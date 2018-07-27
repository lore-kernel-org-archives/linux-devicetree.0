From: Christoph Hellwig <hch@lst.de>
Subject: Re: [BUG BISECT] Ethernet fail on VF50 (OF: Don't set default
        coherent DMA mask)
Date: Fri, 27 Jul 2018 16:04:48 +0200
Message-ID: <20180727140448.GA29001@lst.de>
References: <CAJKOXPeaguNxRr7pCArJ5Db4tS6Kr5BDheCxskY+vd0dUN+0GQ@mail.gmail.com> <CAJKOXPfageiBVXddtdJRBS+092O3QfD0yoS_Mk+PoX7+qNYNUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPfageiBVXddtdJRBS+092O3QfD0yoS_Mk+PoX7+qNYNUA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Fugang Duan <fugang.duan@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 27, 2018 at 03:18:14PM +0200, Krzysztof Kozlowski wrote:
> On 27 July 2018 at 15:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Hi,
> >
> > On today's next, the bisect pointed commit
> > ff33d1030a6ca87cea9a41e1a2ea7750a781ab3d as fault for my boot failures
> > with NFSv4 root on Toradex Colibri VF50 (Iris carrier board).
> >
> > Author: Robin Murphy <robin.murphy@arm.com>
> > Date:   Mon Jul 23 23:16:12 2018 +0100
> >     OF: Don't set default coherent DMA mask
> >
> > Board: Toradex Colibri VF50 (NXP VF500, Cortex A5, serial configured
> > with DMA) on Iris Carrier.
> >
> > It looks like problem with Freescale Ethernet driver:
> > [   15.458477] fsl-edma 40018000.dma-controller: coherent DMA mask is unset
> > [   15.465284] fsl-lpuart 40027000.serial: Cannot prepare cyclic DMA
> > [   15.472086] Root-NFS: no NFS server address
> > [   15.476359] VFS: Unable to mount root fs via NFS, trying floppy.
> > [   15.484228] VFS: Cannot open root device "nfs" or
> > unknown-block(2,0): error -6
> > [   15.491664] Please append a correct "root=" boot option; here are
> > the available partitions:
> > [   15.500188] 0100           16384 ram0
> > [   15.500200]  (driver?)
> > [   15.506406] Kernel panic - not syncing: VFS: Unable to mount root
> > fs on unknown-block(2,0)
> > [   15.514747] ---[ end Kernel panic - not syncing: VFS: Unable to
> > mount root fs on unknown-block(2,0) ]---
> >
> > Attached - defconfig and full boot log.
> >
> > Any hints?
> > Let me know if you need any more information.
> 
> My Exynos boards also fail to boot on missing network:
> https://krzk.eu/#/builders/21/builds/799/steps/10/logs/serial0
> 
> As expected there are plenty of "DMA mask not set" warnings... and
> later dwc3 driver fails with:
>     dwc3: probe of 12400000.dwc3 failed with error -12
> which is probably the answer why LAN attached to USB is not present.

Looks like all the drivers failed to set a dma mask and were lucky.
