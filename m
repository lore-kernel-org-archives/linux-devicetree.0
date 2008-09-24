From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/8] Enhance source position implementation.
Date: Wed, 24 Sep 2008 12:17:35 -0500
Message-ID: <1222276655.11692.18.camel@ld0161-tx32>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>
	<1222196652-13811-2-git-send-email-jdl@jdl.com>
	<1222196652-13811-3-git-send-email-jdl@jdl.com>
	<1222196652-13811-4-git-send-email-jdl@jdl.com>
	<48DA73DA.5000603@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <48DA73DA.5000603-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2008-09-24 at 12:07 -0500, Scott Wood wrote:

> > +char *
> > +srcpos_string(srcpos *pos)
> > +{
> > +#	define POS_BUF_SIZE	(100)
> 
> Local #defines make $YOUTHFUL_DEITY_OFFSPRING cry (and the whitespace 
> after the # doesn't help).  Declare a "const int", or just use sizeof(buf).

Sigh.

> 
> Seems a little elaborate;

...and yet clear.

>  are there cases where reporting the 
> line/column of the first character of the token is not clear?

Yes.

> > +	return strdup(buf);
> 
> Why not just dynamically allocate the buffer in the first place?  Or if 
> you care about the memory wastage (which you probably don't, given that 
> you just leak the allocated string in the callers in later patches), 
> make this function take a FILE * to output to, rather than return an 
> allocated string.

Well, it was really a more general formatting routine.
It may not always directly be output directly to a FILE.

So, maybe there is some room for improvement or optimization
in the future...

jdl
