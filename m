From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v4 2/3] fdt: add support for rng-seed
Date: Tue, 21 May 2019 12:09:39 +0800
Message-ID: <CAJMQK-iZRHO6HBkycPt0yz_vndmmmqFL0duHOcQ8EFSdhhFZcQ@mail.gmail.com>
References: <20190519160446.320-1-hsinyi@chromium.org> <20190519160446.320-2-hsinyi@chromium.org>
 <CANMq1KB7sh=UXaM4sMm_THjZ_wV3Thgr6_ona-TJFqA2QQHALA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANMq1KB7sh=UXaM4sMm_THjZ_wV3Thgr6_ona-TJFqA2QQHALA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 7:54 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> Alphabetical order.
Original headers are not sorted, should I sort them here?
>

>
> I'm a little bit concerned about this, as we really want the rng-seed
> value to be wiped, and not kept in memory (even if it's hard to
> access).
>
> IIUC, fdt_delprop splices the device tree, so it'll override
> "rng-seed" property with whatever device tree entries follow it.
> However, if rng-seed is the last property (or if the entries that
> follow are smaller than rng-seed), the seed will stay in memory (or
> part of it).
>
> fdt_nop_property in v2 would erase it for sure. I don't know if there
> is a way to make sure that rng-seed is removed for good while still
> deleting the property (maybe modify fdt_splice_ to do a memset(.., 0)
> of the moved chunk?).
>
So maybe we can use fdt_nop_property() back?
