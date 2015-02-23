From: Igor Grinberg <grinberg@compulab.co.il>
Subject: Re: [PATCH 07/12] ARM: DT: apq8064: Add usb host support to CM QS-600
Date: Mon, 23 Feb 2015 13:31:29 +0200
Message-ID: <54EB0F91.2050002@compulab.co.il>
References: <424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1424678144-13224-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1424678144-13224-1-git-send-email-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 02/23/15 09:55, Srinivas Kandagatla wrote:
> From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> 
> This patch adds device tree nodes to support two usb hosts on Compulab QS600 board.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Acked-by: Igor Grinberg <grinberg@compulab.co.il>

> ---
>  arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> index 6e62f24..af2e075 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> @@ -41,6 +41,22 @@
>  			};
>  		};
>  
> +		usb3_phy:phy@12520000 {
> +			status = "ok";
> +		};
> +		
> +		usb4_phy:phy@12530000 {
> +			status = "ok";
> +		};
> +		
> +		usb3: usb@12520000 {
> +			status = "ok";
> +		};
> +		
> +		usb4: usb@12530000 {
> +			status = "ok";
> +		};
> +
>  		/* on board fixed 3.3v supply */
>  		v3p3_pcieclk: v3p3-pcieclk {
>  			compatible = "regulator-fixed";
> 

-- 
Regards,
Igor.
