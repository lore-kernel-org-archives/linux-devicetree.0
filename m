From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH] TESTCASE: of: OOPS when disabling node via OF_DYNAMIC
Date: Tue, 31 Mar 2015 19:23:19 +0300
Message-ID: <AEA6F5CA-D520-4F34-BE6B-EF2839501089@konsulko.com>
References: <1427814771-30335-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427814771-30335-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Wolfram,

> On Mar 31, 2015, at 18:12 , Wolfram Sang <wsa@the-dreams.de> wrote:
>=20
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> I wanted to disable a node via OF_DYNAMIC by setting its status to di=
sabled.
> This code is the minimal testcase, the same happens in a more complex=
 scenario.
> There is something wrong with freeing resources. Is my module wrong? =
Or is it a
> bug? Crashlog without CONFIG_I2C_CHARDEV, slightly shortened:
>=20

> [    5.127314] of/notify UPDATE_PROPERTY /i2c@e60b0000:status
> [    5.132814] i2c-sh_mobile e60b0000.i2c: pm_clk_notify() 2
> [    5.138504] bus: 'platform': remove device e60b0000.i2c
> [    5.143762] i2c-sh_mobile e60b0000.i2c: pm_clk_notify() 6
> [    5.149231] device: '7-0068': device_unregister
> [    5.153982] bus: 'i2c': remove device 7-0068
> [    5.158679] device: 'regulator.2': device_unregister
> [    5.165827] i2c 7-0068: uevent
> [    5.168997] i2c i2c-7: adapter [e60b0000.i2c] unregistered
> [    5.174462] device: 'i2c-7': device_unregister
> [    5.179057] bus: 'i2c': remove device i2c-7
> [    5.183570] platform e60b0000.i2c: pm_clk_notify() 7
> [    5.188595] platform e60b0000.i2c: Runtime PM disabled, clock forc=
ed off.
> [    5.195368] platform e60b0000.i2c: pm_clk_notify() 3
> [    5.200426] Unable to handle kernel NULL pointer dereference at vi=
rtual address 00000018
> [    5.208474] pgd =3D c0004000
> [    5.211164] [00000018] *pgd=3D00000000
> [    5.214745] Internal error: Oops: 5 [#1] ARM
> [    5.218995] CPU: 0 PID: 1 Comm: swapper Tainted: G        W       =
4.0.0-rc4-00009-gcb55587ebc4047 #90
> [    5.228148] Hardware name: Generic R8A7790 (Flattened Device Tree)
> [    5.234288] task: ee84d340 ti: ee84e000 task.ti: ee84e000
> [    5.239656] PC is at release_resource+0x20/0x68
> [    5.244171] LR is at _raw_write_lock+0x3c/0x44
> [    5.248591] pc : [<c002417c>]    lr : [<c025f0e0>]    psr: a000011=
3
> [    5.248591] sp : ee84fcd8  ip : ee84fcb0  fp : ee84fcec
> [    5.259989] r10: 00000000  r9 : c03de2c0  r8 : c03d5694
> [    5.265180] r7 : ee84fdf4  r6 : 0000001c  r5 : 00000000  r4 : ee8e=
fd00
> [    5.271664] r3 : 00000000  r2 : 00000018  r1 : 00000009  r0 : c03c=
7cd8
> [    5.278149] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  S=
egment kernel
> [    5.285410] Control: 10c5347d  Table: 40004059  DAC: 00000015
> [    5.291117] Process swapper (pid: 1, stack limit =3D 0xee84e208)
> [    5.296911] Stack: (0xee84fcd8 to 0xee850000)
> [    5.301243] fcc0:                                                 =
      00000000 ee8f3e00
> [    5.309375] fce0: ee84fd0c ee84fcf0 c01604fc c0024168 c03d39a0 ee8=
f3e00 00000000 00000005
> [    5.317507] fd00: ee84fd24 ee84fd10 c016054c c0160494 c03d39a0 ee8=
f3e10 ee84fd3c ee84fd28
> [    5.325639] fd20: c01aad54 c0160544 ee8f3e34 ee8f3e00 ee84fd64 ee8=
4fd40 c01ab3f8 c01aad08
> ...
> [    5.512643] Backtrace:
> [    5.515097] [<c002415c>] (release_resource) from [<c01604fc>] (pla=
tform_device_del+0x74/0x84)
> [    5.523561]  r4:ee8f3e00 r3:00000000
> [    5.527145] [<c0160488>] (platform_device_del) from [<c016054c>] (=
platform_device_unregister+0x14/0x20)
> [    5.536469]  r6:00000005 r5:00000000 r4:ee8f3e00 r3:c03d39a0
> [    5.542152] [<c0160538>] (platform_device_unregister) from [<c01aa=
d54>] (of_platform_device_destroy+0x58/0xa8)
> [    5.552080]  r4:ee8f3e10 r3:c03d39a0
> [    5.555667] [<c01aacfc>] (of_platform_device_destroy) from [<c01ab=
3f8>] (of_platform_notify+0xcc/0xe8)
> [    5.564905]  r4:ee8f3e00 r3:ee8f3e34
> [    5.568493] [<c01ab32c>] (of_platform_notify) from [<c00389b0>] (n=
otifier_call_chain+0x48/0x70)
> [    5.577128]  r6:00000005 r5:00000000 r4:ffffffff
> [    5.581759] [<c0038968>] (notifier_call_chain) from [<c0038c78>] (=
__blocking_notifier_call_chain+0x4c/0x64)
> [    5.591429]  r8:00000005 r7:ee84fdf4 r6:ffffffff r5:c03d7ba4 r4:c0=
3d7b98 r3:ffffffff
> [    5.599192] [<c0038c2c>] (__blocking_notifier_call_chain) from [<c=
0038cb0>] (blocking_notifier_call_chain+0x20/0x28)
> [    5.609637]  r8:c0340d2c r7:c0340d2c r6:ee84fe88 r5:00000005 r4:ee=
84fdf4
> [    5.616365] [<c0038c90>] (blocking_notifier_call_chain) from [<c01=
ab868>] (of_reconfig_notify+0x88/0xa8)
> [    5.625788] [<c01ab7e0>] (of_reconfig_notify) from [<c01aba70>] (o=
f_property_notify+0x44/0x4c)
> [    5.634338]  r5:ee84fe88 r4:ee940440
> [    5.637925] [<c01aba2c>] (of_property_notify) from [<c01abafc>] (_=
_of_changeset_entry_notify+0x84/0xc4)
> [    5.647263] [<c01aba78>] (__of_changeset_entry_notify) from [<c01a=
c408>] (of_changeset_apply+0xa4/0xe4)
> [    5.656588]  r4:ee940440
> [    5.659126] [<c01ac364>] (of_changeset_apply) from [<c0335744>] (t=
est_init+0x84/0xa8)
> [    5.666900]  r6:00000000 r5:c03356c0 r4:eefd18b8
> [    5.671533] [<c03356c0>] (test_init) from [<c0321dd8>] (do_one_ini=
tcall+0x108/0x1bc)
> [    5.679220]  r4:ee940440
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> drivers/of/Makefile       |  2 +-
> drivers/of/wsa_testcase.c | 48 ++++++++++++++++++++++++++++++++++++++=
+++++++++
> 2 files changed, 49 insertions(+), 1 deletion(-)
> create mode 100644 drivers/of/wsa_testcase.c
>=20
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index 7563f36c71db34..4ec30a5bab39d5 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -1,4 +1,4 @@
> -obj-y =3D base.o device.o platform.o
> +obj-y =3D base.o device.o platform.o wsa_testcase.o
> obj-$(CONFIG_OF_DYNAMIC) +=3D dynamic.o
> obj-$(CONFIG_OF_FLATTREE) +=3D fdt.o
> obj-$(CONFIG_OF_EARLY_FLATTREE) +=3D fdt_address.o
> diff --git a/drivers/of/wsa_testcase.c b/drivers/of/wsa_testcase.c
> new file mode 100644
> index 00000000000000..b6bffd1acf76ad
> --- /dev/null
> +++ b/drivers/of/wsa_testcase.c
> @@ -0,0 +1,48 @@
> +/*
> + * Testcase for disabling nodes via OF_DYNAMIC
> + *
> + * Copyright (C) 2015 by Wolfram Sang, Sang Engineering <wsa@sang-en=
gineering.com>
> + * Copyright (C) 2015 by Renesas Electronics Corporation
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify it
> + * under the terms of the GNU General Public License as published by=
 the
> + * Free Software Foundation; version 2 of the License.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include "of_private.h"
> +
> +static __init int test_init(void)
> +{
> +
> +	struct i2c_adapter *adap;
> +	struct device_node *np;
> +	struct of_changeset chgset;
> +	struct property status_chg =3D { .name =3D "status", .length =3D 9,=
 .value =3D "disabled" };
> +	int ret;
> +

^ The status_chg property is on the stack. You can=E2=80=99t do that, b=
ecause after you go out
of scope the property is garbage. You should dynamically allocate.

I bet that even after you fix that you=E2=80=99ll crash anyway.
Note is that on many platforms the path of removing platform devices is=
 borken.
I see that you=E2=80=99re using PM, that=E2=80=99s even more problemati=
c.

The good news is that we can probably fix it if you give us a detailed =
log and
stack trace.

> +	// Use an active adapter here
> +	adap =3D i2c_get_adapter(0);
> +	if (!adap)
> +		return -EPROBE_DEFER;
> +
> +	np =3D adap->dev.of_node;
> +
> +	i2c_put_adapter(adap);
> +
> +	of_changeset_init(&chgset);
> +	of_changeset_update_property(&chgset, np, &status_chg);
> +
> +	mutex_lock(&of_mutex);
> +	ret =3D of_changeset_apply(&chgset);
> +	mutex_unlock(&of_mutex);
> +
> +	return ret;
> +}
> +late_initcall(test_init);
> +
> +MODULE_AUTHOR("Wolfram Sang <wsa@sang-engineering.com>");
> +MODULE_LICENSE("GPL v2");
> --=20
> 2.1.4
>=20

Regards

=E2=80=94 Pantelis
