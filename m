From: Bhupesh Sharma <bhsharma@redhat.com>
Subject: Re: [PATCH arm64/kexec] arm64: kexec_file: forbid kdump via kexec_file_load()
Date: Fri, 7 Dec 2018 20:56:53 +0530
Message-ID: <CACi5LpM9_bQnx+YqBcFqFbMWAmZoYtDwopuSq+NpOaX8tjak=g@mail.gmail.com>
References: <20181207101439.190918-1-james.morse@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207101439.190918-1-james.morse@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morse <james.morse@arm.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, kexec mailing list <kexec@lists.infradead.org>, Will Deacon <will.deacon@arm.com>, robh+dt@kernel.org, AKASHI Takahiro <takahiro.akashi@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, dhowells@redhat.com, Vivek Goyal <vgoyal@redhat.com>, herbert@gondor.apana.org.au, davem@davemloft.net, Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>, arnd@arndb.de, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, prudo@linux.ibm.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

Hi James,

On Fri, Dec 7, 2018 at 3:44 PM James Morse <james.morse@arm.com> wrote:
>
> Now that kexec_walk_memblock() can do the crash-kernel placement itself
> architectures that don't support kdump via kexe_file_load() need to
> explicitly forbid it.
>
> We don't support this on arm64 until the kernel can add the elfcorehdr
> and usable-memory-range fields to the DT. Without these the crash-kernel
> overwrites the previous kernel's memory during startup.
>
> Add a check to refuse crash image loading.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>
> Context: http://lore.kernel.org/r/20181206155424.GA4422@arm.com
>
>  arch/arm64/kernel/kexec_image.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
> index 1ad1d5f8f024..07bf740bea91 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c
> @@ -47,6 +47,10 @@ static void *image_load(struct kimage *image,
>         struct kexec_segment *kernel_segment;
>         int ret;
>
> +       /* We don't support crash kernels yet. */
> +       if (image->type == KEXEC_TYPE_CRASH)
> +               return ERR_PTR(-EOPNOTSUPP);
> +
>         /*
>          * We require a kernel with an unambiguous Image header. Per
>          * Documentation/booting.txt, this is the case when image_size
> --
> 2.19.2
>

TBH, I would have loved the complete 'kexec_file_load' support to have
made way upstream for arm64 as well, but I understand that it is stuck
till we have an agreement on the DT side of things. So, refusing a
crash image loading in such a case makes sense for now.

So, please feel free to add:
Reviewed-by: Bhupesh Sharma <bhsharma@redhat.com>

Thanks,
Bhupesh
