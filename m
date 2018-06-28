From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v3 09/24] drm/sun4i: Don't skip TCONs if
 they don't have channel 0
Date: Thu, 28 Jun 2018 14:24:34 +0800
Message-ID: <CAGb2v67kBRWkJpJogFR4GXgA66dsxVaMVWN8MDiP_wFTqxW-=g@mail.gmail.com>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
 <20180625120304.7543-10-jernej.skrabec@siol.net> <CAGb2v64EkVK+AEngEuadBzAZagyU7eyOhHhBh0iFrxS+-BbCYQ@mail.gmail.com>
 <2676604.ZYCNkuCdbT@jernej-laptop>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBOP62HMQKGQEWBKFNEY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2676604.ZYCNkuCdbT@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 28, 2018 at 12:45 PM, Jernej =C5=A0krabec
<jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> Dne =C4=8Detrtek, 28. junij 2018 ob 03:51:31 CEST je Chen-Yu Tsai napisal=
(a):
>> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org=
>
> wrote:
>> > TV TCONs (channel 1 only) are always connected to TV or HDMI encoder.
>> > Because of that, all output endpoints on such TCON node will point to =
a
>> > encoder which is part of component framework.
>> >
>> > Correct current graph traversing algorithm in such way that it doesn't
>> > skip output enpoints with id 0 on TV TCONs.
>>
>> No. Our bindings say that endpoint 0 _is_ channel 0. For TCONs that don'=
t
>> have channel 0, it must be skipped.
>
> I'm not sure where this is stated. I read TCON binding again. Can you ple=
ase
> point me to it?

https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bin=
dings/display/sunxi/sun4i-drm.txt#L169

Our TCON driver still expects RGB or LVDS panel / bridges on endpoint 0.
So I guess this was sort of implied historically. It's no longer true.
This is something we should probably fix.

In practice our drivers don't look at it (yet), but rely on the downstream
encoder type to determine which channel to use.

But please add the "allwinner,tcon-channel" property as specified in
the binding.

> So on TV TCONs on R40 (without channel 0) TVE would be endpoint 1 and HDM=
I
> endpoint 2 (or the other way around)?

Which one goes first doesn't quite matter. IIRC there's also a mux for TVE?

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
