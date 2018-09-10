From: Jim Quinlan <jim2101024@gmail.com>
Subject: Re: [PATCH v5 08/12] MIPS: BMIPS: add PCI bindings for 7425, 7435
Date: Mon, 10 Sep 2018 10:37:19 -0400
Message-ID: <CANCKTBumoy6mw2n+V7hN_T1SYxhq3JQMxgQUUSmOLuMX-Kv=zw@mail.gmail.com>
References: <1536266581-7308-1-git-send-email-jim2101024@gmail.com>
 <1536266581-7308-9-git-send-email-jim2101024@gmail.com> <20180906214955.2yzyj6tkmflnnvdx@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906214955.2yzyj6tkmflnnvdx@pburton-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: paul.burton@mips.com
Cc: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux@armlinux.org.uk, Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, jhogan@kernel.org, Kevin Cernekee <cernekee@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, yamada.masahiro@socionext.com, Arnd Bergmann <arnd@arndb.de>, nicolas.pitre@linaro.org, keescook@chromium.org, jinb.park7@gm
List-Id: devicetree@vger.kernel.org

On Thu, Sep 6, 2018 at 5:50 PM Paul Burton <paul.burton@mips.com> wrote:
>
> Hi Jim,
>
> On Thu, Sep 06, 2018 at 04:42:57PM -0400, Jim Quinlan wrote:
> > Adds the PCIe nodes for the Broadcom STB PCIe root complex.
> >
> > Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
> > ---
> >  arch/mips/boot/dts/brcm/bcm7425.dtsi     | 28 ++++++++++++++++++++++++++++
> >  arch/mips/boot/dts/brcm/bcm7435.dtsi     | 28 ++++++++++++++++++++++++++++
> >  arch/mips/boot/dts/brcm/bcm97425svmb.dts |  4 ++++
> >  arch/mips/boot/dts/brcm/bcm97435svmb.dts |  4 ++++
> >  4 files changed, 64 insertions(+)
>
> Do you have a preference for how this gets merged? If it goes via the
> PCI tree then for patches 8 & 9:
>
>     Acked-by: Paul Burton <paul.burton@mips.com>
>
Hi Paul,

I hope that the 12 commits  go together and will go through the PCI
tree.  I'm inclined to think I will have to do a V6, and in the cover
leter I will mention this request.

Thanks!
Jim

> Still looking at patch 6.
>
> Thanks,
>     Paul
