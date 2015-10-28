From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add binding docs for Cirrus
 Logic/Wolfson Arizona devices
Date: Wed, 28 Oct 2015 18:04:52 +0900
Message-ID: <56308FB4.8010707@samsung.com>
References: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1445961719-1020-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1445961719-1020-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, broonie@kernel.org, lee.jones@linaro.org
Cc: myungjoo.ham@samsung.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Hi Charles,

On 2015=EB=85=84 10=EC=9B=94 28=EC=9D=BC 01:01, Charles Keepax wrote:
> Add device tree binding documentation for the Arizona drivers
> to the MAINTAINERS file.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>=20
> Changes since v2:
>  - Moved all the maintainer updates into this patch
>=20
> Thanks,
> Charles
>=20
>  MAINTAINERS |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0658fec..4dc45de 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11392,6 +11392,9 @@ T:	git https://github.com/CirrusLogic/linux-d=
rivers.git
>  W:	https://github.com/CirrusLogic/linux-drivers/wiki
>  S:	Supported
>  F:	Documentation/hwmon/wm83??
> +F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> +F:	Documentation/devicetree/bindings/regulator/arizona-regulator.txt
> +F:	Documentation/devicetree/bindings/mfd/arizona.txt
>  F:	arch/arm/mach-s3c64xx/mach-crag6410*
>  F:	drivers/clk/clk-wm83*.c
>  F:	drivers/extcon/extcon-arizona.c
>=20

[for extcon]
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Regards,
Chanwoo Choi
