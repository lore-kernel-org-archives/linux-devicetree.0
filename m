Return-Path: <SRS0=t11G=M5=exceet.de=frieder.schrempf@kernel.org>
Subject: Re: [PATCH 0/4] usb: chipidea: imx: add HSIC support
From: Frieder Schrempf <frieder.schrempf@exceet.de>
References: <20181016045846.2345-1-peter.chen@nxp.com>
 <82a99c3c-20c6-4972-fc6d-1fca8d5d684d@exceet.de>
 <VI1PR04MB53271CABB291EECC73C86C518BFF0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <796469f2-ea5d-d428-6088-32d8eedb3160@exceet.de>
Message-ID: <70259e7d-2b2a-ddf6-4f10-3c53c065133c@exceet.de>
Date: Wed, 17 Oct 2018 13:04:38 +0200
MIME-Version: 1.0
In-Reply-To: <796469f2-ea5d-d428-6088-32d8eedb3160@exceet.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Peter Chen <peter.chen@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 17.10.18 11:56, Frieder Schrempf wrote:
> Hi Peter,
> 
> On 17.10.18 09:23, Peter Chen wrote:
>>> On 16.10.18 07:01, Peter Chen wrote:
>>>> Most of NXP (Freescale) i.mx USB part has HSIC support, in this
>>>> series, we add support for them, it should cover all imx6 and imx7d. I
>>>> have no HSIC interface board which is supported by upstream kernel, so
>>>> this patches are only compiled ok, Frieder Schrempf, would you please
>>>> help me test it on your board? Thanks.
>>>
>>> Thank you for providing the patch!
>>> I applied it to v4.19-rc8 and tested and the LAN9730 comes up and 
>>> works just fine.
>>>
>>> Here is how my devicetree looks like:
>>>
>>> usbphy_dummy: usbphy_dummy@1 {
>>>     compatible = "usb-nop-xceiv";
>>> };
>>>
>>> [...]
>>>
>>> &usbh2 {
>>>     vbus-supply = <&reg_usb_h2_vbus>;
>>>     pinctrl-names = "idle", "active";
>>>     pinctrl-0 = <&pinctrl_usbh2_idle>;
>>>     pinctrl-1 = <&pinctrl_usbh2_active>;
>>>     fsl,usbphy = <&usbphy_dummy>;
>>>     phy_type = "hsic";
>>>     status = "okay";
>>>     #address-cells = <1>;
>>>     #size-cells = <0>;
>>>
>>>     usbnet: smsc@1 {
>>>         compatible = "usb424,9730";
>>>         /* Filled in by U-Boot */
>>>         mac-address = [00 00 00 00 00 00];
>>>         reg = <1>;
>>>     };
>>> };
>>>
>>> [...]
>>>
>>> pinctrl_usbh2_idle: usbh2grp-idle {
>>>     fsl,pins = <
>>>       MX6QDL_PAD_RGMII_TXC__USB_H2_DATA       0x40013030
>>>       MX6QDL_PAD_RGMII_TX_CTL__USB_H2_STROBE  0x40013030
>>>     >;
>>> };
>>>
>>> pinctrl_usbh2_active: usbh2grp-active {
>>>     fsl,pins = <
>>>       MX6QDL_PAD_RGMII_TXC__USB_H2_DATA       0x40013030
>>>       MX6QDL_PAD_RGMII_TX_CTL__USB_H2_STROBE  0x40017030
>>>     >;
>>> };
>>>
>>>
>>> Are there any test cases I should try?
>>> How can I test suspend/resume?
>>>
>>
>> - System suspend/resume
>> 1. Enable USB wakeup
>> for i in $(find /sys -name wakeup | grep usb);do echo enabled  > 
>> $i;echo "echo enabled > $i";done;
>> 2. Let the system enter suspend using below command
>> echo mem > /sys/power/state
>> 3. And see if there is a wakeup block system entering suspend, and 
>> check if USB HSIC works ok
>> after system resume
> 
> System suspend/resume seems to work fine. After resume the ethernet 
> controller works.
> 
> root@imxceet-solo-s-43:~# echo mem > /sys/power/state
> PM: suspend entry (deep)
> PM: Syncing filesystems ... done.
> Freezing user space processes ... (elapsed 0.001 seconds) done.
> OOM killer disabled.
> Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> smsc95xx 3-1:1.0 eth1: entering SUSPEND2 mode
> PM: suspend devices took 0.050 seconds
> Disabling non-boot CPUs ...
> usb 3-1: reset high-speed USB device number 2 using ci_hdrc
> PM: resume devices took 0.590 seconds
> OOM killer enabled.
> Restarting tasks ... done.
> PM: suspend exit
> smsc95xx 3-1:1.0 eth1: link up, 100Mbps, full-duplex, lpa 0x4DE1
> fec 2188000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> 
>>
>> - Runtime suspend
>> 1. Enable auto suspend for all USB devices, and check if USBOH3 clock 
>> is closed,
>> make sure do not plug any ethernet cable on the RJ45 port.
>>
>> /* Enable auto suspend */
>> for i in $(find /sys -name control | grep usb);do echo auto  > $i;echo 
>> "echo auto > $i";done;
> 
> This doesn't work. When the port is suspended it gets into a loop of 
> suspending/resuming endlessly. If i put two logs in 
> ci_hdrc_imx_runtime_suspend() and ci_hdrc_imx_runtime_resume(), I get this:
> 
> [...]
> ci_hdrc_imx_runtime_resume:603
> ci_hdrc_imx_runtime_suspend:574
> ci_hdrc_imx_runtime_resume:603
> ci_hdrc_imx_runtime_suspend:574
> ci_hdrc_imx_runtime_resume:603
> ci_hdrc_imx_runtime_suspend:574
> ci_hdrc_imx_runtime_resume:603
> ci_hdrc_imx_runtime_suspend:574
> [...]

Ok, forget about the loop, this was caused by one of the other ports, 
that had issues with overcurrent detection.

But still it doesn't work for the HSIC port.

The HSIC device is stuck in status "suspending" (note: "suspending" and 
not "suspended"):

~# cat /sys/bus/usb/devices/usb1/power/runtime_status
suspended
~# cat /sys/bus/usb/devices/usb2/power/runtime_status
suspended
~# cat /sys/bus/usb/devices/usb3/power/runtime_status
active
~# cat /sys/bus/usb/devices/usb3/3-1/power/runtime_status
suspending
