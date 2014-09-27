From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/7] clk: sunxi: Add post clk divider for
 factor clocks
Date: Sat, 27 Sep 2014 15:23:05 +0800
Message-ID: <CAGb2v64W7SSvTHgY_qT8D04EHpzZG5BSPKkh1RGxdh7=2=igsg@mail.gmail.com>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-2-git-send-email-wens@csie.org> <54145822.4020607@elopez.com.ar>
 <20140916155711.GF2166@lukather> <CAGb2v64o-7La6Sd_WVDrPQC0DUTqXZPZoG7u=OpXb+xRB1tcog@mail.gmail.com>
 <20140927070708.GY15315@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBB3OLTGQQKGQEBZXKUVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20140927070708.GY15315@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 27, 2014 at 3:07 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, Sep 24, 2014 at 11:35:58PM +0800, Chen-Yu Tsai wrote:
>> Hi Maxime, Emilio,
>>
>> On Tue, Sep 16, 2014 at 11:57 PM, Maxime Ripard
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> > Hi Emilio,
>> >
>> > On Sat, Sep 13, 2014 at 11:43:46AM -0300, Emilio L=C3=B3pez wrote:
>> >> Hi,
>> >>
>> >> El 06/09/14 a las 07:47, Chen-Yu Tsai escibi=C3=B3:
>> >> >Some factor clocks, mostly PLLs, have an extra fixed divider just be=
fore
>> >> >the clock output. Add an option to the factor clk driver config data=
 to
>> >> >specify this divider.
>> >> >
>> >> >Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> >> >---
>> >> >  drivers/clk/sunxi/clk-factors.c | 3 +++
>> >> >  drivers/clk/sunxi/clk-factors.h | 1 +
>> >> >  2 files changed, 4 insertions(+)
>> >> >
>> >> >diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk=
-factors.c
>> >> >index 2057c8a..435111d 100644
>> >> >--- a/drivers/clk/sunxi/clk-factors.c
>> >> >+++ b/drivers/clk/sunxi/clk-factors.c
>> >> >@@ -64,6 +64,9 @@ static unsigned long clk_factors_recalc_rate(struc=
t clk_hw *hw,
>> >> >     /* Calculate the rate */
>> >> >     rate =3D (parent_rate * (n + config->n_start) * (k + 1) >> p) /=
 (m + 1);
>> >> >
>> >> >+    if (config->post_div)
>> >> >+            rate /=3D config->post_div;
>> >> >+
>> >> >     return rate;
>> >> >  }
>> >> >
>> >> >diff --git a/drivers/clk/sunxi/clk-factors.h b/drivers/clk/sunxi/clk=
-factors.h
>> >> >index d2d0efa..ce70c65 100644
>> >> >--- a/drivers/clk/sunxi/clk-factors.h
>> >> >+++ b/drivers/clk/sunxi/clk-factors.h
>> >> >@@ -16,6 +16,7 @@ struct clk_factors_config {
>> >> >     u8 pshift;
>> >> >     u8 pwidth;
>> >> >     u8 n_start;
>> >> >+    u8 post_div;
>> >> >  };
>> >> >
>> >> >  struct clk_factors {
>> >> >
>> >>
>> >> For the record, I liked your solution on[1] more, as it's in line
>> >> with what we're doing on the other sunxi platforms, instead of
>> >> adding features in factors to cover for some cases. But it's your
>> >> and Maxime's call, as I haven't written any of the sun6i code so
>> >> far.
>> >
>> > No, you still wrote most of the clock support, so your opinion is
>> > always valuable (and valued).
>> >
>> > Thing is, unlike what was done in the sun4i driver where there was a
>> > "real" technical issue that was preventing us from using only
>> > fixed-factor, we're not in such a case in sun6i (and later,
>> > apparently).
>> >
>> > PLL6 has only one output, which is then directly multiplied by
>> > fixed-factors, without any (pre|post)-dividers for any of them.
>> >
>> > That means that following what you did for the sun4i would just
>> > register 3 "dumbs" fixed-factors, that we couldn't reference from DT,
>> > or through a cryptic index (which is not even documented in our
>> > bindings).
>> >
>> > I'd be fine either way, I just prefer the solution that has less code
>> > and is more explicit.
>>
>> What's the verdict on this series?
>
> If Emilio prefers to have a single clock node, fine. But please update
> the DT bindings documentation.

OK. Then this series needs a bit of work. I'll pick the orignal
divs clocks patch from patchwork (as I didn't keep one) and fix
up the DT.


ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
