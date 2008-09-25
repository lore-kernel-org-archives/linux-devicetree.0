From: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 8/8] Add documentation for the new DTS language.
Date: Thu, 25 Sep 2008 09:00:02 -0400
Message-ID: <20080925090002.61c38b13@zod.rchland.ibm.com>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>
	<1222196652-13811-2-git-send-email-jdl@jdl.com>
	<1222196652-13811-3-git-send-email-jdl@jdl.com>
	<1222196652-13811-4-git-send-email-jdl@jdl.com>
	<1222196652-13811-5-git-send-email-jdl@jdl.com>
	<1222196652-13811-6-git-send-email-jdl@jdl.com>
	<1222196652-13811-7-git-send-email-jdl@jdl.com>
	<1222196652-13811-8-git-send-email-jdl@jdl.com>
	<1222196652-13811-9-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222196652-13811-9-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
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

On Tue, 23 Sep 2008 14:04:12 -0500
Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:

> +4.1) DTS Lexical Components
> +
> +Property and node names		[a-zA-Z0-9,._+*#?@-]+
> +Identifiers			\\[a-zA-Z_][a-zA-Z0-9_]*
> +Labels				[a-zA-Z_][a-zA-Z0-9_]*
> +Strings				<C-style-double-quoted-strings>
> +Comments			Both /* ... */ and // style are supported
> +Numeric literals		<C-style-integer-numbers>
> +Bytes				[0-9a-fA-F][0-9a-fA-F]
> +
> +Keywords:
> +	else
> +	for
> +	if
> +	in
> +	return
> +	void
> +	/const/
> +	/define/
> +	/incbin/
> +
> +C-style expression operators:
> +	<<
> +	>>
> +	<=
> +	>=
> +	==
> +	!=
> +	&&
> +	||
> +	+
> +	-
> +	*
> +	/
> +	%
> +
> +Additional tokens:
> +	..
> +	:=
> +	{
> +	}
> +	,
> +	&
> +

You have ^, &, |, <, >, ~, (, and ) listed in the "expr_oper:" part of
the DTS grammar below this, but none of those are included here.

Which list is complete/correct?

josh
