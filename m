From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] drivers: of: Fix of_pci.h header guard
Date: Wed, 8 Jun 2016 08:19:40 -0500
Message-ID: <20160608131940.GA8455@rob-hp-laptop>
References: <cf20413cea1895fd005bf27460fe649000c09e02.1465321392.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cf20413cea1895fd005bf27460fe649000c09e02.1465321392.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 07, 2016 at 06:44:48PM +0100, Robin Murphy wrote:
> The compilation of of_pci.c is governed by CONFIG_OF_PCI, but the
> corresponding declarations in of_pci.h are inconsistently guarded by
> CONFIG_OF, with the result that if CONFIG_PCI is disabled for an OF
> platform, the dangling external declarations are still active and the
> inline stub definitions not. So far this has managed to go unnoticed
> since it happens that the only references to these functions are from
> code which itself depends on CONFIG_PCI or CONFIG_OF_PCI.
> 
> Fix this with the appropriate config guard so that any new callers
> outside PCI-specific code don't start unexpectedly breaking under
> certain configs.
> 
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> ---
>  include/linux/of_pci.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
