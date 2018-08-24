From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4 v1] Mezzanine Low Speed connector bus
Date: Fri, 24 Aug 2018 09:28:05 +0200
Message-ID: <CACRpkdbmPkeT8ywBryxVq0jki7Xp6Yo_FJorjucKXQvycPC1DQ@mail.gmail.com>
References: <20180823103332.32047-1-linus.walleij@linaro.org>
 <cd3100ee-03a0-9218-b166-14f15d7669f6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cd3100ee-03a0-9218-b166-14f15d7669f6@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@xilinx.com>, dev <dev@lists.96boards.org>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Andy Shevchenko <andy@infradead.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 24, 2018 at 1:06 AM Frank Rowand <frowand.list@gmail.com> wrote:
> On 08/23/18 03:33, Linus Walleij wrote:

> > - Some indication that binding the connector like this will
> >   not implicate or screw things up for the DT-overlays
> >   idea, i.e. a both/and and not either/or approach.
(...)
>
> For the moment, NACK since there is not a substantive change
> from before.  This is without having read beyond this
> introduction.

So I guess you disagree with the previous statement, and
I need some elaboration to understand exactly what in this
approach works counter to the goals of DT overlays.

It's not like I'm overly infatuated with my own approach, but
I want to get to a point where people can start to use these
daughterboards no matter whether they use DT or ACPI.

I'm missing ACPI input though, the DT people are more
responsive :/

> I will read through the rest of the series and revisit my
> previous conclusions, but most likely not for a few days.

OK no problem there is no immediate hurry.

Yours,
Linus Walleij
