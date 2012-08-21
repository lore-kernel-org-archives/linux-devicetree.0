From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] serial: pl011: honour serial aliases in device tree
Date: Wed, 22 Aug 2012 00:04:23 +0200
Message-ID: <CACRpkdbh-PhFKU54FCti-7RwQLJ8Q0d9_XLPEk5vNemjDOa-wQ@mail.gmail.com>
References: <1345564094-16565-1-git-send-email-matthew.leach@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <1345564094-16565-1-git-send-email-matthew.leach@arm.com>
Sender: linux-serial-owner@vger.kernel.org
To: Matthew Leach <matthew.leach@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, will.deacon@arm.com, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, robherring2@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 21, 2012 at 5:48 PM, Matthew Leach <matthew.leach@arm.com> wrote:

> If the order of UART nodes is changed in the device tree, then tty dev
> devices are attached to different serial ports causing the console to
> be directed to a different physical serial port. The "serial" aliases
> in the device tree should prevent this.
>
> This patch ensures that the UART driver creates tty devices that
> honour these aliases if a device tree is present.
>
> Acked-by: Rob Herring <rob.herring@calxeda.com>
> Signed-off-by: Matthew Leach <matthew.leach@arm.com>
> ---
> v2: use IS_ENABLED instead of ifdefs

Looks good to me.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
