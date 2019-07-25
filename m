From: santosh.shilimkar@oracle.com
Subject: Re: [PATCH v4 0/5] soc: ti: k3: Allow for exclusive and shared device
 requests
Date: Thu, 25 Jul 2019 10:39:23 -0700
Message-ID: <d549d2e9-c375-2c46-e4bc-e3a572c90f11@oracle.com>
References: <20190722050757.29893-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722050757.29893-1-lokeshvutla@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lokesh Vutla <lokeshvutla@ti.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 7/21/19 10:07 PM, Lokesh Vutla wrote:
> Sysfw provides an option for requesting exclusive access for a
> device using the flags MSG_FLAG_DEVICE_EXCLUSIVE. If this flag is
> not used, the device is meant to be shared across hosts. Once a device
> is requested from a host with this flag set, any request to this
> device from a different host will be nacked by sysfw.
> 
> Current tisci firmware and pm drivers always requests for device with
> exclusive permissions set. But this is not be true for certain devices
> that are expcted to be shared across different host contexts.
> So add support for getting the shared or exclusive permissions from DT
> and request firmware accordingly.
> 
> Changes since v3: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=103447
> - Rebased on top of v5.3-rc1
> - Updated power-domain cells for j721e.
> - Mark the console uart as shared in am65x-base-board
> - Added Reviewed-by from Rob
> 
> Lokesh Vutla (5):
>    firmware: ti_sci: Allow for device shared and exclusive requests
>    dt-bindings: ti_sci_pm_domains: Add support for exclusive and shared
>      access
>    soc: ti: ti_sci_pm_domains: Add support for exclusive and shared
>      access
>    arm64: dts: ti: k3-am654: Update the power domain cells
>    arm64: dts: ti: k3-j721e: Update the power domain cells
> 
>   .../bindings/soc/ti/sci-pm-domain.txt         | 11 ++++-
>   MAINTAINERS                                   |  1 +
>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 44 +++++++++---------
>   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi       | 10 ++---
>   arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    |  6 +--
>   arch/arm64/boot/dts/ti/k3-am65.dtsi           |  1 +
>   .../arm64/boot/dts/ti/k3-am654-base-board.dts |  1 +
>   .../dts/ti/k3-j721e-common-proc-board.dts     |  4 ++
>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 20 ++++-----
>   .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      |  6 +--
>   arch/arm64/boot/dts/ti/k3-j721e.dtsi          |  1 +
>   drivers/firmware/ti_sci.c                     | 45 ++++++++++++++++++-
>   drivers/soc/ti/ti_sci_pm_domains.c            | 23 +++++++++-
>   include/dt-bindings/soc/ti,sci_pm_domain.h    |  9 ++++
>   include/linux/soc/ti/ti_sci_protocol.h        |  3 ++
>   15 files changed, 136 insertions(+), 49 deletions(-)
>   create mode 100644 include/dt-bindings/soc/ti,sci_pm_domain.h
> 
Please split this patch series so that drivers and arch, dts patches
can be queued by respective trees.

Regards,
Santosh
