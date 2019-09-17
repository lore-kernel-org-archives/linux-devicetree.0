From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: arm-smmu: Add Adreno GPU variant
Date: Tue, 17 Sep 2019 11:56:24 -0700
Message-ID: <20190917185625.8A4A8214AF@mail.kernel.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org> <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jordan Crouse <jcrouse@codeaurora.org>, freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joerg Roedel <joro@8bytes.org>
List-Id: devicetree@vger.kernel.org

Quoting Jordan Crouse (2019-08-20 12:06:27)
> Add a compatible string to identify SMMUs that are attached
> to Adreno GPU devices that wish to support split pagetables.
>=20
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>=20
>  Documentation/devicetree/bindings/iommu/arm,smmu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Docum=
entation/devicetree/bindings/iommu/arm,smmu.txt
> index 3133f3b..3b07896 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> @@ -18,6 +18,7 @@ conditions.
>                          "arm,mmu-500"
>                          "cavium,smmu-v2"
>                          "qcom,smmu-v2"
> +                       "qcom,adreno-smmu-v2"

Is the tabbing weird here or just my MUA is failing?

> =20
>                    depending on the particular implementation and/or the
>                    version of the architecture implemented.
> @@ -31,6 +32,12 @@ conditions.
>                    as below, SoC-specific compatibles:
>                    "qcom,sdm845-smmu-500", "arm,mmu-500"
> =20
> +                 "qcom,adreno-smmu-v2" is a special implementation for

Heh, special.

> +                 SMMU devices attached to the Adreno GPU on Qcom devices.
> +                 If selected, this will enable split pagetable (TTBR1)

Is this selected? Sounds like Kconfig here.

> +                 support. Only use this if the GPU target is capable of
> +                 supporting 64 bit addresses.
> +
>  - reg           : Base address and size of the SMMU.
> =20
