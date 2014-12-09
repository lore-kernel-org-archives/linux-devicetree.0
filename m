From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] arch: powerpc: kernel: vio.c:  Remove unused function
Date: Tue, 09 Dec 2014 16:29:57 +1100
Message-ID: <1418102997.527.3.camel@concordia>
References: <1417991502-20223-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417991502-20223-1-git-send-email-rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rickard Strandqvist <rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Daniel Walter <dwalter-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Li Zhong <zhong-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2014-12-07 at 23:31 +0100, Rickard Strandqvist wrote:
> Remove the function cmo_high_show() that is not used anywhere.
> 
> This was partially found by using a static code analysis program called cppcheck.
> 
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>
> ---
>  arch/powerpc/kernel/vio.c |    5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/vio.c b/arch/powerpc/kernel/vio.c
> index 5bfdab9..11657d2 100644
> --- a/arch/powerpc/kernel/vio.c
> +++ b/arch/powerpc/kernel/vio.c
> @@ -1032,11 +1032,6 @@ viobus_cmo_pool_rd_attr(reserve, size);
>  viobus_cmo_pool_rd_attr(excess, size);
>  viobus_cmo_pool_rd_attr(excess, free);
>  
> -static ssize_t cmo_high_show(struct bus_type *bt, char *buf)
> -{
> -	return sprintf(buf, "%lu\n", vio_cmo.high);
> -}


from ../arch/powerpc/kernel/vio.c:17:
../arch/powerpc/kernel/vio.c:1046:20: error: 'cmo_high_show' undeclared here (not in a function)
static BUS_ATTR_RW(cmo_high);
^
../include/linux/sysfs.h:76:10: note: in definition of macro '__ATTR'
.show = _show,      \
^
../include/linux/device.h:53:42: note: in expansion of macro '__ATTR_RW'
struct bus_attribute bus_attr_##_name = __ATTR_RW(_name)
^
../arch/powerpc/kernel/vio.c:1046:8: note: in expansion of macro 'BUS_ATTR_RW'
static BUS_ATTR_RW(cmo_high);
^

cheers


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
