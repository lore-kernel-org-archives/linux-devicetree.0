From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 2/2] gpio: Add Cadence GPIO driver
Date: Tue, 18 Dec 2018 13:50:48 +0100
Message-ID: <CAMpxmJUnfnHmopyOfHRZrN1KoqZx_Bsra1BTiGud6UVmzz1ryA@mail.gmail.com>
References: <20181217153652.20056-1-jank@cadence.com> <20181217153652.20056-3-jank@cadence.com>
 <CAMpxmJXrjyK3m4JwgkxwkHjSj-ugb7UzwNrYcBwYjWwj+JBNxw@mail.gmail.com> <CACRpkdYq5Eg2DrwdED-yTZ4kMoCxew+0rdU-b4zuinOf7BEr6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYq5Eg2DrwdED-yTZ4kMoCxew+0rdU-b4zuinOf7BEr6Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jan Kotas <jank@cadence.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio <linux-gpio@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

pon., 17 gru 2018 o 23:22 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> On Mon, Dec 17, 2018 at 4:51 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
>
> > The driver looks good but is there any particular reason not to use
> > regmap for register IO?
>
> I thought we only use regmap for MMIO when the register range is
> shared (as in a system controller) so that some registers are for this,
> some register or even bits in a register for some other driver, so they
> need the spinlock in the regmap to protect the register range.
>

This is what syscon is for. Regmap simply abstracts any register IO.
For instance: there's no locking in this driver. Are we sure it's not
needed? Regmap provides internal locking for you in the form of a
mutex or spinlock.

Also: it looks like the interrupts here are quite simple with a single
bit per interrupt in the status register and the same layout in the
mask register - it could probably profit from using the
regmap_irq_chip and not bother with reimplementing irq_chip callbacks.

> It is also nice for shadowing/caching of register contents I guess,
> wat does this driver get from regmap MMIO?
>

Code shrinkage IMO.

Note that I'm not blocking this from being merged - I just think that
using modern frameworks is always a good idea.

Best regards,
Bartosz Golaszewski

> Yours,
> Linus Walleij
