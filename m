From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 4/4] mfd: arizona: Add device tree binding
 documentation for new clock driver
Date: Mon, 11 Jan 2016 10:23:53 +0000
Message-ID: <20160111102353.GW14104@x1>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452252582-20834-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452252582-20834-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: mturquette@baylibre.com, cw00.choi@samsung.com, sboyd@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, 08 Jan 2016, Charles Keepax wrote:

> Specify the device tree binding for the input clocks to Arizona devic=
es.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>=20
> No changes since v2.
>=20
> Thanks,
> Charles
>=20
>  Documentation/devicetree/bindings/mfd/arizona.txt | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index 18be0cb..39f76f8 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -45,6 +45,13 @@ Optional properties:
> =20
>    - wlf,reset : GPIO specifier for the GPIO controlling /RESET
> =20
> +  - clocks: Should reference the clocks supplied on MCLK1 and MCLK2
> +  - clock-names: Should contains two strings:
> +      "mclk1" for the clock supplied on MCLK1, recommended to be a h=
igh
> +      quality audio reference clock
> +      "mclk2" for the clock supplied on MCLK2, recommended to be an =
always on
> +      32k clock
> +
>    - wlf,gpio-defaults : A list of GPIO configuration register values=
=2E Defines
>      for the appropriate values can found in <dt-bindings/mfd/arizona=
=2Etxt>. If
>      absent, no configuration of these registers is performed. If any=
 entry has

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
