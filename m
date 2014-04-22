From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND 1/5] pinctrl: allows not to define the
 get_group_pins operation
Date: Tue, 22 Apr 2014 14:48:04 +0200
Message-ID: <CACRpkdZrLZZwpVCzo_Ms2=7SqUoryt-6OtF7ePhGp4kwJgDgXQ@mail.gmail.com>
References: <1397135274-10764-1-git-send-email-antoine.tenart@free-electrons.com>
	<1397135274-10764-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397135274-10764-2-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 10, 2014 at 3:07 PM, Antoine T=C3=A9nart
<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> When using a group only pinctrl driver, which does not have any
> information on the pins it is useless to define a get_group_pins
> always returning an empty list of pins.
>
> When not using get_group_pin[1], a driver must implement it so
> pins =3D NULL and num_pins =3D 0. This patch makes it the default
> behaviour if not defined in the pinctrl driver when used in
> pinmux enable and disable funtions and in pinctrl_groups_show.
>
> It also adds a check in pinctrl_get_group_pins and return -EINVAL if
> not defined. This function is called in the gpiolib when adding when
> pingroup range. It cannot be used if no group is defined, so this sea=
ms
> reasonable.
>
> [1] get_group_pin(struct pinctrl_dev *pctldev,
>                   unsigned selector,
>                   const unsigned **pins,
>                   unsigned *num_pins);
>
> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>

OK makes perfect sense.

Patch applied.

Can you please check the Documentation/pinctrl.txt to see
if anything needs to be updated due to this?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
