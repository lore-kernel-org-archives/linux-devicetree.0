From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/9] ARM: dts: imx6ul-isiot: Add Sound card with codec
 node
Date: Thu, 15 Jun 2017 10:20:25 +0800
Message-ID: <20170615022024.GE30112@dragon>
References: <1491501735-1649-1-git-send-email-jagan@openedev.com>
 <1491501735-1649-2-git-send-email-jagan@openedev.com>
 <20170407131649.GH16503@dragon>
 <CAMty3ZDj3XgeZwUTXTTX2svoXaNWJ3GJtbNAt9+jj+n8Z4640w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZDj3XgeZwUTXTTX2svoXaNWJ3GJtbNAt9+jj+n8Z4640w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 14, 2017 at 08:17:04PM +0530, Jagan Teki wrote:
> On Fri, Apr 7, 2017 at 6:46 PM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Thu, Apr 06, 2017 at 11:32:07PM +0530, Jagan Teki wrote:
> >> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >>
> >> Add support for Sound card and related codec(via i2c1) nodes
> >> on Engicam Is.IoT MX6UL variant module boards.
> >>
> >> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Cc: Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>
> >> Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >> ---
> >> Changes for v3:
> >> - Replace fsl,imx-audio-sgtl5000 and use simple-audio-card
> >> Changes for v2:
> >> - Use proper [label:] node-name[@unit-address] for codec
> >> - Remove incorrect codec property 'wlf,shared-lrclk'
> >> - Remove 'gpr' from sound card node
> >>
> >>  arch/arm/boot/dts/imx6ul-isiot-common.dtsi | 10 +++++++
> >>  arch/arm/boot/dts/imx6ul-isiot.dtsi        | 44 ++++++++++++++++++++++++++++++
> >
> > Can you help me understand how these two files are related?  Why is
> > sgtl5000 added into one and sound node added into the other?
> 
> lcdif, ts and sound card which may differ based on the base-board
> connected with SOM, So I moved these stuff which are related to
> Starter kit supported once's and used with SOM dts files. if some
> other board with same SOM can have different lcdif and etc so they can
> define locally to dts.

I do not follow how these stuff are organized.  So far we have the
following isiot dts files.

 - imx6ul-isiot-common.dtsi
 - imx6ul-isiot.dtsi
 - imx6ul-isiot-emmc.dts and imx6ul-isiot-nand.dts

How are they mapping to SoM and base-board?

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
