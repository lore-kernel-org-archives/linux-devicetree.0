From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] scripts: dtc: fix compile warnings
Date: Sat, 24 Mar 2012 17:38:03 -0700
Message-ID: <20120325003803.225FE3E0140@localhost>
References: <1327576807-19216-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4216084942972383091=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1327576807-19216-1-git-send-email-balbi-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: mmarek-AlSwsSmVLrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============4216084942972383091==
Content-Type: text/plain

On Thu, 26 Jan 2012 13:20:07 +0200, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> Fix following compile warnings:
> 
> scripts/dtc/flattree.c: In function ‘flat_read_mem_reserve’:
> scripts/dtc/flattree.c:700:14: warning: variable ‘p’ set but not used
> 	[-Wunused-but-set-variable]
> 
> scripts/dtc/dtc.c: In function ‘main’:
> scripts/dtc/dtc.c:104:17: warning: variable ‘check’ set but not used
> 	[-Wunused-but-set-variable]
> 
> Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

Need to instead update dtc to the latest sources from the upstream dtc
repository.  I've not had time to do it; would you like to take a
look?

g.

> ---
>  scripts/dtc/dtc.c      |    5 +----
>  scripts/dtc/flattree.c |    2 --
>  2 files changed, 1 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/dtc/dtc.c b/scripts/dtc/dtc.c
> index 451c92d..2ef5e2e 100644
> --- a/scripts/dtc/dtc.c
> +++ b/scripts/dtc/dtc.c
> @@ -101,7 +101,7 @@ int main(int argc, char *argv[])
>  	const char *outform = "dts";
>  	const char *outname = "-";
>  	const char *depname = NULL;
> -	int force = 0, check = 0, sort = 0;
> +	int force = 0, sort = 0;
>  	const char *arg;
>  	int opt;
>  	FILE *outf = NULL;
> @@ -143,9 +143,6 @@ int main(int argc, char *argv[])
>  		case 'f':
>  			force = 1;
>  			break;
> -		case 'c':
> -			check = 1;
> -			break;
>  		case 'q':
>  			quiet++;
>  			break;
> diff --git a/scripts/dtc/flattree.c b/scripts/dtc/flattree.c
> index ead0332..28d0b23 100644
> --- a/scripts/dtc/flattree.c
> +++ b/scripts/dtc/flattree.c
> @@ -697,7 +697,6 @@ static struct reserve_info *flat_read_mem_reserve(struct inbuf *inb)
>  {
>  	struct reserve_info *reservelist = NULL;
>  	struct reserve_info *new;
> -	const char *p;
>  	struct fdt_reserve_entry re;
>  
>  	/*
> @@ -706,7 +705,6 @@ static struct reserve_info *flat_read_mem_reserve(struct inbuf *inb)
>  	 *
>  	 * First pass, count entries.
>  	 */
> -	p = inb->ptr;
>  	while (1) {
>  		flat_read_chunk(inb, &re, sizeof(re));
>  		re.address  = fdt64_to_cpu(re.address);
> -- 
> 1.7.8.2
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies,Ltd.

--===============4216084942972383091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4216084942972383091==--
