From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Thu, 4 Jul 2013 20:50:25 -0400
Message-ID: <CADnq5_Osq7WuGjwT8_kenebFe__GbcAPG13YDYP+yNt41AeQZA@mail.gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
	<20130702204255.2044c01b@armhf>
	<20130702191923.GD13924@flint.arm.linux.org.uk>
	<51D330AC.5060903@gmail.com>
	<CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
	<51D348F5.2080205@gmail.com>
	<00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
	<20130703090242.GM516@pengutronix.de>
	<CAF6AEGuzwNJtuAWS29YvdZ1fiMGk5cuv24n4wxkKsDPT8FrDBw@mail.gmail.com>
	<CAPM=9tygEFHWsOw4ZBr9GdF7-2OUcczrNKThHMJ=YQFU-Cbbug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAPM=9tygEFHWsOw4ZBr9GdF7-2OUcczrNKThHMJ=YQFU-Cbbug@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Dave Airlie <airlied@gmail.com>
Cc: Jean-Francois Moine <moinejf@free.fr>, Daniel Drake <dsd@laptop.org>, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, Russell King <rmk@arm.linux.org.uk>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 4, 2013 at 5:28 PM, Dave Airlie <airlied@gmail.com> wrote:
>  >             ...
>>>> Sorry but I'd like to say that this cannot be used commonly. Shouldn't you
>>>> really consider Linux framebuffer or other subsystems? The above dtsi file
>>>> is specific to DRM subsystem. And I think the dtsi file has no any
>>>> dependency on certain subsystem so board dtsi file should be considered for
>>>> all device drivers based on other subsystems: i.e., Linux framebuffer, DRM,
>>>> and so no. So I *strongly* object to it. All we have to do is to keep the
>>>> dtsi file as is, and to find other better way that can be used commonly in
>>>> DRM.
>>>
>>> +1 for not encoding the projected usecase of the graphics subsystem into
>>> the devicetree. Whether the two LCD controllers shall be used together
>>> or separately should not affect the devicetree. devicetree is about
>>> hardware description, not configuration.
>>
>> I do like the supernode idea, it would have avoided the ugly
>> global-list-of-sub-devices in tilcdc (and probably some other
>> drivers).
>>
>> As for projection of use-case, and whether it is something drm
>> specific or not..  if there is a way to make it generic enough that it
>> could work for fbdev, well I suppose that is nice.  Not a hard
>> requirement in my mind, or at least it is a secondary priority
>> compared to having a better way to having drm devices composed of
>> sub-{devices,nodes,whatever}.
>
> I'm not following who has the requirement for exposing different
> output device paths
> as possibly one or two devices, so you could have a drm device for one
> or the other,
> or X could use a subset of devices.
>
> I'm not really sure how best to deal with that, we have had plans for
> drm to actually
> expose sub-groups of crtc/encoders/connectors to userspace via
> different device nodes
> for a while, its just never received the final push on how to configure it.

David Herrmann is working on that as part of the GSoC render node project:
http://dvdhrm.wordpress.com/2013/05/29/drm-render-and-modeset-nodes/

Alex
