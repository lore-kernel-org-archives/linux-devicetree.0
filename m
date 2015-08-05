From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: of: dynamic: resource: add WARN in release_resource for DT
 overlays
Date: Wed, 5 Aug 2015 14:04:05 -0700
Message-ID: <20150805140405.20ab09354f4123c561096eb8@linux-foundation.org>
References: <[PATCH v3 0/7] Introducing (yet again) Device Tree Overlays>
	<1438262237-30889-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438262237-30889-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Jul 2015 15:17:16 +0200 Robert ABEL <rabel@cit-ec.uni-bielefeld.de> wrote:

> 
> This patch prevents a kernel OOPS when removing a DT overlay containing
> nodes with reg properties. release_resources is called for these nodes.
> However, the resource structs were never initialized, hence the kernel OOPS.
> 
> This is obviously a stopgap measure until a proper solution is coded, see [1].
> 
> 
> [1]: https://lkml.org/lkml/2014/4/17/359
>
> ...
>
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -236,6 +236,13 @@ static int __release_resource(struct resource *old)
>  {
>  	struct resource *tmp, **p;
>  
> +    /* devicetree overlays:
> +     * of code doesn't initialize parent, child, sibling
> +     * gracefully 'do the right thing' here
> +     */
> +	if (WARN(!old->parent, "%s: uninitialized resource %s\n", __FUNCTION__, old->name))
> +		return 0;
> +
>  	p = &old->parent->child;
>  	for (;;) {
>  		tmp = *p;

Can we please have a (much) better changelog for this?  Don't ask
people to go off and trawl through lkml.org threads (especially as
lkml.org seems to be down half the time).

What precisely is causing the crash, what are the plans to fix it, why
do we need a stopgap rather than fixing it properly, etc.

Why not put the workaround at the offending call site (whereever that
is?) rather than in the callee?
