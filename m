From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Fri, 5 Jul 2013 07:28:32 +1000
Message-ID: <CAPM=9tygEFHWsOw4ZBr9GdF7-2OUcczrNKThHMJ=YQFU-Cbbug@mail.gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk>
 <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
 <CAF6AEGuzwNJtuAWS29YvdZ1fiMGk5cuv24n4wxkKsDPT8FrDBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAF6AEGuzwNJtuAWS29YvdZ1fiMGk5cuv24n4wxkKsDPT8FrDBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 >             ...
>>> Sorry but I'd like to say that this cannot be used commonly. Shouldn't you
>>> really consider Linux framebuffer or other subsystems? The above dtsi file
>>> is specific to DRM subsystem. And I think the dtsi file has no any
>>> dependency on certain subsystem so board dtsi file should be considered for
>>> all device drivers based on other subsystems: i.e., Linux framebuffer, DRM,
>>> and so no. So I *strongly* object to it. All we have to do is to keep the
>>> dtsi file as is, and to find other better way that can be used commonly in
>>> DRM.
>>
>> +1 for not encoding the projected usecase of the graphics subsystem into
>> the devicetree. Whether the two LCD controllers shall be used together
>> or separately should not affect the devicetree. devicetree is about
>> hardware description, not configuration.
>
> I do like the supernode idea, it would have avoided the ugly
> global-list-of-sub-devices in tilcdc (and probably some other
> drivers).
>
> As for projection of use-case, and whether it is something drm
> specific or not..  if there is a way to make it generic enough that it
> could work for fbdev, well I suppose that is nice.  Not a hard
> requirement in my mind, or at least it is a secondary priority
> compared to having a better way to having drm devices composed of
> sub-{devices,nodes,whatever}.

I'm not following who has the requirement for exposing different
output device paths
as possibly one or two devices, so you could have a drm device for one
or the other,
or X could use a subset of devices.

I'm not really sure how best to deal with that, we have had plans for
drm to actually
expose sub-groups of crtc/encoders/connectors to userspace via
different device nodes
for a while, its just never received the final push on how to configure it.

Dave.
