From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v8 2/3] fdt: add support for rng-seed
Date: Tue, 20 Aug 2019 14:14:18 +0300
Message-ID: <CAKv+Gu_qJUU2hRujjv6e5yPqPQXRXokBU_2mSGD3civ2d2+xhw@mail.gmail.com>
References: <20190819071602.139014-1-hsinyi@chromium.org>
 <20190819071602.139014-3-hsinyi@chromium.org>
 <20190819181349.GE10349@mit.edu>
 <CAJMQK-ghQ8weMerXW7t0DFZTAg_c5M80Yp5DTAtyY2LA7YpS1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJMQK-ghQ8weMerXW7t0DFZTAg_c5M80Yp5DTAtyY2LA7YpS1A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Yu Zhao <yuzhao@google.com>, Kees Cook <keescook@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Stephen Boyd <swboyd@chromium.org>, Will Deacon <will.deacon@arm.com>, lkml <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Jun Yao <yaojun8558363@gmail.com>, Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, 20 Aug 2019 at 10:43, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Hi Ted,
>
> Thanks for raising this question.
>
> For UEFI based system, they have a config table that carries rng seed
> and can be passed to device randomness. However, they also use
> add_device_randomness (not sure if it's the same reason that they
> can't guarantee _all_ bootloader can be trusted)

The config table is actually a Linux invention: it is populated by the
EFI stub code (which is part of the kernel) based on the output of a
call into the EFI_RNG_PROTOCOL, which is defined in the UEFI spec, but
optional and not widely available.

I have opted for add_device_randomness() since there is no way to
establish the quality level of the output of EFI_RNG_PROTOCOL, and so
it is currently only used to prevent the bootup state of the entropy
pool to be too predictable, and the output does not contribute to the
entropy estimate kept by the RNG core.


> This patch is to let DT based system also have similar features, which
> can make initial random number stronger. (We only care initial
> situation here, since more entropy would be added to kernel as time
> goes on )
>
> Conservatively, we can use add_device_randomness() as well, which
> would pass buffer to crng_slow_load() instead of crng_fast_load().
> But I think we should trust bootloader here. Whoever wants to use this
> feature should make sure their bootloader can pass valid (random
> enough) seeds. If they are not sure, they can just don't add the
> property to DT.

It is the firmware that adds the property to the DT, not the user.
