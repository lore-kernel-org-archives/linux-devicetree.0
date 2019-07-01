From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v6 3/3] arm64: kexec_file: add rng-seed support
Date: Mon, 1 Jul 2019 12:33:36 +0800
Message-ID: <CAJMQK-g66_G3M9j1b2fBiMQrr5H7w4WQ5ZVy+aDdsmjb4A1==Q@mail.gmail.com>
References: <20190612043258.166048-1-hsinyi@chromium.org> <20190612043258.166048-4-hsinyi@chromium.org>
 <20190628094251.GC36437@lakrids.cambridge.arm.com> <CAJMQK-iRKkOS9q-qGVj-3o6BVMeANrBoF_4MWQ1g-=4_6HRdbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJMQK-iRKkOS9q-qGVj-3o6BVMeANrBoF_4MWQ1g-=4_6HRdbw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 28, 2019 at 7:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:

> >
> > If the RNG wasn't initialised, we'd carry on with a warning. Why do we
> > follow a different policy here?
> >
(Sorry, please ignore previous comment)
I think this part should be same as kaslr, since they are both adding
random seeds:
If RNG isn't initialized, we won't be able to set these seeds, and dtb
can't do anything else to deal with this, so carry on with warning.
If fdt_setprop failed with no space, create_dtb() will try to setup
dtb again with more space.
Other failures are setting fdt's error, so returns invalid.
