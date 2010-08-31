From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] arch/powerpc/platforms/83xx/mpc837x_mds.c: Add missing
	iounmap
Date: Tue, 31 Aug 2010 16:39:11 -0500
Message-ID: <D97B05D5-3ABF-4B47-97C7-A3EC629A1987@kernel.crashing.org>
References: <1283111238-3129-1-git-send-email-julia@diku.dk>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1283111238-3129-1-git-send-email-julia-dAYI7NvHqcQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Aug 29, 2010, at 2:47 PM, Julia Lawall wrote:

> The function of_iomap returns the result of calling ioremap, so iounmap
> should be called on the result in the error handling code, as done in the
> normal exit of the function.
> 
> The sematic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r exists@
> local idexpression x;
> expression E,E1;
> identifier l;
> statement S;
> @@
> 
> *x = of_iomap(...);
> ...  when != iounmap(x)
>     when != if (...) { ... iounmap(x); ... }
>     when != E = x
>     when any
> (
> if (x == NULL) S
> |
> if (...) {
>  ... when != iounmap(x)
>      when != if (...) { ... iounmap(x); ... }
> (
>  return <+...x...+>;
> |
> *  return ...;
> )
> }
> )
> ... when != x = E1
>    when any
> iounmap(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
> 
> ---
> arch/powerpc/platforms/83xx/mpc837x_mds.c |    9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)

applied to merge

- k
