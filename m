From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: meson: add device tree bindings documentation
Date: Tue, 28 Oct 2014 15:12:37 +0100
Message-ID: <CACRpkdbhLf5pNXZJ_neSrL4XgqH7YpDXUPWqRJkdaD4xw88feg@mail.gmail.com>
References: <1412717576-19737-1-git-send-email-b.galvani@gmail.com>
	<1412717576-19737-3-git-send-email-b.galvani@gmail.com>
	<CACRpkdb4WLX+FeEAuh=YZteaNPzq0WMN0PTTpHnMWmwTts6=Bg@mail.gmail.com>
	<20141026182541.GA23020@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141026182541.GA23020@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Carlo Caione <carlo@caione.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jerry Cao <jerry.cao@amlogic.com>, Victor Wan <victor.wan@amlogic.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 26, 2014 at 7:25 PM, Beniamino Galvani <b.galvani@gmail.com> wrote:
> On Fri, Oct 24, 2014 at 01:53:28PM +0200, Linus Walleij wrote:
>>
>> I think it's better to use the compatible string to indicate different
>> versions of the hardware and then have just have one big
>> regs to cover all registers.
>
> The problem here is that the register ranges are not contiguous and
> the holes in between are used by other devices, so I can't use a
> single range.

OK I get it.

>> So for per-pin configuration, "function" and "pins" would be
>> apropriate.
>
> I will use "groups" instead of "pins" for the pinmux configuration.

Excellent!

Yours,
Linus Walleij
