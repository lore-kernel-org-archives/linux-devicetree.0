From: Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 1/3] dt-bindings: imx-ocotp: add compatible string for
 i.MX7D/S
Date: Mon, 13 Mar 2017 03:14:01 +0000
Message-ID: <VI1PR04MB1166EA630AB6D829B1C8568888250@VI1PR04MB1166.eurprd04.prod.outlook.com>
References: <1488350454-23860-1-git-send-email-peng.fan@nxp.com>
 <a3f9ebba-6dfe-c7a3-fabf-1f5ac69ecafc@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a3f9ebba-6dfe-c7a3-fabf-1f5ac69ecafc-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Srinivas Kandagatla [mailto:srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org]
> Sent: Friday, March 03, 2017 6:12 PM
> To: Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>; shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; Rob Herring
> <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Subject: Re: [PATCH 1/3] dt-bindings: imx-ocotp: add compatible string fo=
r
> i.MX7D/S
>=20
>=20
>=20
> On 01/03/17 06:40, Peng Fan wrote:
> > Add compatible string for i.MX7D/S
> >
> > Signed-off-by: Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
> > Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> Thanks for the patch, I will queue both nvmem driver changes and bindings
> changes, via Greg's chars-misc tree.
> But the DT changes have to go via arm-soc tree.

Thanks, Srini.

Shawn may take the DT changes, if it is ok.

Thanks,
Peng.
>=20
> Thanks,
> srini
> > diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> > b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> > index 966a72e..bbde2e4 100644
> > --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> > +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> > @@ -9,6 +9,7 @@ Required properties:
> >  	"fsl,imx6sl-ocotp" (i.MX6SL), or
> >  	"fsl,imx6sx-ocotp" (i.MX6SX),
> >  	"fsl,imx6ul-ocotp" (i.MX6UL),
> > +	"fsl,imx7d-ocotp" (i.MX7D/S),
> >  	followed by "syscon".
> >  - reg: Should contain the register base and length.
> >  - clocks: Should contain a phandle pointing to the gated peripheral cl=
ock.
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
