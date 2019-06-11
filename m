From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/3] fdt: add support for rng-seed
Date: Tue, 11 Jun 2019 17:34:53 -0600
Message-ID: <20190611233453.GA14130@bogus>
References: <20190527043336.112854-1-hsinyi@chromium.org>
 <20190527043336.112854-2-hsinyi@chromium.org>
 <5ced598d.1c69fb81.dabd8.339d@mx.google.com>
 <CAJMQK-i0z1EHCMK3eTya+SmK6GD_C4Ljvb7BHvsaMWLDxxmwMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJMQK-i0z1EHCMK3eTya+SmK6GD_C4Ljvb7BHvsaMWLDxxmwMg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 06:59:11PM +0800, Hsin-Yi Wang wrote:
> On Tue, May 28, 2019 at 11:53 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Hsin-Yi Wang (2019-05-26 21:33:35)
> > > Introducing a chosen node, rng-seed, which is an entropy that can be
> > > passed to kernel called very early to increase initial device
> > > randomness. Bootloader should provide this entropy and the value is
> > > read from /chosen/rng-seed in DT.
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >
> 
> Hi Rob,
> 
> Is this series accepted? Or is there any other related concern?
> 
> If it's fine, I also have sent a patch for updating
> schemas/chosen.yaml document.

The kernel change is fine, but please put the documentation change into 
the schema doc (in github.com/devicetree-org/dt-schema) and don't modify 
chosen.txt.

Rob
