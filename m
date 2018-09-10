From: Jim Quinlan <jim2101024@gmail.com>
Subject: Re: [PATCH v5 07/12] PCI/MSI: enable PCI_MSI_IRQ_DOMAIN support for MIPS
Date: Mon, 10 Sep 2018 10:42:43 -0400
Message-ID: <CANCKTBsuEaeW=95tpjOPF2RecfTbdUP+C7a1QwFdvOBFG6o8Vg@mail.gmail.com>
References: <1536266581-7308-1-git-send-email-jim2101024@gmail.com>
 <1536266581-7308-8-git-send-email-jim2101024@gmail.com> <20180906214549.y4xpleiukzw5rmqs@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906214549.y4xpleiukzw5rmqs@pburton-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: paul.burton@mips.com
Cc: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux@armlinux.org.uk, Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, jhogan@kernel.org, Kevin Cernekee <cernekee@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, yamada.masahiro@socionext.com, Arnd Bergmann <arnd@arndb.de>, nicolas.pitre@linaro.org, keescook@chromium.org, jinb.park7@gm
List-Id: devicetree@vger.kernel.org

On Thu, Sep 6, 2018 at 5:46 PM Paul Burton <paul.burton@mips.com> wrote:
>
> Hi Jim,
>
> On Thu, Sep 06, 2018 at 04:42:56PM -0400, Jim Quinlan wrote:
> > Add MIPS as an arch that supports PCI_MSI_IRQ_DOMAIN and add
> > generation of msi.h in the MIPS arch.
>
> I guess the second part of this probably became untrue after rebasing
> atop something including commit 34a4399f196c ("mips: use asm-generic
> version of msi.h"), and ought to be removed.
Hi Paul,

Yes, the second clause of this commit message will be removed.

Thanks,
Jim

>
> > Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
> > ---
> >  drivers/pci/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Otherwise this looks fine:
>
>     Acked-by: Paul Burton <paul.burton@mips.com>
>
> Thanks,
>     Paul
