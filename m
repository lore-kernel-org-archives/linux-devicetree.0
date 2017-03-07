From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/15] clk: sunxi-ng: sun5i: Export video PLLs
Date: Tue, 7 Mar 2017 21:21:19 +1100
Message-ID: <CAGRGNgUvNgQonORN0iTV-e2NJzUJpzQUnn13w+C7MwzvR8uZUQ@mail.gmail.com>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <4bb77a9793d4ba25bf633eff6abe41910bb7fc3c.1488876832.git-series.maxime.ripard@free-electrons.com>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBBNET7LCQKGQEL6YDFYA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <4bb77a9793d4ba25bf633eff6abe41910bb7fc3c.1488876832.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Tue, Mar 7, 2017 at 7:56 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> The video PLLs are used directly by the HDMI controller. Export them so
> that we can use them in our DT node.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun5i.h      | 6 ++++--
>  include/dt-bindings/clock/sun5i-ccu.h | 3 +++
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun5i.h b/drivers/clk/sunxi-ng/ccu-sun5i.h
> index 8144487eb7ca..16f7aa92957e 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun5i.h
> +++ b/drivers/clk/sunxi-ng/ccu-sun5i.h
> @@ -28,15 +28,17 @@
>  #define CLK_PLL_AUDIO_4X       6
>  #define CLK_PLL_AUDIO_8X       7
>  #define CLK_PLL_VIDEO0         8
> -#define CLK_PLL_VIDEO0_2X      9
> +
> +/* The PLL_VIDEO0_2X is exported for HDMI */
> +
>  #define CLK_PLL_VE             10
>  #define CLK_PLL_DDR_BASE       11
>  #define CLK_PLL_DDR            12
>  #define CLK_PLL_DDR_OTHER      13
>  #define CLK_PLL_PERIPH         14
>  #define CLK_PLL_VIDEO1         15
> -#define CLK_PLL_VIDEO1_2X      16
>
> +/* The PLL_VIDEO0_2X is exported for HDMI */

PLL_VIDEO*1*_2X, right?

>  /* The CPU clock is exported */
>
>  #define CLK_AXI                        18

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
