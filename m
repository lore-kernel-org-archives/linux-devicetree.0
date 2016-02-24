From: Krzysztof Adamski <k@japko.eu>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: Enable ir receiver on
 orangepi pc
Date: Wed, 24 Feb 2016 13:16:41 +0100
Message-ID: <20160224121640.GA25658@box2.japko.eu>
References: <1456268597-13692-1-git-send-email-hdegoede@redhat.com>
 <1456268597-13692-3-git-send-email-hdegoede@redhat.com>
Reply-To: k@japko.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDIL57GUWIARB7V6W23AKGQEK4GAIVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456268597-13692-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 24, 2016 at 12:03:17AM +0100, Hans de Goede wrote:
>Enable the ir receiver found on the orangepi pc board.
>
>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>---
> arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts

I don't think this file is avaiable in mainline. Wouldn't it be better 
to use patch against existing orangepi-plus dts file?

Otherwise I tested this patch and it works fine on my Orangepi PC (some 
data is splitted out when reading /dev/input/event0).

Best regards,
Krzysztof Adamski
