Return-Path: <SRS0=5gq4=M5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mo4-p05-ob.smtp.rzone.de ([85.215.255.130]:23650 "EHLO
        mo4-p05-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbeJQO5V (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Oct 2018 10:57:21 -0400
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: Re: [PATCH 0/4] usb: chipidea: imx: add HSIC support
References: <20181016045846.2345-1-peter.chen@nxp.com>
Message-ID: <82a99c3c-20c6-4972-fc6d-1fca8d5d684d@exceet.de>
Date: Wed, 17 Oct 2018 09:02:57 +0200
MIME-Version: 1.0
In-Reply-To: <20181016045846.2345-1-peter.chen@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Peter,

On 16.10.18 07:01, Peter Chen wrote:
> Most of NXP (Freescale) i.mx USB part has HSIC support, in this series,
> we add support for them, it should cover all imx6 and imx7d. I have
> no HSIC interface board which is supported by upstream kernel, so this
> patches are only compiled ok, Frieder Schrempf, would you please
> help me test it on your board? Thanks.

Thank you for providing the patch!
I applied it to v4.19-rc8 and tested and the LAN9730 comes up and works 
just fine.

Here is how my devicetree looks like:

usbphy_dummy: usbphy_dummy@1 {
	compatible = "usb-nop-xceiv";
};

[...]

&usbh2 {
	vbus-supply = <&reg_usb_h2_vbus>;
	pinctrl-names = "idle", "active";
	pinctrl-0 = <&pinctrl_usbh2_idle>;
	pinctrl-1 = <&pinctrl_usbh2_active>;
	fsl,usbphy = <&usbphy_dummy>;
	phy_type = "hsic";
	status = "okay";
	#address-cells = <1>;
	#size-cells = <0>;

	usbnet: smsc@1 {
		compatible = "usb424,9730";
		/* Filled in by U-Boot */
		mac-address = [00 00 00 00 00 00];
		reg = <1>;
	};
};

[...]

pinctrl_usbh2_idle: usbh2grp-idle {
   fsl,pins = <
     MX6QDL_PAD_RGMII_TXC__USB_H2_DATA       0x40013030
     MX6QDL_PAD_RGMII_TX_CTL__USB_H2_STROBE  0x40013030
   >;
};

pinctrl_usbh2_active: usbh2grp-active {
   fsl,pins = <
     MX6QDL_PAD_RGMII_TXC__USB_H2_DATA       0x40013030
     MX6QDL_PAD_RGMII_TX_CTL__USB_H2_STROBE  0x40017030
   >;
};


Are there any test cases I should try?
How can I test suspend/resume?

I also have some suggestions for your patch. Please see the separate email.

Thanks,
Frieder

> 
> Peter Chen (4):
>    usb: chipidea: add flag for imx hsic implementation
>    usb: chipidea: imx: add HSIC support
>    usb: chipidea: host: override ehci->hub_control
>    doc: usb: ci-hdrc-usb2: Add pinctrl properties for HSIC pin groups
> 
>   .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |   1 +
>   drivers/usb/chipidea/ci_hdrc_imx.c                 | 153 ++++++++++++++++++---
>   drivers/usb/chipidea/ci_hdrc_imx.h                 |   9 +-
>   drivers/usb/chipidea/host.c                        |  98 +++++++++++++
>   drivers/usb/chipidea/usbmisc_imx.c                 | 131 ++++++++++++++++++
>   include/linux/usb/chipidea.h                       |   3 +
>   6 files changed, 376 insertions(+), 19 deletions(-)
> 
