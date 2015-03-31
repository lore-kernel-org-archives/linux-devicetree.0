From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH V2 3/3] pinctrl: Add Pistachio SoC pin control driver
Date: Tue, 31 Mar 2015 09:56:38 -0700
Message-ID: <CAL1qeaG70_42p8r9ogHxMv2h-yx_TENYV_gZbX1wQMhqSaiFpg@mail.gmail.com>
References: <1427757416-14491-1-git-send-email-abrestic@chromium.org>
	<1427757416-14491-4-git-send-email-abrestic@chromium.org>
	<1427789415.2408.45.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1427789415.2408.45.camel@x220>
Sender: linux-gpio-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Paul,

On Tue, Mar 31, 2015 at 1:10 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
> The patch adds a mismatch between the Kconfig symbol (a bool) and the
> code (which suggests that a modular build is also possible).

Nearly all of the pinctrl drivers (with the exception of qcom and
intel) are like this.  They use a bool Kconfig symbol but they are
written so that they could be built as a module in the future.

Thanks,
Andrew
