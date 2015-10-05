From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun4i: Allow to use the PH6
 pin for GPIO on pcDuino1/2
Date: Mon, 5 Oct 2015 09:55:28 +0800
Message-ID: <CAGb2v65n6ymon+sEASa726sam0KLOvMPbxTxCqvV4j0ust2PCA@mail.gmail.com>
References: <1443985128-23137-1-git-send-email-siarhei.siamashka@gmail.com> <1443985128-23137-2-git-send-email-siarhei.siamashka@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBJ5RY6YAKGQEOYQPARY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1443985128-23137-2-git-send-email-siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 5, 2015 at 2:58 AM, Siarhei Siamashka
<siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The pcDuino1 board does not use any power switches at all for its
> two USB host ports and the VBUS pins are always connected to 5V.
>
> The pcDuino2 board uses the RT9701GB power switch for its single
> USB host port, but the USB_EN pin (PD2) is pulled up with a 10K
> resistor. So that the USB power is still enabled by default even
> if nobody bothers to configure the PD2 pin or runs the pcDuino1
> firmware.

Seems like it would be better if you had a regulator controlled
by PD2. At least can shut down VBUS power when it wants to?

ChenYu

> The current dts file unnecessarily meddles with the PH3 and PH6
> pins. But the PH6 pin is available on the J11 expansion header
> and may have a better use for other purposes. This patch fixes
> the problem and now the PH6 pin can be used with the GPIO sysfs
> interface. Tested on a pcDuino2 board and confirmed the voltage
> on the PH6 pin with a multimeter:
>
>     echo 230 > /sys/class/gpio/export
>     echo "out" > /sys/class/gpio/gpio230/direction
>     echo 0 > /sys/class/gpio/gpio230/value
>     echo 1 > /sys/class/gpio/gpio230/value
>
> USB still works as expected too.
>
> Signed-off-by: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun4i-a10-pcduino.dts | 10 ----------
>  1 file changed, 10 deletions(-)
