From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: arizona: Add defines for GPSW values that can be
 used from DT
Date: Mon, 9 May 2016 15:30:15 +0100
Message-ID: <20160509143015.GL8324@dell>
References: <1462181257-27646-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462181257-27646-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Mon, 02 May 2016, Charles Keepax wrote:

> Add defines for the possible values the GPSW can be set to using the
> wlf,gpsw device tree binding.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  include/dt-bindings/mfd/arizona.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/include/dt-bindings/mfd/arizona.h b/include/dt-bindings/=
mfd/arizona.h
> index c40f665..dedf46f 100644
> --- a/include/dt-bindings/mfd/arizona.h
> +++ b/include/dt-bindings/mfd/arizona.h
> @@ -110,4 +110,9 @@
>  #define ARIZONA_ACCDET_MODE_HPM 4
>  #define ARIZONA_ACCDET_MODE_ADC 7
> =20
> +#define ARIZONA_GPSW_OPEN           0
> +#define ARIZONA_GPSW_CLOSED         1
> +#define ARIZONA_GPSW_CLAMP_ENABLED  2
> +#define ARIZONA_GPSW_CLAMP_DISABLED 3
> +
>  #endif

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
