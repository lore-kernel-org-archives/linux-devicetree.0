From: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] extcon: cros-ec: Add extcon-cros-ec driver to
 support display out.
Date: Mon, 17 Jul 2017 11:02:21 +0200
Message-ID: <CAFqH_53h33cUQ+cJro75XVTnjWY1acFtvnQEeAfynBidMzt1yw@mail.gmail.com>
References: <CGME20170717073746epcas3p4e40eb7da6a6a96da343d7c622491c039@epcas3p4.samsung.com>
 <20170717073720.788-1-enric.balletbo@collabora.com> <87f65045-911a-491d-940a-26c24e189578@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87f65045-911a-491d-940a-26c24e189578-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

2017-07-17 10:54 GMT+02:00 Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
> Hi Enric,
>
> When I tried to apply this patch, error happened as following:
> (based on v4.13-rc1)
>
> Applying: extcon: cros-ec: Add extcon-cros-ec driver to support display o=
ut.
> error: patch failed: include/linux/mfd/cros_ec_commands.h:285
> error: include/linux/mfd/cros_ec_commands.h: patch does not apply
>

Very sorry about that, I had another patch that touched this file and
I forget to invert the sequence, first apply these patches then the
others. Let me fix that and resend again in few minutes, Very sorry
for the noise.

> Is it based on v4.13-rc1?
>
>
> On 2017=EB=85=84 07=EC=9B=94 17=EC=9D=BC 16:37, Enric Balletbo i Serra wr=
ote:
>> From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>
>> This is the driver for the USB Type C cable detection mechanism
>> built into the ChromeOS Embedded Controller on systems that
>> have USB Type-C ports.
>>
>> At present, this allows for the presence of display out, but in
>> future, it may also be used to notify host and device type cables
>> and the presence of power.
>>
>> Signed-off-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>> Acked-by: Chanwoo Choi <cw00.chio-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> Changes since v2:
>>  - Rebase on top of v4.13-rc1
>> Changes since v1:
>>  Requested by Chanwoo Choi
>>  - Rename files changing _ for -
>>  - Remove the unneeded blank line on bottom of header.
>>  - Remove kobject.h and cros_ec_commands.h includes.
>>  - Remove the debug message as is not necessary.
>>  - Use the tab for indentation instead of space for if sentence.
>>  - Define each variable on different lines when the variables should be
>>    initialized.
>>  - Remove EXTCON_USB and EXTCON_USB_HOST as are not really used for now.
>>  - Add one blank line to split out between state and property setting.
>>  - Add the author information (header and module)
>>
>>  Enric Balletbo
>>  - As Rob suggested to rename the compatible name to something indicatin=
g that
>>    is USB Type C related I also renamed the file names, extcon-cros-ec -=
>
>>    extcon-usbc-cros-ec, I think it's more clear.
>>
>>  drivers/extcon/Kconfig               |   7 +
>>  drivers/extcon/Makefile              |   1 +
>>  drivers/extcon/extcon-usbc-cros-ec.c | 415 ++++++++++++++++++++++++++++=
+++++++
>>  include/linux/mfd/cros_ec_commands.h |  75 +++++++
>>  4 files changed, 498 insertions(+)
>>  create mode 100644 drivers/extcon/extcon-usbc-cros-ec.c
>>
>> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
>> index 6d50071..a7bca42 100644
>> --- a/drivers/extcon/Kconfig
>> +++ b/drivers/extcon/Kconfig
>> @@ -150,4 +150,11 @@ config EXTCON_USB_GPIO
>>         Say Y here to enable GPIO based USB cable detection extcon suppo=
rt.
>>         Used typically if GPIO is used for USB ID pin detection.
>>
>> +config EXTCON_USBC_CROS_EC
>> +     tristate "ChromeOS Embedded Controller EXTCON support"
>> +     depends on MFD_CROS_EC
>> +     help
>> +       Say Y here to enable USB Type C cable detection extcon support w=
hen
>> +       using Chrome OS EC based USB Type-C ports.
>> +
>>  endif
>> diff --git a/drivers/extcon/Makefile b/drivers/extcon/Makefile
>> index ecfa958..a73624e 100644
>> --- a/drivers/extcon/Makefile
>> +++ b/drivers/extcon/Makefile
>> @@ -20,3 +20,4 @@ obj-$(CONFIG_EXTCON_QCOM_SPMI_MISC) +=3D extcon-qcom-s=
pmi-misc.o
>>  obj-$(CONFIG_EXTCON_RT8973A) +=3D extcon-rt8973a.o
>>  obj-$(CONFIG_EXTCON_SM5502)  +=3D extcon-sm5502.o
>>  obj-$(CONFIG_EXTCON_USB_GPIO)        +=3D extcon-usb-gpio.o
>> +obj-$(CONFIG_EXTCON_USBC_CROS_EC) +=3D extcon-usbc-cros-ec.o
>> diff --git a/drivers/extcon/extcon-usbc-cros-ec.c b/drivers/extcon/extco=
n-usbc-cros-ec.c
>> new file mode 100644
>> index 0000000..e759ed4
>> --- /dev/null
>> +++ b/drivers/extcon/extcon-usbc-cros-ec.c
>> @@ -0,0 +1,415 @@
>> +/**
>> + * drivers/extcon/extcon-usbc-cros-ec - ChromeOS Embedded Controller ex=
tcon
>> + *
>> + * Copyright (C) 2017 Google, Inc
>> + * Author: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> + *
>> + * This software is licensed under the terms of the GNU General Public
>> + * License version 2, as published by the Free Software Foundation, and
>> + * may be copied, distributed, and modified under those terms.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/extcon.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/cros_ec.h>
>> +#include <linux/module.h>
>> +#include <linux/notifier.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/sched.h>
>> +
>> +struct cros_ec_extcon_info {
>> +     struct device *dev;
>> +     struct extcon_dev *edev;
>> +
>> +     int port_id;
>> +
>> +     struct cros_ec_device *ec;
>> +
>> +     struct notifier_block notifier;
>> +
>> +     bool dp; /* DisplayPort enabled */
>> +     bool mux; /* SuperSpeed (usb3) enabled */
>> +     unsigned int power_type;
>> +};
>> +
>> +static const unsigned int usb_type_c_cable[] =3D {
>> +     EXTCON_DISP_DP,
>> +     EXTCON_NONE,
>> +};
>> +
>> +/**
>> + * cros_ec_pd_command() - Send a command to the EC.
>> + * @info: pointer to struct cros_ec_extcon_info
>> + * @command: EC command
>> + * @version: EC command version
>> + * @outdata: EC command output data
>> + * @outsize: Size of outdata
>> + * @indata: EC command input data
>> + * @insize: Size of indata
>> + *
>> + * Return: 0 on success, <0 on failure.
>> + */
>> +static int cros_ec_pd_command(struct cros_ec_extcon_info *info,
>> +                           unsigned int command,
>> +                           unsigned int version,
>> +                           void *outdata,
>> +                           unsigned int outsize,
>> +                           void *indata,
>> +                           unsigned int insize)
>> +{
>> +     struct cros_ec_command *msg;
>> +     int ret;
>> +
>> +     msg =3D kzalloc(sizeof(*msg) + max(outsize, insize), GFP_KERNEL);
>> +
>> +     msg->version =3D version;
>> +     msg->command =3D command;
>> +     msg->outsize =3D outsize;
>> +     msg->insize =3D insize;
>> +
>> +     if (outsize)
>> +             memcpy(msg->data, outdata, outsize);
>> +
>> +     ret =3D cros_ec_cmd_xfer_status(info->ec, msg);
>> +     if (ret >=3D 0 && insize)
>> +             memcpy(indata, msg->data, insize);
>> +
>> +     kfree(msg);
>> +     return ret;
>> +}
>> +
>> +/**
>> + * cros_ec_usb_get_power_type() - Get power type info about PD device a=
ttached
>> + * to given port.
>> + * @info: pointer to struct cros_ec_extcon_info
>> + *
>> + * Return: power type on success, <0 on failure.
>> + */
>> +static int cros_ec_usb_get_power_type(struct cros_ec_extcon_info *info)
>> +{
>> +     struct ec_params_usb_pd_power_info req;
>> +     struct ec_response_usb_pd_power_info resp;
>> +     int ret;
>> +
>> +     req.port =3D info->port_id;
>> +     ret =3D cros_ec_pd_command(info, EC_CMD_USB_PD_POWER_INFO, 0,
>> +                              &req, sizeof(req), &resp, sizeof(resp));
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     return resp.type;
>> +}
>> +
>> +/**
>> + * cros_ec_usb_get_pd_mux_state() - Get PD mux state for given port.
>> + * @info: pointer to struct cros_ec_extcon_info
>> + *
>> + * Return: PD mux state on success, <0 on failure.
>> + */
>> +static int cros_ec_usb_get_pd_mux_state(struct cros_ec_extcon_info *inf=
o)
>> +{
>> +     struct ec_params_usb_pd_mux_info req;
>> +     struct ec_response_usb_pd_mux_info resp;
>> +     int ret;
>> +
>> +     req.port =3D info->port_id;
>> +     ret =3D cros_ec_pd_command(info, EC_CMD_USB_PD_MUX_INFO, 0,
>> +                              &req, sizeof(req),
>> +                              &resp, sizeof(resp));
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     return resp.flags;
>> +}
>> +
>> +/**
>> + * cros_ec_usb_get_role() - Get role info about possible PD device atta=
ched to a
>> + * given port.
>> + * @info: pointer to struct cros_ec_extcon_info
>> + * @polarity: pointer to cable polarity (return value)
>> + *
>> + * Return: role info on success, -ENOTCONN if no cable is connected, <0=
 on
>> + * failure.
>> + */
>> +static int cros_ec_usb_get_role(struct cros_ec_extcon_info *info,
>> +                             bool *polarity)
>> +{
>> +     struct ec_params_usb_pd_control pd_control;
>> +     struct ec_response_usb_pd_control_v1 resp;
>> +     int ret;
>> +
>> +     pd_control.port =3D info->port_id;
>> +     pd_control.role =3D USB_PD_CTRL_ROLE_NO_CHANGE;
>> +     pd_control.mux =3D USB_PD_CTRL_MUX_NO_CHANGE;
>> +     ret =3D cros_ec_pd_command(info, EC_CMD_USB_PD_CONTROL, 1,
>> +                              &pd_control, sizeof(pd_control),
>> +                              &resp, sizeof(resp));
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     if (!(resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED))
>> +             return -ENOTCONN;
>> +
>> +     *polarity =3D resp.polarity;
>> +
>> +     return resp.role;
>> +}
>> +
>> +/**
>> + * cros_ec_pd_get_num_ports() - Get number of EC charge ports.
>> + * @info: pointer to struct cros_ec_extcon_info
>> + *
>> + * Return: number of ports on success, <0 on failure.
>> + */
>> +static int cros_ec_pd_get_num_ports(struct cros_ec_extcon_info *info)
>> +{
>> +     struct ec_response_usb_pd_ports resp;
>> +     int ret;
>> +
>> +     ret =3D cros_ec_pd_command(info, EC_CMD_USB_PD_PORTS,
>> +                              0, NULL, 0, &resp, sizeof(resp));
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     return resp.num_ports;
>> +}
>> +
>> +static int extcon_cros_ec_detect_cable(struct cros_ec_extcon_info *info=
,
>> +                                    bool force)
>> +{
>> +     struct device *dev =3D info->dev;
>> +     int role, power_type;
>> +     bool polarity =3D false;
>> +     bool dp =3D false;
>> +     bool mux =3D false;
>> +     bool hpd =3D false;
>> +
>> +     power_type =3D cros_ec_usb_get_power_type(info);
>> +     if (power_type < 0) {
>> +             dev_err(dev, "failed getting power type err =3D %d\n",
>> +                     power_type);
>> +             return power_type;
>> +     }
>> +
>> +     role =3D cros_ec_usb_get_role(info, &polarity);
>> +     if (role < 0) {
>> +             if (role !=3D -ENOTCONN) {
>> +                     dev_err(dev, "failed getting role err =3D %d\n", r=
ole);
>> +                     return role;
>> +             }
>> +     } else {
>> +             int pd_mux_state;
>> +
>> +             pd_mux_state =3D cros_ec_usb_get_pd_mux_state(info);
>> +             if (pd_mux_state < 0)
>> +                     pd_mux_state =3D USB_PD_MUX_USB_ENABLED;
>> +
>> +             dp =3D pd_mux_state & USB_PD_MUX_DP_ENABLED;
>> +             mux =3D pd_mux_state & USB_PD_MUX_USB_ENABLED;
>> +             hpd =3D pd_mux_state & USB_PD_MUX_HPD_IRQ;
>> +     }
>> +
>> +     if (force || info->dp !=3D dp || info->mux !=3D mux ||
>> +             info->power_type !=3D power_type) {
>> +
>> +             info->dp =3D dp;
>> +             info->mux =3D mux;
>> +             info->power_type =3D power_type;
>> +
>> +             extcon_set_state(info->edev, EXTCON_DISP_DP, dp);
>> +
>> +             extcon_set_property(info->edev, EXTCON_DISP_DP,
>> +                                 EXTCON_PROP_USB_TYPEC_POLARITY,
>> +                                 (union extcon_property_value)(int)pola=
rity);
>> +             extcon_set_property(info->edev, EXTCON_DISP_DP,
>> +                                 EXTCON_PROP_USB_SS,
>> +                                 (union extcon_property_value)(int)mux)=
;
>> +             extcon_set_property(info->edev, EXTCON_DISP_DP,
>> +                                 EXTCON_PROP_DISP_HPD,
>> +                                 (union extcon_property_value)(int)hpd)=
;
>> +
>> +             extcon_sync(info->edev, EXTCON_DISP_DP);
>> +
>> +     } else if (hpd) {
>> +             extcon_set_property(info->edev, EXTCON_DISP_DP,
>> +                                 EXTCON_PROP_DISP_HPD,
>> +                                 (union extcon_property_value)(int)hpd)=
;
>> +             extcon_sync(info->edev, EXTCON_DISP_DP);
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int extcon_cros_ec_event(struct notifier_block *nb,
>> +                             unsigned long queued_during_suspend,
>> +                             void *_notify)
>> +{
>> +     struct cros_ec_extcon_info *info;
>> +     struct cros_ec_device *ec;
>> +     u32 host_event;
>> +
>> +     info =3D container_of(nb, struct cros_ec_extcon_info, notifier);
>> +     ec =3D info->ec;
>> +
>> +     host_event =3D cros_ec_get_host_event(ec);
>> +     if (host_event & (EC_HOST_EVENT_MASK(EC_HOST_EVENT_PD_MCU) |
>> +                       EC_HOST_EVENT_MASK(EC_HOST_EVENT_USB_MUX))) {
>> +             extcon_cros_ec_detect_cable(info, false);
>> +             return NOTIFY_OK;
>> +     }
>> +
>> +     return NOTIFY_DONE;
>> +}
>> +
>> +static int extcon_cros_ec_probe(struct platform_device *pdev)
>> +{
>> +     struct cros_ec_extcon_info *info;
>> +     struct cros_ec_device *ec =3D dev_get_drvdata(pdev->dev.parent);
>> +     struct device *dev =3D &pdev->dev;
>> +     struct device_node *np =3D dev->of_node;
>> +     int numports, ret;
>> +
>> +     info =3D devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
>> +     if (!info)
>> +             return -ENOMEM;
>> +
>> +     info->dev =3D dev;
>> +     info->ec =3D ec;
>> +
>> +     if (np) {
>> +             u32 port;
>> +
>> +             ret =3D of_property_read_u32(np, "google,usb-port-id", &po=
rt);
>> +             if (ret < 0) {
>> +                     dev_err(dev, "Missing google,usb-port-id property\=
n");
>> +                     return ret;
>> +             }
>> +             info->port_id =3D port;
>> +     } else {
>> +             info->port_id =3D pdev->id;
>> +     }
>> +
>> +     numports =3D cros_ec_pd_get_num_ports(info);
>> +     if (numports < 0) {
>> +             dev_err(dev, "failed getting number of ports! ret =3D %d\n=
",
>> +                     numports);
>> +             return numports;
>> +     }
>> +
>> +     if (info->port_id >=3D numports) {
>> +             dev_err(dev, "This system only supports %d ports\n", numpo=
rts);
>> +             return -ENODEV;
>> +     }
>> +
>> +     info->edev =3D devm_extcon_dev_allocate(dev, usb_type_c_cable);
>> +     if (IS_ERR(info->edev)) {
>> +             dev_err(dev, "failed to allocate extcon device\n");
>> +             return -ENOMEM;
>> +     }
>> +
>> +     ret =3D devm_extcon_dev_register(dev, info->edev);
>> +     if (ret < 0) {
>> +             dev_err(dev, "failed to register extcon device\n");
>> +             return ret;
>> +     }
>> +
>> +     extcon_set_property_capability(info->edev, EXTCON_DISP_DP,
>> +                                    EXTCON_PROP_USB_TYPEC_POLARITY);
>> +     extcon_set_property_capability(info->edev, EXTCON_DISP_DP,
>> +                                    EXTCON_PROP_USB_SS);
>> +     extcon_set_property_capability(info->edev, EXTCON_DISP_DP,
>> +                                    EXTCON_PROP_DISP_HPD);
>> +
>> +     platform_set_drvdata(pdev, info);
>> +
>> +     /* Get PD events from the EC */
>> +     info->notifier.notifier_call =3D extcon_cros_ec_event;
>> +     ret =3D blocking_notifier_chain_register(&info->ec->event_notifier=
,
>> +                                            &info->notifier);
>> +     if (ret < 0) {
>> +             dev_err(dev, "failed to register notifier\n");
>> +             return ret;
>> +     }
>> +
>> +     /* Perform initial detection */
>> +     ret =3D extcon_cros_ec_detect_cable(info, true);
>> +     if (ret < 0) {
>> +             dev_err(dev, "failed to detect initial cable state\n");
>> +             goto unregister_notifier;
>> +     }
>> +
>> +     return 0;
>> +
>> +unregister_notifier:
>> +     blocking_notifier_chain_unregister(&info->ec->event_notifier,
>> +                                        &info->notifier);
>> +     return ret;
>> +}
>> +
>> +static int extcon_cros_ec_remove(struct platform_device *pdev)
>> +{
>> +     struct cros_ec_extcon_info *info =3D platform_get_drvdata(pdev);
>> +
>> +     blocking_notifier_chain_unregister(&info->ec->event_notifier,
>> +                                        &info->notifier);
>> +
>> +     return 0;
>> +}
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static int extcon_cros_ec_suspend(struct device *dev)
>> +{
>> +     return 0;
>> +}
>> +
>> +static int extcon_cros_ec_resume(struct device *dev)
>> +{
>> +     int ret;
>> +     struct cros_ec_extcon_info *info =3D dev_get_drvdata(dev);
>> +
>> +     ret =3D extcon_cros_ec_detect_cable(info, true);
>> +     if (ret < 0)
>> +             dev_err(dev, "failed to detect cable state on resume\n");
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct dev_pm_ops extcon_cros_ec_dev_pm_ops =3D {
>> +     SET_SYSTEM_SLEEP_PM_OPS(extcon_cros_ec_suspend, extcon_cros_ec_res=
ume)
>> +};
>> +
>> +#define DEV_PM_OPS   (&extcon_cros_ec_dev_pm_ops)
>> +#else
>> +#define DEV_PM_OPS   NULL
>> +#endif /* CONFIG_PM_SLEEP */
>> +
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id extcon_cros_ec_of_match[] =3D {
>> +     { .compatible =3D "google,extcon-usbc-cros-ec" },
>> +     { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, extcon_cros_ec_of_match);
>> +#endif /* CONFIG_OF */
>> +
>> +static struct platform_driver extcon_cros_ec_driver =3D {
>> +     .driver =3D {
>> +             .name  =3D "extcon-usbc-cros-ec",
>> +             .of_match_table =3D of_match_ptr(extcon_cros_ec_of_match),
>> +             .pm =3D DEV_PM_OPS,
>> +     },
>> +     .remove  =3D extcon_cros_ec_remove,
>> +     .probe   =3D extcon_cros_ec_probe,
>> +};
>> +
>> +module_platform_driver(extcon_cros_ec_driver);
>> +
>> +MODULE_DESCRIPTION("ChromeOS Embedded Controller extcon driver");
>> +MODULE_AUTHOR("Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cr=
os_ec_commands.h
>> index 26ef492..fdea68c 100644
>> --- a/include/linux/mfd/cros_ec_commands.h
>> +++ b/include/linux/mfd/cros_ec_commands.h
>> @@ -285,10 +285,15 @@ enum host_event_code {
>>       EC_HOST_EVENT_HANG_DETECT =3D 20,
>>       /* Hang detect logic detected a hang and warm rebooted the AP */
>>       EC_HOST_EVENT_HANG_REBOOT =3D 21,
>> +     /* PD MCU triggering host event */
>> +     EC_HOST_EVENT_PD_MCU =3D 22,
>>
>>       /* EC RTC event occurred */
>>       EC_HOST_EVENT_RTC =3D 26,
>>
>> +     /* EC desires to change state of host-controlled USB mux */
>> +     EC_HOST_EVENT_USB_MUX =3D 28,
>> +
>>       /*
>>        * The high bit of the event mask is not used as a host event code=
.  If
>>        * it reads back as set, then the entire event mask should be
>> @@ -2913,6 +2918,76 @@ struct ec_params_usb_pd_control {
>>       uint8_t mux;
>>  } __packed;
>>
>> +#define PD_CTRL_RESP_ENABLED_COMMS      (1 << 0) /* Communication enabl=
ed */
>> +#define PD_CTRL_RESP_ENABLED_CONNECTED  (1 << 1) /* Device connected */
>> +#define PD_CTRL_RESP_ENABLED_PD_CAPABLE (1 << 2) /* Partner is PD capab=
le */
>> +
>> +struct ec_response_usb_pd_control_v1 {
>> +     uint8_t enabled;
>> +     uint8_t role;
>> +     uint8_t polarity;
>> +     char state[32];
>> +} __packed;
>> +
>> +#define EC_CMD_USB_PD_PORTS 0x102
>> +
>> +struct ec_response_usb_pd_ports {
>> +     uint8_t num_ports;
>> +} __packed;
>> +
>> +#define EC_CMD_USB_PD_POWER_INFO 0x103
>> +
>> +#define PD_POWER_CHARGING_PORT 0xff
>> +struct ec_params_usb_pd_power_info {
>> +     uint8_t port;
>> +} __packed;
>> +
>> +enum usb_chg_type {
>> +     USB_CHG_TYPE_NONE,
>> +     USB_CHG_TYPE_PD,
>> +     USB_CHG_TYPE_C,
>> +     USB_CHG_TYPE_PROPRIETARY,
>> +     USB_CHG_TYPE_BC12_DCP,
>> +     USB_CHG_TYPE_BC12_CDP,
>> +     USB_CHG_TYPE_BC12_SDP,
>> +     USB_CHG_TYPE_OTHER,
>> +     USB_CHG_TYPE_VBUS,
>> +     USB_CHG_TYPE_UNKNOWN,
>> +};
>> +
>> +struct usb_chg_measures {
>> +     uint16_t voltage_max;
>> +     uint16_t voltage_now;
>> +     uint16_t current_max;
>> +     uint16_t current_lim;
>> +} __packed;
>> +
>> +struct ec_response_usb_pd_power_info {
>> +     uint8_t role;
>> +     uint8_t type;
>> +     uint8_t dualrole;
>> +     uint8_t reserved1;
>> +     struct usb_chg_measures meas;
>> +     uint32_t max_power;
>> +} __packed;
>> +
>> +/* Get info about USB-C SS muxes */
>> +#define EC_CMD_USB_PD_MUX_INFO 0x11a
>> +
>> +struct ec_params_usb_pd_mux_info {
>> +     uint8_t port; /* USB-C port number */
>> +} __packed;
>> +
>> +/* Flags representing mux state */
>> +#define USB_PD_MUX_USB_ENABLED       (1 << 0)
>> +#define USB_PD_MUX_DP_ENABLED        (1 << 1)
>> +#define USB_PD_MUX_POLARITY_INVERTED (1 << 2)
>> +#define USB_PD_MUX_HPD_IRQ           (1 << 3)
>> +
>> +struct ec_response_usb_pd_mux_info {
>> +     uint8_t flags; /* USB_PD_MUX_*-encoded USB mux state */
>> +} __packed;
>> +
>>  /**********************************************************************=
*******/
>>  /*
>>   * Passthru commands
>>
>
>
> --
> Best Regards,
> Chanwoo Choi
> Samsung Electronics
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
