From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am65: Change #address-cells and
 #size-cells of interconnect to 2
Date: Tue, 28 Aug 2018 09:25:56 -0700
Message-ID: <20180828162556.GQ7523@atomide.com>
References: <20180828102642.26482-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180828102642.26482-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>, nsekhar@ti.com
List-Id: devicetree@vger.kernel.org

* Kishon Vijay Abraham I <kishon@ti.com> [180828 10:31]:
> AM65 has two PCIe controllers and each PCIe controller has '2' address
> spaces one within the 4GB address space of the SoC and the other above
> the 4GB address space of the SoC in addition to the register space. The
> size of the address space above the 4GB SoC address space is 4GB. These
> address ranges will be used by CPU/DMA to access the PCIe address space.
> In order to represent the address space above the 4GB SoC address space
> and to represent the size of this address space as 4GB, change
> address-cells and size-cells of interconnect to 2.
...
>  		cbass_mcu: interconnect@28380000 {
>  			compatible = "simple-bus";
>  			#address-cells = <1>;
>  			#size-cells = <1>;

Yup great, the interconnect instances that don't need above 4GB
address space should stay this way.

Acked-by: Tony Lindgren <tony@atomide.com>
