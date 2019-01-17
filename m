From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845: Expand soc bus address range
Date: Thu, 17 Jan 2019 14:41:16 +0100
Message-ID: <38c47c17-b86e-500a-e8c1-74d8944c6f9a@free.fr>
References: <20190116064906.22791-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116064906.22791-1-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Doug Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On 16/01/2019 07:49, Bjorn Andersson wrote:

> DMA addresses for devices on the soc bus must be constrained to the 36
> address bits that the bus provides.  When no IOMMU is present then this
> is easy--DMA addresses are just physical addresses and physical
> addresses are (by definition) within the address bits of the bus.  When
> an IOMMU is present, however, DMA addresses are virtual addresses.
> Despite these addresses being virtual, however, they are still
> constrained by the 36 address bits of the bus.
> 
> Unless dma-ranges is specified, which causes bus_dma_mask to be set, DMA
> allocations for devices on the platform_bus will use all 48 address bits
> available by the ARM SMMU. Causing addresses to be truncated on the bus.
> 
> This patch increases the #size-cells to 2, in order to be able to define
> dma-ranges describe the 36 bit DMA capability of the bus, and bumps

Seems like you changed your mind mid-sentence? :-)

> While touching all reg properties, addresses are padded to 8 digits.
