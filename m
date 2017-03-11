From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Sat, 11 Mar 2017 12:32:43 +0100
Message-ID: <5e1183f4-774f-413a-628a-96e0df321faf@xs4all.nl>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-15-git-send-email-steve_longerbeam@mentor.com>
 <20170302160257.GK3220@valkosipuli.retiisi.org.uk>
 <20170303230645.GR21222@n2100.armlinux.org.uk>
 <20170304131329.GV3220@valkosipuli.retiisi.org.uk>
 <a7b8e095-a95c-24bd-b1e9-e983f18061c4@xs4all.nl>
 <20170310120902.1daebc7b@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170310120902.1daebc7b-ch4gOOMV7nf/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree@
List-Id: devicetree@vger.kernel.org

On 10/03/17 16:09, Mauro Carvalho Chehab wrote:
> Em Fri, 10 Mar 2017 13:54:28 +0100
> Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> escreveu:
> 
>>> Devices that have complex pipeline that do essentially require using the
>>> Media controller interface to configure them are out of that scope.
>>>   
>>
>> Way too much of how the MC devices should be used is in the minds of developers.
>> There is a major lack for good detailed documentation, utilities, compliance
>> test (really needed!) and libv4l plugins.
> 
> Unfortunately, we merged an incomplete MC support at the Kernel. We knew
> all the problems with MC-based drivers and V4L2 applications by the time
> it was developed, and we requested Nokia developers (with was sponsoring MC
> develoment, on that time) to work on a solution to allow standard V4L2
> applications to work with MC based boards.
> 
> Unfortunately, we took the decision to merge MC without that, because 
> Nokia was giving up on Linux development, and we didn't want to lose the
> 2 years of discussions and work around it, as Nokia employers were leaving
> the company. Also, on that time, there was already some patches floating
> around adding backward support via libv4l. Unfortunately, those patches
> were never finished.
> 
> The net result is that MC was merged with some huge gaps, including
> the lack of a proper solution for a generic V4L2 program to work
> with V4L2 devices that use the subdev API.
> 
> That was not that bad by then, as MC was used only on cell phones
> that run custom-made applications. 
> 
> The reallity changed, as now, we have lots of low cost SoC based
> boards, used for all sort of purposes. So, we need a quick solution
> for it.
> 
> In other words, while that would be acceptable support special apps
> on really embedded systems, it is *not OK* for general purpose SoC
> harware[1].
> 
> [1] I'm calling "general purpose SoC harware" those ARM boards
> like Raspberry Pi that are shipped to the mass and used by a wide
> range of hobbyists and other people that just wants to run Linux on
> ARM. It is possible to buy such boards for a very cheap price,
> making them to be used not only on special projects, where a custom
> made application could be interesting, but also for a lot of
> users that just want to run Linux on a low cost ARM board, while
> keeping using standard V4L2 apps, like "camorama".
> 
> That's perhaps one of the reasons why it took a long time for us to
> start receiving drivers upstream for such hardware: it is quite 
> intimidating and not logical to require developers to implement
> on their drivers 2 complex APIs (MC, subdev) for those
> hardware that most users won't care. From user's perspective,
> being able to support generic applications like "camorama" and
> "zbar" is all they want.
> 
> In summary, I'm pretty sure we need to support standard V4L2 
> applications on boards like Raspberry Pi and those low-cost 
> SoC-based boards that are shipped to end users.
> 
>> Anyway, regarding this specific patch and for this MC-aware driver: no, you
>> shouldn't inherit controls from subdevs. It defeats the purpose.
> 
> Sorry, but I don't agree with that. The subdev API is an optional API
> (and even the MC API can be optional).
> 
> I see the rationale for using MC and subdev APIs on cell phones,
> ISV and other embedded hardware, as it will allow fine-tuning
> the driver's support to allow providing the required quality for
> certain custom-made applications. but on general SoC hardware,
> supporting standard V4L2 applications is a need.
> 
> Ok, perhaps supporting both subdev API and V4L2 API at the same
> time doesn't make much sense. We could disable one in favor of the
> other, either at compilation time or at runtime.

Right. If the subdev API is disabled, then you have to inherit the subdev
controls in the bridge driver (how else would you be able to access them?).
And that's the usual case.

If you do have the subdev API enabled, AND you use the MC, then the
intention clearly is to give userspace full control and inheriting controls
no longer makes any sense (and is highly confusing IMHO).

> 
> This way, if the subdev API is disabled, the driver will be
> functional for V4L2-based applications that don't support neither
> MC or subdev APIs.

I'm not sure if it makes sense for the i.MX driver to behave differently
depending on whether the subdev API is enabled or disabled. I don't know
enough of the hardware to tell if it would ever make sense to disable the
subdev API.

Regards,

	Hans

> 
>> As mentioned, I will attempt to try and get some time to work on this
>> later this year. Fingers crossed.
> 
> That will be good, and, once we have a solution that works, we can
> work on cleanup the code, but, until then, drivers for arm-based boards
> sold to end consumers should work out of the box with standard V4L2 apps.
> 
> While we don't have that, I'm OK to merge patches adding such support
> upstream.
> 
> Thanks,
> Mauro
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
