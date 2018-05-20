From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/15] drm/sun4i: Add support for R40 TV TCONs
Date: Sun, 20 May 2018 12:09:52 +1000
Message-ID: <CAGRGNgXbKGhnern4=_W9W5dKM54H5B1dnAD7up-23rUAMWWCSw@mail.gmail.com>
References: <20180519183127.2718-1-jernej.skrabec@siol.net>
 <20180519183127.2718-11-jernej.skrabec@siol.net> <CAGRGNgWumzhiiwJenOXRuRN0i-_2uY=YR5L+9m70HW2ibF=C7w@mail.gmail.com>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQIP76OUQLBBBNSQPMAKGQE77FBA6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGRGNgWumzhiiwJenOXRuRN0i-_2uY=YR5L+9m70HW2ibF=C7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jernej,

On Sun, May 20, 2018 at 11:57 AM, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Jernej,
>
> On Sun, May 20, 2018 at 4:31 AM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
>> R40 display pipeline has a lot of possible configurations. HDMI can be
>> connected to 2 different TCONs (out of 4) and mixers can be connected to
>> any TCON. All this must be configured in TCON TOP.
>>
>> Along with definition of TCON capabilities also add mux callback, which
>> can configure this complex pipeline.
>>
>> For now, only TCON TV is supported.
>>
>> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
>> ---
>>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 39 ++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> index e0c562ce1c22..81b9551e4f78 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> @@ -1274,6 +1274,31 @@ static int sun6i_tcon_set_mux(struct sun4i_tcon *tcon,
>>         return 0;
>>  }
>>
>> +static int sun8i_r40_tcon_tv_set_mux(struct sun4i_tcon *tcon,
>> +                                    const struct drm_encoder *encoder,
>> +                                    int index)
>> +{
>> +       if (encoder->encoder_type == DRM_MODE_ENCODER_TMDS)
>> +               sun8i_tcon_top_set_hdmi_src(tcon->tcon_top, index);
>> +
>> +       sun8i_tcon_top_de_config(tcon->tcon_top, tcon->id,
>> +                                tcon_type_tv, index);
>> +
>> +       return 0;
>> +}
>> +
>> +static int sun8i_r40_tcon_tv_set_mux_0(struct sun4i_tcon *tcon,
>> +                                      const struct drm_encoder *encoder)
>> +{
>> +       return sun8i_r40_tcon_tv_set_mux(tcon, encoder, 0);
>> +}
>> +
>> +static int sun8i_r40_tcon_tv_set_mux_1(struct sun4i_tcon *tcon,
>> +                                      const struct drm_encoder *encoder)
>> +{
>> +       return sun8i_r40_tcon_tv_set_mux(tcon, encoder, 1);
>> +}
>
> Are TCON-TOPs going to be a common thing in new SoCs from Allwinner?
> If so, maybe we should add an index to the TCON quirks and have a
> common TCON-TOP set_mux function.

Actually, that only moves it up a level. Should it be a devicetree property?

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
