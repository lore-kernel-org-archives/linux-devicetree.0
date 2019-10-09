From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH V10 0/2] mailbox: arm: introduce smc triggered mailbox
Date: Wed, 9 Oct 2019 01:10:01 +0000
Message-ID: <AM0PR04MB4481F68159D932DA455634A988950@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1569824287-4263-1-git-send-email-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569824287-4263-1-git-send-email-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

> Subject: [PATCH V10 0/2] mailbox: arm: introduce smc triggered mailbox

Are you fine with this patch set?

Thanks,
Peng.

>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> V10:
>  - Add R-b tag from Andre, Rob and Florian
>  - Two minor fixes
>   - Drop "passed from consumers" in patch 1/2 per Andre's comments
>   - Drop interrupts.h in patch 2/2 per Andre's comments
>=20
> V9:
>  - Add Florian's R-b tag in patch 1/2
>  - Mark arm,func-id as a required property per Andre's comments in patch
> 1/2.
>  - Make invoke_smc_mbox_fn as a private entry in a channal per Florian's
>    comments in pach 2/2
>  - Include linux/types.h in arm-smccc-mbox.h in patch 2/2
>  - Drop function_id from arm_smccc_mbox_cmd since func-id is from DT
>    in patch 2/2/.
>=20
>    Andre,
>     I have marked arm,func-id as a required property and dropped
> function-id
>     from client, please see whether you are happy with the patchset.
>     Hope we could finalize and get patches land in.
>=20
>    Thanks,
>    Peng.
>=20
> V8:
> Add missed arm-smccc-mbox.h
>=20
> V7:
> Typo fix
> #mbox-cells changed to 0
> Add a new header file arm-smccc-mbox.h
> Use ARM_SMCCC_IS_64
>=20
> Andre,
>   The function_id is still kept in arm_smccc_mbox_cmd, because arm,func-i=
d
> property is optional, so clients could pass function_id to mbox driver.
>=20
> V6:
> Switch to per-channel a mbox controller
> Drop arm,num-chans, transports, method
> Add arm,hvc-mbox compatible
> Fix smc/hvc args, drop client id and use correct type.
> https://patchwork.kernel.org/cover/11146641/
>=20
> V5:
> yaml fix
> https://patchwork.kernel.org/cover/11117741/
>=20
> V4:
> yaml fix for num-chans in patch 1/2.
> https://patchwork.kernel.org/cover/11116521/
>=20
> V3:
> Drop interrupt
> Introduce transports for mem/reg usage
> Add chan-id for mem usage
> Convert to yaml format
> https://patchwork.kernel.org/cover/11043541/
>=20
> V2:
> This is a modified version from Andre Przywara's patch series
> https://lore.kernel.org/patchwork/cover/812997/.
> The modification are mostly:
> Introduce arm,num-chans
> Introduce arm_smccc_mbox_cmd
> txdone_poll and txdone_irq are both set to false arm,func-ids are kept, b=
ut as
> an optional property.
> Rewords SCPI to SCMI, because I am trying SCMI over SMC, not SCPI.
> Introduce interrupts notification.
>=20
> [1] is a draft implementation of i.MX8MM SCMI ATF implementation that use
> smc as mailbox, power/clk is included, but only part of clk has been
> implemented to work with hardware, power domain only supports get name
> for now.
>=20
> The traditional Linux mailbox mechanism uses some kind of dedicated
> hardware IP to signal a condition to some other processing unit, typicall=
y a
> dedicated management processor.
> This mailbox feature is used for instance by the SCMI protocol to signal =
a
> request for some action to be taken by the management processor.
> However some SoCs does not have a dedicated management core to provide
> those services. In order to service TEE and to avoid linux shutdown power=
 and
> clock that used by TEE, need let firmware to handle power and clock, the
> firmware here is ARM Trusted Firmware that could also run SCMI service.
>=20
> The existing SCMI implementation uses a rather flexible shared memory
> region to communicate commands and their parameters, it still requires a
> mailbox to actually trigger the action.
>=20
> This patch series provides a Linux mailbox compatible service which uses =
smc
> calls to invoke firmware code, for instance taking care of SCMI requests.
> The actual requests are still communicated using the standard SCMI way of
> shared memory regions, but a dedicated mailbox hardware IP can be replace=
d
> via this new driver.
>=20
> This simple driver uses the architected SMC calling convention to trigger
> firmware services, also allows for using "HVC" calls to call into hypervi=
sors or
> firmware layers running in the EL2 exception level.
>=20
> Patch 1 contains the device tree binding documentation, patch 2 introduce=
s
> the actual mailbox driver.
>=20
> Please note that this driver just provides a generic mailbox mechanism, I=
t
> could support synchronous TX/RX, or synchronous TX with asynchronous RX.
> And while providing SCMI services was the reason for this exercise, this =
driver
> is in no way bound to this use case, but can be used generically where th=
e OS
> wants to signal a mailbox condition to firmware or a hypervisor.
> Also the driver is in no way meant to replace any existing firmware inter=
face,
> but actually to complement existing interfaces.
>=20
> [1] https://github.com/MrVan/arm-trusted-firmware/tree/scmi
>=20
>=20
>=20
> Peng Fan (2):
>   dt-bindings: mailbox: add binding doc for the ARM SMC/HVC mailbox
>   mailbox: introduce ARM SMC based mailbox
>=20
>  .../devicetree/bindings/mailbox/arm-smc.yaml       |  96
> ++++++++++++
>  drivers/mailbox/Kconfig                            |   7 +
>  drivers/mailbox/Makefile                           |   2 +
>  drivers/mailbox/arm-smc-mailbox.c                  | 166
> +++++++++++++++++++++
>  include/linux/mailbox/arm-smccc-mbox.h             |  20 +++
>  5 files changed, 291 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/mailbox/arm-smc.yaml
>  create mode 100644 drivers/mailbox/arm-smc-mailbox.c  create mode
> 100644 include/linux/mailbox/arm-smccc-mbox.h
>=20
> --
> 2.16.4
