From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RESEND PATCH 2/2] PCI: rockchip: Add quirk to disable RC's ASPM
 L0s
Date: Wed, 16 Nov 2016 08:52:58 +0800
Message-ID: <f9cd9cab-9d73-7749-a76e-90dd276b3b83@rock-chips.com>
References: <1479096666-112668-1-git-send-email-shawn.lin@rock-chips.com>
 <1479096666-112668-2-git-send-email-shawn.lin@rock-chips.com>
 <20161115222649.uymslcg2fyfwtxpd@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161115222649.uymslcg2fyfwtxpd@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 2016/11/16 6:26, Rob Herring wrote:
> On Mon, Nov 14, 2016 at 12:11:06PM +0800, Shawn Lin wrote:
>> Rockchip's RC outputs 100MHz reference clock but there are
>> two methods for PHY to generate it.
>>
>> (1)One of them is to use system PLL to generate 100MHz clock and
>> the PHY will relock it and filter signal noise then outputs the
>> reference clock.
>>
>> (2)Another way is to share Soc's 24MHZ crystal oscillator with
>> PHY and force PHY's DLL to generate 100MHz internally.
>>
>> When using case(2), the exit from L0s doesn't work fine occasionally
>> due to the broken design of RC receiver's logical circuit. So even if
>> we use extended-synch, it still fails for PHY to relock the bits from
>> FTS sometimes. This will hang the system.
>>
>> Maybe we could argue that why not use case(1) to avoid it? The reason
>> is that as we could see the reference clock is derived from system PLL
>> and the path from it to PHY isn't so clean which means there are some
>> noise introduced by power-domain and other buses can't be filterd out
>> by PHY and we could see noise from the frequency spectrum by oscilloscope.
>> This makes the TX compatibility test a little difficult to pass the spec.
>> So case(1) and case(2) are both used indeed now. If using case(2), we
>> should disable RC's L0s support, and that is why we need this property to
>> indicate this quirk.
>
> Doesn't the driver know which case it is using? I don't see why you need
> the quirk property.

Unfortunately it doesn't. This is one of the pre-input clock for PHY but
doesn't get any indication from the register of both PHY and controller.
So assigning a quirk seems quite straightforward.

>>
>> Also after checking quirk.c, I noticed there is already a quirk for
>> disabling L0s unconditionally, quirk_disable_aspm_l0s. But obviously we
>> shouldn't do that as mentioned above that case(1) could still works fine
>> with L0s.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
