From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 00/14] Clock improvement for video playback
Date: Wed, 14 Sep 2016 11:36:20 -0700
Message-ID: <20160914183620.GV7243@codeaurora.org>
References: <1472473626-15398-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472473626-15398-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gabriel.fernandez-qxv4g6HH51o@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Olivier Bideau <olivier.bideau-qxv4g6HH51o@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel@s
List-Id: devicetree@vger.kernel.org

On 08/29, gabriel.fernandez-qxv4g6HH51o@public.gmane.org wrote:
> From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
> 
> v3:
>   - Rebase to v4.8-rc1
>   - Tipo fix in st,clkgen-pll.txt
>   - Add Ack of Peter for the series
>   - Add missed patch: "ARM: DT: STiH4xx: Simplify clock binding of STiH4xx platforms"
> 
> v2:
>   - Simpliflication of clock binding
>     remark from Rob https://lkml.org/lkml/2016/5/25/492
>   - Suppression of stih415-416 support for the clocks (in order
> 	to help simplification of clock binding)
>     (others patchs for the machine and drivers will come)
> 
> This serie allows to increase video resolutions and make audio
> adjustment during a video playback.
> 
> Gabriel Fernandez (14):
>   drivers: clk: st: Remove stih415-416 clock support
>   drivers: clk: st: Simplify clock binding of STiH4xx platforms
>   ARM: DT: STiH4xx: Simplify clock binding of STiH4xx platforms
>   drivers: clk: st: Add fs660c32 synthesizer algorithm
>   drivers: clk: st: Add clock propagation for audio clocks
>   drivers: clk: st: Handle clk synchronous mode for video clocks
>   ARM: DT: STiH407: Enable clock propagation for audio clocks
>   ARM: DT: STiH410: Enable clock propagation for audio clocks
>   ARM: DT: STiH418: Enable clock propagation for audio clocks
>   ARM: DT: STiH407: Enable synchronous clock mode for video clocks
>   ARM: DT: STiH410: Enable synchronous clock mode for video clocks
>   ARM: DT: STiH418: Enable synchronous clock mode for video clocks
>   ARM: DT: STi: STiH407: clock configuration to address 720p and 1080p
>   ARM: DT: STi: STiH410: clock configuration to address 720p and 1080p

The order of patches intermingles clk changes and dts changes.
I'd prefer to not take any patches for dts through the clk tree,
so can those be deferred to an arm-soc PR? Assuming that works,
I'd just pick 1-2, and 4-6 into the clk tree and the rest can go
on top through arm-soc.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
