class SecretDiary
  def initialize(diary)
    @diary = diary
    @unlocked = false
  end

  def read
    return @diary.read if @unlocked
    fail "Go away!"
  end

  def lock
    @unlocked = false
  end

  def unlock
    @unlocked = true
  end
end