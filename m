From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v6 3/3] arm64: kexec_file: add rng-seed support
Date: Fri, 28 Jun 2019 19:47:20 +0800
Message-ID: <CAJMQK-iRKkOS9q-qGVj-3o6BVMeANrBoF_4MWQ1g-=4_6HRdbw@mail.gmail.com>
References: <20190612043258.166048-1-hsinyi@chromium.org> <20190612043258.166048-4-hsinyi@chromium.org>
 <20190628094251.GC36437@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628094251.GC36437@lakrids.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 28, 2019 at 5:42 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Wed, Jun 12, 2019 at 12:33:02PM +0800, Hsin-Yi Wang wrote:
> > Adding "rng-seed" to dtb. It's fine to add this property if original
> > fdt doesn't contain it. Since original seed will be wiped after
> > read, so use a default size 128 bytes here.
>
> Why is 128 bytes the default value?
More than 64 bytes should be enough.
>
> I didn't see an update to Documentation/devicetree/bindings/chosen.txt,
> so it's not clear to me precisely what we expect.
>
Rob suggested to update in a newer dt-schema documentation at
https://github.com/devicetree-org/dt-schema.
A pull request has been sent but perhaps it would continue if kernel
patches are accepted.
>
> For 128 bytes, it would be better to use a buffer on the stack. That
> avoids the possibility of the allocation failing.
>
Okay, I'll update this.
>
> If the RNG wasn't initialised, we'd carry on with a warning. Why do we
> follow a different policy here?
>
For failure case, I think kernel can still be boot since this is not a
very fatal case, just same as the seed wasn't provided by bootloader
at first boot. So I'll also let fdt_setprop() failed case carry on
with warning.

Thanks
