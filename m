From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v3 18/24] drm/sun4i: DW HDMI PHY: Add
 support for second PLL
Date: Thu, 28 Jun 2018 14:59:02 +0800
Message-ID: <CAGb2v66HOrbjm4w-EoVpvPde7SoVE5X3tfcyW_Ny-vQ+ax141Q@mail.gmail.com>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
 <20180625120304.7543-19-jernej.skrabec@siol.net> <CAGb2v651RGegpAi-2efhBUkyFf1iC+zxOGTbRkmjuWcYSTgYJw@mail.gmail.com>
 <52771065.UHJ1SZMy5a@jernej-laptop>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBTMO2LMQKGQEFTZHEOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <52771065.UHJ1SZMy5a@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 28, 2018 at 12:56 PM, Jernej =C5=A0krabec
<jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> Dne =C4=8Detrtek, 28. junij 2018 ob 04:25:54 CEST je Chen-Yu Tsai napisal=
(a):
>> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org=
>
> wrote:
>> > Some DW HDMI PHYs, like those found in A64 and R40 SoCs, can select
>> > between two clock parents.
>> >
>> > Add code which reads second PLL from DT.
>> >
>> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
>>
>> This patch by itself does not do anything. It should be merged with the
>> next one.
>
> Maxime said clock changes should be separated from DT changes.
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-May/578775.htm=
l

OK. I think the boundary between these two is bit blurred in this case.
And I think implementing support for two or more parents, then actually
adding the second parent makes more sense.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
