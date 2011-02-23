From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] olpc_battery: bind to device tree
Date: Wed, 23 Feb 2011 13:34:30 -0700
Message-ID: <AANLkTi=29myerzgH6WRCSOPKpaDnGgEtQacVHvxRoQT_@mail.gmail.com>
References: <20110219150644.681D59D401D@zog.reactivated.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110219150644.681D59D401D@zog.reactivated.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <dsd@laptop.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>
Cc: cbou@mail.ru, dwmw2@infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, dilinger@queued.net, dmitry.torokhov@gmail.com
List-Id: devicetree@vger.kernel.org

[cc'ing devicetree-discuss@lists.ozlabs.org.  Please cc this list for
any dt-related patches]

On Sat, Feb 19, 2011 at 8:06 AM, Daniel Drake <dsd@laptop.org> wrote:
> Move from being statically probed by platform presence to binding to
> the battery node of the device tree.
>
> This is cleaner and allows suspend/resume (wakeup) support to be adde=
d
> in a later patch.
>
> Signed-off-by: Daniel Drake <dsd@laptop.org>

Hi Daniel, comments below.

> ---
> =A0arch/x86/platform/olpc/olpc_dt.c | =A0 13 +++++++
> =A0drivers/power/Kconfig =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0drivers/power/olpc_battery.c =A0 =A0 | =A0 66 ++++++++++++++++++++=
+++++------------
> =A03 files changed, 58 insertions(+), 23 deletions(-)
>
> Replaces patch "olpc_battery: convert to platform device"
>
> The problem mentioned in another mail regarding devicetree binding is=
 now
> fixed via separate patches from Andres.
>
> diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olp=
c/olpc_dt.c
> index dab8746..97211c1 100644
> --- a/arch/x86/platform/olpc/olpc_dt.c
> +++ b/arch/x86/platform/olpc/olpc_dt.c
> @@ -19,6 +19,7 @@
> =A0#include <linux/kernel.h>
> =A0#include <linux/bootmem.h>
> =A0#include <linux/of.h>
> +#include <linux/of_platform.h>
> =A0#include <linux/of_pdt.h>
> =A0#include <asm/olpc_ofw.h>
>
> @@ -181,3 +182,15 @@ void __init olpc_dt_build_devicetree(void)
> =A0 =A0 =A0 =A0pr_info("PROM DT: Built device tree with %u bytes of m=
emory.\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prom_early_allocated);
> =A0}
> +
> +/* A list of DT node/bus matches that we want to expose as platform =
devices */
> +static struct of_device_id __initdata of_ids[] =3D {
> + =A0 =A0 =A0 { .name =3D "battery" },
> + =A0 =A0 =A0 {},

As mentioned in the other thread, matching by name is strongly
discouraged.  It isn't very accurate and compatible is the preferred
method for binding devices.  'battery' in particular is highly
non-specific.

I do understand that you don't have a compatible property in the
current firmware, and to a certain extent we have to live with what
we're given by the kernel.  However, I think it would be better in the
OLPC case to find the battery node and add a compatible property
before registering a platform_device for it.  (or use a bus notifier
to tell you when it is registered, and add 'compatible' at that
point.)  That way we the uncertainty is taken care of in the board
support code without polluting the driver matching namespace.

> +};
> +
> +static int __init declare_of_platform_devices(void)
> +{
> + =A0 =A0 =A0 return of_platform_bus_probe(NULL, of_ids, NULL);
> +}
> +device_initcall(declare_of_platform_devices);
> diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
> index 61bf5d7..3a9151d 100644
> --- a/drivers/power/Kconfig
> +++ b/drivers/power/Kconfig
> @@ -84,7 +84,7 @@ config BATTERY_PMU
>
> =A0config BATTERY_OLPC
> =A0 =A0 =A0 =A0tristate "One Laptop Per Child battery"
> - =A0 =A0 =A0 depends on X86_32 && OLPC
> + =A0 =A0 =A0 depends on X86_32 && OLPC && OF
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Say Y to enable support for the battery on the OLP=
C laptop.
>
> diff --git a/drivers/power/olpc_battery.c b/drivers/power/olpc_batter=
y.c
> index 0b0ff3a..99fc8e0 100644
> --- a/drivers/power/olpc_battery.c
> +++ b/drivers/power/olpc_battery.c
> @@ -17,6 +17,7 @@
> =A0#include <linux/power_supply.h>
> =A0#include <linux/jiffies.h>
> =A0#include <linux/sched.h>
> +#include <linux/of_platform.h>
> =A0#include <asm/olpc.h>
>
>
> @@ -519,9 +520,8 @@ static struct device_attribute olpc_bat_error =3D=
 {
> =A0* =A0 =A0 =A0 =A0 =A0 =A0 Initialisation
> =A0******************************************************************=
***/
>
> -static struct platform_device *bat_pdev;
> -
> =A0static struct power_supply olpc_bat =3D {
> + =A0 =A0 =A0 .name =3D "olpc-battery",
> =A0 =A0 =A0 =A0.get_property =3D olpc_bat_get_property,
> =A0 =A0 =A0 =A0.use_for_apm =3D 1,
> =A0};
> @@ -534,13 +534,18 @@ void olpc_battery_trigger_uevent(unsigned long =
cause)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kobject_uevent(&olpc_bat.dev->kobj, KO=
BJ_CHANGE);
> =A0}
>
> -static int __init olpc_bat_init(void)
> +static int __devinit olpc_battery_probe(struct platform_device *pdev=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 const struct of_device_id *match)

