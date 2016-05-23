From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] MIPS: devicetree: fix cpu interrupt controller node-names
Date: Mon, 23 May 2016 10:47:16 -0500
Message-ID: <CAL_Jsq+CC3p0hPTtPB=RsL9O7sqX1ZXKkoFk0dOj0gvvKifAkw@mail.gmail.com>
References: <1464003540-13009-1-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464003540-13009-1-git-send-email-antonynpavlov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 23, 2016 at 6:39 AM, Antony Pavlov <antonynpavlov@gmail.com=
> wrote:
> Here is the quote from [1]:
>
>     The unit-address must match the first address specified
>     in the reg property of the node. If the node has no reg property,
>     the @ and unit-address must be omitted and the node-name alone
>     differentiates the node from other nodes at the same level
>
> This patch adjusts MIPS dts-files and devicetree binding
> documentation in accordance with [1].
>
>     [1] Power.org(tm) Standard for Embedded Power Architecture(tm)
>         Platform Requirements (ePAPR). Version 1.1 =E2=80=93 08 April=
 2011.
>         Chapter 2.2.1.1 Node Name Requirements

=46YI, you can reference "the Devicetree Spec" now: devicetree.org

Acked-by: Rob Herring <robh@kernel.org>

> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@imgtec.com>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: linux-mips@linux-mips.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/mips/cpu_irq.txt | 2 +-
>  arch/mips/boot/dts/ingenic/jz4740.dtsi             | 2 +-
>  arch/mips/boot/dts/ralink/mt7620a.dtsi             | 2 +-
>  arch/mips/boot/dts/ralink/rt2880.dtsi              | 2 +-
>  arch/mips/boot/dts/ralink/rt3050.dtsi              | 2 +-
>  arch/mips/boot/dts/ralink/rt3883.dtsi              | 2 +-
>  arch/mips/boot/dts/xilfpga/nexys4ddr.dts           | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
