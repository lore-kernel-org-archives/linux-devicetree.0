Return-Path: <SRS0=4ndd=M6=exceet.de=frieder.schrempf@kernel.org>
Subject: Re: [PATCH 0/4] usb: chipidea: imx: add HSIC support
References: <20181016045846.2345-1-peter.chen@nxp.com>
 <82a99c3c-20c6-4972-fc6d-1fca8d5d684d@exceet.de>
 <VI1PR04MB53271CABB291EECC73C86C518BFF0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <796469f2-ea5d-d428-6088-32d8eedb3160@exceet.de>
 <70259e7d-2b2a-ddf6-4f10-3c53c065133c@exceet.de>
 <9efff07e-deb6-5740-6326-bd2f11f9fed4@exceet.de>
 <VI1PR04MB5327FF408B0FFE0FEA8935338BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <b127d005-3407-4c00-99a1-2a92809b7148@exceet.de>
Date: Thu, 18 Oct 2018 09:46:56 +0200
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB5327FF408B0FFE0FEA8935338BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Peter Chen <peter.chen@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 18.10.18 03:22, Peter Chen wrote:
>   
>>>>> - System suspend/resume
>>>>> 1. Enable USB wakeup
>>>>> for i in $(find /sys -name wakeup | grep usb);do echo enabled  >
>>>>> $i;echo "echo enabled > $i";done; 2. Let the system enter suspend
>>>>> using below command echo mem > /sys/power/state 3. And see if there
>>>>> is a wakeup block system entering suspend, and check if USB HSIC
>>>>> works ok after system resume
>>>>
>>>> System suspend/resume seems to work fine. After resume the ethernet
>>>> controller works.
>>>>
>>>> root@imxceet-solo-s-43:~# echo mem > /sys/power/state
>>>> PM: suspend entry (deep)
>>>> PM: Syncing filesystems ... done.
>>>> Freezing user space processes ... (elapsed 0.001 seconds) done.
>>>> OOM killer disabled.
>>>> Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
>>>> smsc95xx 3-1:1.0 eth1: entering SUSPEND2 mode
>>>> PM: suspend devices took 0.050 seconds Disabling non-boot CPUs ...
>>>> usb 3-1: reset high-speed USB device number 2 using ci_hdrc
>>>> PM: resume devices took 0.590 seconds OOM killer enabled.
>>>> Restarting tasks ... done.
>>>> PM: suspend exit
>>>> smsc95xx 3-1:1.0 eth1: link up, 100Mbps, full-duplex, lpa 0x4DE1 fec
>>>> 2188000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
>>>>
>>>>>
>>>>> - Runtime suspend
>>>>> 1. Enable auto suspend for all USB devices, and check if USBOH3
>>>>> clock is closed, make sure do not plug any ethernet cable on the
>>>>> RJ45 port.
>>>>>
>>>>> /* Enable auto suspend */
>>>>> for i in $(find /sys -name control | grep usb);do echo auto  >
>>>>> $i;echo "echo auto > $i";done;
>>>>
>>>> This doesn't work. When the port is suspended it gets into a loop of
>>>> suspending/resuming endlessly. If i put two logs in
>>>> ci_hdrc_imx_runtime_suspend() and ci_hdrc_imx_runtime_resume(), I get
>>>> this:
>>>>
>>>> [...]
>>>> ci_hdrc_imx_runtime_resume:603
>>>> ci_hdrc_imx_runtime_suspend:574
>>>> ci_hdrc_imx_runtime_resume:603
>>>> ci_hdrc_imx_runtime_suspend:574
>>>> ci_hdrc_imx_runtime_resume:603
>>>> ci_hdrc_imx_runtime_suspend:574
>>>> ci_hdrc_imx_runtime_resume:603
>>>> ci_hdrc_imx_runtime_suspend:574
>>>> [...]
>>>
>>> Ok, forget about the loop, this was caused by one of the other ports,
>>> that had issues with overcurrent detection.
>>>
>>> But still it doesn't work for the HSIC port.
>>>
>>> The HSIC device is stuck in status "suspending" (note: "suspending"
>>> and not "suspended"):
>>>
>>> ~# cat /sys/bus/usb/devices/usb1/power/runtime_status
>>> suspended
>>> ~# cat /sys/bus/usb/devices/usb2/power/runtime_status
>>> suspended
>>> ~# cat /sys/bus/usb/devices/usb3/power/runtime_status
>>> active
>>> ~# cat /sys/bus/usb/devices/usb3/3-1/power/runtime_status
>>> suspending
>>
>> It seems like this is a problem with the smsc95xx driver. I fixed this and now the
>> device is suspending properly, when the network interface is down and resumes
>> when it comes up.
>>
>> I also checked the USBOH3 clock and its properly switched on and off.
>>
>> What didn't work is auto suspend and resume on ethernet link down/up, but this
>> seems to be a restriction of the smsc95xx/usbnet driver.
>>
>> So all in all this looks good to me. Please let me know if you need any more
>> information or tests.
>>
> 
> Thanks, Frieder, no more tests are needed.
> You could send me your dts changes as patches, I will append it at my v2 patch series.

My board is currently off-tree so I can't send any patch for the pinmux 
settings in devicetree. But I will send a patch with the changes that 
should go to imx6qdl.dtsi, imx6sl.dtsi and imx6sx.dtsi. Though I only 
tested on i.MX6S.

Thanks,
Frieder
