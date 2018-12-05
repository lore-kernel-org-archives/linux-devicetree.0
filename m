From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/3] ARM: sun8i: a33: Audio codec improvements
Date: Wed,  5 Dec 2018 18:11:49 +0800
Message-ID: <20181205101152.22983-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB3GIT3QAKGQEFO2U4EI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series improves audio support on the A33. Like other Allwinner
SoCs, the A33 requires the use of a sigma-delta modulation fractional-N
PLL to generate the correct clock used for audio playback. Otherwise the
pitch would be slightly off.

Patch 1 enables sigma-delta modulation for the audio PLL on the A33.

Patch 2 is only slightly related. It sets the CLK_SET_RATE_PARENT flag
for all audio-related module clocks

Patch 3 lowers the audio codec's oversampling rate, so that it can
play back audio sampled at beyond 48 KHz.

This is the same as what has recently been done for the A64, which
shares the same audio codec hardware design.

However, on the A33 it seems the PLL doesn't always immediately lock on
to the new clock frequency when there is a rate change. Also since the
codec is only put in standby instead of turned off, runtime PM never
kicks in, and the audio related clocks never get turned off. I'm still
looking into this.

On an unrelated note, if you get pops when playing back audio on sunxi,
it might be related to cpufreq. Try setting the governor to performance
and see if that removes the pops.

Regards
ChenYu


Chen-Yu Tsai (3):
  clk: sunxi-ng: a33: Use sigma-delta modulation for audio PLL
  clk: sunxi-ng: a33: Set CLK_SET_RATE_PARENT for all audio module
    clocks
  ARM: dts: sun8i: a33: Drop audio codec oversampling rate to 128 fs

 arch/arm/boot/dts/sun8i-a33.dtsi     |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 43 +++++++++++++++++-----------
 2 files changed, 28 insertions(+), 17 deletions(-)

-- 
2.20.0.rc1
