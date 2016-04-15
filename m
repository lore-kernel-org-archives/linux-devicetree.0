From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] pinctrl: iproc: Allow PINCONF to be disabled completely
Date: Fri, 15 Apr 2016 10:24:06 +0200
Message-ID: <CACRpkdYmGUxQu5Sagw+J70wpFc+3Smg3V8mKxF2OFOhbMATYDw@mail.gmail.com>
References: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
	<1460506523-6249-5-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1460506523-6249-5-git-send-email-ray.jui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 13, 2016 at 2:15 AM, Ray Jui <ray.jui@broadcom.com> wrote:

> In some of the future iProc based SoCs, pinconf is handled by another
> block and the iProc GPIO controller is solely used as a GPIO controller.
> This patch adds support of a new compatible string "brcm,iproc-gpio-only",
> that is introduced to handle this case, where pinconf functions in this
> driver are completely disabled
>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Reviewed-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
> Reviewed-by: Jon Mason <jon.mason@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>

If this was entirely true, then the driver should end up only executing
[devm_]gpiochip_add_data() but that does not seem to be the case.

You are still registering a pin controller, right? Just disabling some of
the pin config options. The pin multiplexing is still there, right?
Then it is not "solely a GPIO controller". Not at all.

This patch set needs some elaboration I think.

Yours,
Linus Walleij
