From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 3/3] pinctrl: Add Pistachio SoC pin control driver
Date: Tue, 7 Apr 2015 16:13:16 +0200
Message-ID: <CACRpkdYfN_AV47G8cni=gApcwf8nx_fUrreGZp7ASRsU5PM1bA@mail.gmail.com>
References: <1427757416-14491-1-git-send-email-abrestic@chromium.org>
	<1427757416-14491-4-git-send-email-abrestic@chromium.org>
	<1427789415.2408.45.camel@x220>
	<CAL1qeaG70_42p8r9ogHxMv2h-yx_TENYV_gZbX1wQMhqSaiFpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL1qeaG70_42p8r9ogHxMv2h-yx_TENYV_gZbX1wQMhqSaiFpg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Paul Bolle <pebolle@tiscali.nl>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 31, 2015 at 6:56 PM, Andrew Bresticker
<abrestic@chromium.org> wrote:
> Hi Paul,
>
> On Tue, Mar 31, 2015 at 1:10 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
>> The patch adds a mismatch between the Kconfig symbol (a bool) and the
>> code (which suggests that a modular build is also possible).
>
> Nearly all of the pinctrl drivers (with the exception of qcom and
> intel) are like this.  They use a bool Kconfig symbol but they are
> written so that they could be built as a module in the future.

There are many aspects to this and I have no strong opinion,
it doesn't really disturb me either way as both are familiar
ways of writing drivers be it modular or not.

I think it's more disturbing that bool drivers have .remove()
functions, and as pointed out elsewhere this is because the
module can still be bound/unbound from sysfs even if compiled
into the kernel and then that code path will actually be executed.

And as I remarked again, elsewhere, that can be overcome
by adding the .suppress_bind_attrs = true to struct device_driver
inside the platform driver.

So if going through all the hazzle to remove anything compiled-out
for non-modules, also take the step above removing .remove()
calls and setting .suppress_bind_attrs.

I will maybe do so sometime myself for any bool drivers...

Yours,
Linus Walleij
