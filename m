From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v8 2/3] fdt: add support for rng-seed
Date: Tue, 20 Aug 2019 15:42:37 +0800
Message-ID: <CAJMQK-ghQ8weMerXW7t0DFZTAg_c5M80Yp5DTAtyY2LA7YpS1A@mail.gmail.com>
References: <20190819071602.139014-1-hsinyi@chromium.org> <20190819071602.139014-3-hsinyi@chromium.org>
 <20190819181349.GE10349@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819181349.GE10349@mit.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: "Theodore Y. Ts'o" <tytso@mit.edu>, Hsin-Yi Wang <hsinyi@chromium.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Ted,

Thanks for raising this question.

For UEFI based system, they have a config table that carries rng seed
and can be passed to device randomness. However, they also use
add_device_randomness (not sure if it's the same reason that they
can't guarantee _all_ bootloader can be trusted)
This patch is to let DT based system also have similar features, which
can make initial random number stronger. (We only care initial
situation here, since more entropy would be added to kernel as time
goes on )

Conservatively, we can use add_device_randomness() as well, which
would pass buffer to crng_slow_load() instead of crng_fast_load().
But I think we should trust bootloader here. Whoever wants to use this
feature should make sure their bootloader can pass valid (random
enough) seeds. If they are not sure, they can just don't add the
property to DT.