static int __devinit olpc_battery_probe(struct platform_device *pdev)

match is no longer needed (see below)

> =A0{
> - =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 int ret;
> =A0 =A0 =A0 =A0uint8_t status;
> + =A0 =A0 =A0 struct device_node *root;
> + =A0 =A0 =A0 const char *arch;
> + =A0 =A0 =A0 int propsize;
>
> - =A0 =A0 =A0 if (!olpc_platform_info.ecver)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENXIO;
> + =A0 =A0 =A0 /* Check that we're running on an XO laptop */
> + =A0 =A0 =A0 if (!machine_is_olpc())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * We've seen a number of EC protocol changes; this dr=
iver requires
> @@ -552,21 +557,15 @@ static int __init olpc_bat_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENXIO;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 /* Ignore the status. It doesn't actually matter */
> =A0 =A0 =A0 =A0ret =3D olpc_ec_cmd(EC_BAT_STATUS, NULL, 0, &status, 1=
);
> =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
>
> - =A0 =A0 =A0 /* Ignore the status. It doesn't actually matter */
> -
> - =A0 =A0 =A0 bat_pdev =3D platform_device_register_simple("olpc-batt=
ery", 0, NULL, 0);
> - =A0 =A0 =A0 if (IS_ERR(bat_pdev))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(bat_pdev);
> -
> - =A0 =A0 =A0 ret =3D power_supply_register(&bat_pdev->dev, &olpc_ac)=
;
> + =A0 =A0 =A0 ret =3D power_supply_register(&pdev->dev, &olpc_ac);
> =A0 =A0 =A0 =A0if (ret)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto ac_failed;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>
> - =A0 =A0 =A0 olpc_bat.name =3D bat_pdev->name;
> =A0 =A0 =A0 =A0if (olpc_board_at_least(olpc_board_pre(0xd0))) { /* XO=
-1.5 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0olpc_bat.properties =3D olpc_xo15_bat_=
props;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0olpc_bat.num_properties =3D ARRAY_SIZE=
(olpc_xo15_bat_props);
> @@ -575,7 +574,7 @@ static int __init olpc_bat_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0olpc_bat.num_properties =3D ARRAY_SIZE=
(olpc_xo1_bat_props);
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 ret =3D power_supply_register(&bat_pdev->dev, &olpc_bat=
);
> + =A0 =A0 =A0 ret =3D power_supply_register(&pdev->dev, &olpc_bat);
> =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto battery_failed;
>
> @@ -587,7 +586,7 @@ static int __init olpc_bat_init(void)
> =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto error_failed;
>
> - =A0 =A0 =A0 goto success;
> + =A0 =A0 =A0 return 0;
>
> =A0error_failed:
> =A0 =A0 =A0 =A0device_remove_bin_file(olpc_bat.dev, &olpc_bat_eeprom)=
;
> @@ -595,19 +594,42 @@ eeprom_failed:
> =A0 =A0 =A0 =A0power_supply_unregister(&olpc_bat);
> =A0battery_failed:
> =A0 =A0 =A0 =A0power_supply_unregister(&olpc_ac);
> -ac_failed:
> - =A0 =A0 =A0 platform_device_unregister(bat_pdev);
> -success:
> =A0 =A0 =A0 =A0return ret;
> =A0}
>
> -static void __exit olpc_bat_exit(void)
> +static int __devexit olpc_battery_remove(struct platform_device *pde=
v)
> =A0{
> =A0 =A0 =A0 =A0device_remove_file(olpc_bat.dev, &olpc_bat_error);
> =A0 =A0 =A0 =A0device_remove_bin_file(olpc_bat.dev, &olpc_bat_eeprom)=
;
> =A0 =A0 =A0 =A0power_supply_unregister(&olpc_bat);
> =A0 =A0 =A0 =A0power_supply_unregister(&olpc_ac);
> - =A0 =A0 =A0 platform_device_unregister(bat_pdev);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static const struct of_device_id olpc_battery_ids[] __devinitconst =3D=
 {
> + =A0 =A0 =A0 { .name =3D "battery" },
> + =A0 =A0 =A0 {}
> +};
> +MODULE_DEVICE_TABLE(of, olpc_battery_ids);
> +
> +static struct of_platform_driver olpc_battery_drv =3D {

This should be:

static struct platform_driver olpc_battery_drv =3D {

of_platform_driver is deprecated and in the process of being removed.
platform_driver is pretty much a drop in replacement as long as the
=2Eof_match_table is populated.

> + =A0 =A0 =A0 .driver =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "olpc-battery",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D olpc_battery_ids,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .probe =3D olpc_battery_probe,
> + =A0 =A0 =A0 .remove =3D __devexit_p(olpc_battery_remove),
> +};
> +
> +static int __init olpc_bat_init(void)
> +{
> + =A0 =A0 =A0 return of_register_platform_driver(&olpc_battery_drv);

return platform_driver_register(&olpc_battery_drv)

> +}
> +
> +static void __exit olpc_bat_exit(void)
> +{
> + =A0 =A0 =A0 of_unregister_platform_driver(&olpc_battery_drv);

platform_driver_unregister()

> =A0}
>
> =A0module_init(olpc_bat_init);
> --
> 1.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
