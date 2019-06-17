From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 0/6] AM654: Add PCIe and SERDES DT nodes
Date: Mon, 17 Jun 2019 18:00:52 +0300
Message-ID: <9e03c24e-4ca7-5ba5-a8d4-a95b2b6579f1@ti.com>
References: <20190529091812.20764-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529091812.20764-1-kishon@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 29/05/2019 12:18, Kishon Vijay Abraham I wrote:
> Patch series adds PCIe and SERDES DT nodes to k3-am65.dtsi and keeps
> them disabled in k3-am654-base-board.dts since there are no PCIe
> slots in the base board.
> 
> PCIe slots are actually present in add on boards. Once overlay support
> is merged, I'll add overlay DTS files to enable PCIe.
> 
> All the driver patches and binding documentation patches for PCIe and
> SERDES are already merged.

Queued up towards 5.3, thanks.

-Tero

> 
> Kishon Vijay Abraham I (6):
>    arm64: dts: k3-am6: Add "socionext,synquacer-pre-its" property to
>      gic_its
>    arm64: dts: k3-am6: Add mux-controller DT node required for muxing
>      SERDES
>    arm64: dts: k3-am6: Add SERDES DT node
>    arm64: dts: k3-am6: Add PCIe Root Complex DT node
>    arm64: dts: k3-am6: Add PCIe Endpoint DT node
>    arm64: dts: ti: am654-base-board: Disable SERDES and PCIe
> 
>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 128 ++++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-am65.dtsi           |   1 +
>   .../arm64/boot/dts/ti/k3-am654-base-board.dts |  24 ++++
>   3 files changed, 153 insertions(+)
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
