From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am65: Change #address-cells and
 #size-cells of interconnect to 2
Date: Tue, 4 Sep 2018 08:41:42 -0500
Message-ID: <20180904134142.npoxfimfsllmxdwb@akan>
References: <20180903095235.13853-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180903095235.13853-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, nsekhar@ti.com, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

On 15:22-20180903, Kishon Vijay Abraham I wrote:

> AM65 has two PCIe controllers and each PCIe controller has '2' address
> spaces one within the 4GB address space of the SoC and the other above
> the 4GB address space of the SoC (cbass_main) in addition to the
> register space. The size of the address space above the 4GB SoC address
> space is 4GB. These address ranges will be used by CPU/DMA to access
> the PCIe address space. In order to represent the address space above
> the 4GB SoC address space and to represent the size of this address
> space as 4GB, change address-cells and size-cells of interconnect to 2.
> 
> Since OSPI has similar need in MCU Domain Memory Map, change
> address-cells and size-cells of cbass_mcu interconnect also to 2.
> 

Please add Fixes

Vignesh, Sekhar, Tony,

Do we agree this is the right way to go forward? if yes, please
ack.


-- 
Regards,
Nishanth Menon
