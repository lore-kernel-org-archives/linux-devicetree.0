From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v5 2/3] fdt: add support for rng-seed
Date: Mon, 10 Jun 2019 18:59:11 +0800
Message-ID: <CAJMQK-i0z1EHCMK3eTya+SmK6GD_C4Ljvb7BHvsaMWLDxxmwMg@mail.gmail.com>
References: <20190527043336.112854-1-hsinyi@chromium.org> <20190527043336.112854-2-hsinyi@chromium.org>
 <5ced598d.1c69fb81.dabd8.339d@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5ced598d.1c69fb81.dabd8.339d@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2019 at 11:53 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Hsin-Yi Wang (2019-05-26 21:33:35)
> > Introducing a chosen node, rng-seed, which is an entropy that can be
> > passed to kernel called very early to increase initial device
> > randomness. Bootloader should provide this entropy and the value is
> > read from /chosen/rng-seed in DT.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>

Hi Rob,

Is this series accepted? Or is there any other related concern?

If it's fine, I also have sent a patch for updating
schemas/chosen.yaml document.

Thanks
