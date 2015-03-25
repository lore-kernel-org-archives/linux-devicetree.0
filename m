From: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Subject: Re: [PATCH V6 15/25] MIPS: BMIPS: Flush the readahead cache after DMA
Date: Wed, 25 Mar 2015 10:23:58 +0100
Message-ID: <20150325092358.GA31933@linux-mips.org>
References: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
 <1419529760-9520-16-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1419529760-9520-16-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 25, 2014 at 09:49:10AM -0800, Kevin Cernekee wrote:

> BMIPS 3300/435x/438x CPUs have a readahead cache that is separate fro=
m
> the L1/L2.  During a DMA operation, accesses adjacent to a DMA buffer
> may cause parts of the DMA buffer to be prefetched into the RAC.  To
> avoid possible coherency problems, flush the RAC upon DMA completion.
>=20
> Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/mips/mm/dma-default.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/mips/mm/dma-default.c b/arch/mips/mm/dma-default.c
> index af5f046..38ee47a 100644
> --- a/arch/mips/mm/dma-default.c
> +++ b/arch/mips/mm/dma-default.c
> @@ -18,6 +18,7 @@
>  #include <linux/highmem.h>
>  #include <linux/dma-contiguous.h>
> =20
> +#include <asm/bmips.h>
>  #include <asm/cache.h>
>  #include <asm/cpu-type.h>
>  #include <asm/io.h>

Aside of platform-specific headers having no business of getting
included directly in a generic arch file, this also breaks the build
of many platforms:

  CC      arch/mips/mm/dma-default.o
In file included from arch/mips/mm/dma-default.c:21:0:
=2E/arch/mips/include/asm/bmips.h: In function =E2=80=98bmips_read_zscm=
_reg=E2=80=99:
=2E/arch/mips/include/asm/bmips.h:97:160: error: cast to pointer from i=
nteger of different size [-Werror=3Dint-to-pointer-cast]
  cache_op(Index_Load_Tag_S, ZSCM_REG_BASE + offset);
                                                                       =
                                                                       =
                  ^
=2E/arch/mips/include/asm/bmips.h: In function =E2=80=98bmips_write_zsc=
m_reg=E2=80=99:
=2E/arch/mips/include/asm/bmips.h:118:160: error: cast to pointer from =
integer of different size [-Werror=3Dint-to-pointer-cast]
  cache_op(Index_Store_Tag_S, ZSCM_REG_BASE + offset);

I think the broken platforms are all the 64 bit platforms.

  Ralf
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
