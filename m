From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 10/18] drm/sun4i: mixer: Read id from DT
Date: Wed, 11 Jul 2018 15:11:30 +0800
Message-ID: <CAGb2v66Ghosy92MQH8YmqxkimNe5S0sYSVmt+X-ZsDHYzPK=EA@mail.gmail.com>
References: <20180710203511.18454-1-jernej.skrabec@siol.net>
 <20180710203511.18454-11-jernej.skrabec@siol.net> <CAGb2v66vU4gBewGjLL-Ohx6mvKOVu4dDdwKNsXrkr3nZsSq3Cg@mail.gmail.com>
 <3034661.dpXlJLpBba@jernej-laptop>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBOW3S3NAKGQEXTRA73I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3034661.dpXlJLpBba@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 11, 2018 at 3:10 PM, Jernej =C5=A0krabec <jernej.skrabec@siol.n=
et> wrote:
> Dne sreda, 11. julij 2018 ob 05:11:56 CEST je Chen-Yu Tsai napisal(a):
>> On Wed, Jul 11, 2018 at 4:35 AM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org=
>
> wrote:
>> > Currently, TCON supports 2 ways to match TCON with engine (mixer in th=
is
>> > case). Old way is to just traverse of graph backwards and compare node
>> > pointer. New way is to match TCON and engine by their respective ids.
>> > All SoCs with DE2 enabled till now used the old way, which means mixer
>> > id was never used and thus never implemented.
>> >
>> > However, for R40, only the new way will be used. To prepare for that,
>> > implement mixer id fetching from DT.
>> >
>> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
>> > ---
>> >
>> >  drivers/gpu/drm/sun4i/sun8i_mixer.c | 40 +++++++++++++++++++++++++++-=
-
>> >  1 file changed, 38 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> > b/drivers/gpu/drm/sun4i/sun8i_mixer.c index aa81b9838ae8..4bd4d8ccb34f
>> > 100644
>> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> > @@ -22,6 +22,7 @@
>> >
>> >  #include <linux/component.h>
>> >  #include <linux/dma-mapping.h>
>> >  #include <linux/of_device.h>
>> >
>> > +#include <linux/of_graph.h>
>> >
>> >  #include <linux/reset.h>
>> >
>> >  #include "sun4i_drv.h"
>> >
>> > @@ -322,6 +323,42 @@ static struct regmap_config sun8i_mixer_regmap_co=
nfig
>> > =3D {>
>> >         .max_register   =3D 0xbfffc, /* guessed */
>> >
>> >  };
>> >
>> > +static int sun8i_mixer_of_get_id(struct device_node *node)
>> > +{
>> > +       struct device_node *port, *ep;
>> > +       int ret =3D -EINVAL;
>> > +
>> > +       /* output is port 1 */
>> > +       port =3D of_graph_get_port_by_id(node, 1);
>> > +       if (!port)
>> > +               return -EINVAL;
>> > +
>> > +       /* try to find downstream endpoint */
>> > +       for_each_available_child_of_node(port, ep) {
>> > +               struct device_node *remote;
>> > +               u32 reg;
>> > +
>> > +               remote =3D of_graph_get_remote_endpoint(ep);
>> > +               if (!remote)
>> > +                       continue;
>> > +
>> > +               ret =3D of_property_read_u32(remote, "reg", &reg);
>> > +               if (!ret) {
>> > +                       of_node_put(remote);
>> > +                       of_node_put(ep);
>> > +                       of_node_put(port);
>> > +
>> > +                       return reg;
>> > +               }
>> > +
>> > +               of_node_put(remote);
>> > +       }
>> > +
>> > +       of_node_put(port);
>> > +
>> > +       return ret;
>> > +}
>> > +
>>
>> The above looks good.
>>
>> >  static int sun8i_mixer_bind(struct device *dev, struct device *master=
,
>> >
>> >                               void *data)
>> >
>> >  {
>> >
>> > @@ -353,8 +390,7 @@ static int sun8i_mixer_bind(struct device *dev, st=
ruct
>> > device *master,>
>> >         dev_set_drvdata(dev, mixer);
>> >         mixer->engine.ops =3D &sun8i_engine_ops;
>> >         mixer->engine.node =3D dev->of_node;
>> >
>> > -       /* The ID of the mixer currently doesn't matter */
>> > -       mixer->engine.id =3D -1;
>> > +       mixer->engine.id =3D sun8i_mixer_of_get_id(dev->of_node);
>>
>> Should you be handling error codes?
>
> Sadly, no. Other supported DE2 SoC miss reg property in DT and it would b=
reak
> them. Additionally, V3s has only one mixer and thus technically doesn't
> violate binding with omiting mixer id.
>
> Anyway, it was -1 all the time before and not really used, so having nega=
tive
> value doesn't change anything for other SoCs. If this fails and it's need=
ed,
> it would stop at mixer <-> TCON matching stage anyway.
>
> I guess I should add comment for that.

Yes. Please. We'll leave the rest till later. I plan to fix up the missing
IDs for all the other SoCs anyway.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
