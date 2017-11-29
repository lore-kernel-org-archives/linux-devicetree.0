From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 7/8] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Date: Wed, 29 Nov 2017 23:16:31 +0100
Message-ID: <20171129221631.GD1706@lunn.ch>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-8-david.daney@cavium.com>
 <CAFqt6zabdQhyjUc4WsjzJ6CxMr70H3V_JdipJVwRi8LuOG54tA@mail.gmail.com>
 <CAFqt6zZAPxKm663yEHD0Rx2SPye9Nvoax0RMroDQuF8BpZchsA@mail.gmail.com>
 <20171129191138.ntlfw5fb4xacwyun@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20171129191138.ntlfw5fb4xacwyun@mwanda>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, David Daney <david.daney@cavium.com>, linux-kernel@vger.kernel.org, ralf@linux-mips.org, Carlos Munoz <cmunoz@cavium.com>, Rob Herring <robh+dt@kernel.org>, Souptick Joarder <jrdr.linux@gmail.com>, "Steven J. Hill" <steven.hill@cavium.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <f.fainelli@gmail.com>, James Hogan <james.hogan@mips.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 10:11:38PM +0300, Dan Carpenter wrote:
> On Wed, Nov 29, 2017 at 09:37:15PM +0530, Souptick Joarder wrote:
> > >> +static int bgx_port_sgmii_set_link_speed(struct bgx_port_priv *priv, struct port_status status)
> > >> +{
> > >> +       u64     data;
> > >> +       u64     prtx;
> > >> +       u64     miscx;
> > >> +       int     timeout;
> > >> +
> > 
> > >> +
> > >> +       switch (status.speed) {
> > >> +       case 10:
> > >
> > > In my opinion, instead of hard coding the value, is it fine to use ENUM ?
> >    Similar comments applicable in other places where hard coded values are used.
> > 
> 
> 10 means 10M right?  That's not really a magic number.  It's fine.

There are also :
uapi/linux/ethtool.h:#define SPEED_10		10
uapi/linux/ethtool.h:#define SPEED_100		100
uapi/linux/ethtool.h:#define SPEED_1000		1000
uapi/linux/ethtool.h:#define SPEED_10000	10000
uapi/linux/ethtool.h:#define SPEED_100000	100000

	     Andrew
