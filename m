From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] of: Add Inforce Computing to vendor prefix list
Date: Tue, 19 Apr 2016 17:23:31 -0500
Message-ID: <20160419222331.GA31618@rob-hp-laptop>
References: <1460453397-5597-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1460453397-5597-2-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460453397-5597-2-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 12, 2016 at 10:29:57AM +0100, Srinivas Kandagatla wrote:
> This patch adds Inforce Computing to vendor prefix list.
> This vendor makes boards like IFC6410, IFC6540 based on Qualcomm SOCs.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index f382061..7df3544 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -119,6 +119,7 @@ idt	Integrated Device Technologies, Inc.
>  ifi	Ingenieurburo Fur Ic-Technologie (I/F/I)
>  iom	Iomega Corporation
>  img	Imagination Technologies Ltd.
> +inforce	Inforce Computing
>  ingenic	Ingenic Semiconductor
>  innolux	Innolux Corporation
>  intel	Intel Corporation
> -- 
> 2.5.0
> 
