From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 03/14] drm/sun4i: tcon: Add variant callback for TCON
 output muxing
Date: Mon, 2 Oct 2017 21:03:06 +0800
Message-ID: <CAGb2v67V-5vxoa1H7FtOYO7kfnuiN+kXeCZEK=E-uLQkJR+wvg@mail.gmail.com>
References: <20170929082306.16193-1-wens@csie.org> <20170929082306.16193-4-wens@csie.org>
 <20170929101918.h7lfefk3bjj2lf74@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170929101918.h7lfefk3bjj2lf74@flea>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 29, 2017 at 6:19 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Fri, Sep 29, 2017 at 08:22:55AM +0000, Chen-Yu Tsai wrote:
>>  static const struct sun4i_tcon_quirks sun5i_a13_quirks = {
>> -     .has_unknown_mux = true,
>> -     .has_channel_1  = true,
>> +     .has_unknown_mux        = true,
>> +     .has_channel_1          = true,
>> +     .set_mux                = sun5i_a13_tcon_set_mux,
>
> I guess we could even retire has_unknown_mux now, since it provides
> the same information than if set_mux is set or to NULL.

I'll drop them in the same patch in v4.

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
