From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Tue, 12 Nov 2013 11:29:36 +0100
Message-ID: <CACRpkdZpwwoM3h5_rXOwbN7cC72ruvTio6Z1hzMhLCDzh5VeKQ@mail.gmail.com>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de>
	<1521079.WSLhhfqBXl@lem-wkst-02>
	<52261BF0.4090106@wwwdotorg.org>
	<3144247.j2q6H0KWZx@lem-wkst-02>
	<52279524.8090006@wwwdotorg.org>
	<20130909161924.GT29403@sirena.org.uk>
	<528121D5.40403@keymile.com>
	<528127B2.80109@wwwdotorg.org>
	<52812D3A.2070107@keymile.com>
	<52813100.1060500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <52813100.1060500@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Gerlando Falauto <gerlando.falauto@keymile.com>, Mark Brown <broonie@kernel.org>, Lars Poeschel <poeschel@lemonage.de>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon
List-Id: devicetree@vger.kernel.org

On Mon, Nov 11, 2013 at 8:33 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 11/11/2013 12:17 PM, Gerlando Falauto wrote:

>> Thanks for your answer. So it should be the parent driver to proactively
>> configure the GPIO as input, active high etc..., when an IRQ for its
>> GPIOs is requested, right?
>
> That was the conclusion of this thread, or a similar thread, yes.

Yepps second that.

And we added an API to that you can flag a GPIO as being
in use by an IRQ using gpio_lock_as_irq() from your
irq_chip callbacks.

Yours,
Linus Walleij
