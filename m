From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] USB: Fix of_usb_get_dr_mode_by_phy with a shared phy
 block
Date: Fri, 3 Jun 2016 15:09:00 +0200
Message-ID: <4b744696-f448-cf4f-d5e8-a3d71d04a77b@redhat.com>
References: <1464888666-17728-1-git-send-email-hdegoede@redhat.com>
 <20160602181648.GB28820@uda0271908>
 <88cada17-af4c-9548-e734-351b6695e30f@redhat.com>
 <20160603130454.GA3778@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160603130454.GA3778@uda0271908>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 03-06-16 15:04, Bin Liu wrote:
> Hi,
>
> On Fri, Jun 03, 2016 at 12:34:35PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 02-06-16 20:16, Bin Liu wrote:
>>> Hi,
>>>
>>> On Thu, Jun 02, 2016 at 07:31:03PM +0200, Hans de Goede wrote:
>>>> Some SoCs have a single phy-hw-block with multiple phys, this is
>>>> modelled by a single phy dts node, so we end up with multiple
>>>> controller nodes with a phys property pointing to the phy-node
>>>> of the otg-phy.
>>>>
>>>> Only one of these controllers typically is an otg controller, yet we
>>>
>>> Is it guaranteed that only one of them will be otg?
>>
>> I guess not, but if there are 2 then with my patch we are of no worse
>> then today, we will then pick the first otg controller. Whereas
>
> What if the first otg controller is not what we want? this patch does
> not solve the problem. I would think Kishon's suggestion in another
> email - seperate dt phy nodes - is a better option.

That is not possible as it will break the dt-bindings for existing
devices.

And that adds a lot of complexity without a good reason, as I mentioned
in my reply to Kishon if we want to make 100% sure that we've the
right controller, we should pass in the phy index argument to the
phandle to of_usb_get_dr_mode_by_phy and make of_usb_get_dr_mode_by_phy
check this.

I'll submit a v2 which does this.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
