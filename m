From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 02/21] powerpc: use memblock functions returning virtual address
Date: Tue, 29 Jan 2019 20:52:17 +1100
Message-ID: <871s4vssdq.fsf@concordia.ellerman.id.au>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com> <1548057848-15136-3-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548057848-15136-3-git-send-email-rppt@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arml>
List-Id: devicetree@vger.kernel.org

Mike Rapoport <rppt@linux.ibm.com> writes:

> From: Christophe Leroy <christophe.leroy@c-s.fr>
>
> Since only the virtual address of allocated blocks is used,
> lets use functions returning directly virtual address.
>
> Those functions have the advantage of also zeroing the block.
>
> [ MR:
>  - updated error message in alloc_stack() to be more verbose
>  - convereted several additional call sites ]
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/powerpc/kernel/dt_cpu_ftrs.c |  3 +--
>  arch/powerpc/kernel/irq.c         |  5 -----
>  arch/powerpc/kernel/paca.c        |  6 +++++-
>  arch/powerpc/kernel/prom.c        |  5 ++++-
>  arch/powerpc/kernel/setup_32.c    | 26 ++++++++++++++++----------
>  5 files changed, 26 insertions(+), 19 deletions(-)

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
