From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 08/41] Documentation: dt: arm: fix spelling mistakes
Date: Mon, 25 Apr 2016 08:48:46 -0500
Message-ID: <20160425134846.GA7606@rob-hp-laptop>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-9-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461543878-3639-9-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Engestrom <eric@engestrom.ch>
Cc: linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Punit Agrawal <punit.agrawal@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 01:24:05AM +0100, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric@engestrom.ch>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/arm/cci.txt        | 2 +-
>  Documentation/devicetree/bindings/arm/spear-misc.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cci.txt b/Documentation/devicetree/bindings/arm/cci.txt
> index a1a5a7e..0f2153e 100644
> --- a/Documentation/devicetree/bindings/arm/cci.txt
> +++ b/Documentation/devicetree/bindings/arm/cci.txt
> @@ -100,7 +100,7 @@ specific to ARM.
>  				 "arm,cci-400-pmu,r0"
>  				 "arm,cci-400-pmu,r1"
>  				 "arm,cci-400-pmu"  - DEPRECATED, permitted only where OS has
> -						      secure acces to CCI registers
> +						      secure access to CCI registers
>  				 "arm,cci-500-pmu,r0"
>  				 "arm,cci-550-pmu,r0"
>  		- reg:
> diff --git a/Documentation/devicetree/bindings/arm/spear-misc.txt b/Documentation/devicetree/bindings/arm/spear-misc.txt
> index cf64982..e404e25 100644
> --- a/Documentation/devicetree/bindings/arm/spear-misc.txt
> +++ b/Documentation/devicetree/bindings/arm/spear-misc.txt
> @@ -6,4 +6,4 @@ few properties of different peripheral controllers.
>  misc node required properties:
>  
>  - compatible Should be	"st,spear1340-misc", "syscon".
> -- reg: Address range of misc space upto 8K
> +- reg: Address range of misc space up to 8K
> -- 
> 2.8.0
> 
