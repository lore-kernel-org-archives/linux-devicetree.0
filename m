From: Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 08/15] usb: dwc3: Make RX/TX threshold configurable
Date: Tue, 9 Jan 2018 23:54:29 +0000
Message-ID: <30102591E157244384E984126FC3CB4F300CC1D9@us01wembx1.internal.synopsys.com>
References: <cover.1515182391.git.thinhn@synopsys.com>
 <8446dc260efb993507a219ae11815607b8e58027.1515182391.git.thinhn@synopsys.com>
 <20180109041238.6gkzusod6x3su5gu@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 1/8/2018 8:12 PM, Rob Herring wrote:
> On Fri, Jan 05, 2018 at 12:14:48PM -0800, Thinh Nguyen wrote:
>> DWC_usb31 periodic transfer at 48K+ bytes per interval may need
>> modification to the TX/RX packet threshold to achieve optimal result.
>> Add properties to make it configurable.
> 
> I tend to think these should all be implied by the SoC specific
> compatible string if they need to be tuned.
> 
>>
>> Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/usb/dwc3.txt | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index 52fb41046b34..02dde83d02fa 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -55,6 +55,12 @@ Optional properties:
>>    - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
>>   	register for post-silicon frame length adjustment when the
>>   	fladj_30mhz_sdbnd signal is invalid or incorrect.
>> + - snps,rx_thr_sel_prd: set to enable periodic ESS RX packet threshold.
> 
> Isn't the next property being present sufficient to enable this or not?

Yes, we can do that. Actually, both settings must be set to enable the 
periodic TX/RX threshold.

> 
>> + - snps,rx_thr_num_pkt_prd: periodic ESS RX packet threshold count.
>> + - snps,rx_max_burst_prd: Max periodic ESS RX burst size.
>> + - snps,tx_thr_sel_prd: set to enable periodic ESS TX packet threshold.
> 
> ditto
> 
>> + - snps,tx_thr_num_pkt_prd: periodic ESS TX packet threshold count.
>> + - snps,tx_max_burst_prd: Max periodic ESS TX burst size.
> 
> Don't use '_' in property names.

I'll make the change.

> 
>>   
>>    - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
>>   
>> -- 
>> 2.11.0
>>
> 

Thanks,
Thinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
