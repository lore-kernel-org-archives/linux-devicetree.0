From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/5] nds32: Fix bug in bitfield.h
Date: Thu, 18 Oct 2018 15:26:31 +0100
Message-ID: <20181018142622.p3hrrymexubkkuf5@lakrids.cambridge.arm.com>
References: <cover.1539745993.git.nickhu@andestech.com>
 <6702edd2853db9a475853a9b8d00b5aacf546bb2.1539745993.git.nickhu@andestech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6702edd2853db9a475853a9b8d00b5aacf546bb2.1539745993.git.nickhu@andestech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nickhu <nickhu@andestech.com>
Cc: greentime@andestech.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, deanbo422@gmail.com, peterz@infradead.org, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, arnd@arndb.de, sboyd@codeaurora.org, geert@linux-m68k.org, zong@andestech.com, ebiederm@xmission.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org, pombredanne@nexb.com, tglx@linutronix.de, kstewart@linuxfoundation.org, devicetree@vger.kernel.org, green.hu@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2018 at 04:43:14PM +0800, Nickhu wrote:
> There two bitfield bug for perfomance counter
> in bitfield.h:
> 
> 	PFM_CTL_offSEL1		21 --> 16
> 	PFM_CTL_offSEL2		27 --> 22
> 
> This commit fix it.
> 
> Signed-off-by: Nickhu <nickhu@andestech.com>

This patch should probably be move before the patch adding perf support.
That way, perf support isn't broken at the point it is added.

Thanks,
Mark.

> ---
>  arch/nds32/include/asm/bitfield.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/nds32/include/asm/bitfield.h b/arch/nds32/include/asm/bitfield.h
> index 8e84fc385b94..19b2841219ad 100644
> --- a/arch/nds32/include/asm/bitfield.h
> +++ b/arch/nds32/include/asm/bitfield.h
> @@ -692,8 +692,8 @@
>  #define PFM_CTL_offKU1		13	/* Enable user mode event counting for PFMC1 */
>  #define PFM_CTL_offKU2		14	/* Enable user mode event counting for PFMC2 */
>  #define PFM_CTL_offSEL0		15	/* The event selection for PFMC0 */
> -#define PFM_CTL_offSEL1		21	/* The event selection for PFMC1 */
> -#define PFM_CTL_offSEL2		27	/* The event selection for PFMC2 */
> +#define PFM_CTL_offSEL1		16	/* The event selection for PFMC1 */
> +#define PFM_CTL_offSEL2		22	/* The event selection for PFMC2 */
>  /* bit 28:31 reserved */
>  
>  #define PFM_CTL_mskEN0		( 0x01  << PFM_CTL_offEN0 )
> -- 
> 2.17.0
> 
