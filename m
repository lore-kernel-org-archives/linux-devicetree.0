From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v6 0/6] Allwinner H6 Mali GPU support
Date: Mon, 3 Jun 2019 19:27:51 +0200
Message-ID: <CAJiuCcchRZZ-Wwy3_fo_aq=GuCaCW8RHS8nBtB2br4n5Qtu-MA@mail.gmail.com>
References: <20190521161102.29620-1-peron.clem@gmail.com> <CAL_Jsq+86nNEBzjbf_GLWWrAN91jwU+JQ7zrEoFaT_dxUzVv4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+86nNEBzjbf_GLWWrAN91jwU+JQ7zrEoFaT_dxUzVv4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Joerg Roedel <joro@8bytes.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>, Neil Armstrong <narmstrong@baylibre.com>, Steven Price <steven.price@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Linux IOMMU <iommu@lists.linux-foundation.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime, Joerg,

On Wed, 22 May 2019 at 21:27, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, May 21, 2019 at 11:11 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmai=
l.com> wrote:
> >
> > Hi,
> >
> > The Allwinner H6 has a Mali-T720 MP2 which should be supported by
> > the new panfrost driver. This series fix two issues and introduce the
> > dt-bindings but a simple benchmark show that it's still NOT WORKING.
> >
> > I'm pushing it in case someone want to continue the work.
> >
> > This has been tested with Mesa3D 19.1.0-RC2 and a GPU bitness patch[1].
> >
> > One patch is from Icenowy Zheng where I changed the order as required
> > by Rob Herring[2].
> >
> > Thanks,
> > Clement
> >
> > [1] https://gitlab.freedesktop.org/kszaq/mesa/tree/panfrost_64_32
> > [2] https://patchwork.kernel.org/patch/10699829/
> >
> >
> > [  345.204813] panfrost 1800000.gpu: mmu irq status=3D1
> > [  345.209617] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
> > 0x0000000002400400
> > [  345.209617] Reason: TODO
> > [  345.209617] raw fault status: 0x800002C1
> > [  345.209617] decoded fault status: SLAVE FAULT
> > [  345.209617] exception type 0xC1: TRANSLATION_FAULT_LEVEL1
> > [  345.209617] access type 0x2: READ
> > [  345.209617] source id 0x8000
> > [  345.729957] panfrost 1800000.gpu: gpu sched timeout, js=3D0,
> > status=3D0x8, head=3D0x2400400, tail=3D0x2400400, sched_job=3D000000009=
e204de9
> > [  346.055876] panfrost 1800000.gpu: mmu irq status=3D1
> > [  346.060680] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
> > 0x0000000002C00A00
> > [  346.060680] Reason: TODO
> > [  346.060680] raw fault status: 0x810002C1
> > [  346.060680] decoded fault status: SLAVE FAULT
> > [  346.060680] exception type 0xC1: TRANSLATION_FAULT_LEVEL1
> > [  346.060680] access type 0x2: READ
> > [  346.060680] source id 0x8100
> > [  346.561955] panfrost 1800000.gpu: gpu sched timeout, js=3D1,
> > status=3D0x8, head=3D0x2c00a00, tail=3D0x2c00a00, sched_job=3D00000000b=
55a9a85
> > [  346.573913] panfrost 1800000.gpu: mmu irq status=3D1
> > [  346.578707] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
> > 0x0000000002C00B80
> >
> > Change in v5:
> >  - Remove fix indent
> >
> > Changes in v4:
> >  - Add bus_clock probe
> >  - Fix sanity check in io-pgtable
> >  - Add vramp-delay
> >  - Merge all boards into one patch
> >  - Remove upstreamed Neil A. patch
> >
> > Change in v3 (Thanks to Maxime Ripard):
> >  - Reauthor Icenowy for her path
> >
> > Changes in v2 (Thanks to Maxime Ripard):
> >  - Drop GPU OPP Table
> >  - Add clocks and clock-names in required
> >
> > Cl=C3=A9ment P=C3=A9ron (5):
> >   drm: panfrost: add optional bus_clock
> >   iommu: io-pgtable: fix sanity check for non 48-bit mali iommu
> >   dt-bindings: gpu: mali-midgard: Add H6 mali gpu compatible
> >   arm64: dts: allwinner: Add ARM Mali GPU node for H6
> >   arm64: dts: allwinner: Add mali GPU supply for H6 boards
> >
> > Icenowy Zheng (1):
> >   dt-bindings: gpu: add bus clock for Mali Midgard GPUs
>
> I've applied patches 1 and 3 to drm-misc. I was going to do patch 4
> too, but it doesn't apply.
>
> Patch 2 can go in via the iommu tree and the rest via the allwinner tree.

Is this OK for you to pick up this series?

Thanks,
Cl=C3=A9ment

>
> Rob
