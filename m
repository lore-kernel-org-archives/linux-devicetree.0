From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: mark lx2160a esdhc controllers dma
 coherent
Date: Fri, 27 Sep 2019 20:35:35 +0200
Message-ID: <CAPDyKFpm-73euWRWDHhMz=aRt38VLWp5-OaTVhVeFwuc+y46mQ@mail.gmail.com>
References: <20190922102341.GO25745@shell.armlinux.org.uk>
 <E1iBz55-0008Mj-CX@rmk-PC.armlinux.org.uk>
 <CAPDyKFpQn+O-M60q-Tc4QOBM+WhFhmnkU6_-t5hnQcndLo==YA@mail.gmail.com>
 <AM0PR04MB66766AC0807A85B3E5428E028F840@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <4cb91a30-ed1b-1fef-58df-fbc46757bd5d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4cb91a30-ed1b-1fef-58df-fbc46757bd5d@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, dann frazier <dann.frazier@canonical.com>, Will Deacon <will.deacon@arm.com>, Leo Li <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, "Y.b. Lu" <yangbo.lu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Christoph Hellwig <hch@lst.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 24 Sep 2019 at 20:04, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 24/09/2019 04:41, Leo Li wrote:
> >
> >
> >> -----Original Message-----
> >> From: Ulf Hansson <ulf.hansson@linaro.org>
> >> Sent: Monday, September 23, 2019 4:27 PM
> >> To: Russell King <rmk+kernel@armlinux.org.uk>
> >> Cc: Robin Murphy <robin.murphy@arm.com>; dann frazier
> >> <dann.frazier@canonical.com>; Will Deacon <will.deacon@arm.com>;
> >> Nicolin Chen <nicoleotsuka@gmail.com>; Y.b. Lu <yangbo.lu@nxp.com>;
> >> Christoph Hellwig <hch@lst.de>; Mark Rutland <mark.rutland@arm.com>;
> >> DTML <devicetree@vger.kernel.org>; Leo Li <leoyang.li@nxp.com>; Rob
> >> Herring <robh+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Linux
> >> ARM <linux-arm-kernel@lists.infradead.org>
> >> Subject: Re: [PATCH 3/3] arm64: dts: mark lx2160a esdhc controllers dma
> >> coherent
> >>
> >> On Sun, 22 Sep 2019 at 12:29, Russell King <rmk+kernel@armlinux.org.uk>
> >> wrote:
> >>>
> >>> The LX2160A esdhc controllers are setup by the driver to be DMA
> >>> coherent, but without marking them as such in DT, Linux thinks they
> >>> are not.  This can lead to random sporadic DMA errors, even to the
> >>> extent of preventing boot, such as:
> >>>
> >>> mmc0: ADMA error
> >>> mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
> >>> mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x00002202
> >>> mmc0: sdhci: Blk size:  0x00000008 | Blk cnt:  0x00000001
> >>> mmc0: sdhci: Argument:  0x00000000 | Trn mode: 0x00000013
> >>> mmc0: sdhci: Present:   0x01f50008 | Host ctl: 0x00000038
> >>> mmc0: sdhci: Power:     0x00000003 | Blk gap:  0x00000000
> >>> mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x000040d8
> >>> mmc0: sdhci: Timeout:   0x00000003 | Int stat: 0x00000001
> >>> mmc0: sdhci: Int enab:  0x037f108f | Sig enab: 0x037f108b
> >>> mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00002202
> >>> mmc0: sdhci: Caps:      0x35fa0000 | Caps_1:   0x0000af00
> >>> mmc0: sdhci: Cmd:       0x0000333a | Max curr: 0x00000000
> >>> mmc0: sdhci: Resp[0]:   0x00000920 | Resp[1]:  0x001d8a33
> >>> mmc0: sdhci: Resp[2]:   0x325b5900 | Resp[3]:  0x3f400e00
> >>> mmc0: sdhci: Host ctl2: 0x00000000
> >>> mmc0: sdhci: ADMA Err:  0x00000009 | ADMA Ptr: 0x000000236d43820c
> >>> mmc0: sdhci: ============================================
> >>> mmc0: error -5 whilst initialising SD card
> >>>
> >>> These are caused by the device's descriptor fetch hitting
> >>> speculatively loaded CPU cache lines that the CPU does not see through
> >>> the normal, non-cacheable DMA coherent mapping that it uses for
> >>> non-coherent devices.
> >>>
> >>> DT and the device must agree wrt whether the device is DMA coherent or
> >>> not.
> >>>
> >>> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> >>
> >> As I am picking up patch1 and patch2 from this series, I can also help out and
> >> pick up this one, if that is okay by people?
> >
> > There is some concern recently from linux-next maintainer about this causing potential conflicts.  https://lkml.org/lkml/2019/9/15/225
>
> In principle, it should be fine for #2 and #3 to go via separate trees -
> #3 aligns the DT with the existing behaviour of the driver, while #2
> will make the driver behave correctly whichever state the DT is in.
>
> Robin.

That's right, so I am leaving this patch for arm-soc people to pick up then.

Kind regards
Uffe
