From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCHv2 2/7] usb: dwc2: add support for STM32F7 USB OTG HS
Date: Sat, 30 Sep 2017 17:16:08 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE3007729090269FF8113@US01WEMBX2.internal.synopsys.com>
References: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
 <1503930018-536-3-git-send-email-amelie.delaunay@st.com>
 <a0f2971e-d41a-01bb-88e1-8ffed786e954@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amelie DELAUNAY <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Benjamin GAIGNARD <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/29/2017 07:22 AM, Amelie DELAUNAY wrote:
> Hi,
>
> Gentle ping for driver review submitted on August 28th.
>
> Thanks,
> Amelie
>
> On 08/28/2017 04:20 PM, Amelie Delaunay wrote:
>> This patch adds the dwc2_set_params function for STM32F7 USB OTG HS.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
>> ---
>>   drivers/usb/dwc2/params.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
>> index a3ffe97..d5b672d 100644
>> --- a/drivers/usb/dwc2/params.c
>> +++ b/drivers/usb/dwc2/params.c
>> @@ -136,6 +136,15 @@ static void dwc2_set_stm32f4x9_fsotg_params(struct dwc2_hsotg *hsotg)
>>   	p->activate_stm_fs_transceiver = true;
>>   }
>>
>> +static void dwc2_set_stm32f7_hsotg_params(struct dwc2_hsotg *hsotg)
>> +{
>> +	struct dwc2_core_params *p = &hsotg->params;
>> +
>> +	p->host_rx_fifo_size = 622;
>> +	p->host_nperio_tx_fifo_size = 128;
>> +	p->host_perio_tx_fifo_size = 256;
>> +}
>> +
>>   const struct of_device_id dwc2_of_match_table[] = {
>>   	{ .compatible = "brcm,bcm2835-usb", .data = dwc2_set_bcm_params },
>>   	{ .compatible = "hisilicon,hi6220-usb", .data = dwc2_set_his_params  },
>> @@ -154,6 +163,8 @@ const struct of_device_id dwc2_of_match_table[] = {
>>   	{ .compatible = "st,stm32f4x9-fsotg",
>>   	  .data = dwc2_set_stm32f4x9_fsotg_params },
>>   	{ .compatible = "st,stm32f4x9-hsotg" },
>> +	{ .compatible = "st,stm32f7-hsotg",
>> +	  .data = dwc2_set_stm32f7_hsotg_params },
>>   	{},
>>   };
>>   MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
>>


Acked-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>


John

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
