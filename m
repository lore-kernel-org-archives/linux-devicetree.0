From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/8] Enhance source position implementation.
Date: Wed, 24 Sep 2008 12:23:10 -0500
Message-ID: <48DA777E.40006@freescale.com>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>	<1222196652-13811-2-git-send-email-jdl@jdl.com>	<1222196652-13811-3-git-send-email-jdl@jdl.com>
	<1222196652-13811-4-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222196652-13811-4-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
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

Jon Loeliger wrote:
> +char *
> +srcpos_string(srcpos *pos)
> +{
> +#	define POS_BUF_SIZE	(100)
> +
> +	const char *fname;
> +	char buf[POS_BUF_SIZE];
> +
> +	if (pos->file && pos->file->name)
> +		fname = pos->file->name;
> +	else
> +		fname = "<no-file>";
> +
> +	if (pos->first_line == pos->last_line) {
> +		if (pos->first_column == pos->last_column) {
> +			snprintf(buf, POS_BUF_SIZE, "%s %d:%d",
> +				 fname, pos->first_line, pos->first_column);

Oh, another thing -- if the filename is over 100 characters (due to 
having directory components included, for example), this will cut off 
the most useful information (the line/column info), and the second most 
useful information (the end of the file name, rather than the leading 
path components).

If we wrote directly to a FILE *, this would be a non-issue.

-Scott
