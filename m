From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 00/33] ARM: davinci: modernize the irq support
Date: Mon, 11 Feb 2019 13:11:11 +0100
Message-ID: <CAMpxmJV34X=C4HMGNiAUxoVkPP+1nY3186QHOisqQtwT9pNtyg@mail.gmail.com>
References: <20190208173458.4801-1-brgl@bgdev.pl> <50671542-c055-1796-c58e-276ba3d414d0@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50671542-c055-1796-c58e-276ba3d414d0@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, David Lechner <david@lechnology.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

pon., 11 lut 2019 o 12:54 Sekhar Nori <nsekhar@ti.com> napisa=C5=82(a):
>
> + Jason, Marc
>
> Thomas, Jason, Marc,
>
> On 08/02/19 11:04 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This series ports the davinci platform to using SPARSE_IRQ, cleans up
> > the irqchip drivers and moves them over to drivers/irqchip.
> >
> > The series can be logically split into four parts. The first (1-8) aims
> > at introducing support for SPARSE_IRQ. It contains a couple changes
> > required for that functionality and the final patch actually selecting
> > it.
> >
> > Second part (9-19) makes the aintc driver suitable for drivers/irqchip
> > and eventually moves it over there.
> >
> > Part 3 (20-32) does the same for the cp-intc driver.
> >
> > Last patch removes unnecessary code.
> >
> > The series has been tested on da850-lcdk (for cp-intc) and
> > dm365-evm (for aintc).
>
> With your ack, I would like to try get it merged to v5.1 via ARM SoC tree=
.
>
> Bartosz, I noticed that Jason and Marc were not originally CCed. You may
> have to resend if they don't have the series in their inbox.
>
> Thanks,
> Sekhar

Sorry for that, I'm not sure how this happened, since they do pop up
in get_maintainer.pl output for that series.

I'll resend it.

Bart
