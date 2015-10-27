From: andrew-ct chen <andrew-ct.chen@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: add document of mediatek efuse driver
Date: Tue, 27 Oct 2015 13:32:18 +0800
Message-ID: <1445923938.15900.15.camel@mtksdaap41>
References: <1444984751-4572-1-git-send-email-andrew-ct.chen@mediatek.com>
	 <1444984751-4572-2-git-send-email-andrew-ct.chen@mediatek.com>
	 <562DF8BE.4060205@linaro.org> <20151026102344.GD25308@pengutronix.de>
	 <562E0698.1000503@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <562E0698.1000503@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, 2015-10-26 at 10:55 +0000, Srinivas Kandagatla wrote:
>=20
> On 26/10/15 10:23, Sascha Hauer wrote:
> > On Mon, Oct 26, 2015 at 09:56:14AM +0000, Srinivas Kandagatla wrote=
:
> >>
> >>
> >> On 16/10/15 09:39, andrew-ct.chen@mediatek.com wrote:
> >>> From: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
> >>>
> >>> Add Mediatek MT8173 EFUSE Devicetree binding file
> >>>
> >>> Signed-off-by: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
> >>
> >> Looks good to me, minor comment below.
> >>
> >> Will queue this for v4.5 once v4.4-rc1 is released.
> >>
> >>
> >>> ---
> >>>   .../devicetree/bindings/nvmem/mtk-efuse.txt        | 36 +++++++=
+++++++++++++++
> >>>   1 file changed, 36 insertions(+)
> >>>   create mode 100644 Documentation/devicetree/bindings/nvmem/mtk-=
efuse.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.tx=
t b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> >>> new file mode 100644
> >>> index 0000000..92edc3d
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> >>> @@ -0,0 +1,36 @@
> >>> +=3D Mediatek MTK-EFUSE device tree bindings =3D
> >>> +
> >>> +This binding is intended to represent MTK-EFUSE which is found i=
n most Mediatek SOCs.
> >>> +
> >>> +Required properties:
> >>> +- compatible: should be "mediatek,mt8173-efuse" or "mediatek,mt8=
135-efuse"
> >>
> >> Can we make the compatible more generic for mediatek socs? Like
> >> "mediatek,efuse"  Or are they different in each SOC?
> >
> > While we can add an additional "mediatek,efuse" compatible we shoul=
d
> > always add the most specific compatible first. Otherwise we cannot
> > differentiate between SoCs later without changing the device tree.
> Yes, that=E2=80=99s correct.
>=20
> AFAIK, Ideally the driver should have more generic compatible string=20
> unless there is any SOC specific thing, and DT can still use the orde=
r=20
> of specific, generic compatible strings. If not we would end up addin=
g=20
> compatible strings into the driver for every new SOC.

We will modify for generic compatible string like "mediatek,efuse" and
rebase it to v4.4-rc1.

>=20
> --srini
>=20
> >
> > Sascha
> >
