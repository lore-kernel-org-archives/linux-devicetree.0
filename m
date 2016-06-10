From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4] USB: Fix of_usb_get_dr_mode_by_phy with a shared phy
 block
Date: Fri, 10 Jun 2016 20:27:03 +0200
Message-ID: <7c86faf8-85a9-fab5-d67d-672508b39a6f@redhat.com>
References: <1465551985-3332-1-git-send-email-hdegoede@redhat.com>
 <20160610150014.GF2167@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160610150014.GF2167@uda0271908>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 10-06-16 17:00, Bin Liu wrote:
> Hi,
>
> On Fri, Jun 10, 2016 at 11:46:25AM +0200, Hans de Goede wrote:
>> Some SoCs have a single phy-hw-block with multiple phys, this is
>> modelled by a single phy dts node, so we end up with multiple
>> controller nodes with a phys property pointing to the phy-node
>> of the otg-phy.
>>
>> Only one of these controllers typically is an otg controller, yet we
>> were checking the first controller who uses a phy from the block and
>> then end up looking for a dr_mode property in e.g. the ehci controller.
>>
>> This commit fixes this by adding an arg0 parameter to
>> of_usb_get_dr_mode_by_phy and make of_usb_get_dr_mode_by_phy
>> check that this matches the phandle args[0] value when looking for
>> the otg controller.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes in v2:
>> -Add a arg0 parameter instead of looking for nodes with a dr_mode property
>> Changes in v3:
>> -No changes
>> Changes in v4:
>> -When arg0 == -1, use of_parse_phandle instead of of_parse_phandle_with_args
>>  because using of_parse_phandle_with_args breaks phy's which use the usb-phy
>>  bindings instead of the generic phy bindings
>
> I would think you'd better send this patch with --in-reply-to to the
> patch in v3, so whoever picks it can easily pick the whole patch set,
> especially in this case the set touches multiple modules, and you don't
> want to resend the other patches.

Does that mean that you're happy with this patch now ? If so can I have
your Acked-by please ? Then I'll resend the entire set after that.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
