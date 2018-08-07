From: Scott Wood <oss@buserror.net>
Subject: Re: [RFC 5/5] powerpc/fsl: Add supported-irq-ranges for P2020
Date: Tue, 07 Aug 2018 16:13:58 -0500
Message-ID: <ab2a113620123cb71364b6ae89328ae2fca49821.camel@buserror.net>
References: <1532684881-19310-1-git-send-email-Bharat.Bhushan@nxp.com>
         <1532684881-19310-6-git-send-email-Bharat.Bhushan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532684881-19310-6-git-send-email-Bharat.Bhushan@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bharat Bhushan <Bharat.Bhushan@nxp.com>, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, galak@kernel.crashing.org, mark.rutland@arm.com, kstewart@linuxfoundation.org, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: robh@kernel.org, keescook@chromium.org, tyreld@linux.vnet.ibm.com, joe@perches.com
List-Id: devicetree@vger.kernel.org

On Fri, 2018-07-27 at 15:18 +0530, Bharat Bhushan wrote:
> MPIC on NXP (Freescale) P2020 supports following irq
> ranges:
>   > 0 - 11      (External interrupt)
>   > 16 - 79     (Internal interrupt)
>   > 176 - 183   (Messaging interrupt)
>   > 224 - 231   (Shared message signaled interrupt)

Why don't you convert to the 4-cell interrupt specifiers that make dealing
with these ranges less error-prone?

> diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> index 1006950..49ff348 100644
> --- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> +++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
> @@ -57,6 +57,11 @@ void __init mpc85xx_rdb_pic_init(void)
>  			MPIC_BIG_ENDIAN |
>  			MPIC_SINGLE_DEST_CPU,
>  			0, 256, " OpenPIC  ");
> +	} else if (of_machine_is_compatible("fsl,P2020RDB-PC")) {
> +		mpic = mpic_alloc(NULL, 0,
> +		  MPIC_BIG_ENDIAN |
> +		  MPIC_SINGLE_DEST_CPU,
> +		  0, 0, " OpenPIC  ");
>  	} else {
>  		mpic = mpic_alloc(NULL, 0,
>  		  MPIC_BIG_ENDIAN |

I don't think we want to grow a list of every single revision of every board
in these platform files.

-Scott
