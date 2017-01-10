From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] usb: dwc2: Add binding for AHB burst
Date: Tue, 10 Jan 2017 13:46:56 -0800
Message-ID: <e8fa98c7-0dbc-7be7-be54-b2a9114bc289@synopsys.com>
References: <cover.1479339900.git.johnyoun@synopsys.com>
 <1495076.fZ1uLW9fli@debian64>
 <dab2e32a-1bd0-2aa5-5a7a-61f2201786b4@synopsys.com>
 <19255165.1fIP7jmgm1@debian64>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19255165.1fIP7jmgm1@debian64>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/19/2016 6:49 AM, Christian Lamparter wrote:
> Hello John, hello Felipe
> 
> On Monday, November 28, 2016 7:32:20 PM CET John Youn wrote:
>> On 11/22/2016 12:51 PM, Christian Lamparter wrote:
>>> On Monday, November 21, 2016 7:32:30 PM CET John Youn wrote:
>>>> On 11/21/2016 1:10 PM, Christian Lamparter wrote:
>>>>> On Monday, November 21, 2016 12:16:31 PM CET John Youn wrote:
>>>>>> On 11/18/2016 12:18 PM, Christian Lamparter wrote:
>>>>>>> On Friday, November 18, 2016 8:16:08 AM CET Rob Herring wrote:
>>>>>>>> Also, perhaps you should allow that the compatible string can define the 
>>>>>>>> default.
>>>>>>>>
>>>>>>> I hoped you would say that :).
>>>>>>>
>>>>>>> I've attached a patch (on top of John Youn changes) [...]
>>>>>>> ---
>>>>>>> Subject: [PATCH] usb: dwc2: add a default ahb-burst setting for amcc,dwc-otg
>>>>>>> [...]
>>>>>>> @@ -1097,6 +1097,22 @@ static const char *const ahb_bursts[] = {
>>>>>>> +/* [...] */
>>>>>>> +static const struct of_device_id dwc2_compat_ahb_bursts[] = {
>>>>>>> +	{
>>>>>>> +		.compatible = "amcc,dwc-otg",
>>>>>>> +		.data = (void *) GAHBCFG_HBSTLEN_INCR16,
>>>>>>> +	},
>>>>>>> +};
>>>> [...]
>>>>>>>> @@ -1107,6 +1123,12 @@ static int dwc2_get_property_ahb_burst(struct dwc2_hsotg *hsotg)
>>>>>>>  	ret = device_property_read_string(hsotg->dev, "snps,ahb-burst", &str);
>>>>>>>  	if (ret < 0) {
>>>>>>> +		const struct of_device_id *match;
>>>>>>> +
>>>>>>> +		match = of_match_node(dwc2_compat_ahb_bursts, node);
>>>>>>> +		if (match)
>>>>>>> +			ret = (int)match->data;
>>>>>>> +
>>>> [...]
>>>>>> I'd prefer if you use the binding which requires no extra code in
>>>>>> dwc2.
>>>>> I'm fine with either option. However it think that this would require
>>>>> that either Mark or Rob would allow an exception to the "keep existing
>>>>> dts the way they are) and ack the following change to the canyonlands.dts. 
>>>> [...]
>>
>> Ok thanks for clearing that up. I understand.
>>
>> For now we can just set the property to "INCR16" based on the
>> compatible string. Perhaps in the future do this from a glue-layer
>> driver which binds to all compatible strings other than "snps,dwc2".
>>
>> I won't be able to do anything with this until next week though.
> Ok, I think enough time has passed. I would like to see this
> patch series (v3 [0]) being queued for 4.11+ together with
> "usb: dwc2: add a default ahb-burst setting for amcc,dwc-otg" [1].
> 
> Felipe, if you want I can resend the series and add the
> "amcc,dwc-otg" patch to it as well. Just let me know what you
> prefer here.
> 
> Regards,
> Christian
> 
> [0] <https://urldefense.proofpoint.com/v2/url?u=https-3A__www.mail-2Darchive.com_linux-2Dusb-40vger.kernel.org_msg83401.html&d=DgICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=0VsY7UdB1d6feXmjAhNrI_qghu91wtaLLnO3I3Uw2os&m=9a_ZbkfhbOdNjPstQXQq2hm157AzXQX03qKZIddHarU&s=zb0Zx7ZwvnKxcbpCJ_RlLrt1JtzhwUm9DffIAn9oR3k&e= >
> [1] <https://urldefense.proofpoint.com/v2/url?u=https-3A__www.spinics.net_lists_linux-2Dusb_msg149663.html&d=DgICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=0VsY7UdB1d6feXmjAhNrI_qghu91wtaLLnO3I3Uw2os&m=9a_ZbkfhbOdNjPstQXQq2hm157AzXQX03qKZIddHarU&s=23LsbEs2DjUVLrj4ifAU2LCzEi-U3wn1G1Nx9FBIxvw&e= >
> 

Hi Christian,

This should be fixed against the latest dwc2 param rework series [1]
which i hope to get queued for 4.11. If you can give it a test, that
would be great.

Regards,
John

[1] https://www.spinics.net/lists/linux-usb/msg151693.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
