From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH] arm64: add support for rng-seed
Date: Fri, 10 May 2019 08:14:00 +0200
Message-ID: <36fab640-b98e-9781-f96f-0ed988a71077@rasmusvillemoes.dk>
References: <20190507045433.542-1-hsinyi@chromium.org>
 <CAL_Jsq+rGeFKAPVmPvv_Z+G=BppKUK-tEUphBajZVxFtbRBJvQ@mail.gmail.com>
 <CAJMQK-iVhScf0ybZ85kqP0B5_QPoYZ9PZt35jHRUh8FNHKvu7w@mail.gmail.com>
 <CAL_JsqJZ+mOnrLWt0Cpo_Ybr_ohxwWom1qiyV8_EFocULde7=Q@mail.gmail.com>
 <CAJMQK-jjzYwX3NZAKJ-8ypjcN75o-ZX4iOVD=84JecEd4qV1bA@mail.gmail.com>
 <CAL_JsqLnmedF5cJYH+91U2Q_WX755O8TQs6Ue9mqtEiFKcjGWQ@mail.gmail.com>
 <CAJMQK-hJUG855+TqX=droOjUfb-MKnU0n0FYtr_SW2KByKAW1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJMQK-hJUG855+TqX=droOjUfb-MKnU0n0FYtr_SW2KByKAW1w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Architecture Mailman List <boot-architecture@lists.linaro.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On 09/05/2019 10.00, Hsin-Yi Wang wrote:
>>>> Why do you need to clear it? That wasn't necessary for kaslr-seed.
>>> I think it's for security purpose. If we know the random seed, it's
>>> more likely we can predict randomness.
>>> Currently on arm64, kaslr-seed will be wiped out (in
>>> arch/arm64/kernel/kaslr.c#get_kaslr_seed(), it's set to 0) so we can't
>>> read from sysfs (eg. /sys/firmware/devicetree/.../kaslr-seed)
>>> I'm not sure on other arch if it will be wiped out.
>>
>> The difference is if I have the kaslr seed, I can calculate the kernel
>> base address.
>>
>> In your case, you are feeding an RNG which continually has entropy
>> added to it. I can't see that knowing one piece of the entropy data is
>> a security hole. It looks more like you've just copied what what done
>> for kaslr-seed.
> +Kees who can probably explain this better.
> 
> This early added entropy is also going to be used for stack canary. At
> the time it's created there's not be much entropy (before
> boot_init_stack_canary(), there's only add_latent_entropy() and
> command_line).

So, why not just have the bootloader add whatever entropy it has via the
commandline, which already gets mixed in? That requires no kernel
changes, and works for all architectures.

If anything, perhaps instead of just adding gobbledygook=abc123, make an
official command line parameter (there was talk about this at some
point), and have the kernel overwrite the value with xxx so it's not
visible in /proc/cmdline.

Rasmus
