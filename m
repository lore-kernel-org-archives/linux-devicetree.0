From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH V2 3/3] pinctrl: Add Pistachio SoC pin control driver
Date: Tue, 31 Mar 2015 20:20:15 +0200
Message-ID: <1427826015.2408.63.camel@x220>
References: <1427757416-14491-1-git-send-email-abrestic@chromium.org>
	 <1427757416-14491-4-git-send-email-abrestic@chromium.org>
	 <1427789415.2408.45.camel@x220>
	 <CAL1qeaG70_42p8r9ogHxMv2h-yx_TENYV_gZbX1wQMhqSaiFpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL1qeaG70_42p8r9ogHxMv2h-yx_TENYV_gZbX1wQMhqSaiFpg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Tue, 2015-03-31 at 09:56 -0700, Andrew Bresticker wrote:
> On Tue, Mar 31, 2015 at 1:10 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
> > The patch adds a mismatch between the Kconfig symbol (a bool) and the
> > code (which suggests that a modular build is also possible).
> 
> Nearly all of the pinctrl drivers (with the exception of qcom and
> intel) are like this.

Could be, I didn't check. Perhaps copy and pasting is to blame. (Copy
and pasting appears to me a sensible way to start writing a new driver).

> They use a bool Kconfig symbol but they are
> written so that they could be built as a module in the future.

Did I miss a comment or a remark in the commit explanation that explains
this? Anyhow, if that modular future is not expected to be the near
future, can you perhaps carry these lines in a branch called, say
pinctrl-modular?

Thanks,


Paul Bolle
