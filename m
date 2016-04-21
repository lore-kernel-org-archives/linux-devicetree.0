From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 08/18] ARM: multi_v7_defconfig: Enable STi FDMA driver
Date: Thu, 21 Apr 2016 13:25:46 +0200
Message-ID: <5937696.Zdx8BrBD6K@wuerfel>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-9-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461236675-10176-9-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, vinod.koul@intel.com, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, broonie@kernel.org, dmaengine@vger.kernel.org, lee.jones@linaro.org, ludovic.barre@st.com, maxime.coquelin@st.com
List-Id: devicetree@vger.kernel.org

On Thursday 21 April 2016 12:04:25 Peter Griffin wrote:
> This DMA controller is found on all STi chipsets.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 2823490..61008a0 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -727,6 +727,7 @@ CONFIG_DMA_OMAP=y
>  CONFIG_QCOM_BAM_DMA=y
>  CONFIG_XILINX_VDMA=y
>  CONFIG_DMA_SUN6I=y
> +CONFIG_ST_FDMA=y
>  CONFIG_STAGING=y
>  CONFIG_SENSORS_ISL29018=y
>  CONFIG_SENSORS_ISL29028=y
> -- 

Is this needed for booting? If not, make it a loadable module.

	Arnd
