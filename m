From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: [PATCH] Input: Add driver for Microchip's CAP1106
Date: Fri, 11 Jul 2014 11:47:54 +0200
Message-ID: <CANq1E4Snpdd_8d8e1gSKjKjJb9KsxjEGDUToKfn8AbyLSOUa6g@mail.gmail.com>
References: <1405064550-12222-1-git-send-email-zonque@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1405064550-12222-1-git-send-email-zonque@gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Daniel Mack <zonque@gmail.com>
Cc: dtor@mail.ru, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi

On Fri, Jul 11, 2014 at 9:42 AM, Daniel Mack <zonque@gmail.com> wrote:
> This patch adds a driver for Microchips CAP1106, an I2C driven, 6-channel
> capacitive touch sensor.
>
> For now, only the capacitive buttons are supported, and no specific
> settings that can be tweaked for individual channels, except for the
> device-wide sensitivity gain. The defaults seem to work just fine out of
> the box, so I'll leave configurable parameters for someone who's in need
> of them and who can actually measure the impact. All registers are
> prepared, however. Many of them are just not used for now.
>
> The implementation does not make any attempt to be compatible to platform
> data driven boards, but fully depends on CONFIG_OF.
>
> Power management functions are also left for volounteers with the ability
> to actually test them.
>
> Signed-off-by: Daniel Mack <zonque@gmail.com>
> ---
>  .../devicetree/bindings/input/cap1106.txt          |  63 ++++
>  drivers/input/keyboard/Kconfig                     |  10 +
>  drivers/input/keyboard/Makefile                    |   1 +
>  drivers/input/keyboard/cap1106.c                   | 376 +++++++++++++++++++++
>  4 files changed, 450 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/cap1106.txt
>  create mode 100644 drivers/input/keyboard/cap1106.c
>
> diff --git a/Documentation/devicetree/bindings/input/cap1106.txt b/Documentation/devicetree/bindings/input/cap1106.txt
> new file mode 100644
> index 0000000..57f5af3
...
> +       spin_lock_irqsave(&priv->lock, flags);
> +       disable_irq(priv->irq);
> +       cancel_work_sync(&priv->work);
> +       spin_unlock_irqrestore(&priv->lock, flags);

Btw., cancel_work_sync() has a might_sleep() annotation, so you really
cannot call it while holding spinlocks (see start_flush_work() in
workqueue.c).

Cheers
David
