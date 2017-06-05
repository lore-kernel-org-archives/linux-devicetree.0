From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 0/2] ARM/arm64: sunxi: convert CCU raw
 numbers to macros
Date: Mon,  5 Jun 2017 17:00:31 +0800
Message-ID: <20170605090033.31663-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBM532TEQKGQEWW3A63A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

This is a fixed version of my "convert CCU raw numbers to macros" series.
Please take these instead.

Changes since v1:

  - Fixed incorrect macro name for IR reset control phandle

  - Fixed header filename typo

These are some clean up patches for 4.12. They convert raw number
references for the CCU and R_CCU nodes, from when the CCU/R_CCU stuff
was first added, to the defined macros in the device tree header files.

These affect the A64 and H3/H5.

These are based on our sunxi/fixes-for-4.12 branch. Once these are merged,
I think it's time to send off pull requests for our fixes branches.

ChenYu

Chen-Yu Tsai (2):
  ARM: sunxi: h3-h5: Convert R_CCU raw numbers to macros
  arm64: allwinner: a64: Convert CCU raw number references to macros

 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  8 +++---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 35 ++++++++++++++-------------
 2 files changed, 23 insertions(+), 20 deletions(-)

-- 
2.11.0
