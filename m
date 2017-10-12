From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCHv2 0/7] Add support for USB OTG on STM32F7
Date: Thu, 12 Oct 2017 14:01:41 +0200
Message-ID: <ed37c11b-7518-9344-6598-c4e4f6301806@st.com>
References: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
 <878tgim24i.fsf@linux.intel.com>
 <04a49088-b615-d7b8-0387-e7bfa32ee19f@st.com>
 <87vajllx8t.fsf@linux.intel.com>
 <1c4180ef-2da6-b420-7c6e-41769608384a@st.com>
 <87sheplsrm.fsf@linux.intel.com>
 <3c36db6d-75fd-1be6-e946-b75a04e3760e@st.com>
 <21df4d0c-075c-0c5a-c39b-b1dd94fe819d@st.com>
 <87efq821tz.fsf@linux.intel.com>
 <d6e8be43-cbb9-89cd-eb3f-b34ac23ad99f@st.com>
 <878tgg1t5a.fsf@linux.intel.com> <8760bk1t1l.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8760bk1t1l.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Amelie DELAUNAY <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Benjamin GAIGNARD <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 10/12/2017 01:53 PM, Felipe Balbi wrote:
> 
> Hi,
> 
> Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
>>>>> I thought that patches 1 and 2, as they are "driver" patches, had to be
>>>>> applied on USB tree (so Felipe's one), and the others (3 to 7) had to be
>>>>> applied on STM32-DT tree (Alex's one). Did I miss something?
>>>>
>>>> patch 1 is documentation, right? Without the documentation patch,
>>>> checkpatch will cringe :-) So either way works.
>>>>
>>>> If you insist, I can take 1-2 through my tree. No worries.
>>>
>>> I don't want to insist :) but for me it is better (and more safe) if you
>>> take patch 1&2 in your tree, and will take others in mine.
>>
>> Okay, I'll apply 1&2
> 
> they are now in my testing/next and next branches.

Thanks Felipe
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
