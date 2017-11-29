From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4 7/8] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Date: Wed, 29 Nov 2017 22:11:38 +0300
Message-ID: <20171129191138.ntlfw5fb4xacwyun@mwanda>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-8-david.daney@cavium.com>
 <CAFqt6zabdQhyjUc4WsjzJ6CxMr70H3V_JdipJVwRi8LuOG54tA@mail.gmail.com>
 <CAFqt6zZAPxKm663yEHD0Rx2SPye9Nvoax0RMroDQuF8BpZchsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <CAFqt6zZAPxKm663yEHD0Rx2SPye9Nvoax0RMroDQuF8BpZchsA@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, David Daney <david.daney@cavium.com>, linux-kernel@vger.kernel.org, ralf@linux-mips.org, Carlos Munoz <cmunoz@cavium.com>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, "Steven J. Hill" <steven.hill@cavium.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <f.fainelli@gmail.com>, James Hogan <james.hogan@mips.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 09:37:15PM +0530, Souptick Joarder wrote:
> >> +static int bgx_port_sgmii_set_link_speed(struct bgx_port_priv *priv, struct port_status status)
> >> +{
> >> +       u64     data;
> >> +       u64     prtx;
> >> +       u64     miscx;
> >> +       int     timeout;
> >> +
> 
> >> +
> >> +       switch (status.speed) {
> >> +       case 10:
> >
> > In my opinion, instead of hard coding the value, is it fine to use ENUM ?
>    Similar comments applicable in other places where hard coded values are used.
> 

10 means 10M right?  That's not really a magic number.  It's fine.

> >> +static int bgx_port_init_xaui_link(struct bgx_port_priv *priv)
> >> +{
> 
> >> +
> >> +               if (use_ber) {
> >> +                       timeout = 10000;
> >> +                       do {
> >> +                               data =
> >> +                               oct_csr_read(BGX_SPU_BR_STATUS1(priv->node, priv->bgx, priv->index));
> >> +                               if (data & BIT(0))
> >> +                                       break;
> >> +                               timeout--;
> >> +                               udelay(1);
> >> +                       } while (timeout);
> >
> > In my opinion, it's better to implement similar kind of loops inside macros.

I don't understand what you mean here.  For what it's worth this code
seems clear enough to me (except for the bad indenting of oct_csr_read().

It should be something like:
				data = oct_csr_read(BGX_SPU_BR_STATUS1(priv->node,
						priv->bgx, priv->index));

That's over the 80 char limit but so is the original code.

regards,
dan carpenter
