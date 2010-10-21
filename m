From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/4] Create new and use new print_error that uses
	printf style formatting.
Date: Wed, 20 Oct 2010 22:44:10 -0600
Message-ID: <20101021044410.GD13335@angua.secretlab.ca>
References: <20101020214419.2985.51068.stgit@riker>
	<20101020214457.2985.90434.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101020214457.2985.90434.stgit@riker>
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

On Wed, Oct 20, 2010 at 02:44:58PM -0700, John Bonesio wrote:
> yyerror is meant to be called by the parser internal code, and it's interface
> is limited. Instead create and call a new error message routine that allows
> formatted strings to be used.
> 
> yyerror uses the new routine so error formatting remains consistent.
> 
> Signed-of-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Picked up and pushed out to my git tree.  Jon is a little tied up for
the moment, so I'll maintain a working tree at
git://git.secretlab.ca/git/dtc.git until we've got this work finished
and we can ask him to merge it.

g.

> ---
> 
>  dtc-parser.y |   28 ++++++++++++++++++----------
>  srcpos.c     |   21 +++++++++++++--------
>  srcpos.h     |    2 ++
>  3 files changed, 33 insertions(+), 18 deletions(-)
> 
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 0aaf8e8..b58ba8e 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -27,6 +27,7 @@
>  YYLTYPE yylloc;
>  
>  extern int yylex(void);
> +extern void print_error(char const *fmt, ...);
>  extern void yyerror(char const *s);
>  
>  extern struct boot_info *the_boot_info;
> @@ -136,8 +137,7 @@ devicetree:
>  			if (target)
>  				merge_nodes(target, $3);
>  			else
> -				yyerror("label does not exist in "
> -					" node redefinition");
> +				print_error("label, '%s' not found", $2);
>  			$$ = $1;
>  		}
>  	;
> @@ -200,8 +200,7 @@ propdata:
>  
>  			if ($6 != 0)
>  				if (fseek(f, $6, SEEK_SET) != 0)
> -					srcpos_error(&yylloc,
> -						     "Couldn't seek to offset %llu in \"%s\": %s",
> +					print_error("Couldn't seek to offset %llu in \"%s\": %s",
>  						     (unsigned long long)$6,
>  						     $4.val,
>  						     strerror(errno));
> @@ -295,7 +294,7 @@ subnodes:
>  		}
>  	| subnode propdef
>  		{
> -			yyerror("syntax error: properties must precede subnodes");
> +			print_error("syntax error: properties must precede subnodes");
>  			YYERROR;
>  		}
>  	;
> @@ -314,12 +313,21 @@ subnode:
>  
>  %%
>  
> -void yyerror(char const *s)
> +void print_error(char const *fmt, ...)
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
> +void yyerror(char const *s) {
> +	print_error("%s", s);
> +}
> +
>  static unsigned long long eval_literal(const char *s, int base, int bits)
>  {
>  	unsigned long long val;
> @@ -328,11 +336,11 @@ static unsigned long long eval_literal(const char *s, int base, int bits)
>  	errno = 0;
>  	val = strtoull(s, &e, base);
>  	if (*e)
> -		yyerror("bad characters in literal");
> +		print_error("bad characters in literal");
>  	else if ((errno == ERANGE)
>  		 || ((bits < 64) && (val >= (1ULL << bits))))
> -		yyerror("literal out of range");
> +		print_error("literal out of range");
>  	else if (errno != 0)
> -		yyerror("bad literal");
> +		print_error("bad literal");
>  	return val;
>  }
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
