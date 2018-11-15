From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 3/3] ARM: socfpga: dts: document
 "altr,stratix10-rst-mgr" binding
Date: Thu, 15 Nov 2018 10:32:59 +0100
Message-ID: <1542274379.4915.3.camel@pengutronix.de>
References: <20181105200549.17159-1-dinguyen@kernel.org>
         <20181105200549.17159-3-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105200549.17159-3-dinguyen@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Dinh,

On Mon, 2018-11-05 at 14:05 -0600, Dinh Nguyen wrote:
> "altr,stratix10-rst-mgr" is used for the Stratix10 reset manager.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  Documentation/devicetree/bindings/reset/socfpga-reset.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/socfpga-reset.txt b/Documentation/devicetree/bindings/reset/socfpga-reset.txt
> index 98c9f560e5c5..38fe34fd8b8a 100644
> --- a/Documentation/devicetree/bindings/reset/socfpga-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/socfpga-reset.txt
> @@ -1,7 +1,8 @@
>  Altera SOCFPGA Reset Manager
>  
>  Required properties:
> -- compatible : "altr,rst-mgr"
> +- compatible : "altr,rst-mgr" for (Cyclone5/Arria5/Arria10)
> +	       "altr,stratix10-rst-mgr","altr,rst-mgr" for Stratix10 ARM64 SoC

git grep '\(altr\|intel\),stratix10'

currently only shows "intel,stratix10-clkmgr". Should this be
"intel,stratix10-rst-mgr"? I think keeping "altr," is fine for
consistency, just wanted to point it out.

>  - reg : Should contain 1 register ranges(address and length)
>  - altr,modrst-offset : Should contain the offset of the first modrst register.
>  - #reset-cells: 1

regards
Philipp
