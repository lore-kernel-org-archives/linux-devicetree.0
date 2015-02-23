From: Igor Grinberg <grinberg@compulab.co.il>
Subject: Re: [PATCH 08/12] ARM: DT: apq8064: Add USB OTG support for CM QS-600
Date: Mon, 23 Feb 2015 13:31:40 +0200
Message-ID: <54EB0F9C.90500@compulab.co.il>
References: <424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1424678152-13266-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1424678152-13266-1-git-send-email-srinivas.kandagatla@linaro.org>
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
> This patch adds USB OTG support on USB1 for Compulab QS-600 Board.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Acked-by: Igor Grinberg <grinberg@compulab.co.il>

> ---
>  arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> index af2e075..6349f24 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> @@ -41,6 +41,11 @@
>  			};
>  		};
>  
> +		/* OTG */
> +		usb1_phy:phy@12500000 {
> +			status = "ok";
> +		};
> +
>  		usb3_phy:phy@12520000 {
>  			status = "ok";
>  		};
> @@ -48,7 +53,16 @@
>  		usb4_phy:phy@12530000 {
>  			status = "ok";
>  		};
> -		
> +
> +		gadget1:gadget@12500000 {
> +			status = "ok";
> +		};
> +
> +		/* OTG */
> +		usb1: usb@12500000 {
> +			status = "ok";
> +		};
> +
>  		usb3: usb@12520000 {
>  			status = "ok";
>  		};
> 

-- 
Regards,
Igor.
