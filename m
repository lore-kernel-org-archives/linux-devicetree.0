From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: arm-smmu: Add Adreno GPU variant
Date: Tue, 27 Aug 2019 12:13:42 -0500
Message-ID: <20190827171342.GA29932@bogus>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
 <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jordan Crouse <jcrouse@codeaurora.org>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, Mark Rutland <mark.rutland@arm.com>, Joerg Roedel <joro@8bytes.org>
List-Id: devicetree@vger.kernel.org

On Tue, 20 Aug 2019 13:06:27 -0600, Jordan Crouse wrote:
> Add a compatible string to identify SMMUs that are attached
> to Adreno GPU devices that wish to support split pagetables.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
