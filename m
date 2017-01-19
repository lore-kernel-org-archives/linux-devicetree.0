From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] usb: dwc3: add quirk to handle DWC_USB3_NUM ==
 DWC_USB3_NUM_IN_EPS
Date: Thu, 19 Jan 2017 22:49:38 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE300772909021B3FEC4C@US01WEMBX2.internal.synopsys.com>
References: <1484855882-4936-1-git-send-email-pure.logic@nexus-software.ie>
 <87mvemx0so.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1/19/2017 12:17 PM, Felipe Balbi wrote:
>
> Hi,
>
> Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org> writes:
>> - DWC_USB3_NUM indicates the number of Device mode single directional
>>   endpoints, including OUT and IN endpoint 0.
>>
>> - DWC_USB3_NUM_IN_EPS indicates the maximum number of Device mode IN
>>   endpoints active at any time, including control endpoint 0.
>>
>> It's possible to configure RTL such that DWC_USB3_NUM_EPS is equal to
>> DWC_USB3_NUM_IN_EPS.
>
> in that case, isn't it so you really don't have OUT eps? Why was your HW
> configured like this? Is this is silicon already or in FPGA or something
> early development-only part?
>
>> dwc3-core calculates the number of OUT endpoints as DWC_USB3_NUM minus
>> DWC_USB3_NUM_IN_EPS. If RTL has been configured with DWC_USB3_NUM_IN_EPS
>
> correctly so.
>
>> equal to DWC_USB3_NUM then dwc3-core will calculate the number of OUT
>> endpoints as zero.
>
> right
>
>> For example a from dwc3_core_num_eps() shows:
>> [    1.565000]  /usb0@f01d0000: found 8 IN and 0 OUT endpoints
>>
>> This patch fixes this case by adding a snps,num_in_eps quirk and an
>
> "This patch works around this case" would've been better here.
>
>> over-ride value for DWC_USB3_NUM_IN_EPS snps,num_in_eps_override. When the
>> quirk is declared then snps,num_in_eps_override will be used instead of
>> DWC_USB3_NUM_IN_EPS as the value of the number active IN endpoints.
>
> you don't need two values. A read of a non-existing property will return
> 0, IIRC.
>
>> The minimum value specified for DWC_USB3_NUM_IN_EPS in the Designware
>> data-book is two, if snps,num_in_eps_quirk is declared but
>> snps,num_in_eps_override is omitted, then the minimum value will be used as
>> the default.
>>
>> Signed-off-by: Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc3.txt |  3 +++
>>  drivers/usb/dwc3/core.c                        | 11 +++++++++++
>>  drivers/usb/dwc3/core.h                        |  6 ++++++
>>  3 files changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index e3e6983..bb383bf 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -55,6 +55,9 @@ Optional properties:
>>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
>>
>>   - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
>> + - snps,num_in_eps_quirk: when set core will over-ride the num_in_eps value.
>> + - snps,num_in_eps_override: the value that will be used for num_in_eps when
>> +			num_in_eps_quirk is true
>
> please declare these on the section above. Not below the one deprecated
> property.
>
> And as I said, you only need one property.
>
>>  This is usually a subnode to DWC3 glue to which it is connected.
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 369bab1..d5e472a 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -398,6 +398,8 @@ static void dwc3_core_num_eps(struct dwc3 *dwc)
>>  	struct dwc3_hwparams	*parms = &dwc->hwparams;
>>
>>  	dwc->num_in_eps = DWC3_NUM_IN_EPS(parms);
>> +	if (dwc->num_in_eps_quirk)
>> +		dwc->num_in_eps = dwc->num_in_eps_override;
>>  	dwc->num_out_eps = DWC3_NUM_EPS(parms) - dwc->num_in_eps;
>>  }
>>
>> @@ -908,6 +910,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  	struct device		*dev = dwc->dev;
>>  	u8			lpm_nyet_threshold;
>>  	u8			tx_de_emphasis;
>> +	u8			num_in_eps_override;
>>  	u8			hird_threshold;
>>
>>  	/* default to highest possible threshold */
>> @@ -922,6 +925,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  	 */
>>  	hird_threshold = 12;
>>
>> +	/* default value of 2 is the minimum RTL parameter value */
>> +	num_in_eps_override = 2;
>> +
>>  	dwc->maximum_speed = usb_get_maximum_speed(dev);
>>  	dwc->dr_mode = usb_get_dr_mode(dev);
>>  	dwc->hsphy_mode = of_usb_get_phy_mode(dev->of_node);
>> @@ -981,9 +987,14 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  				    &dwc->hsphy_interface);
>>  	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
>>  				 &dwc->fladj);
>> +	dwc->num_in_eps_quirk = device_property_read_bool(dev,
>> +				"snps,num_in_eps_quirk");
>> +	device_property_read_u8(dev, "snps,num_in_eps_override",
>> +				&num_in_eps_override);
>
> avoid the quirk flag and try like this:
>
> 	device_property_read_u8(...);
>
>
> 	num_in_eps = NUM_IN_EPS();
> 	num_out_eps = total - num_in_eps;
>
> 	if (num_out_eps == 0) {
>         	num_in_eps = dwc->override;
>                 num_out_eps = total - num_in_eps;
> 	}
>
> John, does this look correct to you, btw? I don't have my documentation
> right now (@home)
>

Hi Felipe, Bryan,

All endpoints as specified in DWC_USB3_NUM_EPS are bidirectional and
can be used as either IN or OUT within USB spec limits and
requirements.

DWC_USB3_NUM_IN_EPS specifies the number of EPs that can be *active*
IN EPs at any *one time*. This is limited by the number of TX FIFOs
you have instantiated in your design since each IN EP needs its own TX
FIFO.

So it is valid to have say, DWC_USB3_NUM_EPS=8 and
DWC_USB3_NUM_IN_EPS=8. Even though it is not possible to use all 8 EPs
as IN since you need at least one of them to be a control OUT. So you
could have a configuration of EP0 IN and OUT plus 6 IN EPs (total 1
OUT, 7 IN). Or EP0 IN and OUT plus any other combination of IN/OUT for
the remaining 6 EPs.

With the above in mind, you can probably just redo the endpoint number
logic in dwc3 to handle all cases without any quirks at all.

All that said, there is one further complication which is with the
DWC_USB3_EN_LOG_PHYS_EP_SUPT parameter. This is recommended to be
enabled and it is enabled by default.

If it is disabled, it will fix the physical and logical EP number and
direction of the available EPs to meet timings for FPGA designs. This
shouldn't be used in final designs for ASICS but we don't know for
sure whether it has made it to any final designs or not.

And unfortunately, whether this is set or not is not visible to the
software so it will require a quirk.

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
