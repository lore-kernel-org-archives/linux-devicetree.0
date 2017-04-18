From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/3] ARM: sun8i: a83t: device tree cleanup
Date: Tue, 18 Apr 2017 12:22:02 +0800
Message-ID: <20170418042205.27894-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBP4K27DQKGQE5EJMCAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Here are a few patches cleaning up sun8i-a83t.dtsi. These get rid
of known warnings and deprecated features. I'm sending these now
before I send patches that add new stuff.

Regards
ChenYu

Chen-Yu Tsai (3):
  ARM: sun8i: a83t: Drop skeleton.dtsi
  ARM: sun8i: a83t: Drop leading zeroes from device node addresses
  ARM: sun8i: a83t: Rename pinmux setting names

 .../boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts  |  2 +-
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts   |  2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  | 36 ++++++++++++++--------
 3 files changed, 25 insertions(+), 15 deletions(-)

-- 
2.11.0
