From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/6] pinctrl: Support stopping deferred probe after initcalls
Date: Mon, 2 Jul 2018 15:23:08 +0200
Message-ID: <CACRpkdZU50xG-seDq8pZ0QLBXzn_Ygs-s1rJXGqzpfDJGbjDtA@mail.gmail.com>
References: <20180628204344.13973-1-robh@kernel.org> <20180628204344.13973-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628204344.13973-4-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Alexander Graf <agraf@suse.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, boot-architecture@lists.linaro.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 28, 2018 at 10:43 PM Rob Herring <robh@kernel.org> wrote:

> Pinctrl drivers are a common dependency which can prevent a system
> booting even if the default or bootloader configured settings can work.
> If a pinctrl node in DT indicates that the default pin setup can be used
> with the 'pinctrl-use-default' property, then only defer probe until
> initcalls are done. If the deferred probe timeout is enabled or loadable
> modules are disabled, then we'll stop deferring probe regardless of the
> DT property. This gives platforms the option to work without their
> pinctrl driver being enabled.
>
> Dropped the pinctrl specific deferring probe message as the driver core
> can print deferred probe related messages if needed.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v3:
> - Drop pinctrl deferred probe msg in favor of driver core messages
> - Move the handling of "pinctrl-use-default" option out of driver core
> - Stop deferring probe if modules are not enabled.
>
> Linus, I reworked this a bit, so didn't add your ack.

Looks even better now:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
