From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 10/19] drm/sun4i: hdmi: Rename internal DDC
 clock to avoid name collision
Date: Fri, 23 Jun 2017 17:37:13 +0800
Message-ID: <CAGb2v67KnHjBmOwCCfrbYXC8r2fH_s5deJYecJgAzPCfuTKiMw@mail.gmail.com>
References: <20170602101024.18940-1-wens@csie.org> <20170602101024.18940-11-wens@csie.org>
 <20170602193012.xwuziggyx6evmusz@flea.lan> <CAGb2v64Vgdjm1MAwn+L0PVc0CA0QOCn=0RONKoGDWLpzVBzvmQ@mail.gmail.com>
 <20170605140012.rlx7rm7xhriwqaza@flea.lan>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBYWCWPFAKGQEZ2JBG4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170605140012.rlx7rm7xhriwqaza-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 5, 2017 at 10:00 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Sat, Jun 03, 2017 at 10:33:25PM +0800, Chen-Yu Tsai wrote:
>> On Sat, Jun 3, 2017 at 3:30 AM, Maxime Ripard
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> > On Fri, Jun 02, 2017 at 06:10:15PM +0800, Chen-Yu Tsai wrote:
>> >> The DDC parent clock on the A31 SoC is also conveniently named
>> >> "hdmi-ddc", which results in a name collision when the hdmi driver
>> >> registers its internal DDC divider clock.
>> >>
>> >> Rename the internal clock to "hdmi-ddc-divider".
>> >>
>> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> >> ---
>> >>  drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
>> >> index e1071838f487..9a6b6243e977 100644
>> >> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
>> >> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
>> >> @@ -125,7 +125,7 @@ static int _sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *parent,
>> >>       if (!ddc)
>> >>               return -ENOMEM;
>> >>
>> >> -     init.name = "hdmi-ddc";
>> >> +     init.name = "hdmi-ddc-divider";
>> >
>> > Can't we rename the CCU clock instead? Having the clock called
>> > hdmi-ddc being the actual clock output on the DDC bus feels more
>> > natural.
>>
>> Do you have any suggestions? The manual labels the conflicting one
>> in the CCU as "HDMI_DDC"...
>
> DDC as the main CCU clock, and hdmi-ddc as the one actually generated
> by the HDMI controller?

I think I'll just name it hdmi-ddc-parent. Who knows if some other module
comes in and has a clock named ddc.

ChenYu
