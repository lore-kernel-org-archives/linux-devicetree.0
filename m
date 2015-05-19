From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] mailbox: arm-mhu: update the binding document
Date: Tue, 19 May 2015 13:24:07 +0100
Message-ID: <555B2B67.9000002@arm.com>
References: <1430131945-20628-1-git-send-email-sudeep.holla@arm.com> <55520DB4.6060903@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55520DB4.6060903-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 12/05/15 15:27, Sudeep Holla wrote:
> Hi Jassi,
>
> On 27/04/15 11:52, Sudeep Holla wrote:
>> The initial version of the binding document pushed along with the driver
>> is not clear/explicit about couple of the required properties namely:
>> clocks and clock-names, though the AMBA primecell binding used by the
>> arm-mhu specifies them clearly. Without these property the driver will
>> not even get probed, so it is mandatory to have them in DT.
>>
>> This patch adds the above mentioned required properties to the binding.
>> It also adds the optional interrupt-names property which is good to have
>> along with some minor updates to replace references to the driver with
>> the hardware IP.
>>
>
> Can you review this ? It will be good to get this before v4.1 gets
> released, otherwise the binding will remain incomplete in v4.1 ?
>

Any update on this ?

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
