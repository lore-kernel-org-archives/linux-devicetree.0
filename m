Return-Path: <robherring2@gmail.com>
Date: Tue, 18 Dec 2018 10:42:30 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: tegra-cec: Document Tegra186
 and Tegra194
Message-ID: <20181218164230.GA18480@bogus>
References: <20181211094841.16027-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181211094841.16027-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Dec 11, 2018 at 10:48:39AM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Tegra186 and Tegra194 contain a CEC controller that is identical to
> that found in earlier generations. Document the compatible strings for
> these newer chips.

If identical, why don't you have a fallback compatible?

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - new patch adding missing compatible strings
> 
>  Documentation/devicetree/bindings/media/tegra-cec.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/tegra-cec.txt b/Documentation/devicetree/bindings/media/tegra-cec.txt
> index c503f06f3b84..da3590f0b7a1 100644
> --- a/Documentation/devicetree/bindings/media/tegra-cec.txt
> +++ b/Documentation/devicetree/bindings/media/tegra-cec.txt
> @@ -8,6 +8,8 @@ Required properties:
>  	"nvidia,tegra114-cec"
>  	"nvidia,tegra124-cec"
>  	"nvidia,tegra210-cec"
> +	"nvidia,tegra186-cec"
> +	"nvidia,tegra194-cec"
>    - reg : Physical base address of the IP registers and length of memory
>  	  mapped region.
>    - interrupts : HDMI CEC interrupt number to the CPU.
> -- 
> 2.19.1
> 
