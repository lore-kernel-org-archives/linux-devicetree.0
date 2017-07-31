From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/2] clk: meson: expose clk ids
Date: Mon, 31 Jul 2017 14:00:12 +0200
Message-ID: <203231e0-1d9b-ecca-bc04-d5133fb2ec87@baylibre.com>
References: <20170731113832.26490-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170731113832.26490-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/31/2017 01:38 PM, Jerome Brunet wrote:
> In previous cycles, concerns have been raised about the way clocks are
> exposed for the meson clock controller, only when validated and required
> in DT.
> 
> Instead, this patchset expose all the known clocks which may be needed in
> DT later on. The clocks left out are internal clocks which should never be
> used directly in DT. These are mostly internal muxes and dividers of
> composite clocks.
> 
> While this should reduce the patch flow on the related header files, It
> won't stop it completely. There are still many clocks we don't know about
> yet. We tend discover a few in every cycle.
> 
> This patchset depends on these fixes [0] to avoid issues when adding new
> clk ids.
> 
> [0]: https://lkml.kernel.org/r/20170727161755.10393-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
> 
> Jerome Brunet (2):
>   clk: meson8b: expose every clock in the bindings
>   clk: meson-gxbb: expose almost every clock in the bindings
> 
>  drivers/clk/meson/gxbb.h                 | 117 ++-----------------------------
>  drivers/clk/meson/meson8b.h              | 103 ++-------------------------
>  include/dt-bindings/clock/gxbb-clkc.h    |  60 ++++++++++++++++
>  include/dt-bindings/clock/meson8b-clkc.h |  70 ++++++++++++++++++
>  4 files changed, 141 insertions(+), 209 deletions(-)
> 

Acked-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
