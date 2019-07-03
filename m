From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/3] add doc and MAINTAINERS for poweroff
Date: Wed, 3 Jul 2019 09:22:11 +0200
Message-ID: <fbabe719-1e7d-8ac0-8d7b-adbc52d368f0@gmail.com>
References: <20190702094045.3652-1-frank-w@public-files.de>
 <20190702094045.3652-2-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702094045.3652-2-frank-w@public-files.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Josef Friedl <josef.friedl@speed.at>
List-Id: devicetree@vger.kernel.org



On 02/07/2019 11:40, Frank Wunderlich wrote:
> From: Josef Friedl <josef.friedl@speed.at>
> 
> poweroff for BPI-R2
> Suggested-by: Frank Wunderlich <frank-w@public-files.de>
> 
> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> =2D--

Please provide a proper commit message. Also subject should be adjusted. Just
have a look into the git log to see what prefix you should use.

What's =2D-- ?


>  .../devicetree/bindings/mfd/mt6397.txt        | 10 ++++++-
>  .../bindings/power/reset/mt6323-poweroff.txt  | 20 +++++++++++++
>  .../devicetree/bindings/rtc/rtc-mt6397.txt    | 29 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++++
>  4 files changed, 64 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-p=
> oweroff.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentat=
> ion/devicetree/bindings/mfd/mt6397.txt
> index 0ebd08af777d..44acb9827716 100644
> =2D-- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -8,6 +8,7 @@ MT6397/MT6323 is a multifunction device with the following=
>  sub modules:
>  - Clock
>  - LED
>  - Keys
> +- Power controller
> 
>  It is interfaced to host controller using SPI interface by a proprietary =
> hardware
>  called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwra=
> p.

It seems you have some problems with enconding or word wrapping by your email
setting. please check that.

> @@ -22,8 +23,10 @@ compatible: "mediatek,mt6397" or "mediatek,mt6323"
>  Optional subnodes:
> 
>  - rtc
> -	Required properties:
> +	Required properties: Should be one of follows
> +		- compatible: "mediatek,mt6323-rtc"
>  		- compatible: "mediatek,mt6397-rtc"
> +	For details, see Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
>  - regulators
>  	Required properties:
>  		- compatible: "mediatek,mt6397-regulator"
> @@ -46,6 +49,11 @@ Optional subnodes:
>  		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
>  	see Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
> 
> +- power-controller
> +	Required properties:
> +		- compatible: "mediatek,mt6323-pwrc"
> +	For details, see Documentation/devicetree/bindings/power/reset/mt6323-po=
> weroff.txt
> +
>  Example:
>  	pwrap: pwrap@1000f000 {
>  		compatible =3D "mediatek,mt8135-pwrap";
> diff --git a/Documentation/devicetree/bindings/power/reset/mt6323-poweroff=
> .txt b/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
> new file mode 100644
> index 000000000000..933f0c48e887
> =2D-- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
> @@ -0,0 +1,20 @@
> +Device Tree Bindings for Power Controller on MediaTek PMIC
> +
> +The power controller which could be found on PMIC is responsible for exte=
> rnally
> +powering off or on the remote MediaTek SoC through the circuit BBPU.
> +
> +Required properties:
> +- compatible: Should be one of follows
> +       "mediatek,mt6323-pwrc": for MT6323 PMIC
> +
> +Example:
> +
> +       pmic {
> +               compatible =3D "mediatek,mt6323";
> +
> +               ...
> +
> +               power-controller {
> +                       compatible =3D "mediatek,mt6323-pwrc";
> +               };
> +       }
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt b/Docume=
> ntation/devicetree/bindings/rtc/rtc-mt6397.txt
> new file mode 100644
> index 000000000000..ebd1cf80dcc8
> =2D-- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> @@ -0,0 +1,29 @@
> +Device-Tree bindings for MediaTek PMIC based RTC
> +
> +MediaTek PMIC based RTC is an independent function of MediaTek PMIC that =
> works
> +as a type of multi-function device (MFD). The RTC can be configured and s=
> et up
> +with PMIC wrapper bus which is a common resource shared with the other
> +functions found on the same PMIC.
> +
> +For MediaTek PMIC MFD bindings, see:
> +Documentation/devicetree/bindings/mfd/mt6397.txt
> +
> +For MediaTek PMIC wrapper bus bindings, see:
> +Documentation/devicetree/bindings/soc/mediatek/pwrap.txt

In the end there is no difference between the mt6397 rtc and the mt7622-rtc,
right? Please rename the binding document of mt7622 and add the compatible
there. No need to add a new file.

> +
> +Required properties:
> +- compatible: Should be one of follows
> +       "mediatek,mt6323-rtc": for MT6323 PMIC
> +       "mediatek,mt6397-rtc": for MT6397 PMIC
> +
> +Example:
> +
> +       pmic {
> +               compatible =3D "mediatek,mt6323";
> +
> +               ...
> +
> +               rtc {
> +                       compatible =3D "mediatek,mt6323-rtc";
> +               };
> +       };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01a52fc964da..ec6ff342aa3c 100644
> =2D-- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9920,6 +9920,12 @@ S:	Maintained
>  F:	drivers/net/dsa/mt7530.*
>  F:	net/dsa/tag_mtk.c
> 
> +MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS
> +M:	Sean Wang <sean.wang@mediatek.com>
> +L:	linux-pm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
> +
>  MEDIATEK JPEG DRIVER
>  M:	Rick Chang <rick.chang@mediatek.com>
>  M:	Bin Liu <bin.liu@mediatek.com>
> =2D-
> 2.17.1

Maintainers entries are normally a seperate patch.

Regards,
Matthias

> 
