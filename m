From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v3 2/3] arm64: implement update_fdt_pgprot()
Date: Thu, 16 May 2019 16:39:32 +0200
Message-ID: <CAKv+Gu_kgHEhk-p8KoGVgpifdjA67Li-D19_KSLo+1h4ZvL=3g@mail.gmail.com>
References: <20190516102817.188519-1-hsinyi@chromium.org> <20190516102817.188519-2-hsinyi@chromium.org>
 <CAL_JsqLx1UdjCnZ69aQm0GU_uOdd7tTdD_oM=D7yhDANoQ0fEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLx1UdjCnZ69aQm0GU_uOdd7tTdD_oM=D7yhDANoQ0fEA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Devicetree List <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Chintan Pandya <cpandya@codeaurora.org>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.>
List-Id: devicetree@vger.kernel.org

On Thu, 16 May 2019 at 16:37, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, May 16, 2019 at 5:28 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Basically does similar things like __fixmap_remap_fdt(). It's supposed
> > to be called after fixmap_remap_fdt() is called at least once, so region
> > checking can be skipped. Since it needs to know dt physical address, make
> > a copy of the value of __fdt_pointer.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  arch/arm64/kernel/setup.c |  2 ++
> >  arch/arm64/mm/mmu.c       | 17 +++++++++++++++++
> >  2 files changed, 19 insertions(+)
>
> Why not just map the FDT R/W at the start and change it to RO just
> before calling unflatten_device_tree? Then all the FDT scanning
> functions or any future fixups we need can just assume R/W. That is
> essentially what Stephen suggested. However, there's no need for a
> weak function as it can all be done within the arch code.
>
> However, I'm still wondering why the FDT needs to be RO in the first place.
>

It was RO because it could be RO, and we wanted to ensure that it
didn't get modified inadvertently (hence the CRC check we added as
well)

If there is a need for the FDT to be RW, let's make it RW.
