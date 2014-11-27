From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 2/2] m32r: Add missing big-endian I/O accessors
Date: Thu, 27 Nov 2014 22:48:56 +0100
Message-ID: <3837177.boLNi8fnoI@wuerfel>
References: <1417112193-14400-1-git-send-email-cernekee@gmail.com> <1417112193-14400-2-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417112193-14400-2-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 27 November 2014 10:16:33 Kevin Cernekee wrote:
> m32r doesn't use GENERIC_IOMAP, and it doesn't currently implement e.g.
> ioread32be() on its own.  Add definitions to <asm/io.h> to fix build
> failures in common drivers that use these functions.
> 
>    drivers/tty/serial/8250/8250_core.c: In function 'mem32be_serial_out':
> >> drivers/tty/serial/8250/8250_core.c:434:2: error: implicit declaration of function 'iowrite32be' [-Werror=implicit-function-declaration]
>      iowrite32be(value, p->membase + offset);
>      ^
>    drivers/tty/serial/8250/8250_core.c: In function 'mem32be_serial_in':
> >> drivers/tty/serial/8250/8250_core.c:440:2: error: implicit declaration of function 'ioread32be' [-Werror=implicit-function-declaration]
>      return ioread32be(p->membase + offset);
>      ^
>    cc1: some warnings being treated as errors
> 
> Compile-tested only.
> 
> Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 

Both patches

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
