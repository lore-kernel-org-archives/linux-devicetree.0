From: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH 2/8] dt-bindings: document PASID property for IOMMU
 masters
Date: Mon, 8 Jul 2019 09:58:30 +0200
Message-ID: <4a90dc21-e727-b2f6-1353-cb08babf0ec2@redhat.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-3-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610184714.6786-3-jean-philippe.brucker@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, will.deacon@arm.com
Cc: joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com, robin.murphy@arm.com, jacob.jun.pan@linux.intel.com, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jean,

On 6/10/19 8:47 PM, Jean-Philippe Brucker wrote:
> On Arm systems, some platform devices behind an SMMU may support the PASID
> feature, which offers multiple address space. Let the firmware tell us
> when a device supports PASID.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> ---
> Previous discussion on this patch last year:
> https://patchwork.ozlabs.org/patch/872275/
> I split PASID and stall definitions, keeping only PASID here.
> ---
>  Documentation/devicetree/bindings/iommu/iommu.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/iommu.txt b/Documentation/devicetree/bindings/iommu/iommu.txt
> index 5a8b4624defc..3c36334e4f94 100644
> --- a/Documentation/devicetree/bindings/iommu/iommu.txt
> +++ b/Documentation/devicetree/bindings/iommu/iommu.txt
> @@ -86,6 +86,12 @@ have a means to turn off translation. But it is invalid in such cases to
>  disable the IOMMU's device tree node in the first place because it would
>  prevent any driver from properly setting up the translations.
>  
> +Optional properties:
> +--------------------
> +- pasid-num-bits: Some masters support multiple address spaces for DMA, by
> +  tagging DMA transactions with an address space identifier. By default,
> +  this is 0, which means that the device only has one address space.
> +
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
>  
>  Notes:
>  ======
> 
