From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: Multiple generic PHY instances for DWC3 USB IP
Date: Wed, 4 Apr 2018 14:56:39 +0900
Message-ID: <CAK7LNARBVG54o+fozHk8efXUNk8GSkRcRcdDNrtUhDs5kOA7=Q@mail.gmail.com>
References: <CAK7LNATkS6pFQ9Gexm1uiG8e-3x6QXh-GYs3ABVEQzBnFK5gqw@mail.gmail.com>
 <87vad7cz2i.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87vad7cz2i.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2018-04-04 14:36 GMT+09:00 Felipe Balbi <felipe.balbi@linux.intel.com>:
>
> Hi,
>
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>> Currently, DWC3 core IP (drivers/usb/dwc3/core.c)
>> can take only one PHY phandle for each of SS, HS.
>> (phy-names DT property is "usb2-phy" and "usb3-phy" for each)
>
> We never had any other requirements :-)
>
>> The DWC3 core IP is provided by Synopsys,
>> but some SoC-dependent parts (a.k.a glue-layer)
>> are implemented by SoC venders.
>>
>> The number of connected PHY instances are SoC-dependent.
>>
>> If you look at generic drivers such as
>>   drivers/usb/host/ehci-platform.c
>> the driver can handle arbitrary number of PHY instances.
>>
>> However, as mentioned above, DWC3 core allows only one PHY phandle
>> for each SS/HS.
>> This can result in a strange DT structure.
>>
>> For example, Socionext PXs3 SoC is integrated with 2 instances of DWC3.
>>
>> The instance 0 of DWC3 is connected with 2 super-speed PHYs.
>
> why 2 super-speed phys? Is this a two-port host-only implementation?


Socionext SoCs only support the host-mode.


The instance 0 has 2 ports.
In our integration, 1 SS PHY is needed for each port.
That's why it needs 2 SS PHYs.

Each DWC3 instance is connected with
multiple HS PHYs and multiple SS PHYs,
depending on the number of ports.




>> The instance 1 of DWC3 is connected with 1 super-speed PHY.
>
> Are both of these instances incapable of high/full/low-speed
> communication?

Also HS PHYs are connected.


To narrow down the problem,
I picked up the DT snippet only for SS PHY device nodes.




>> @@ -894,8 +894,8 @@ struct dwc3 {
>>         struct usb_phy          *usb2_phy;
>>         struct usb_phy          *usb3_phy;
>>
>> -       struct phy              *usb2_generic_phy;
>> -       struct phy              *usb3_generic_phy;
>> +       unsigned int            num_phys;
>> +       struct phy              **phys;
>>
>>         bool                    phys_ready;
>>
>>
>>
>> Is this OK?
>
> I don't know, I need a bit more details about your integration :-)


I can send a patch.

My concern is the following commit.
I do not know which parts are using this lookups.




commit 08f871a3aca252b15107fc37dedcdacbac80fdb5
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date:   Wed Nov 19 17:28:23 2014 +0200

    usb: dwc3: host: convey the PHYs to xhci

    On some platforms a PHY may need to be handled also in the
    host controller driver. Exynos5420 SoC requires some "PHY
    tuning" based on the USB speed. This patch delivers dwc3's
    PHYs to the xhci platform device when it's created.

    Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
    Tested-by: Vivek Gautam <gautam.vivek@samsung.com>
    Acked-by: Felipe Balbi <balbi@ti.com>
    Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>

-- 
Best Regards
Masahiro Yamada
