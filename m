From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v6 08/13] drm/sun4i: add support for
 Allwinner DE2 mixers
Date: Fri, 5 May 2017 11:40:17 +0800
Message-ID: <CAGb2v64tYm=L9ZY1uKguA8aWJinLvruBQ5+vLMQDJGgwWk_ySA@mail.gmail.com>
References: <20170504114858.9008-1-icenowy@aosc.io> <20170504114858.9008-9-icenowy@aosc.io>
 <20170504130535.6nokhni5a3uxwy66@lukather> <c0b049b4ddc2af2f34059e9c9d659de9@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBOPIV7EAKGQEQ532IOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <c0b049b4ddc2af2f34059e9c9d659de9-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 5, 2017 at 12:52 AM,  <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> =E5=9C=A8 2017-05-04 21:05=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
>>
>> On Thu, May 04, 2017 at 07:48:53PM +0800, Icenowy Zheng wrote:
>>>
>>> Allwinner have a new "Display Engine 2.0" in their new SoCs, which come=
s
>>> with mixers to do graphic processing and feed data to TCON, like the ol=
d
>>> backends and frontends.
>>>
>>> Add support for the mixer on Allwinner V3s SoC; it's the simplest one.
>>>
>>> Currently a lot of functions are still missing -- more investigations
>>> are needed to gain enough information for them.
>>>
>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>> ---
>>> Changes in v6:
>>> - Rebased on wens's multi-pipeline patchset.
>>> Changes in v5:
>>> - Changed some code alignment.
>>> - Request real 32-bit DMA (prepare for 64-bit SoCs).
>>> Changes in v4:
>>> - Killed some dead code according to Jernej.
>>>
>>>  drivers/gpu/drm/sun4i/Kconfig       |  10 +
>>>  drivers/gpu/drm/sun4i/Makefile      |   3 +
>>>  drivers/gpu/drm/sun4i/sun8i_layer.c | 140 +++++++++++++
>>>  drivers/gpu/drm/sun4i/sun8i_layer.h |  36 ++++
>>>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 394
>>> ++++++++++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 137 +++++++++++++
>>>  6 files changed, 720 insertions(+)
>>>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_layer.c
>>>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_layer.h
>>>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_mixer.c
>>>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_mixer.h
>>>

[...]

>>> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
>>> b/drivers/gpu/drm/sun4i/sun8i_mixer.c
>>> new file mode 100644
>>> index 000000000000..e216b84d5bb2
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
>>> @@ -0,0 +1,394 @@

[...]

>>> +       list_add_tail(&mixer->engine.list, &drv->engine_list);
>>
>>
>> You didn't call INIT_LIST_HEAD on that list.
>
>
> So didn't the sun4i_backend driver...
>
> I think the mixer->engine.list only means an item in the
> engine_list, and the drv->engine_list is initialized in the
> sun4i_drv source code.

I read [1] that if the item is subsequently added to a list,
you could omit the INIT_LIST_HEAD call.

Makes sense, though you have to be sure you aren't doing anything
else with the list element.

ChenYu

[1] https://isis.poly.edu/kulesh/stuff/src/klist/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
