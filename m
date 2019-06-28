From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v6 2/3] fdt: add support for rng-seed
Date: Fri, 28 Jun 2019 19:23:45 +0800
Message-ID: <CAJMQK-g_9bDHJgKr-qKpQ6HwombB+6Asg_z3r6nv+pC4q4j-Aw@mail.gmail.com>
References: <20190612043258.166048-1-hsinyi@chromium.org> <20190612043258.166048-3-hsinyi@chromium.org>
 <20190628093529.GB36437@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628093529.GB36437@lakrids.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 28, 2019 at 5:35 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Wed, Jun 12, 2019 at 12:33:00PM +0800, Hsin-Yi Wang wrote:
> > Introducing a chosen node, rng-seed, which is an entropy that can be
> > passed to kernel called very early to increase initial device
> > randomness. Bootloader should provide this entropy and the value is
> > read from /chosen/rng-seed in DT.
>
> Could you please elaborate on this?
>
> * What is this initial entropy used by, and why is this important? I
>   assume that devices which can populate this will have a HW RNG that
>   the kernel will eventually make use of.
There are a few discussions here[0]. We basically want to add more
randomness for stack canary when device just boot and not much device
randomness was added.
[0] https://lore.kernel.org/patchwork/patch/1070974/#1268553

On Thu, May 9, 2019 at 1:00 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> This early added entropy is also going to be used for stack canary. At
> the time it's created there's not be much entropy (before
> boot_init_stack_canary(), there's only add_latent_entropy() and
> command_line).
> On arm64, there is a single canary for all tasks. If RNG is weak or
> the seed can be read, it might be easier to figure out the canary.

With newer compilers[1] there will be a per-task canary on arm64[2],
which will improve this situation, but many architectures lack a
per-task canary, unfortunately. I've also recently rearranged the RNG
initialization[3] which should also help with better entropy mixing.
But each of these are kind of band-aids against not having sufficient
initial entropy, which leaves the canary potentially exposed.

-Kees

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=359c1bf35e3109d2f3882980b47a5eae46123259
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0a1213fa7432778b71a1c0166bf56660a3aab030
[3] https://git.kernel.org/pub/scm/linux/kernel/git/tytso/random.git/commit/?h=dev&id=d55535232c3dbde9a523a9d10d68670f5fe5dec3
>
> * How much entropy is necessary or sufficient?
64 bytes should be enough. But depends on how much bootloader can provide.
>
> * Why is the DT the right mechanism for this?
EFI based systems can inject randomness in early boot. This is aimed
to support DT based systems to also have this feature.

https://github.com/torvalds/linux/commit/636259880a7e7d3446a707dddebc799da94bdd0b#diff-3ded2fe21b37c6f3e86c2a8418507714

Thanks
