From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V3 2/4] of: Add binding document for MIPS GIC
Date: Wed, 29 Oct 2014 09:56:54 -0700
Message-ID: <CAL1qeaGm1Ma=B-gJV2ovnLNYFooq6bv12rODq4d8cGtKLeNy-g@mail.gmail.com>
References: <1414541562-10076-1-git-send-email-abrestic@chromium.org>
	<1414541562-10076-3-git-send-email-abrestic@chromium.org>
	<5450C915.9030600@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5450C915.9030600-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 29, 2014 at 4:01 AM, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> On 10/29/2014 12:12 AM, Andrew Bresticker wrote:
>>
>> +- mti,available-cpu-vectors : Specifies the list of CPU interrupt vectors
>> +  to which the GIC may route interrupts.  May contain up to 6 entries,
>> one
>> +  for each of the CPU's hardware interrupt vectors.  Valid values are 2 -
>> 7.
>> +  This property is ignored if the CPU is started in EIC mode.
>> +
>
>
> Wouldn't it be better to have this in the reversed sense ie:
> mti,nonavailable-cpu-vectors? I think the assumption that by default they're
> all available unless something else is connected to them which is unlikely
> in most cases. It can be made optional property then.
>
> I don't have a strong opinion about it though.

Actually, I think I like the reversed sense as well.  Perhaps
"mti,reserved-cpu-vectors"?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
