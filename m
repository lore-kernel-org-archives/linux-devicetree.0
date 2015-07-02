From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH 1/2] gpio: dwapb: Use human understandable gpio numbering.
Date: Thu, 2 Jul 2015 16:20:59 +0200
Message-ID: <20150702142058.GA9349@localhost.localdomain>
References: <cover.1435777856.git.rcochran@linutronix.de>
 <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de>
 <267A46E7-C5C5-4696-90CC-D44F4130B3EF@smart-africa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <267A46E7-C5C5-4696-90CC-D44F4130B3EF@smart-africa.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Michael van der Westhuizen <michael@smart-africa.com>
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alan Tull <atull@altera.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dinh Nguyen <dinguyen@altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 02, 2015 at 08:05:26AM +0100, Michael van der Westhuizen wr=
ote:
> Ultimately, the numbering is inconsequential to users in kernel-space=
 when DT is
> in use.  It=E2=80=99s the userland users we=E2=80=99re trying to help=
=2E

Yes.  Lets help the users!
=20
> In my case, I have quite a lot of vendor-supplied code that needs the=
 numbers to
> be stable and backward compatible.  This quickly devolves into a disc=
ussion of
> GPIOs in sysfs as an ABI, which is not a discussion I want to have :)

In the present state, the gpio numbers on the Altera socfpga change
with changing kernel releases.  Not only does that suck, but it also
proves that the gpio numbering is not any kind of ABI.  Rather, it is
some kind of oversight.

Anyhow, the whole point is, when the data sheet says that the SoC has
GPIO0 to GPION, then those numbers should be exposed to user space.

Thanks,
Richard
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
