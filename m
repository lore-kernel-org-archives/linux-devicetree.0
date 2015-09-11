From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 8/9] MAINTAINERS: Add FDMA driver files to STi section.
Date: Fri, 11 Sep 2015 17:22:33 +0100
Message-ID: <20150911162233.GC18779@x1>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
 <1441980871-24475-9-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441980871-24475-9-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, robh+dt@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> This patch adds the FDMA driver files to the STi
> section of the maintainers file.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index b60e2b2..b3cdd5b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1504,6 +1504,7 @@ S:	Maintained
>  F:	arch/arm/mach-sti/
>  F:	arch/arm/boot/dts/sti*
>  F:	drivers/clocksource/arm_global_timer.c
> +F:	drivers/dma/st_fdma*
>  F:	drivers/i2c/busses/i2c-st.c
>  F:	drivers/media/rc/st_rc.c
>  F:	drivers/mmc/host/sdhci-st.c

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
