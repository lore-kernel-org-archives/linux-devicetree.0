From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 10/10] ARM: dts: sun8i: Add board dts
 file for Banana Pi M2 Ultra
Date: Thu, 11 May 2017 15:44:54 +0200
Message-ID: <CACRpkdYg7jLymwi14BMJ3p6oeOwjt+PLzQFC1S8e01v9dtw3=w@mail.gmail.com>
References: <20170504135006.16483-1-icenowy@aosc.io> <20170504135006.16483-11-icenowy@aosc.io>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDE6RCFOWIARBWGV2HEAKGQEDMQQSMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170504135006.16483-11-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 4, 2017 at 3:50 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:

> From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>
> The Banana Pi M2 Ultra is an SBC based on the Allwinner R40 SoC. The
> form factor and position of various connectors, leds and buttons is
> similar to the Banana Pi M1+, Banana Pi M3, and is exactly the same
> as the latest Banana Pi M64.
>
> It features:
>
>   - X-Powers AXP221s PMIC connected to i2c0
>   - 2 GB DDR3 DRAM
>   - 8 GB eMMC
>   - micro SD card slot
>   - DC power jack
>   - HDMI output
>   - MIPI DSI connector
>   - 2x USB 2.0 hosts
>   - 1x USB 2.0 OTG
>   - gigabit ethernet with Realtek RTL8211E transceiver
>   - WiFi/Bluetooth with AP6212 chip, with external antenna connector
>   - SATA and power connectors for native SATA support
>   - camera sensor connector
>   - consumer IR receiver
>   - audio out headphone jack
>   - onboard microphone
>   - red, green, and blue LEDs
>   - debug UART pins
>   - Li-Po battery connector
>   - Raspberry Pi B+ compatible GPIO header
>   - power, reset, and boot control buttons
>
> This patch adds a dts file that enables debug UART and MMC support.
>
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>

Eric put a lot of time and effort into naming the GPIO lines on the
other Pi board.

So please follow the good example and name the GPIO lines on this board
like in the other rpi boards, should be something like:

&pio {
    gpio-line-names = "...", "...";
};

This is very helpful for users.

Yours,
Linus Walleij
