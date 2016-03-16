From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: sunxi: Fix A33 external interrupts
 not working
Date: Wed, 16 Mar 2016 13:05:49 +0100
Message-ID: <CACRpkdZF-hiwGaHdyORzdj06vqmceZ_5ko1LDYJoCMXC216hTg@mail.gmail.com>
References: <1457808297-12300-1-git-send-email-hdegoede@redhat.com>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDE6RCFOWIARBHMYUW3QKGQEW7RGBQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1457808297-12300-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 12, 2016 at 7:44 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> pinctrl-sun8i-a33.c (and the dts) declare only 2 interrupt banks,
> where as the closely related a23 has 3 banks. This matches with the
> datasheet for the A33 where only interrupt banks B and G are specified
> where as the A23 has banks A, B and G.
>
> However the A33 being the A23 derative it is means that the interrupt
> configure/status io-addresses for the 2 banks it has are not changed
> from the A23, iow they have the same address as if bank A was still
> present. Where as the sunxi pinctrl currently tries to use the A23 bank
> A addresses for bank B, since the pinctrl code does not know about the
> removed bank A.
>
> Add a irq_bank_base parameter and use this where appropriate to take
> the missing bank A into account.
>
> This fixes external interrupts not working on the A33 (tested with
> an i2c touchscreen controller which uses an external interrupt).
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Patch applied, tagged for stable.

Yours,
Linus Walleij
