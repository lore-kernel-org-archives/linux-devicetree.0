From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3] phy: bcm-ns-usb2: new driver for USB 2.0 PHY on Northstar
Date: Thu, 14 Apr 2016 09:28:14 +0200
Message-ID: <CACna6rzGgp54r5xTn6NqmgY8rqQfftpS6jwc4v28cspfS_+xZw@mail.gmail.com>
References: <1460367788-971-1-git-send-email-zajec5@gmail.com>
	<570E4FAB.7070703@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <570E4FAB.7070703-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Felix Fietkau <nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi and thanks for your review!

On 13 April 2016 at 15:54, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote=
:
> On Monday 11 April 2016 03:13 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> +Example:
>> +     usb2-phy {
>> +             compatible =3D "brcm,ns-usb2-phy";
>> +             reg =3D <0x1800c000 0x1000>;
>> +             reg-names =3D "dmu";
>> +             #phy-cells =3D <0>;
>> +             #clock-cells =3D <0>;
>
> Is clock-cells required here? It's generally added for clock provider=
s right?

You're right, it's not.


>> +static int bcm_ns_usb2_phy_init(struct phy *phy)
>> +{
>> +     struct bcm_ns_usb2 *usb2 =3D phy_get_drvdata(phy);
>> +     struct device *dev =3D usb2->dev;
>> +     struct platform_device *pdev =3D to_platform_device(dev);
>> +     struct resource *res;
>> +     void __iomem *dmu;
>> +     u32 ref_clk_rate, usb2ctl, usb_pll_ndiv, usb_pll_pdiv;
>> +     int err =3D 0;
>> +
>> +     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dm=
u");
>> +     dmu =3D devm_ioremap_resource(dev, res);
>> +     if (IS_ERR(dmu)) {
>> +             dev_err(dev, "Failed to map DMU regs\n");
>> +             err =3D -EIO;
>> +             goto err_out;
>> +     }
>
> ioremap should ideally be in probe function.

Sure, will change it.


>> +     err =3D clk_prepare_enable(usb2->ref_clk);
>> +     if (err < 0) {
>> +             dev_err(dev, "Failed to prepare ref clock: %d\n", err)=
;
>> +             goto err_iounmap;
>> +     }
>> +
>> +     ref_clk_rate =3D clk_get_rate(usb2->ref_clk);
>> +     if (!ref_clk_rate) {
>
> use IS_ERR?

clk_get_rate returns unsigned long, not a pointer


>> +             dev_err(dev, "Failed to get ref clock rate\n");
>> +             err =3D -EINVAL;
>> +             goto err_clk_off;
>> +     }
>> +
>> +     usb2ctl =3D ioread32(dmu + BCMA_DMU_CRU_USB2_CONTROL);
>
> use readl and friends.

OK


>> +     usb_pll_pdiv =3D usb2ctl;
>> +     usb_pll_pdiv &=3D BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_MASK;
>> +     usb_pll_pdiv >>=3D BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_SHIF=
T;
>> +     if (!usb_pll_pdiv)
>> +             usb_pll_pdiv =3D 1 << 3;
>
> this can be
> if (!(usb2ctl & BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_MASK))
>         usb_pll_pdiv =3D 1 << 3;



>> +     /* Calculate ndiv based on a solid 1920 MHz that is for USB2 P=
HY */
>> +     usb_pll_ndiv =3D (1920000000 * usb_pll_pdiv) / ref_clk_rate;
>> +
>> +     /* Unlock DMU PLL settings */
>> +     iowrite32(0x0000ea68, dmu + BCMA_DMU_CRU_CLKSET_KEY);
>
> What is 0x0000ea68? Please avoid hard coding values. It makes difficu=
lt to review.

I'd love to define every single bit, but I don't know them. I didn't
get or see any programming guide from Broadcom for 10 years now. I'm
just using magic value I found in reference code in Broadcom's SDK.


>> +     /* Write USB 2.0 PLL control setting */
>> +     usb2ctl &=3D ~BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_NDIV_MASK;
>> +     usb2ctl |=3D usb_pll_ndiv << BCMA_DMU_CRU_USB2_CONTROL_USB_PLL=
_NDIV_SHIFT;
>> +     iowrite32(usb2ctl, dmu + BCMA_DMU_CRU_USB2_CONTROL);
>> +
>> +     /* Lock DMU PLL settings */
>> +     iowrite32(0x00000000, dmu + BCMA_DMU_CRU_CLKSET_KEY);
>
> So the PHY has only a PLL that has to be configured?

Yes to my best knowledge.


>> diff --git a/include/linux/bcma/bcma_driver_arm_c9.h b/include/linux=
/bcma/bcma_driver_arm_c9.h
>> new file mode 100644
>> index 0000000..93bd73d
>> --- /dev/null
>> +++ b/include/linux/bcma/bcma_driver_arm_c9.h
>> @@ -0,0 +1,15 @@
>> +#ifndef LINUX_BCMA_DRIVER_ARM_C9_H_
>> +#define LINUX_BCMA_DRIVER_ARM_C9_H_
>> +
>> +/* DMU (Device Management Unit) */
>> +#define BCMA_DMU_CRU_USB2_CONTROL                    0x0164
>> +#define  BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_NDIV_MASK 0x00000FFC
>> +#define  BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_NDIV_SHIFT        2
>> +#define  BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_MASK 0x00007000
>> +#define  BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_SHIFT        12
>> +#define BCMA_DMU_CRU_CLKSET_KEY                              0x0180
>> +#define BCMA_DMU_CRU_STRAPS_CTRL                     0x02A0
>> +#define  BCMA_DMU_CRU_STRAPS_CTRL_USB3                       0x0000=
0010
>> +#define  BCMA_DMU_CRU_STRAPS_CTRL_4BYTE                      0x0000=
8000
>
> If these are specific to PHY, then add it inside the PHY driver.

DMU registers are also used by other drivers, but I should definitely
mention that, I'll update commit message in next version.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
