From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] m32r: Add missing big-endian I/O accessors
Date: Thu, 27 Nov 2014 18:52:58 +0100
Message-ID: <75201216.LyHlPqmjDS@wuerfel>
References: <1417110404-13297-1-git-send-email-cernekee@gmail.com> <1417110404-13297-2-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417110404-13297-2-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 27 November 2014 09:46:44 Kevin Cernekee wrote:
>  #define iowrite32 writel
>  
> +#define ioread16be(addr)       be16_to_cpu(readw(addr))
> +#define ioread32be(addr)       be32_to_cpu(readl(addr))
> +#define iowrite16be(val, addr) writew(cpu_to_be16(val), addr)
> +#define iowrite32be(val, addr) writel(cpu_to_be32(val), addr)
> +
> 

m32r can be either little-endian or big-endian, so these need to
unconditionally swap instead.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
