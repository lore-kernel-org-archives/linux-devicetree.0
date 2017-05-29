From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v7 00/34] i.MX Media Driver
Date: Mon, 29 May 2017 19:29:33 +0200
Message-ID: <22f7f479-c319-1358-f209-021f95537d86@xs4all.nl>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
 <dd82968a-4c0b-12a4-f43b-7e63a255812d@xs4all.nl>
 <85c134d0-80f1-4313-2028-61bdad37903e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <85c134d0-80f1-4313-2028-61bdad37903e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/29/2017 07:23 PM, Steve Longerbeam wrote:
> Hi Hans, thanks for the reply...
> 
> 
> On 05/29/2017 06:46 AM, Hans Verkuil wrote:
>> Hi Steve,
>>
>> On 05/25/2017 02:29 AM, Steve Longerbeam wrote:
>>> In version 7:
>>>
>>>
>>
>> What is the status as of v7?
>>
>>  From what I can tell patch 2/34 needs an Ack from Rob Herring,
> 
> 
> Yes still missing that Ack. I think the issue is likely the Synopsys DW
> mipi csi-2 bindings. Someone earlier noted that there is another driver
> under devel for this Synopsys core, with another set of bindings.
> But it was determined that in fact this is a different device with a
> different register set.
> 
>   From what I remember of dealing with Synopsys cores in the past,
> these cores are highly configurable using their coreBuilder tools. So
> while the other device might stem from the same initial core from
> Synopsys, it was probably built with different design parameters
> compared to the core that exists in the i.MX6. So in essence it is a
> different device.
> 
> 
>> patches
>> 4-14 are out of scope for the media subsystem,
> 
> Ok. I did submit patches 4-14 to the right set of folks. Should I just
> drop this set in the next submission if they have not changed?

No, please keep them. Just make a note in the cover letter that they go
through a different tree. I like seeing the whole set :-)

>> patches 20-25 and 27-34
>> are all staging (so fine to be merged from my point of view).
>>
>> I'm not sure if patch 26 (defconfig) should be applied while the imx
>> driver is in staging. I would suggest that this patch is moved to the end
>> of the series.
> 
> Ok.
> 
>>
>> That leaves patches 15-19. I replied to patch 15 with a comment, patches
>> 16-18 look good to me, although patches 17 and 18 should be combined
>> to one
>> patch since patch 17 won't compile otherwise. Any idea when the
>> multiplexer is
>> expected to be merged? (just curious)
> 
> Philipp replied separately.
> 
>>
>> I would really like to get this merged for 4.13, so did I miss anything?
>>  From what I can tell it is really just an Ack for patch 2/34.
> 
> Agreed.

Can you split off the TODO file in its own patch? It was buried in the
big patch and I missed it because of that.

Take a look at Sakari's comment from today about another TODO item that
probably should be in the TODO file.

Regards,

	Hans

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
