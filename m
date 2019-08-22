From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: iommu/arm,smmu: add compatible string
 for Marvell
Date: Thu, 22 Aug 2019 15:16:25 +0100
Message-ID: <5208b371-c81a-23a0-0870-2810fce3c7fa@arm.com>
References: <20190711150242.25290-1-gregory.clement@bootlin.com>
 <20190711150242.25290-4-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190711150242.25290-4-gregory.clement@bootlin.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Antoine Tenart <antoine.tenart@bootlin.com>, =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>
List-Id: devicetree@vger.kernel.org

On 11/07/2019 16:02, Gregory CLEMENT wrote:
> From: Hanna Hawa <hannah@marvell.com>
> 
> Add specific compatible string for Marvell usage due errata of
> accessing 64bits registers of ARM SMMU, in AP806.
> 
> AP806 SoC uses the generic ARM-MMU500, and there's no specific
> implementation of Marvell, this compatible is used for errata only.

Forgive me for repeating myself[1], but:

"Given that, I think something more specific like:

	"marvell,ap806-smmu", "arm,mmu-500";

would be most appropriate. Otherwise, if some future Marvell SoC were to
ever come out with a *different* MMU-500 integration problem, you'd
already have painted yourself into a corner."

Robin.

[1] 
https://lore.kernel.org/linux-arm-kernel/3ce1d67a-4e3c-e8d8-f7fc-79649f1def68@arm.com/

> Signed-off-by: Hanna Hawa <hannah@marvell.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> index 3133f3ba7567..7ed58d51846e 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> @@ -16,6 +16,7 @@ conditions.
>                           "arm,mmu-400"
>                           "arm,mmu-401"
>                           "arm,mmu-500"
> +                        "marvell,mmu-500"
>                           "cavium,smmu-v2"
>                           "qcom,smmu-v2"
>   
> 
