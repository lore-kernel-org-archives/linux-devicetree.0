From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/4] mailbox: add support for System Control and Power
 Interface(SCPI) protocol
Date: Thu, 14 May 2015 09:25:24 +0100
Message-ID: <55545BF4.9090809@arm.com>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>	<1430134846-24320-2-git-send-email-sudeep.holla@arm.com>	<CABb+yY1KcrDNrhCHae=B7D+9jv2MEOqwF0VhDRKnZu7ATGfv2A@mail.gmail.com>	<55538540.1010505@arm.com>	<CABb+yY1083thUrtKfMKg1ZP2=d3Jr4hqRczqejpAkba+40UnkA@mail.gmail.com> <CABb+yY0J1j=wMaKj+1nohU7qJpVS83BD_AX3Mf56T5+6V6+NOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY0J1j=wMaKj+1nohU7qJpVS83BD_AX3Mf56T5+6V6+NOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 14/05/15 08:30, Jassi Brar wrote:
> On Thu, May 14, 2015 at 12:32 PM, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> BTW is scpi_protocol.c meant/tested to work over arm_mhu.c? The spec
>> says so but I don't see how because you pass 'struct scpi_xfer*' as
>> the message whereas arm_mhu.c expects u32*
>>

Yes it's tested using arm_mhu.c, and I have even sent updates to the
binding that's incomplete as of now and *must* be pulled into v4.1.
Please make sure it gets in. Otherwise clocks are optional but the
driver fails to probe without that. I was initially wondering why the
MHU probe is not called.

scpi_xfer has the slot as first element which will have the right
doorbell bit(in this case slot#0) set always.

> It seems your remote doesn't interpret the value in STAT register...
> so it just works.

Not exactly. If you look at Figure 2-1 in the spec, it shows how STAT
(along with SET/CLEAR) is used to identify the protocol. The remote
can implement multiple protocol. E.g. SCPI(on Slot#0 - main topic of
this series), ACPI(PCC/CPPC say on Slot#1), ABC(on Slot#X)...etc.

> However the SCPI spec recommends seeing STAT register as '31 slots'
> ... maybe we should try to support that.
>

Correct but only Slot#0 is used for SCPI.

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
