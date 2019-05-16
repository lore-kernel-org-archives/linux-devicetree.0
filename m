From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH v3 2/3] arm64: implement update_fdt_pgprot()
Date: Thu, 16 May 2019 18:34:16 +0100
Message-ID: <5f598806-1c36-7c2a-0f47-da79ec7d28c6@arm.com>
References: <20190516102817.188519-1-hsinyi@chromium.org>
 <20190516102817.188519-2-hsinyi@chromium.org>
 <CAL_JsqLx1UdjCnZ69aQm0GU_uOdd7tTdD_oM=D7yhDANoQ0fEA@mail.gmail.com>
 <CAJMQK-jrJQri3gM=X6JRD6Rk+B5S4939HJTptrQMY64xEWr1qA@mail.gmail.com>
 <CAL_Jsq+dVg9E_EzpoC4Bz1ytUckDGXUcEJyU5pV2HS6rZuKmHA@mail.gmail.com>
 <CAJMQK-hzjSBf2-QFMn52Sa8fwvm5-gaddzBOudfEc1neR2rwnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJMQK-hzjSBf2-QFMn52Sa8fwvm5-gaddzBOudfEc1neR2rwnA@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees
List-Id: devicetree@vger.kernel.org

Hi!

On 16/05/2019 17:48, Hsin-Yi Wang wrote:
> On Thu, May 16, 2019 at 11:32 PM Rob Herring <robh+dt@kernel.org> wrote:
>> Doesn't kexec operate on a copy because it already does modifications.

It does!

> This patch is to assist "[PATCH v3 3/3] fdt: add support for rng-seed"
> (https://lkml.org/lkml/2019/5/16/257). I thought that by default
> second kernel would use original fdt, so I write new seed back to
> original fdt. Might be wrong.
> 
> ** "[PATCH v3 3/3] fdt: add support for rng-seed" is supposed to
> handle for adding new seed in kexec case, discussed in v2
> (https://lkml.org/lkml/2019/5/13/425)
> 
> By default (not considering user defines their own fdt), if second
> kernel uses copied fdt, when is it copied and can we modify that?

Regular kexec's user-space already updates the dtb for the cmdline and maybe the initrd.
For KASLR, it generates its own seed with getrandom():

https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/tree/kexec/arch/arm64/kexec-arm64.c#n483

If user-space can do it, user-space should do it!


Thanks,

James
