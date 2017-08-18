From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v5 1/1] usb:host:xhci support option to disable the xHCI
 USB2 HW LPM
Date: Fri, 18 Aug 2017 14:08:23 +0300
Message-ID: <5996CAA7.2050304@linux.intel.com>
References: <1502166477-23897-1-git-send-email-tqnguyen@apm.com>
 <CAKrQpSt_JuiXPFxTT7ApYFN+6u5AmreJB4PFAGzMRh12FpcnHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKrQpSt_JuiXPFxTT7ApYFN+6u5AmreJB4PFAGzMRh12FpcnHA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Thang Q. Nguyen" <tqnguyen-qTEPVZfXA3Y@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>, Iyappan Subramanian <isubramanian-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17.08.2017 06:19, Thang Q. Nguyen wrote:
> On Tue, Aug 8, 2017 at 11:27 AM, Thang Q. Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org> wrote:
>> XHCI specification 1.1 does not require xHCI-compliant controllers
>> to always enable hardware USB2 LPM. However, the current xHCI
>> driver always enable it when seeing HLC=1.
>> This patch supports an option for users to control disabling
>> USB2 Hardware LPM via DT/ACPI attribute.
>> This option is needed in case user would like to disable this
>> feature. For example, their xHCI controller has its USB2 HW LPM
>> broken.
>>
>> Signed-off-by: Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>
>> Signed-off-by: Thang Q. Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
...
>>
>
> Do you have any comments about this patch? Thanks.
> --

Looks good,
will send forward after 4.14-rc1

Thanks
Mathias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
