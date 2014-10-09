From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/3] gpio: Add APM X-Gene standby GPIO controller driver
Date: Thu, 09 Oct 2014 14:13:34 +0200
Message-ID: <2334188.M3m5hnmS5j@wuerfel>
References: <1412779948-28769-1-git-send-email-yvo@apm.com> <1843196.sbXNmZyoMx@wuerfel> <CAL4ahLfpubEqi49gy8T9pyrf=1j__LbAsKUyr5i=koNyp0Mmig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL4ahLfpubEqi49gy8T9pyrf=1j__LbAsKUyr5i=koNyp0Mmig@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Y Vo <yvo@apm.com>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Tin Huynh <tnhuynh@apm.com>, patches@apm.com, Toan Le <toanle@apm.com>, Phong Vo <pvo@apm.com>
List-Id: devicetree@vger.kernel.org

On Thursday 09 October 2014 16:31:18 Y Vo wrote:
> Dear Arnd,
> 
> Thanks a lot for your review. Pls see my answer on blue text below.

Please do not send html-encoded email, it will get dropped by all mailing
lists.

> 
> On Wed, Oct 8, 2014 at 10:13 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > On Wednesday 08 October 2014 21:52:26 Y Vo wrote:
> > > +
> > > +#define GICD_SPI_BASE                        0x78010000
> >
> > You can't hardcode register locations. Please use the proper interfaces
> > to do whatever you want.
> > *APM: We will do that.*
> 
> 
> 
> >
> > It's probably not ok to map any GIC registers into the GPIO driver,
> > it should operate as a nested irqchip.
> >
> 
>  *APM: We will find the solution, the problem is we want to read the status
> of that GPIO in case it is configured IRQ. In this case we must access to
> GIC to read the true value.*

Can you explain what the hardware does here? Do you mean you have no way
to read the GPIO level from the GPIO controller for any pin that is
configured as an interrupt?

Can you route all GPIO pins to arbitrary upstream IRQ lines, or is this
hardwired in the GPIO block?

	Arnd
