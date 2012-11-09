From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of: Add vendor prefix for ON Semiconductor Corp.
Date: Fri, 09 Nov 2012 07:55:05 -0600
Message-ID: <509D0B39.1000203@gmail.com>
References: <1352466421-27480-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1352466421-27480-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/09/2012 07:07 AM, Thierry Reding wrote:
> The used vendor prefix corresponds to the stock symbol (ONNN) for ON
> Semiconductor Corp.
> 
> Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>

Applied. Thanks.

Rob

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index ac2c2c4..deba8d0 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -34,6 +34,7 @@ national	National Semiconductor
>  nintendo	Nintendo
>  nvidia	NVIDIA
>  nxp	NXP Semiconductors
> +onnn	ON Semiconductor Corp.
>  picochip	Picochip Ltd
>  powervr	Imagination Technologies
>  qcom	Qualcomm, Inc.
> 
