From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/3] ARM: zImage: ensure it is always a multiple of 64
	bits in size
Date: Mon, 13 Jun 2011 03:43:05 -0700
Message-ID: <20110613104305.GC10951@atomide.com>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<1307858800-16712-2-git-send-email-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1307858800-16712-2-git-send-email-nicolas.pitre@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: John Bonesio <bones@secretlab.ca>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

* Nicolas Pitre <nicolas.pitre@linaro.org> [110611 23:02]:
> This is needed for proper alignment when the DTB appending feature
> is used.
> 
> Signed-off-by: Nicolas Pitre <nicolas.pitre@linaro.org>

Acked-by: Tony Lindgren <tony@atomide.com>

> ---
>  arch/arm/boot/compressed/vmlinux.lds.in |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/compressed/vmlinux.lds.in b/arch/arm/boot/compressed/vmlinux.lds.in
> index ea80abe..6c02db1 100644
> --- a/arch/arm/boot/compressed/vmlinux.lds.in
> +++ b/arch/arm/boot/compressed/vmlinux.lds.in
> @@ -47,6 +47,9 @@ SECTIONS
>    .got			: { *(.got) }
>    _got_end = .;
>    .got.plt		: { *(.got.plt) }
> +
> +  /* ensure the zImage file size is always a multiple of 64 bits */
> +  .pad			: { BYTE(0); . = ALIGN(8); }
>    _edata = .;
>  
>    . = BSS_START;
> -- 
> 1.7.4
> 
