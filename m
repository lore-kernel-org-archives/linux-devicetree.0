From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Tue, 10 Sep 2013 13:52:24 -0600
Message-ID: <522F7878.30800@wwwdotorg.org>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de> <52279524.8090006@wwwdotorg.org> <20130909161924.GT29403@sirena.org.uk> <2052193.CMUEUJFRgS@lem-wkst-02> <522F2521.4090806@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <522F2521.4090806@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lars Poeschel <poeschel@lemonage.de>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-Id: devicetree@vger.kernel.org

On 09/10/2013 07:56 AM, Javier Martinez Canillas wrote:
...
> The only thing that this patch tries to solve is when a driver expect to request
> a IRQ and it doesn't care if is a real IRQ line from an interrupt controller or
> a GPIO pin mapped as an IRQ.

That can be solved in the interrupt chip driver. The fact the previous
attempt didn't work doesn't mean that it's impossible.

> With board files we used to explicitly do the GPIO setup
> (gpio_{request,direction_input}) but with DT these board files are gone and we
> need a way to setup a GPIO implicitly when is mapped as an IRQ.

Well, that's just an example of hacking around something in a board file
that should have been fixed in the GPIO/IRQ controller.

> That's the only use case that this patch covers.
...
> Also, it would be great if we can find a temporary solution so we can finally
> have ethernet working with DT on most OMAP2+ boards. Since I expect that doing
> the mentioned change on gpiolib would take at least a couple of kernel releases.

Really? I thought this patch was error-checking to make sure that
different drivers didn't request a GPIO and an IRQ that are actually the
same signal. This patch shouldn't affect any functionality except in
cases where there's a bug in the DT (incorrect GPIO/IRQ passed to some
driver).
