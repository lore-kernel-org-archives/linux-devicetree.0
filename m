From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: sun9i: cubieboard4: Enable misc. peripherals
Date: Thu, 10 Dec 2015 21:36:28 +0800
Message-ID: <1449754591-3999-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZH7UWZQKGQECH76HCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Here are some patches enabling some peripherals on the Cubieboard4.

Patch 1 enables the LEDs.

Patch 2 enables the IR receiver.

Patch 3 enables the RSB controller.


Regards
ChenYu

Chen-Yu Tsai (3):
  ARM: dts: sun9i: cubieboard4: Enable LEDs
  ARM: dts: sun9i: cubieboard4: Enable consumer IR receiver
  ARM: dts: sun9i: cubieboard4: Enable Reduced Serial Bus controller

 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.6.2
