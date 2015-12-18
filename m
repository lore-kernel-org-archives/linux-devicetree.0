From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] ARM: dts: sun7i: Devicetree improvements
 for the Wexler TAB7200
Date: Fri, 18 Dec 2015 11:49:51 +0300
Message-ID: <1450428591-5597-1-git-send-email-mamlinav@gmail.com>
Reply-To: mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCENVD7YAEIM7EOPWMCRUBFJNSRJM-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,
This is a batch of patches with devicetree improvements for Wexler TAB7200 tablet.

The first one add Goodix GT911 touchscreen node to dts.
The second add PWM node, which need for LCD backlight.
The third add LCD backlight support via PWM.
The last add PA gpio pin for controlling external amplifiers.

The touchscreen patch depends on "Goodix touchscreen enhancements" [1]
and "Input: goodix - add axis swapping and axis inversion support" [2]
patchsets. Both merged into Dmitry Torokhov's input tree (goodix branch)

[1] https://lkml.org/lkml/2015/11/19/241
[2] https://lkml.org/lkml/2015/11/21/44

Aleksei Mamlin (4):
  ARM: dts: sun7i: Enable touchscreen on Wexler TAB7200 tablet
  ARM: dts: sun7i: Enable PWM controller on Wexler TAB7200 tablet
  ARM: dts: sun7i: Add backlight node to Wexler TAB7200 tablet
  ARM: dts: sun7i: Add PA gpio pin to Wexler TAB7200 tablet

 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

-- 
2.4.10
