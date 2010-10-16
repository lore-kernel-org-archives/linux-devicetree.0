From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Change yyerror to use stdarg so we can give more
	descriptive errors.
Date: Fri, 15 Oct 2010 19:09:22 -0600
Message-ID: <20101016010921.GA13878@angua.secretlab.ca>
References: <20101016003239.3900.85967.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101016003239.3900.85967.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 15, 2010 at 05:33:04PM -0700, John Bonesio wrote:
> The subject pretty much says it all. The patch is to allow dtc to give more
> descriptive errors by having yyerror take a variable number of parameters
> printf style.
> 
> - John

Missing your Signed-off-by line.

One trivial comment below, but otherwise looks right to me.

> ---
> 
>  dtc-parser.y |   15 ++++++++++-----
>  srcpos.c     |   21 +++++++++++++--------
>  srcpos.h     |    2 ++
>  3 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 0aaf8e8..aa250f1 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -27,7 +27,7 @@
>  YYLTYPE yylloc;
>  
>  extern int yylex(void);
> -extern void yyerror(char const *s);
> +extern void yyerror(char const *fmt, ...);
>  
>  extern struct boot_info *the_boot_info;
>  extern int treesource_error;
> @@ -136,8 +136,8 @@ devicetree:
>  			if (target)
>  				merge_nodes(target, $3);
>  			else
> -				yyerror("label does not exist in "
> -					" node redefinition");
> +				yyerror("label, '%s' does not exist in"
> +					" node extension", $2);

Actually, the neither the original nor the new message is very
accurate.  How about simply:

"label '%s' does not exist"

or perhaps

"reference to non-existent label '%s'".

>  			$$ = $1;
>  		}
>  	;
> @@ -314,9 +314,14 @@ subnode:
>  
>  %%
>  
> -void yyerror(char const *s)
> +void yyerror(char const *fmt, ...)
>  {
> -	srcpos_error(&yylloc, "%s", s);
> +	va_list va;
> +
> +	va_start(va, fmt);
> +	srcpos_verror(&yylloc, fmt, va);
> +	va_end(va);
> +
>  	treesource_error = 1;
>  }
>  
> diff --git a/srcpos.c b/srcpos.c
> index 87d7f17..2dbc874 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -208,20 +208,25 @@ srcpos_string(struct srcpos *pos)
>  	return pos_str;
>  }
>  
> +void
> +srcpos_verror(struct srcpos *pos, char const *fmt, va_list va)
> +{
> +       const char *srcstr;
> +
> +       srcstr = srcpos_string(pos);
> +
> +       fprintf(stdout, "Error: %s ", srcstr);
> +       vfprintf(stdout, fmt, va);
> +       fprintf(stdout, "\n");
> +}
>  
>  void
>  srcpos_error(struct srcpos *pos, char const *fmt, ...)
>  {
> -	const char *srcstr;
>  	va_list va;
> -	va_start(va, fmt);
> -
> -	srcstr = srcpos_string(pos);
> -
> -	fprintf(stderr, "Error: %s ", srcstr);
> -	vfprintf(stderr, fmt, va);
> -	fprintf(stderr, "\n");
>  
> +	va_start(va, fmt);
> +	srcpos_verror(pos, fmt, va);
>  	va_end(va);
>  }
>  
> diff --git a/srcpos.h b/srcpos.h
> index 985f847..bd7966e 100644
> --- a/srcpos.h
> +++ b/srcpos.h
> @@ -76,6 +76,8 @@ extern struct srcpos *srcpos_copy(struct srcpos *pos);
>  extern char *srcpos_string(struct srcpos *pos);
>  extern void srcpos_dump(struct srcpos *pos);
>  
> +extern void srcpos_verror(struct srcpos *pos, char const *, va_list va)
> +     __attribute__((format(printf, 2, 0)));
>  extern void srcpos_error(struct srcpos *pos, char const *, ...)
>       __attribute__((format(printf, 2, 3)));
>  extern void srcpos_warn(struct srcpos *pos, char const *, ...)
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
