From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v8 2/3] fdt: add support for rng-seed
Date: Wed, 21 Aug 2019 13:57:05 +0800
Message-ID: <CAJMQK-hdYz+pW5QL41nXkZAX1qiRynaWg7cne48qCaQsuPrSCg@mail.gmail.com>
References: <20190819071602.139014-1-hsinyi@chromium.org> <20190819071602.139014-3-hsinyi@chromium.org>
 <20190819181349.GE10349@mit.edu> <CAJMQK-ghQ8weMerXW7t0DFZTAg_c5M80Yp5DTAtyY2LA7YpS1A@mail.gmail.com>
 <CAKv+Gu_qJUU2hRujjv6e5yPqPQXRXokBU_2mSGD3civ2d2+xhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKv+Gu_qJUU2hRujjv6e5yPqPQXRXokBU_2mSGD3civ2d2+xhw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Devicetree List <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboy>
List-Id: devicetree@vger.kernel.org

Then we'd still use add_device_randomness() in case that bootloader
provides weak entropy.

On Tue, Aug 20, 2019 at 7:14 PM Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
>
> On Tue, 20 Aug 2019 at 10:43, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Hi Ted,
> >
> > Thanks for raising this question.
> >
> > For UEFI based system, they have a config table that carries rng seed
> > and can be passed to device randomness. However, they also use
> > add_device_randomness (not sure if it's the same reason that they
> > can't guarantee _all_ bootloader can be trusted)
>
> The config table is actually a Linux invention: it is populated by the
> EFI stub code (which is part of the kernel) based on the output of a
> call into the EFI_RNG_PROTOCOL, which is defined in the UEFI spec, but
> optional and not widely available.
>
> I have opted for add_device_randomness() since there is no way to
> establish the quality level of the output of EFI_RNG_PROTOCOL, and so
> it is currently only used to prevent the bootup state of the entropy
> pool to be too predictable, and the output does not contribute to the
> entropy estimate kept by the RNG core.
>
>
> > This patch is to let DT based system also have similar features, which
> > can make initial random number stronger. (We only care initial
> > situation here, since more entropy would be added to kernel as time
> > goes on )
> >
> > Conservatively, we can use add_device_randomness() as well, which
> > would pass buffer to crng_slow_load() instead of crng_fast_load().
> > But I think we should trust bootloader here. Whoever wants to use this
> > feature should make sure their bootloader can pass valid (random
> > enough) seeds. If they are not sure, they can just don't add the
> > property to DT.
>
> It is the firmware that adds the property to the DT, not the user.
