From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 bus+gpio 5/5] dt-bindings: gpio: Document GPIOs via
 Moxtet bus
Date: Fri, 1 Mar 2019 15:36:09 +0100
Message-ID: <CACRpkdYpjjpVNUXRgT=XY758FGtDYow2fvwpah37T_GjTvLauQ@mail.gmail.com>
References: <20190301035852.26780-1-marek.behun@nic.cz> <20190301035852.26780-6-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301035852.26780-6-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 1, 2019 at 4:59 AM Marek Beh=C3=BAn <marek.behun@nic.cz> wrote:

> This patch adds documentation of the device tree bindings for GPIOs
> on the devices connected via Moxtet bus.
>
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +               compatible =3D "cznic,moxtet-gpio";

Is cznic registered in
Documentation/devicetree/bindings/vendor-prefixes.txt?

Yours,
Linus Walleij
