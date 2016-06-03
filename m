From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] USB: Fix of_usb_get_dr_mode_by_phy with a shared phy
 block
Date: Fri, 3 Jun 2016 13:39:26 +0200
Message-ID: <e8b770aa-5642-93c3-60c8-0717e87e732e@redhat.com>
References: <1464888666-17728-1-git-send-email-hdegoede@redhat.com>
 <575167EC.8000504@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575167EC.8000504-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 03-06-16 13:20, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Thursday 02 June 2016 11:01 PM, Hans de Goede wrote:
>> Some SoCs have a single phy-hw-block with multiple phys, this is
>> modelled by a single phy dts node, so we end up with multiple
>> controller nodes with a phys property pointing to the phy-node
>> of the otg-phy.
>
> Maybe we should try to model each phy with a separate dt node?

That seems like making things unnecessarily complicated. If we want
to be 100% sure that of_usb_get_dr_mode_by_phy finds the right
controller, we could add an "int index" parameter to of_usb_get_dr_mode_by_phy
and make it check that first argument specified to the phandle
used in the controller node matches the passed in index.

And use index == -1 to skip this test.

Regards,

Hans



>
> Thanks
> Kishon
>>
>> Only one of these controllers typically is an otg controller, yet we
>> were checking the first controller who uses a phy from the block and
>> then end up looking for a dr_mode property in e.g. the ehci controller.
>>
>> Instead of looking for nodes with a phy property, look for nodes
>> with a dr_mode property, so that we actually access the dr_mode property
>> in a node which has it.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/usb/common/common.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
>> index e3d0161..9806433 100644
>> --- a/drivers/usb/common/common.c
>> +++ b/drivers/usb/common/common.c
>> @@ -145,7 +145,7 @@ enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct device_node *phy_np)
>>  	int err;
>>
>>  	do {
>> -		controller = of_find_node_with_property(controller, "phys");
>> +		controller = of_find_node_with_property(controller, "dr_mode");
>>  		index = 0;
>>  		do {
>>  			phy = of_parse_phandle(controller, "phys", index);
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
