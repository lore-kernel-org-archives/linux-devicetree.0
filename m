From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/4] extcon: arizona: Add extcon specific device tree
 binding document
Date: Wed, 28 Oct 2015 09:19:09 +0000
Message-ID: <20151028091909.GN5828@x1>
References: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: broonie@kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Tue, 27 Oct 2015, Charles Keepax wrote:

> Subsystem specific bindings for the Arizona devices are being factore=
d
> out of the MFD binding document into separate documents for each
> subsystem. This patch adds a binding document that covers the existin=
g
> extcon specific bindings.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>=20
> Changes since v2:
>  - Moved the maintainer updates into a separate patch
>=20
> Thanks,
> Charles
>=20
>  .../devicetree/bindings/extcon/extcon-arizona.txt  |   15 ++++++++++=
+++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-a=
rizona.txt

Replied on Chanwoo's request.

> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.=
txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> new file mode 100644
> index 0000000..e1705fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> @@ -0,0 +1,15 @@
> +Cirrus Logic Arizona class audio SoCs
> +
> +These devices are audio SoCs with extensive digital capabilities and=
 a range
> +of analogue I/O.
> +
> +This document lists Extcon specific bindings, see the primary bindin=
g document:
> +  ../mfd/arizona.txt
> +
> +Optional properties:
> +
> +  - wlf,hpdet-channel : Headphone detection channel.
> +    ARIZONA_ACCDET_MODE_HPL or 1 - Headphone detect mode is set to H=
PDETL
> +    ARIZONA_ACCDET_MODE_HPR or 2 - Headphone detect mode is set to H=
PDETR
> +    If this node is not mentioned or if the value is unknown, then
> +    headphone detection mode is set to HPDETL.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
