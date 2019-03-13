From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx7s-warp: PMIC swbst boot-on/always-on
Date: Wed, 13 Mar 2019 00:11:55 -0300
Message-ID: <CAOMZO5DU9t8ajjOiN-z7bPEtOsB=-D=4yFbUJGJgFqwO7d=B=w@mail.gmail.com>
References: <1551565949-13843-1-git-send-email-pjtexier@koncepto.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551565949-13843-1-git-send-email-pjtexier@koncepto.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Jean Texier <pjtexier@koncepto.io>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 2, 2019 at 7:33 PM Pierre-Jean Texier <pjtexier@koncepto.io> wrote:
>
> PMIC swbst regulator is used for the MikroBUS socket (pin +5V).
>
> We have to set the regulator to "boot-on" and "always-on"
> to output a voltage of 5V on this socket.
>
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
