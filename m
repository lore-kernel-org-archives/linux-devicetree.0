From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Specifying the console device using an alias
Date: Wed, 20 Aug 2014 11:25:21 -0600
Message-ID: <CAPnjgZ3YU8zy48UrxByZjY5rkK3mK7Quvi6O3kWtBfW6ttG6VA@mail.gmail.com>
References: <CAPnjgZ2A=DkGSnFLy1En8bH0pZAUAEWCWz_jQ941g3QQEUN9NQ@mail.gmail.com>
	<CAPnjgZ1S-HVZJ7kzt=YKT+jjZEtLdmZSnr6kmNVf+paGKdrgoQ@mail.gmail.com>
	<20140818191909.GA5352@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140818191909.GA5352-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On 18 August 2014 13:19, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>
> Simon,
>
> On Thu, Aug 14, 2014 at 10:02:10PM -0600, Simon Glass wrote:
>> (correct list)
>>
>> On 14 August 2014 21:42, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> > Hi,
>> >
>> > In U-Boot we currently specify the console device (typically serial)
>> > using something like:
>> >
>> > aliases {
>> >    console = "/serial@1234";
>> > }
>> >
>> > But the question has come up as to whether this should be done another
>> > way. I see the "linux.stdout" property in the /chosen node.
>> >
>> > I am concerned that making use of the /chosen node in U-Boot might
>> > confuse a lot of people, since this node is normally used to provide
>> > selections for the OS to use when booting. If we did use /chosen, then
>> > linux,stdout seems plain wrong but perhaps u-boot,stdout could be used
>> > instead.
>
> See ePAPR. There's a stdout-path property specified, without linux,
> prefix.

Yes, I see that, but linux doesn't use it AFAICT. Are you suggesting
that U-Boot should? Or should we use 'u-boot,stdout-path' in /chosen?
See my question immediately above about /chosen.

Regards,
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
