From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: Use yylloc instead of yyloc
Date: Wed, 11 Nov 2009 21:42:59 -0600
Message-ID: <E1N8QaJ-00031X-GU@jdl.com>
References: <20091112001404.GI3235@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20091112001404.GI3235-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org> 
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
Cc: Lukasz Wojcik <zbr-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Jon, fix for the typo the FreeBSD folks noticed.  Please apply.
> 
> yylloc is the correct way to get token positioning information.  yyloc
> is a bison internal variable that only works by accident.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> 
> Index: dtc/dtc-parser.y
> ===================================================================
> --- dtc.orig/dtc-parser.y	2009-11-12 11:11:15.000000000 +1100
> +++ dtc/dtc-parser.y	2009-11-12 11:11:20.000000000 +1100
> @@ -175,7 +175,7 @@ propdata:
>  
>  			if ($6 != 0)
>  				if (fseek(file->file, $6, SEEK_SET) != 0)
> -					srcpos_error(&yyloc,
> +					srcpos_error(&yylloc,
>  						     "Couldn't seek to offset %
> llu in \"%s\": %s",
>  						     (unsigned long long)$6,
>  						     $4.val,
> 
> 

Applied.

jdl
