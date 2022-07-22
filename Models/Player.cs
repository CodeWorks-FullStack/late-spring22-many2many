namespace Hockey.Models
{
  public class Player
  {
    public int Id { get; set; }
    public string Name { get; set; }
    public int Jersey { get; set; }
  }

  public class TeamPlayerPlayerViewModel : Player
  {
    // plus the relationship id
    public int TeamPlayerId { get; set; }
  }
}