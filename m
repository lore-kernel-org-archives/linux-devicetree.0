From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH V2 3/3] pinctrl: Add Pistachio SoC pin control driver
Date: Tue, 31 Mar 2015 20:55:08 +0200
Message-ID: <1427828108.2408.73.camel@x220>
References: <1427757416-14491-1-git-send-email-abrestic@chromium.org>
	 <1427757416-14491-4-git-send-email-abrestic@chromium.org>
	 <1427789415.2408.45.camel@x220>
	 <CAL1qeaG70_42p8r9ogHxMv2h-yx_TENYV_gZbX1wQMhqSaiFpg@mail.gmail.com>
	 <1427826015.2408.63.camel@x220>
	 <CAL1qeaHg2oLbnxCmk_TaxRMYA6vM8cfgUeLk=i7Q5b1CJfS9LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL1qeaHg2oLbnxCmk_TaxRMYA6vM8cfgUeLk=i7Q5b1CJfS9LQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Tue, 2015-03-31 at 11:37 -0700, Andrew Bresticker wrote:
> I have no immediate plans to make this a module, but since the changes
> to make it buildable as a module have no overhead (at least I think
> they don't!) I'd prefer to leave them in for consistency and to
> eliminate any need for these changes in the future.

The people reading the code or reviewing the patch might wonder, just
like I did, about the mismatch between the code and the Kconfig symbol.

Dead code - even if it's easily dealt with during the build - shouldn't
be added without a clear benefit. And I don't think consistency or doing
now what might be done in the future bring enough benefits.

> I'll leave it up to LinusW though.

Right, it's Linus decision.

Thanks,


Paul Bolle

