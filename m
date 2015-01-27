From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/4] ARM: shmobile: emev2-kzm9d: Add PFC information
 for uart1
Date: Tue, 27 Jan 2015 08:55:20 +0100
Message-ID: <CACRpkda4SBof0EaZVWtEYaeb6j_BGAVj39kje+mBz90eB3qAwQ@mail.gmail.com>
References: <1421583604-27256-1-git-send-email-niso@kth.se>
	<1421583604-27256-5-git-send-email-niso@kth.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1421583604-27256-5-git-send-email-niso@kth.se>
Sender: linux-sh-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niso@kth.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 18, 2015 at 1:20 PM, Niklas S=C3=B6derlund <niso@kth.se> wr=
ote:

> Configure the pinmux on kzm9d to use the serial connector for uart1.
>
> Signed-off-by: Niklas S=C3=B6derlund <niso@kth.se>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

> +&pfc {
> +       uart1_pins: uart@e1030000 {
> +               renesas,groups =3D "uart1_ctrl", "uart1_data";
> +               renesas,function =3D "uart1";
> +       };
> +};

Would be nice if the PFC driver could be augmented to also accept the
now standard bindings "groups" and "function" simply :) we're adding pa=
rse
functions for those to the core.

Yours,
Linus Walleij
