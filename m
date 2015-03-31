From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH V2 0/3] pinctrl: Support for IMG Pistachio
Date: Tue, 31 Mar 2015 16:00:34 +0200
Message-ID: <20150331140034.GE28951@linux-mips.org>
References: <1427757416-14491-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427757416-14491-1-git-send-email-abrestic@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 30, 2015 at 04:16:53PM -0700, Andrew Bresticker wrote:

> This series adds support for the system pin and GPIO controller on the IMG
> Pistachio SoC.  Pistachio's system pin controller manages 99 pins, 90 of
> which are MFIOs which can be muxed between multiple functions or used
> as GPIOs.  The GPIO control for the 90 MFIOs is broken up into banks
> of 16.  Pistachio also has a second pin controller, the RPU pin controller,
> which will be supported by a future patchset through an extension to this
> driver.
> 
> Test on an IMG Pistachio BuB.  Based on mips-for-linux-next which inluces my
> series adding Pistachio platform support [1].  A branch with this series is
> available at [2].

Does this mean you want me to funnel this through the MIPS tree?  If so,
could I have an Ack from the maintainers?

Thanks,

  Ralf
