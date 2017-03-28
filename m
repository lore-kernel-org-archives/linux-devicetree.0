From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v5 1/5] usb: dwc2: Add support for STM32F429/439/469 USB
 OTG HS/FS in FS mode (internal PHY)
Date: Tue, 28 Mar 2017 15:49:58 +0200
Message-ID: <d3711b3b-401d-87c7-20bd-a88364ef15a1@st.com>
References: <20170201012547.76158-1-bruherrera@gmail.com>
 <20170201012547.76158-2-bruherrera@gmail.com>
 <2B3535C5ECE8B5419E3ECBE300772909021B411720@US01WEMBX2.internal.synopsys.com>
 <58187797-2c11-c75b-571c-27fe64578099@st.com>
 <8760ith6a6.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8760ith6a6.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 03/28/2017 03:36 PM, Felipe Balbi wrote:
>
> Hi,
>
> Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org> writes:
>> Hi John,
>>
>> On 02/01/2017 04:37 AM, John Youn wrote:
>>> On 1/31/2017 5:26 PM, Bruno Herrera wrote:
>>>> This patch introduces a new parameter to activate USB OTG HS/FS core
>>>> embedded phy transceiver. The STM32F4x9 SoC uses the GGPIO register
>>>> to enable the transceiver.
>>>> Also add the dwc2_set_params function for stm32f4 otg fs.
>>>>
>>>> Signed-off-by: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> Acked-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>>
>> Do you plan to take those patches on your pull-request for 4.12?
>> I was wondering if I take machine parts (DT) in my pull request for 4.12
>> or if I wait an official version with driver part merged.
>
> patches already in my queue for v4.12

Thanks for info.

Regards
Alex

>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
