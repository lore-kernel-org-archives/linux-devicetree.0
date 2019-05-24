From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] amr64: map FDT as RW for early_init_dt_scan()
Date: Fri, 24 May 2019 16:58:38 -0500
Message-ID: <20190524215838.GA16271@bogus>
References: <20190519160446.320-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190519160446.320-1-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 12:04:44AM +0800, Hsin-Yi Wang wrote:
> Currently in arm64, FDT is mapped to RO before it's passed to
> early_init_dt_scan(). However, there might be some code that needs
> to modify FDT during init. Map FDT to RW until unflatten DT.

typo in the subject.

Otherwise, this one seems fine to me.

> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> change log v2->v4:
> * v3 abandoned
> * add an arg pgprot_t to fixmap_remap_fdt()
> ---
>  arch/arm64/include/asm/mmu.h | 2 +-
>  arch/arm64/kernel/setup.c    | 5 ++++-
>  arch/arm64/mm/mmu.c          | 4 ++--
>  3 files changed, 7 insertions(+), 4 deletions(-)
