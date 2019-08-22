From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 00/20] Initial support for Marvell MMP3 SoC
Date: Thu, 22 Aug 2019 09:23:59 -0700
Message-ID: <CAOesGMjDTbwSviXbB2P=wPjmp2JC_U8XB0fUby5R003RCaeRaQ@mail.gmail.com>
References: <20190822092643.593488-1-lkundrak@v3.sk> <244fdc87-0fe5-be79-d9cd-2395d0ac3f57@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <244fdc87-0fe5-be79-d9cd-2395d0ac3f57@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>
Cc: Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 3:32 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 22/08/2019 10:26, Lubomir Rintel wrote:
> > Hi,
> >
> > this is a second spin of a patch set that adds support for the Marvell
> > MMP3 processor. MMP3 is used in OLPC XO-4 laptops, Panasonic Toughpad
> > FZ-A1 tablet and Dell Wyse 3020 Tx0D thin clients.
> >
> > Compared to v1, there's a handful of fixes in response to reviews. Patch
> > 02/20 is new. Details in individual patches.
> >
> > Apart from the adjustments in mach-mmp/, the patch makes necessary
> > changes to the irqchip driver and adds an USB2 PHY driver. The latter
> > has a dependency on the mach-mmp/ changes, so it can't be submitted
> > separately.
> >
> > The patch set has been tested to work on Wyse Tx0D and not ruin MMP2
> > support on XO-1.75.
>
> How do you want this series to be merged? I'm happy to take the irqchip
> related patches as well as the corresponding DT change (once reviewed)
> through my tree.

DT changes, unless there's lack of backwards compatibility, are best
merged through the platform trees. Especially for new platforms like
these where there's likely going to be nearby changes (and thus
conflicts).

I.e. driver changes I'm all for bringing through driver trees
(including binding patches), but please leave dts/dtsi changes to the
platform.


-Olof
