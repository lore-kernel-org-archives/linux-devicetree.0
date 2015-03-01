From: Roman Volkov <rvolkov-oLhuKTjYqW/YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dts: vt8500: Add SDHC node to DTS file for
 WM8650
Date: Sun, 1 Mar 2015 22:49:59 +0300
Message-ID: <20150301224959.4a106bfd@v1ron-s7>
References: <1423130878-3894-1-git-send-email-v1ron@v1ros.org>
	<1425226007-2757-1-git-send-email-rvolkov@v1ros.org>
	<1425226007-2757-2-git-send-email-rvolkov@v1ros.org>
	<54F35371.7020608@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F35371.7020608-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexey Charkov <alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=D0=92 Sun, 01 Mar 2015 20:59:13 +0300
Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:

> On 3/1/2015 7:06 PM, Roman Volkov wrote:
>=20
> > Since WM8650 has the same 'WMT' SDHC controller as WM8505, and the
> > driver is already in the kernel, this node enables the controller
> > support for WM8650
>=20
> > Signed-off-by: Roman Volkov <rvolkov-oLhuKTjYqW/YtjvyW6yDsg@public.gmane.org>
> > Reviewed-by: Alexey Charkov <alchark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >   arch/arm/boot/dts/wm8650.dtsi | 9 +++++++++
> >   1 file changed, 9 insertions(+)
>=20
> > diff --git a/arch/arm/boot/dts/wm8650.dtsi
> > b/arch/arm/boot/dts/wm8650.dtsi index b1c59a7..e12213d 100644
> > --- a/arch/arm/boot/dts/wm8650.dtsi
> > +++ b/arch/arm/boot/dts/wm8650.dtsi
> > @@ -187,6 +187,15 @@
> >   			interrupts =3D <43>;
> >   		};
> >
> > +		sdhc@d800a000 {
>=20
>     According to the ePAPR standard, the device nodes should have
> generic names according to their functions, so this node should be
> named just "sd@d800a000".
>=20
> WBR, Sergei
>=20

Sergei,

Why not "sdmmc" or "sdhci" or "sdio" then? It would be great to name
nodes in same way, but there is no exact requirement in ePAPR v1.1
regarding SD/MMC controllers. Also, in Linux I don't see that someone
strictly follows this requirement. This renaming will affect driver,
since .compatible strings likely also need changing.

Roman
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
