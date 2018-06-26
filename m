From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] RFC: Mezzanine handling for 96boards
Date: Tue, 26 Jun 2018 10:36:52 +0200
Message-ID: <CACRpkdYZmoP-yf6wT0=3Npr4u9zB8qtEraihSYyrjXHeEHp0ow@mail.gmail.com>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <CAK8P3a2KqoX-squhGc8TBuJ==8xxELsuy-H+c1+C7Fu7Z4OjDA@mail.gmail.com>
 <CAKv+Gu-gAkfRsEUOc=iyxi6Twvg9cbvWNqNHRS2HzUDZg8xUhg@mail.gmail.com>
 <CACRpkdb1GksbePt6XgePCD6g-z4fxY-LF-gpyRfQVxCrq226fg@mail.gmail.com>
 <CAKv+Gu8cXxQWbnB++adGx=xwAzuM9jqxkCOznk1qP5r=P4vxrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAKv+Gu8cXxQWbnB++adGx=xwAzuM9jqxkCOznk1qP5r=P4vxrQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, dev <dev@lists.96boards.org>, Mark Brown <broonie@kernel.org>, John Stultz <john.stultz@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 26, 2018 at 10:19 AM Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
> On 26 June 2018 at 10:09, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Mon, Jun 18, 2018 at 3:22 PM Ard Biesheuvel
> > <ard.biesheuvel@linaro.org> wrote:
> >
> >> We should also consider firmware use of the mezzanines. For instance,
> >> the Secure96 has a RNG which UEFI may want to use so the early boot
> >> code can access is for KASLR. It also has a TPM, which should not be
> >> reset/reinitialized/etc by the OS if we want to make meaningful use of
> >> it.
> >
> > This problem: sharing or dedicating a piece of hardware to UEFI or
> > the TrustZone secure world is a generic problem not related to
> > mezzanines or plug-in boards specifically.
(...)
> I agree that this is *also* a problem. But it is not what I was talking about.
>
> My example is about peripherals that firmware and OS should both drive
> natively, and in the TPM case, the OS should be mindful of the fact
> that the measured state should be preserved.

Ah I see.

In that case this is something the TPM driver should be doing
I guess? I mean it is a "firmware plus OS TPM driver"-specific
problem.

I guess that would be hard to duct-tape on if the peripheral
is context-unaware and easy to do if the designer of the
peripheral HW took multiple call-context into account.
Whether TPM does this I don't know...

> Also, it means that we
> may be duplicating functionality between the OS and firmware [as
> usual] so it might make sense to come up with something that takes
> both use cases into account.

What we are doing now with Atmel's ECC chip is even worse:
duplicating functionality between OS and userspace. So I'm
trying to solve that first.

Yours,
Linus Walleij
