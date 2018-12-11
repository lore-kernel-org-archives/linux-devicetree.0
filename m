From: "AKASHI, Takahiro" <takahiro.akashi@linaro.org>
Subject: Re: [PATCH v16 06/16] lib: fdt: add a helper function for handling
 memory range property
Date: Tue, 11 Dec 2018 15:17:16 +0900
Message-ID: <20181211061715.GF21466@linaro.org>
References: <20181115055254.2812-1-takahiro.akashi@linaro.org>
 <20181115055254.2812-7-takahiro.akashi@linaro.org>
 <CAL_JsqL4_Z5pVfoB3opjL7eTzZvhBJW7_aQS443quAAR0gGH1w@mail.gmail.com>
 <20181206155424.GA4422@arm.com>
 <681e1265-2f0c-2a62-3778-09911b2be7fc@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <681e1265-2f0c-2a62-3778-09911b2be7fc@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morse <james.morse@arm.com>
Cc: Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, dyoung@redhat.com, Baoquan He <bhe@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, prudo@linux.ibm.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, bhsharma@redhat.com, kexec@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

James,

On Fri, Dec 07, 2018 at 10:12:47AM +0000, James Morse wrote:
> Hi Akashi, Will,
> 
> On 06/12/2018 15:54, Will Deacon wrote:
> > On Thu, Dec 06, 2018 at 08:47:04AM -0600, Rob Herring wrote:
> >> On Wed, Nov 14, 2018 at 11:52 PM AKASHI Takahiro
> >> <takahiro.akashi@linaro.org> wrote:
> >>>
> >>> Added function, fdt_setprop_reg(), will be used later to handle
> >>> kexec-specific property in arm64's kexec_file implementation.
> >>> It will possibly be merged into libfdt in the future.
> >>
> >> You generally can't modify libfdt files. Any changes will be blown
> >> away with the next dtc sync (there's one in -next now). Though here
> >> you are creating a new location with fdt code. lib/ is just a shim to
> >> the actual libfdt code. Don't put any implementation there. You can
> >> add this to drivers/of/fdt_address.c for the short term, but it still
> >> needs to go upstream.
> >>
> >> Otherwise, the implementation looks fine to me.
> > 
> > I agree, but I don't think there's a real need for us to hack
> > drivers/of/fdt_address.c in the meantime -- let's just target upstream
> > and not carry this in the kernel.
> > 
> > Akashi -- for now, I'll drop the kdump parts of this series which rely
> > on this helper. The majority of the series is actually independent and
> > can go in as-is.
> > 
> > I've pushed out a kexec branch to the arm64 tree for you to take a look
> > at:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=kexec
> 
> I gave this a quick spin. Without the elfcorehdr/usable-memory-range arm64 needs
> to explicitly forbid kdump via kexec_file_load. (like powerpc does already).

Thank you for pointing this out.

> Without this kdump works, but the second kernel overwrites the first as those DT
> properties are missing.
> 
> I'll post a patch momentarily,

Fine, but anyhow I'm going to submit a new version (*without* kdump),
I will fix the issue along with others.

-Takahiro Akashi


> 
> Thanks,
> 
> James
> 
