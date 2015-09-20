From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] ARM: dts: sunxi: Add backlight node to q8 tablets
Date: Sun, 20 Sep 2015 08:30:46 -0400
Message-ID: <1442752251-20744-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBA6O7KXQKGQE4H6ROBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime, Chen-Yu,

Here is a slightly updated version of Chen-Yu's backlight
patches, also adding support for the backlight found on A13 
based q8 tablets.

This series is based on mripard/sunxi/for-next with the following
patches on top (Maxime you've send mails indicating that you've merged
these alread, but you seem to have not pushed them yet) :

ARM: dts: sun5i: Add sun5i-q8-common.dtsi
ARM: dts: sun5i: Add dts file for q8 formfactor a13 based tablets
ARM: dts: sun8i: Add PWM controller node for A23/A33
ARM: dts: sun8i: Add PWM channel 0 pinmux setting for A23/A33

As discussed I've changed the "ARM: dts: sunxi: Enable PWM controller
on Q8 format tablets" patch to enable the pwm node in sunxi-q8-common.h
rather then in sunx8i-q8-common.h, other then that the 2 patches from
Chen-Yu are unchanged.

Regards,

Hans
