From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Subject: Re: [PATCH 2/3] drivers: phy: broadcom: Add driver for Cygnus USB phy controller
Date: Tue, 24 Oct 2017 12:11:00 +0530
Message-ID: <CAAFb_vo-M=2sSCCvzesDiOT9F-RN0HfwwijKXWDvKYL1OdWqmA@mail.gmail.com>
References: <1508819822-29956-1-git-send-email-raveendra.padasalagi@broadcom.com>
 <1508819822-29956-3-git-send-email-raveendra.padasalagi@broadcom.com> <e1b26a08cc999ddfabd0e1fedd5d772d@milecki.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e1b26a08cc999ddfabd0e1fedd5d772d@milecki.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Raviteja Garimella <raviteja.garimella@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 24, 2017 at 11:16 AM, Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl=
> wrote:
> On 2017-10-24 06:37, Raveendra Padasalagi wrote:
>>
>> Add driver for Broadcom's USB phy controller's used in Cygnus
>> familyof SoC. Cygnus has three USB phy controller's, port 0,
>> port 1 provides USB host functionality and port 2 can be configured
>> for host/device role.
>>
>> Configuration of host/device role for port 2 is achieved based on
>> the extcon events, the driver registers to extcon framework to get
>> appropriate connect events for Host/Device cables connect/disconnect
>> states based on VBUS and ID interrupts.
>
>
> Minor issues commented inline.
>
>
>> +#define USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET          0x0408
>> +#define USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE      BIT(0)
>
>
> Here you define reg bits using BIT(n).
>
>
>> +#define SUSPEND_OVERRIDE_0                             13
>> +#define SUSPEND_OVERRIDE_1                             14
>> +#define SUSPEND_OVERRIDE_2                             15
>> +#define USB2_IDM_IDM_RESET_CONTROL_OFFSET              0x0800
>> +#define USB2_IDM_IDM_RESET_CONTROL__RESET              0
>
>
> And here without BIT(n). Either is fine but it may be better to be
> consistent about it.

Thanks, will fix it in the next version of the patch.

>
>
>> +static int cygnus_phy_probe(struct platform_device *pdev)
>> +{
>> +       struct resource *res;
>> +       struct cygnus_phy_driver *phy_driver;
>> +       struct phy_provider *phy_provider;
>> +       int i, ret;
>> +       u32 reg_val;
>> +       struct device *dev =3D &pdev->dev;
>> +       struct device_node *node =3D dev->of_node;
>> +
>> +       /* allocate memory for each phy instance */
>> +       phy_driver =3D devm_kzalloc(dev, sizeof(struct cygnus_phy_driver=
),
>> +                                 GFP_KERNEL);
>> +       if (!phy_driver)
>> +               return -ENOMEM;
>> +
>> +       phy_driver->num_phys =3D of_get_child_count(node);
>> +
>> +       if (phy_driver->num_phys =3D=3D 0) {
>> +               dev_err(dev, "PHY no child node\n");
>> +               return -ENODEV;
>> +       }
>> +
>> +       phy_driver->instances =3D devm_kcalloc(dev, phy_driver->num_phys=
,
>> +                                            sizeof(struct
>> cygnus_phy_instance),
>> +                                            GFP_KERNEL);
>
>
> I don't think kcalloc is safe here. E.g. In cygnus_phy_shutdown you
> iterate over all instances reading the .power value. If
> cygnus_phy_shutdown gets called before having each instance powered up,
> you'll read random memory as .power value.

Yes, Need to use devm_kzalloc() to make sure contents of
phy_driver->instances is zero initialized.
Will fix it in the next patch.
