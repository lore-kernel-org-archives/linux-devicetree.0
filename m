From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5] phy-sun4i-usb: Fix irq free conditions to match
 request conditions
Date: Wed, 22 Jun 2016 11:35:00 +0530
Message-ID: <576A2A8C.7090403@ti.com>
References: <1466242293-22393-1-git-send-email-hdegoede@redhat.com>
 <720c35c7-eb9a-2881-cb95-39fa6aa61dee@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <720c35c7-eb9a-2881-cb95-39fa6aa61dee-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Saturday 18 June 2016 05:03 PM, Sergei Shtylyov wrote:
> On 6/18/2016 12:31 PM, Hans de Goede wrote:
> 
>> commit 5cf700ac9d50("phy: phy-sun4i-usb: Fix optional gpios failing probe")
>> changed the condition under which irqs are requested, but omitted matching
>> changes to sun4i_usb_phy_remove(). This commit fixes this.
>>
>> Fixes: commit 5cf700ac9d50("phy: phy-sun4i-usb: Fix optional gpios failing
>> probe")
> 
>    "Commit" not needed here, this tag has a standardized format.

Fixed it myself and applied.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
