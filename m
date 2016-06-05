From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH RFT 2/4] ARM: dts: imx28-eukrea-mbmx28lc: add missing
 reg properties
Date: Sun, 5 Jun 2016 17:54:00 +0200 (CEST)
Message-ID: <1527550523.279555.c2b71a89-24ac-4970-b99e-c80b6a2e1ba0.open-xchange@email.1und1.de>
References: <1465134666-13459-1-git-send-email-stefan.wahren@i2se.com>
 <CAOMZO5DqYV97M+heNaehqFCTEiYnYKRqCfiF0FMxzqEvw-gkZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5DqYV97M+heNaehqFCTEiYnYKRqCfiF0FMxzqEvw-gkZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Eric_B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Fabio,

> Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> hat am 5. Juni 2016 um 16:00 geschrieben:
> 
> 
> On Sun, Jun 5, 2016 at 10:51 AM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:
> > This patch adds the missing reg properties for the regulator nodes
> > in order to fix the dtc warnings.
> >
> > Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi |    4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
> > b/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
> > index 8859474..581e85f 100644
> > --- a/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
> > +++ b/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
> > @@ -84,6 +84,7 @@
> >
> >                 reg_3p3v: regulator@0 {
> >                         compatible = "regulator-fixed";
> > +                       reg = <0>;
> 
> The proper fix here would be to remove "@0" instead.

in this case many other mxs boards are wrong.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
