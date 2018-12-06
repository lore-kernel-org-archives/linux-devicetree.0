From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v16 06/16] lib: fdt: add a helper function for handling
 memory range property
Date: Thu, 6 Dec 2018 08:47:04 -0600
Message-ID: <CAL_JsqL4_Z5pVfoB3opjL7eTzZvhBJW7_aQS443quAAR0gGH1w@mail.gmail.com>
References: <20181115055254.2812-1-takahiro.akashi@linaro.org> <20181115055254.2812-7-takahiro.akashi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181115055254.2812-7-takahiro.akashi@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "AKASHI, Takahiro" <takahiro.akashi@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Howells <dhowells@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, dyoung@redhat.com, Baoquan He <bhe@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, prudo@linux.ibm.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, bhsharma@redhat.com, kexec@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.or
List-Id: devicetree@vger.kernel.org

On Wed, Nov 14, 2018 at 11:52 PM AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:
>
> Added function, fdt_setprop_reg(), will be used later to handle
> kexec-specific property in arm64's kexec_file implementation.
> It will possibly be merged into libfdt in the future.

You generally can't modify libfdt files. Any changes will be blown
away with the next dtc sync (there's one in -next now). Though here
you are creating a new location with fdt code. lib/ is just a shim to
the actual libfdt code. Don't put any implementation there. You can
add this to drivers/of/fdt_address.c for the short term, but it still
needs to go upstream.

Otherwise, the implementation looks fine to me.

> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> ---
>  include/linux/libfdt.h | 26 ++++++++++++++++++++
>  lib/Makefile           |  2 +-
>  lib/fdt_addresses.c    | 56 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 83 insertions(+), 1 deletion(-)
>  create mode 100644 lib/fdt_addresses.c
