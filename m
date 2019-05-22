From: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH 1/6] arch: riscv: add support for building DTB files from DT source data
Date: Wed, 22 May 2019 21:18:33 +0200
Message-ID: <868suyb8mu.fsf@baylibre.com>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411084304.5072-2-paul.walmsley@sifive.com> (Paul Walmsley's
        message of "Thu, 11 Apr 2019 01:42:59 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
List-Id: devicetree@vger.kernel.org

On Thu 11 Apr 2019 at 01:42, Paul Walmsley <paul.walmsley@sifive.com> wrote:

> Similar to ARM64, add support for building DTB files from DT source
> data for RISC-V boards.
>
> This patch starts with the infrastructure needed for SiFive boards.
> Boards from other vendors would add support here in a similar form.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>

Tested-by: Loys Ollivier <lollivier@baylibre.com>

Tested the whole patch series using FSBL+BBL.
Did basic boot testing and uart validation.

The actual testing process is quite cumbersome.
One needs to rebuild the BBL to update the dtb loaded.

Would you have an idea of the delta between bbl and u-boot ?
I tried booting the same kernel + dtb with U-Boot but ran into
errors related to plic.

Loys
