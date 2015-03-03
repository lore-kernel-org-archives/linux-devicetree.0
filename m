From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH 2/6] mfd: arizona: Update binding documentation
 for WM8280
Date: Tue, 3 Mar 2015 16:46:41 +0000
Message-ID: <20150303164641.GE32624@x1>
References: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1425399576-26428-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425399576-26428-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, linus.walleij@linaro.org, gnurou@gmail.com, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, rf@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 03 Mar 2015, Charles Keepax wrote:

> From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
>=20
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt |   15 +++++++++++=
----
>  1 files changed, 11 insertions(+), 4 deletions(-)

Applied, thanks.

Will send out pull-request once this has had time to soak in -next.=20

> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index bfef000..af8646f 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -8,6 +8,7 @@ Required properties:
>    - compatible : One of the following chip-specific strings:
>          "wlf,wm5102"
>          "wlf,wm5110"
> +        "wlf,wm8280"
>          "wlf,wm8997"
>    - reg : I2C slave address when connected using I2C, chip select nu=
mber when
>      using SPI.
> @@ -26,10 +27,16 @@ Required properties:
>    - #gpio-cells : Must be 2. The first cell is the pin number and th=
e
>      second cell is used to specify optional parameters (currently un=
used).
> =20
> -  - AVDD-supply, DBVDD1-supply, DBVDD2-supply, DBVDD3-supply (wm5102=
, wm5110),
> -    CPVDD-supply, SPKVDDL-supply (wm5102, wm5110), SPKVDDR-supply (w=
m5102,
> -    wm5110), SPKVDD-supply (wm8997) : Power supplies for the device,=
 as covered
> -    in Documentation/devicetree/bindings/regulator/regulator.txt
> +  - AVDD-supply, DBVDD1-supply, CPVDD-supply : Power supplies for th=
e device,
> +    as covered in Documentation/devicetree/bindings/regulator/regula=
tor.txt
> +
> +  - DBVDD2-supply, DBVDD3-supply : Additional databus power supplies=
 (wm5102,
> +    wm5110, wm8280)
> +
> +  - SPKVDDL-supply, SPKVDDR-supply : Speaker driver power supplies (=
wm5102,
> +    wm5110, wm8280)
> +
> +  - SPKVDD-supply : Speaker driver power supply (wm8997)
> =20
>  Optional properties:
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
