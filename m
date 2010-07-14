From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: Fix a filehandle leak
Date: Wed, 14 Jul 2010 17:31:38 -0500
Message-ID: <E1OZAUM-0007wJ-A8@jdl.com>
References: <20100714061056.GE23242@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20100714061056.GE23242@yookeroo> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> From: Martin Ettl <ettl.martin-Mmb7MZpHnFY@public.gmane.org>
> 
> During a check of the current git head of the linux kernel with the
> static code analysis tool cppcheck
> (http://sourceforge.net/apps/mediawiki/cppcheck/index.php?title=Main_Page)
> the tool discovered a resource leak in linux-2.6/scripts/dtc/fstree.c.
> 
> Please refer the attached patch, that fixes the issue.
> 
> Fixes https://bugzilla.kernel.org/show_bug.cgi?id=15363
> 
> Signed-off-by: Martin Ettl <ettl.martin-Mmb7MZpHnFY@public.gmane.org>
> Signed-off-by: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> 
> ---
> 
> Jon, please apply.
> 
>  scripts/dtc/fstree.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/dtc/fstree.c b/scripts/dtc/fstree.c
> index 766b269..8fe1bdf 100644
> --- a/scripts/dtc/fstree.c
> +++ b/scripts/dtc/fstree.c
> @@ -77,6 +77,7 @@ static struct node *read_fstree(const char *dirname)
>  		free(tmpnam);
>  	}
>  
> +	closedir(d);
>  	return tree;
>  }
>  
> -- 
> 1.7.1
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _ot
> her_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

Applied -p 3.

jdl
