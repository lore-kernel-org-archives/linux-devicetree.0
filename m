From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 06/11] phy: da8xx-usb: new driver for DA8XX SoC USB PHY
Date: Fri, 1 Apr 2016 22:45:47 +0300
Message-ID: <56FECFEB.2030708@cogentembedded.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-7-git-send-email-david@lechnology.com>
 <56FE74AC.6080303@ti.com> <20160401144510.GA6264@uda0271908>
 <56FE9B8F.7050605@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56FE9B8F.7050605@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, Bin Liu <b-liu@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Petr Kulhavy <petr@barix.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Robert Jarzmik <robert.jarzmik@free.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/01/2016 07:02 PM, David Lechner wrote:

>>>> +EXPORT_SYMBOL_GPL(da8xx_usb20_phy_set_mode);
>>>
>>> Don't prefer export symbols from PHY driver. That'll create unnecessary
>>> dependencies between the controller and the PHY.
>>
>> Agreed.
>>
>>> I think it'll be better to create a new attribute and use it?
>>
>> Another simpler option is to not support _set_mode() for DA8xx, and the
>> phy driver set the otgmode bit in probe() based on dr_mode of the
>> controller.
>>
>> Regards,
>> -Bin.
>
> This certainly works for my particular use case, however, Sergei Shtylyov, who
> wrote the da8xx musb glue layer originally, seemed to recall in his review of
> the patch series that this really is necessary for OTG mode to work properly.

    No, it's still not necessary, however this method is now called from 
musb_init_controller() (it wasn't in my time). ISTR however that you needed to 
enforce the mode override in CFGCHIP2 for the host mode to function properly.

WBR, Sergei
