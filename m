From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 0/2] mailbox: arm: introduce smc triggered mailbox
Date: Tue, 27 Aug 2019 09:51:50 +0000
Message-ID: <1566942646-18015-1-git-send-email-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V4:
yaml fix for num-chans in patch 1/2.

V3:
Drop interrupt
Introduce transports for mem/reg usage
Add chan-id for mem usage
Convert to yaml format
https://patchwork.kernel.org/cover/11043541/
 
V2:
This is a modified version from Andre Przywara's patch series
https://lore.kernel.org/patchwork/cover/812997/.
The modification are mostly:
Introduce arm,num-chans
Introduce arm_smccc_mbox_cmd
txdone_poll and txdone_irq are both set to false
arm,func-ids are kept, but as an optional property.
Rewords SCPI to SCMI, because I am trying SCMI over SMC, not SCPI.
Introduce interrupts notification.

[1] is a draft implementation of i.MX8MM SCMI ATF implementation that
use smc as mailbox, power/clk is included, but only part of clk has been
implemented to work with hardware, power domain only supports get name
for now.

The traditional Linux mailbox mechanism uses some kind of dedicated hardware
IP to signal a condition to some other processing unit, typically a dedicated
management processor.
This mailbox feature is used for instance by the SCMI protocol to signal a
request for some action to be taken by the management processor.
However some SoCs does not have a dedicated management core to provide
those services. In order to service TEE and to avoid linux shutdown
power and clock that used by TEE, need let firmware to handle power
and clock, the firmware here is ARM Trusted Firmware that could also
run SCMI service.

The existing SCMI implementation uses a rather flexible shared memory
region to communicate commands and their parameters, it still requires a
mailbox to actually trigger the action.

This patch series provides a Linux mailbox compatible service which uses
smc calls to invoke firmware code, for instance taking care of SCMI requests.
The actual requests are still communicated using the standard SCMI way of
shared memory regions, but a dedicated mailbox hardware IP can be replaced via
this new driver.

This simple driver uses the architected SMC calling convention to trigger
firmware services, also allows for using "HVC" calls to call into hypervisors
or firmware layers running in the EL2 exception level.

Patch 1 contains the device tree binding documentation, patch 2 introduces
the actual mailbox driver.

Please note that this driver just provides a generic mailbox mechanism,
It could support synchronous TX/RX, or synchronous TX with asynchronous
RX. And while providing SCMI services was the reason for this exercise,
this driver is in no way bound to this use case, but can be used generically
where the OS wants to signal a mailbox condition to firmware or a
hypervisor.
Also the driver is in no way meant to replace any existing firmware
interface, but actually to complement existing interfaces.

[1] https://github.com/MrVan/arm-trusted-firmware/tree/scmi

Peng Fan (2):
  dt-bindings: mailbox: add binding doc for the ARM SMC/HVC mailbox
  mailbox: introduce ARM SMC based mailbox

 .../devicetree/bindings/mailbox/arm-smc.yaml       | 126 ++++++++++++
 drivers/mailbox/Kconfig                            |   7 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/arm-smc-mailbox.c                  | 215 +++++++++++++++++++++
 4 files changed, 350 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/arm-smc.yaml
 create mode 100644 drivers/mailbox/arm-smc-mailbox.c

-- 
2.16.4
