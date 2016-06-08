From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 27/32] gpio: Add support for the FXL6408 GPIO expander.
Date: Wed, 8 Jun 2016 11:10:58 +0200
Message-ID: <CACRpkdax3AmnprT48zL7J92ddMvLYeRXi9OrQK_JrBT8_zZQoA@mail.gmail.com>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com> <1464817421-8519-28-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1464817421-8519-28-git-send-email-kraxel@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Alexandre Courbot <gnurou@gmail.com>, "open list:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.ker>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 1, 2016 at 11:43 PM, Gerd Hoffmann <kraxel@redhat.com> wrote:

> +#define FXL6408_OUTPUT                 0x05
> +/* Bits here make the output High-Z, instead of the OUTPUT value. */
> +#define FXL6408_OUTPUT_HIGH_Z          0x07
(...)
> +       /* Disable High-Z of outputs, so that our OUTPUT updates
> +        * actually take effect.
> +        */
> +       i2c_smbus_write_byte_data(client, FXL6408_OUTPUT_HIGH_Z, 0);

High-Z is probably the same as open drain right? And if not open drain,
it is push-pull.

So you want to implement .set_single_ended() for configuring the lines in
"high-z", i.e. open drain output mode.

Yours,
Linus Walleij
