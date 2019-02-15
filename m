From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 05/11] drm/bridge: Add Analogix anx6345 support
Date: Fri, 15 Feb 2019 11:36:57 -0800
Message-ID: <CA+E=qVe1UOxprkG+zm1OX87f9vOPyHom=hxhnzGxidBA54WxkA@mail.gmail.com>
References: <20190215050957.20755-1-anarsoul@gmail.com> <CGME20190215051043epcas5p37cd953f0a76fb34e819b45c330dc6368@epcas5p3.samsung.com>
 <20190215050957.20755-6-anarsoul@gmail.com> <7d71654e-7169-2682-5655-0a9a9ea91c6d@samsung.com>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBRNJTTRQKGQELHFYLQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <7d71654e-7169-2682-5655-0a9a9ea91c6d-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 15, 2019 at 1:13 AM Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:

Hi Andrzej,

Thanks for review!

> > +#include <linux/of_gpio.h>
> Do you need this header?

I'll drop it.

> > +#include <drm/drmP.h>
>
> drmP.h is/should be deprecated.

Same here

> > +struct anx6345_platform_data {
> > +     struct regulator *dvdd12;
> > +     struct regulator *dvdd25;
> > +     struct gpio_desc *gpiod_reset;
> > +};
>
> Why do you need this struct, why just do not embed it's fields directly
> into struct anx6345 ?

OK, I'll embed it into struct anx6345

> > +     if (WARN_ON(anx6345->powered))
> > +             return;
>
> It should not happen, you can remove this warn.

OK

> > +     if (pdata->dvdd12) {
>
> If regulators are required this will be never null.

Right, and regulator subsystem will return dummy regulator if it's
missing in dts.
I'll remove redundant checks.

> > +
> > +     if (pdata->dvdd25) {
>
> ditto

OK

> > +
> > +     if (anx6345->panel)
> > +             drm_panel_prepare(anx6345->panel);
>
> again, here and below: panel is never null, check can be removed.

That's not true, panel is optional. It can be DP connector, not a panel.

> > +
> > +     gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
> > +     usleep_range(1000, 2000);
> > +
> > +     gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
>
>
> Start/stop sequence seems odd regarding reset gpio:
>
> 1. In probe reset is set to low, in poweroff to high - incosistent.
>
> 2. If in case of disabled device reset should be 0, there is no point to
> set it again to 0 three lines above.
>
> 3. I suspect in dts reset gpio should be declared as active_low, and the
> logic in the driver should be reverted, in power off it should be set to
> high, in power on it should be lowered (logically).

OK, I'll look into it.

> > +err_poweroff:
> > +     DRM_ERROR("Failed DisplayPort transmitter initialization: %d\n", err);
>
> redundant message

OK, will drop.

> > +             DRM_ERROR("Get sink count failed %d\n", err);
>
> The rule of thumb I heard is that if you start message capitalized you
> should end with dot. Since I do not know if it is enforced in kernel I
> leave the decision up to you.

I grepped DRM_ERROR in driver/gpu/drm and they do exactly the same as here.
So I'll just keep it as is for consistency.

> > +static bool anx6345_bridge_mode_fixup(struct drm_bridge *bridge,
> > +                                   const struct drm_display_mode *mode,
> > +                                   struct drm_display_mode *adjusted_mode)
> > +{
> > +     if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> > +             return false;
> > +
> > +     /* Max 1200p at 5.4 Ghz, one lane */
> > +     if (mode->clock > 154000)
> > +             return false;
>
> These checks should be in mode_valid callback.

OK

> > +     /* Map slave addresses of ANX6345 */
> > +     for (i = 0; i < I2C_NUM_ADDRESSES; i++) {
> > +             if (anx6345_i2c_addresses[i] >> 1 != client->addr)
> > +                     anx6345->i2c_clients[i] = i2c_new_dummy(client->adapter,
> > +                                             anx6345_i2c_addresses[i] >> 1);
> > +             else
> > +                     anx6345->i2c_clients[i] = client;
>
>
> I see this contredanse is copy/pasted from anx78*, but it looks quite
> complicated. As I understand there are two i2c addresses, why we cannot
> assume one address is for control interfaces and another  is dummy? It would
> simplify the code here and in other places.

Sorry, I don't get you, could you elaborate? Note that anx6345 uses
both addresses,
i2c_new_dummy() just registers new i2c device bound to a dummy driver and it's
supposed to be used for devices that consume more than one i2c address.

> > +     if (!found) {
> > +             DRM_ERROR("ANX%x (ver. %d) not supported by this driver\n",
> > +                       anx6345->chipid, version);
> > +             err = -ENODEV;
> > +             goto err_poweroff;
> > +     }
>
>
> As I see chip becomes powered forever, is it OK? Usually it should be
> powered only when pipeline starts, and powered-off after pipeline stops.

I'll look into how hard it would be to implement but personally I
think it's OK for now.
We can add more sophisticated power management once this driver is merged.
