From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v3 2/3] arm64: implement update_fdt_pgprot()
Date: Fri, 17 May 2019 00:48:47 +0800
Message-ID: <CAJMQK-hzjSBf2-QFMn52Sa8fwvm5-gaddzBOudfEc1neR2rwnA@mail.gmail.com>
References: <20190516102817.188519-1-hsinyi@chromium.org> <20190516102817.188519-2-hsinyi@chromium.org>
 <CAL_JsqLx1UdjCnZ69aQm0GU_uOdd7tTdD_oM=D7yhDANoQ0fEA@mail.gmail.com>
 <CAJMQK-jrJQri3gM=X6JRD6Rk+B5S4939HJTptrQMY64xEWr1qA@mail.gmail.com> <CAL_Jsq+dVg9E_EzpoC4Bz1ytUckDGXUcEJyU5pV2HS6rZuKmHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+dVg9E_EzpoC4Bz1ytUckDGXUcEJyU5pV2HS6rZuKmHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees
List-Id: devicetree@vger.kernel.org

On Thu, May 16, 2019 at 11:32 PM Rob Herring <robh+dt@kernel.org> wrote:

> Doesn't kexec operate on a copy because it already does modifications.
>
Hi Rob,

This patch is to assist "[PATCH v3 3/3] fdt: add support for rng-seed"
(https://lkml.org/lkml/2019/5/16/257). I thought that by default
second kernel would use original fdt, so I write new seed back to
original fdt. Might be wrong.

** "[PATCH v3 3/3] fdt: add support for rng-seed" is supposed to
handle for adding new seed in kexec case, discussed in v2
(https://lkml.org/lkml/2019/5/13/425)

By default (not considering user defines their own fdt), if second
kernel uses copied fdt, when is it copied and can we modify that?

Thanks!
