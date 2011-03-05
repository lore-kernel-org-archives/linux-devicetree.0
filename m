From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Make of_read_number() handle unaligned data
Date: Fri, 4 Mar 2011 22:20:45 -0700
Message-ID: <20110305052045.GK7579@angua.secretlab.ca>
References: <20110222223647.GA17406@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110222223647.GA17406-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 22, 2011 at 02:36:47PM -0800, David VomLehn wrote:
> Numeric values in properties can be unaligned, so introduce get_unaligned()
> in of_read_number() to make this work correctly on all processors.
> 
> Signed-off-by: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Hi David,

I've thought a lot about this change, (which is a big part of why it
has taken me so long to reply) and while the change itself doesn't
look problematic, I'm really bothered by the implications.  I really
don't like the binding that makes this change necessary.  Mixing cell
and string values is already troublesome.  Placing the cell after the
string so that alignment is wonky is doubly so.  (however, I am
working from memory here about the binding that requires this change.
Can you send it to me again, and I'll have a fresh look).

g.

> ---
>  include/linux/of.h |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index cad7cf0..a0a6925 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -22,6 +22,7 @@
>  #include <linux/spinlock.h>
>  
>  #include <asm/byteorder.h>
> +#include <asm/unaligned.h>
>  
>  #ifdef CONFIG_OF
>  
> @@ -110,8 +111,11 @@ extern void of_node_put(struct device_node *node);
>  static inline u64 of_read_number(const __be32 *cell, int size)
>  {
>  	u64 r = 0;
> -	while (size--)
> -		r = (r << 32) | be32_to_cpu(*(cell++));
> +	while (size--) {
> +		r = (r << 32) | be32_to_cpu(get_unaligned(cell));
> +		cell++;
> +	}
> +
>  	return r;
>  }
>  
