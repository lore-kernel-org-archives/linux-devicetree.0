From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Fri, 27 Sep 2013 21:21:10 +0100
Message-ID: <20130927202110.GI12758@n2100.arm.linux.org.uk>
References: <CAOMZO5Dj7o3qBH2hzPFWjepgpt5XR5qKmQorKS6jH_7=gnY5cg@mail.gmail.com> <20130927121357.GY12758@n2100.arm.linux.org.uk> <20130927132601.GL25146@S2101-09.ap.freescale.net> <20130927151900.GA12758@n2100.arm.linux.org.uk> <CAHCPf3t8=mJn-RCz3C1cY6zqsH9ds8UANKpKx9ZpwPM6WjJt3g@mail.gmail.com> <20130927174916.GD12758@n2100.arm.linux.org.uk> <CAHCPf3sC7bY=p4vpBQFpRUmyPspT_PVjx0rH9cm1ov=SqkO+Vg@mail.gmail.com> <20130927190546.GG12758@n2100.arm.linux.org.uk> <CAHCPf3vxGAzTnY360KC7Yt-DB1FB14Sv_Cn7DBTH6HGZ6y=stg@mail.gmail.com> <CAHCPf3sv3wSbUc9QFVhmYsPc1kqiWYRuOMO7rreuiGSrwyepBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHCPf3sv3wSbUc9QFVhmYsPc1kqiWYRuOMO7rreuiGSrwyepBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2013 at 02:48:16PM -0500, Matt Sealey wrote:
> On Fri, Sep 27, 2013 at 2:41 PM, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org> wrote:
> > On Fri, Sep 27, 2013 at 2:05 PM, Russell King - ARM Linux
> > <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> >> I've got good news... finally!
> >>
> > The difference would be
> >
> > * In the top situation, your PHY is generating the clock for the
> > entire system - the i.MX6 takes it and uses it drive logic and to
> > clock receive and sends it back out on TXC to transmit data (GPR1[21]
> > = 0)
> > * In the bottom situation, the i.MX6 generates a clock, the PHY uses
> > it to drive it's logic AND generate other clocks, and the i.MX6 clock
> > is looped back through the pad to the MAC to drive it's logic and
> > clock transmit data (GPR1[21] = 1)
> 
> Ignore that. It's not totally wrong but it's weird. This is really
> difficult to put into words...
> 
> GPR1[21] = 0 i.MX6 receives a clock from the PHY. You need to generate
> a clock at the PHY as input to the MAC. The MAC won't run until the
> PHY is out of reset and the clock is generated. You may need SION set
> for RMII depending on the pin...
> GPR1[21] = 1 implies we generate a clock from i.MX6 TO the PHY. The
> clock is looped back through the pad to the MAC. SION is irrelevant.
> 
> Still want to know who's clock it is and where it should be going....

As I said, when Rabeeh is around, I will ask questions about this.
I'm fairly certain that we don't need _all_ those ethernet pinmux
settings (we just need the RGMII ones, and can omit the MII ones.)

Having hacked on this solidly since about 5pm yesterday, I'm not going
to spend very much time on this until later next week, or I can talk to
Rabeeh.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
