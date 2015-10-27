From: andrew-ct chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: add document of mediatek efuse driver
Date: Tue, 27 Oct 2015 17:27:55 +0800
Message-ID: <1445938075.22398.3.camel@mtksdaap41>
References: <1444984751-4572-1-git-send-email-andrew-ct.chen@mediatek.com>
	 <1444984751-4572-2-git-send-email-andrew-ct.chen@mediatek.com>
	 <562DF8BE.4060205@linaro.org> <20151026102344.GD25308@pengutronix.de>
	 <562E0698.1000503@linaro.org> <1445923938.15900.15.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445923938.15900.15.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-10-27 at 13:32 +0800, andrew-ct chen wrote:
> On Mon, 2015-10-26 at 10:55 +0000, Srinivas Kandagatla wrote:
> >=20
> > On 26/10/15 10:23, Sascha Hauer wrote:
> > > On Mon, Oct 26, 2015 at 09:56:14AM +0000, Srinivas Kandagatla wro=
te:
> > >>
> > >>
> > >> On 16/10/15 09:39, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > >>> From: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > >>>
> > >>> Add Mediatek MT8173 EFUSE Devicetree binding file
> > >>>
> > >>> Signed-off-by: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > >>
> > >> Looks good to me, minor comment below.
> > >>
> > >> Will queue this for v4.5 once v4.4-rc1 is released.
> > >>
> > >>
> > >>> ---
> > >>>   .../devicetree/bindings/nvmem/mtk-efuse.txt        | 36 +++++=
+++++++++++++++++
> > >>>   1 file changed, 36 insertions(+)
> > >>>   create mode 100644 Documentation/devicetree/bindings/nvmem/mt=
k-efuse.txt
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.=
txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> > >>> new file mode 100644
> > >>> index 0000000..92edc3d
> > >>> --- /dev/null
> > >>> +++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> > >>> @@ -0,0 +1,36 @@
> > >>> +=3D Mediatek MTK-EFUSE device tree bindings =3D
> > >>> +
> > >>> +This binding is intended to represent MTK-EFUSE which is found=
 in most Mediatek SOCs.
> > >>> +
> > >>> +Required properties:
> > >>> +- compatible: should be "mediatek,mt8173-efuse" or "mediatek,m=
t8135-efuse"
> > >>
> > >> Can we make the compatible more generic for mediatek socs? Like
> > >> "mediatek,efuse"  Or are they different in each SOC?
> > >
> > > While we can add an additional "mediatek,efuse" compatible we sho=
uld
> > > always add the most specific compatible first. Otherwise we canno=
t
> > > differentiate between SoCs later without changing the device tree=
=2E
> > Yes, that=E2=80=99s correct.
> >=20
> > AFAIK, Ideally the driver should have more generic compatible strin=
g=20
> > unless there is any SOC specific thing, and DT can still use the or=
der=20
> > of specific, generic compatible strings. If not we would end up add=
ing=20
> > compatible strings into the driver for every new SOC.
>=20
> We will modify for generic compatible string like "mediatek,efuse" an=
d
> rebase it to v4.4-rc1.

=46or more clearly, we will modify the compatible string to
"mediatek,mt8173-efuse" and "mediatek,efuse".

>=20
> >=20
> > --srini
> >=20
> > >
> > > Sascha
> > >
>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
