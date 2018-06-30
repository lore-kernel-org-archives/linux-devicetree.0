From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 06/24] drm/sun4i: Fix releasing node when
 enumerating enpoints
Date: Sat, 30 Jun 2018 09:09:57 +0800
Message-ID: <CAGb2v65xZe8VM+dOd1fchXgekpgzvj1s75zdjz-6Met4K-5nBg@mail.gmail.com>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
 <20180625120304.7543-7-jernej.skrabec@siol.net> <CAGb2v65dNvqcWa7MUMesrEeDGfEmd0xPpKQmbqJ60_FHe=Y_JA@mail.gmail.com>
 <3837144.KdEe8HRubn@jernej-laptop>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBB7FQ3PMQKGQEX4XPGJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3837144.KdEe8HRubn@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 30, 2018 at 3:15 AM, Jernej =C5=A0krabec <jernej.skrabec@siol.n=
et> wrote:
> Dne =C4=8Detrtek, 28. junij 2018 ob 03:53:36 CEST je Chen-Yu Tsai napisal=
(a):
>> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org=
>
> wrote:
>> > sun4i_drv_add_endpoints() has a memory leak since it uses of_node_put(=
)
>> > when remote is equal to NULL and does nothing when remote has a valid
>> > pointer.
>> >
>> > Invert the logic to fix memory leak.
>> >
>> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
>>
>> Given this is a fix, it should have Fixes and stable tags.
>
> How should be this handled given that the patch is already merged and can=
not
> be dropped?

We can't. We'll have to manually submit it for stable once this lands
in Linus' tree.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
