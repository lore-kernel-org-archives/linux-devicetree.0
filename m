From: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/8] Add conditionalized debug() print macro.
Date: Thu, 25 Sep 2008 08:42:44 -0400
Message-ID: <20080925084244.27191e11@zod.rchland.ibm.com>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>
	<1222196652-13811-2-git-send-email-jdl@jdl.com>
	<1222196652-13811-3-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222196652-13811-3-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 23 Sep 2008 14:04:06 -0500
Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:

> From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  dtc.h |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/dtc.h b/dtc.h
> index 08d54c8..ec636f8 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -34,7 +34,15 @@
>  #include <libfdt_env.h>
>  #include <fdt.h>
> 
> +#ifdef DEBUG
> +#define debug(fmt,args...)	printf(fmt, ##args)
> +#else
> +#define debug(fmt,args...)
> +#endif
> +
> +

So, not to be nitpicky, but this requires a rebuild of dtc with -DDEBUG
(or similar) to get the debug output.

Would it be better to have it just take a --debug option on the command
line and conditionalize on a global variable?  dtc isn't exactly a
performance crazy application, so the if checks shouldn't matter too
much.

josh
