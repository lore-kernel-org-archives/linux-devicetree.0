From: Karl Beldan <karl.beldan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: da850: Add basic DTS for the L138/C6748 Dev Kit
Date: Thu, 13 Oct 2016 07:14:54 +0000
Message-ID: <20161013071454.a44v7oikcifxklty@gobelin>
References: <20160804144332.4841-1-kbeldan@baylibre.com>
 <20160804182902.GA22499@rob-hp-laptop>
 <20160804210326.GE15013@gobelin>
 <CAL_Jsq+3eWgcYc=wpgVCadSFQUyE+WLfA3kTb10AuoZfiKsKog@mail.gmail.com>
 <20160804234349.GA4391@gobelin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160804234349.GA4391@gobelin>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, karl.beldan+oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2016 at 11:43:49PM +0000, Karl Beldan wrote:
> On Thu, Aug 04, 2016 at 04:13:10PM -0500, Rob Herring wrote:
> > +Peter H
> > 
> > On Thu, Aug 4, 2016 at 4:03 PM, Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> > > On Thu, Aug 04, 2016 at 01:29:02PM -0500, Rob Herring wrote:
> > >> On Thu, Aug 04, 2016 at 02:43:32PM +0000, Karl Beldan wrote:
> > >> > The LCDK is the successor to the late Hawkboard and has the same machine
> > >> > number.
> > >> > Among the differences are the flash (16bits vs 8bits) and some pins
> > >> > (MMC, LEDs, buttons, some external connectors), however the main
> > >> > components remain the same (eth. PHY, Audio Codec, Video decoder and
> > >> > DAC) except for the main PMIC, different and hard-wired on the LCDK (the
> > >> > LDOs and DCDCs are always ON).
> > >> > A DT-only boot with this addition gives functional uart, reboot via
> > >> > watchdog, rtc, ethernet and MMC (I added the CD gpio for the MMC
> > >> > although davinci_mmc doesn't call yet the mmc core OF facilities).
> > 
> > [...]
> > 
> > >> > +   aliases {
> > >> > +           serial2 = &serial2;
> > >> > +   };
> > >> > +
> > >> > +   chosen {
> > >> > +           bootargs = "console=ttyS2,115200n8 earlycon";
> > >>
> > >> You don't need console with stdout-path set. And really, earlycon should
> > >> not be the default.
> > >>
> > > Ok for earlycon.
> > >
> > > For the console, I thought likewise .. until I _struggled_ to understand
> > > why the console was disappearing under my feet.
> > > It seemed even stranger when I started looking at the codepath because
> > > drivers/of/base.c would properly add_preferred_console as expected after
> > > the corresponding UART was added. But the reality was there, without it
> > > the console was not like stdout-path.
> > > Among the commits that could instill doubt as to whether stdout-path
> > > rules is f64255b5072d:
> > > "The assumption that at least 1 preferred console will be registered
> > > when the stdout-path property is set is invalid, which can result in
> > > _no_ consoles.", though it didn't answer my question.
> > > I started looking whether tty0 was not getting in the way and in the end
> > > I came up with setting console.
> > > But you seem affirmative.
> > 
> > There have been some issues in this area, but I thought they were in
> > conjunction with earlycon and solved now. This is a fairly common
> > review request for dts files, so I'm surprised if it doesn't work
> > right. Maybe having tty0 or not has some influence. Or people just
> > accept review comments without testing or caring...
> > 
> I can assure you I tested without early{con,printk} ;).
> 
> Now I have just rechecked the codepaths and something caught my
> attention in kernel/printk/printk.c:__add_preferred_console(): if
> console_cmdline is empty selected_console gets unconditionally set to
> zero ! Knowing this I confirmed by replacing with idx (works), and also
> by using ttyS0 (i.e. alias serial0 = &uart2) (works), this would not
> affect DTs using serial0. It's late here so I'll stop there.
>  

The stdout-path bug was fixed last week by Paul Burton in 05fd007e4629 
("console: don't prefer first registered if DT specifies stdout-path").
 
Karl
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
