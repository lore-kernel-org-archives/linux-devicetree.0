From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v3 0/5] soc: ti: k3-am654: Allow for exclusive and shared
 device requests
Date: Wed, 29 May 2019 14:28:46 +0530
Message-ID: <3f8e15a0-af8f-c91c-5401-826460726a7d@ti.com>
References: <20190410053728.17374-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190410053728.17374-1-lokeshvutla@ti.com>
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
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob, Tero,

On 10/04/19 11:07 AM, Lokesh Vutla wrote:
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

If there are no comments on this series, can this be merged?

Thanks and regards,
Lokesh

> Changes since v2:
> - Added macros for new power-domain cell
> - Rebased on top of v5.1-rc4
> - Updated commit messages.
> 
> Lokesh Vutla (5):
>   firmware: ti_sci: Allow for device shared and exclusive requests
>   dt-bindings: ti_sci_pm_domains: Add support for exclusive and shared
>     access
>   soc: ti: ti_sci_pm_domains: Add support for exclusive and shared
>     access
>   soc: ti: ti_sci_pm_domains: Switch to SPDX Licensing
>   arm64: dts: ti: k3-am654: Update the power domain cells
> 
>  .../bindings/soc/ti/sci-pm-domain.txt         | 11 ++++-
>  MAINTAINERS                                   |  1 +
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 32 ++++++-------
>  arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi       | 10 ++---
>  arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    |  6 +--
>  arch/arm64/boot/dts/ti/k3-am65.dtsi           |  1 +
>  drivers/firmware/ti_sci.c                     | 45 ++++++++++++++++++-
>  drivers/soc/ti/ti_sci_pm_domains.c            | 33 +++++++++-----
>  include/dt-bindings/soc/ti,sci_pm_domain.h    |  9 ++++
>  include/linux/soc/ti/ti_sci_protocol.h        |  3 ++
>  10 files changed, 112 insertions(+), 39 deletions(-)
>  create mode 100644 include/dt-bindings/soc/ti,sci_pm_domain.h
> 
