From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: Support for IMG Pistachio
Date: Fri, 6 Mar 2015 12:29:55 +0100
Message-ID: <CACRpkdbCOHNPs5Y58h--X6pOVvYyxTrgcFhFyk5dWE+JLo=rhg@mail.gmail.com>
References: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 24, 2015 at 3:15 AM, Andrew Bresticker
<abrestic@chromium.org> wrote:

>  I'd like this to go through the MIPS tree with
> Linus'/Alex's ACKs if possible.

Why? It will only help creating merge conflicts.
There seem to be no compile-related dependencies, just Kconfig
symbols, so patches using this can go in orthogonally.

Yours,
Linus Walleij
