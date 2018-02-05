From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 BUGFIX] ARM: dts: imx6ull: fix the imx6ull-14x14-evk
 configuration
Date: Mon, 5 Feb 2018 18:37:20 +0800
Message-ID: <20180205103716.GY31354@dragon>
References: <1516955159-21626-1-git-send-email-LW@KARO-electronics.de>
 <1516956738-24673-1-git-send-email-LW@KARO-electronics.de>
 <20180205075620.GO31354@dragon>
 <20180205105543.1711274c@karo-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180205105543.1711274c-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 05, 2018 at 10:55:43AM +0100, Lothar Waﬂmann wrote:
> Hi,
> 
> On Mon, 5 Feb 2018 15:56:22 +0800 Shawn Guo wrote:
> > On Fri, Jan 26, 2018 at 09:52:18AM +0100, Lothar Waﬂmann wrote:
> > > imx6ull-14x14-evk.dts currently includes the imx6ul.dtsi file for an
> > > i.MX6ULL SoC which is plain wrong.
> > > 
> > > Rename the current imx6ul-14x14-evk.dts to .dtsi and include it from
> > > imx6ul-14x14-evk.dts and imx6ull-14x14-evk.dts, so that both can
> > > include the appropriate SoC specific (imx6ul.dtsi/imx6ull.dtsi) file.
> > > 
> > > Signed-off-by: Lothar Waﬂmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > 
> > Which base is the patch generated against?  I cannot apply it to any
> > branch in my tree.
> >
> The patch was generated against next-20180118 but also applies to
> next-20180205.

It looks like you would really want this go into 4.16 as a fix?  In that
case, I will need to wait for v4.16-rc1 to apply it.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
