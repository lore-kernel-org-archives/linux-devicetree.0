From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/2] ARM: sun8i: a83t: Enable EMAC Ethernet
Date: Fri,  8 Dec 2017 15:31:55 +0800
Message-ID: <20171208073157.14599-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB477VDIQKGQERBW56CA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This is my spin on enabling Ethernet on the A83T. It consists of
Corentin's dtsi patch plus my board level patch. There's nothing
really special about them.

ChenYu

Chen-Yu Tsai (1):
  ARM: dts: sun8i: a83t: Enable Ethernet on two boards

Corentin LABBE (1):
  ARM: dts: sun8i: a83t: add dwmac-sun8i device node

 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts     | 19 ++++++++++++++
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts | 17 ++++++++++++
 arch/arm/boot/dts/sun8i-a83t.dtsi                | 33 ++++++++++++++++++++++++
 3 files changed, 69 insertions(+)

-- 
2.15.0
