From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 3/4] mfd: arizona: Remove bindings covered in new
 subsystem specific docs
Date: Wed, 28 Oct 2015 09:03:06 +0000
Message-ID: <20151028090306.GJ5828@x1>
References: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1445961719-1020-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1445961719-1020-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: broonie@kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Tue, 27 Oct 2015, Charles Keepax wrote:

> Binding documentation has been added in new subsystem specific bindin=
g
> documents. This patch removes the now duplicate documentation from th=
e
> MFD documentation.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>=20
> Changes since v2:
>  - No longer moving the core regulators into the regulator binding do=
cument,
>    as they are properties of the device as a whole not just the regul=
ators
>  - Moved the maintainer updates into a seperate patch
>=20
> Lee, I have removed your ack because the patch has changed a fair amo=
unt.
> Apologies if this would not have been your preference.

That was the right thing to do.

> Thanks,
> Charles
>=20
>  Documentation/devicetree/bindings/mfd/arizona.txt |   15 +++--------=
----
>  1 files changed, 3 insertions(+), 12 deletions(-)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index a8fee60..18be0cb 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -44,7 +44,6 @@ Required properties:
>  Optional properties:
> =20
>    - wlf,reset : GPIO specifier for the GPIO controlling /RESET
> -  - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
> =20
>    - wlf,gpio-defaults : A list of GPIO configuration register values=
=2E Defines
>      for the appropriate values can found in <dt-bindings/mfd/arizona=
=2Etxt>. If
> @@ -67,21 +66,13 @@ Optional properties:
>      present, the number of values should be less than or equal to th=
e
>      number of inputs, unspecified inputs will use the chip default.
> =20
> -  - wlf,hpdet-channel : Headphone detection channel.
> -    ARIZONA_ACCDET_MODE_HPL or 1 - Headphone detect mode is set to H=
PDETL
> -    ARIZONA_ACCDET_MODE_HPR or 2 - Headphone detect mode is set to H=
PDETR
> -    If this node is not mentioned or if the value is unknown, then
> -    headphone detection mode is set to HPDETL.
> -
>    - DCVDD-supply, MICVDD-supply : Power supplies, only need to be sp=
ecified if
>      they are being externally supplied. As covered in
>      Documentation/devicetree/bindings/regulator/regulator.txt
> =20
> -Optional subnodes:
> -  - ldo1 : Initial data for the LDO1 regulator, as covered in
> -    Documentation/devicetree/bindings/regulator/regulator.txt
> -  - micvdd : Initial data for the MICVDD regulator, as covered in
> -    Documentation/devicetree/bindings/regulator/regulator.txt
> +Also see child specific device properties:
> +  Regulator - ../regulator/arizona-regulator.txt
> +  Extcon    - ../extcon/extcon-arizona.txt
> =20
>  Example:
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
