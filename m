From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/2] of: Add Semtech Corp. vendor prefix
Date: Wed, 13 Jun 2012 13:31:49 -0500
Message-ID: <4FD8DC95.1020404@gmail.com>
References: <1334229613-678-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1334229613-678-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-input-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-input@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 04/12/2012 06:20 AM, Thierry Reding wrote:
> This commit adds a device tree vendor prefix for Semtech Corp.
> 
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: devicetree-discuss@lists.ozlabs.org
> Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 6b6e465..19af408 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -44,6 +44,7 @@ simtek
>  sirf	SiRF Technology, Inc.
>  st	STMicroelectronics
>  stericsson	ST-Ericsson
> +sx	Semtech Corp.

This should be smtc to match stock ticker.

Rob

>  ti	Texas Instruments
>  wlf	Wolfson Microelectronics
>  xlnx	Xilinx

