From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Sat, 11 Mar 2017 11:06:55 -0800
Message-ID: <71f61b28-1252-45ad-b5f4-52ae2f5b9352@gmail.com>
References: <20170303230645.GR21222@n2100.armlinux.org.uk>
 <20170304131329.GV3220@valkosipuli.retiisi.org.uk>
 <a7b8e095-a95c-24bd-b1e9-e983f18061c4@xs4all.nl>
 <20170310120902.1daebc7b@vento.lan>
 <5e1183f4-774f-413a-628a-96e0df321faf@xs4all.nl>
 <20170311101408.272a9187@vento.lan>
 <20170311153229.yrdjmggb3p2suhdw@ihha.localdomain>
 <acfb5eca-ff00-6d57-339a-3322034cbdb3@gmail.com>
 <20170311184551.GD21222@n2100.armlinux.org.uk>
 <1f1b350a-5523-34bc-07b7-f3cd2d1fd4c1@gmail.com>
 <20170311185959.GF21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170311185959.GF21222-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, pavel-+ZI9xUNit7I@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 03/11/2017 10:59 AM, Russell King - ARM Linux wrote:
> On Sat, Mar 11, 2017 at 10:54:55AM -0800, Steve Longerbeam wrote:
>>
>>
>> On 03/11/2017 10:45 AM, Russell King - ARM Linux wrote:
>>> I really don't think expecting the user to understand and configure
>>> the pipeline is a sane way forward.  Think about it - should the
>>> user need to know that, because they have a bayer-only CSI data
>>> source, that there is only one path possible, and if they try to
>>> configure a different path, then things will just error out?
>>>
>>> For the case of imx219 connected to iMX6, it really is as simple as
>>> "there is only one possible path" and all the complexity of the media
>>> interfaces/subdevs is completely unnecessary.  Every other block in
>>> the graph is just noise.
>>>
>>> The fact is that these dot graphs show a complex picture, but reality
>>> is somewhat different - there's only relatively few paths available
>>> depending on the connected source and the rest of the paths are
>>> completely useless.
>>>
>>
>> I totally disagree there. Raw bayer requires passthrough yes, but for
>> all other media bus formats on a mipi csi-2 bus, and all other media
>> bus formats on 8-bit parallel buses, the conersion pipelines can be
>> used for scaling, CSC, rotation, and motion-compensated de-interlacing.
>
> ... which only makes sense _if_ your source can produce those formats.
> We don't actually disagree on that.
>
> Let me re-state.  If the source can _only_ produce bayer, then there is
> _only_ _one_ possible path, and all the overhead of the media controller
> stuff is totally unnecessary.
>
> Or, are you going to tell me that the user should have the right to
> configure paths through the iMX6 hardware that are not permitted by the
> iMX6 manuals for the data format being produced by the sensor?
>

Russell, I'm not following you. The imx6 pipelines allow for many
different sources, not just the inx219 that only outputs bayer. You
seem to be saying that those other pipelines should not be present
because they don't support raw bayer.

Steve
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
