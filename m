From: "WALID" <eng.walid-W8OjrA9bE4VWk0Htik3J/w@public.gmane.org>
Subject: RE: Re: [PATCH 3/9] of: protect linux/of.h with CONFIG_OF
Date: Sun, 14 Feb 2010 09:13:57 +0200
Message-ID: <32616.31135033$1266132178@news.gmane.org>
References: <20100213154838.4767.83881.stgit@angua>	 <20100213160242.4767.57641.stgit@angua> <1266127834.16346.60.camel@pasglop>
Reply-To: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org>
In-Reply-To: <1266127834.16346.60.camel@pasglop>
Content-Language: ar-sy
Sender: owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org
To: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, 'Grant Likely' <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Please remove my email from your mailing list!!!!!!!

-----Original Message-----
From: owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org [mailto:owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org] On Behalf Of Benjamin Herrenschmidt
Sent: Sunday, February 14, 2010 8:11 AM
To: Grant Likely
Cc: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org; sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org; jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org; davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org; microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org; linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org; sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: [microblaze-uclinux] Re: [PATCH 3/9] of: protect linux/of.h with CONFIG_OF

On Sat, 2010-02-13 at 09:02 -0700, Grant Likely wrote:
> From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> 
> For platforms that have CONFIG_OF optional, we need to make the contents
> of linux/of.h conditional on CONFIG_OF.
> 
> Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Acked-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

For now...

In the long run, maybe we want some of the iterators to be empty inlines
returning NULL ?

Cheers,
Ben.

> ---
> 
>  include/linux/of.h |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 5c7b6a6..48b0ee6 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -22,6 +22,8 @@
>  
>  #include <asm/byteorder.h>
>  
> +#ifdef CONFIG_OF
> +
>  typedef u32 phandle;
>  typedef u32 ihandle;
>  
> @@ -194,4 +196,5 @@ extern void of_attach_node(struct device_node *);
>  extern void of_detach_node(struct device_node *);
>  #endif
>  
> +#endif /* CONFIG_OF */
>  #endif /* _LINUX_OF_H */


___________________________
microblaze-uclinux mailing list
microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Project Home Page : http://www.itee.uq.edu.au/~jwilliams/mblaze-uclinux
Mailing List Archive : http://www.itee.uq.edu.au/~listarch/microblaze-uclinux/
