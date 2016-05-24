From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [PATCH] MIPS: devicetree: fix cpu interrupt controller
 node-names
Date: Tue, 24 May 2016 14:43:17 +0300
Message-ID: <20160524144317.53614ee26334019774c3ea99@gmail.com>
References: <1464003540-13009-1-git-send-email-antonynpavlov@gmail.com>
	<CAL_Jsq+CC3p0hPTtPB=RsL9O7sqX1ZXKkoFk0dOj0gvvKifAkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+CC3p0hPTtPB=RsL9O7sqX1ZXKkoFk0dOj0gvvKifAkw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 23 May 2016 10:47:16 -0500
Rob Herring <robh+dt@kernel.org> wrote:

> On Mon, May 23, 2016 at 6:39 AM, Antony Pavlov <antonynpavlov@gmail.c=
om> wrote:
> > Here is the quote from [1]:
> >
> >     The unit-address must match the first address specified
> >     in the reg property of the node. If the node has no reg propert=
y,
> >     the @ and unit-address must be omitted and the node-name alone
> >     differentiates the node from other nodes at the same level
> >
> > This patch adjusts MIPS dts-files and devicetree binding
> > documentation in accordance with [1].
> >
> >     [1] Power.org(tm) Standard for Embedded Power Architecture(tm)
> >         Platform Requirements (ePAPR). Version 1.1 =E2=80=93 08 Apr=
il 2011.
> >         Chapter 2.2.1.1 Node Name Requirements
>=20
> FYI, you can reference "the Devicetree Spec" now: devicetree.org

Thanks for your note! Last time I visited devicetree.org in Jan 2015.
Now I see that the devicetree.org site has changed dramaticaly,
e.g. it does not use Mediawiki anymore.

Alas some important links from the http://www.devicetree.org/specificat=
ions/ page are broken:

   * http://www.devicetree.org/specifications-pdf
   * https://github.com/devicetree-org/devicetree-specification-release=
d

Anyway I have got a prerelease specification version from github:

    https://raw.githubusercontent.com/devicetree-org/devicetree-specifi=
cation-released/master/prerelease/devicetree-specification-v0.1-pre1-20=
160429.pdf


> Acked-by: Rob Herring <robh@kernel.org>
>=20
> > Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Paul Burton <paul.burton@imgtec.com>
> > Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Pawel Moll <pawel.moll@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> > Cc: Kumar Gala <galak@codeaurora.org>
> > Cc: linux-mips@linux-mips.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  Documentation/devicetree/bindings/mips/cpu_irq.txt | 2 +-
> >  arch/mips/boot/dts/ingenic/jz4740.dtsi             | 2 +-
> >  arch/mips/boot/dts/ralink/mt7620a.dtsi             | 2 +-
> >  arch/mips/boot/dts/ralink/rt2880.dtsi              | 2 +-
> >  arch/mips/boot/dts/ralink/rt3050.dtsi              | 2 +-
> >  arch/mips/boot/dts/ralink/rt3883.dtsi              | 2 +-
> >  arch/mips/boot/dts/xilfpga/nexys4ddr.dts           | 2 +-
> >  7 files changed, 7 insertions(+), 7 deletions(-)


--=20
--=C2=A0
Best regards,
=C2=A0 Antony Pavlov
