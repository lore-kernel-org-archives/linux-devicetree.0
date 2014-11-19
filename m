From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] drivers/core/of: Add symlink to device-tree from devices with an OF node
Date: Wed, 19 Nov 2014 09:38:13 +0100
Message-ID: <3422452.OFUjscQXRB@wuerfel>
References: <1415342031.4925.27.camel@kernel.crashing.org> <546BD8BD.2010605@au1.ibm.com> <1416364544.5704.23.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416364544.5704.23.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Jeremy Kerr <jeremy.kerr-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 19 November 2014 13:35:44 Benjamin Herrenschmidt wrote:
> On Wed, 2014-11-19 at 10:39 +1100, Jeremy Kerr wrote:
> > Hi Rob,
> > 
> > >> diff --git a/drivers/base/core.c b/drivers/base/core.c
> > >> index 20da3ad..8c7b607 100644
> > >> --- a/drivers/base/core.c
> > >> +++ b/drivers/base/core.c
> > >> @@ -493,6 +493,15 @@ static int device_add_attrs(struct device *dev)
> > >>                         goto err_remove_dev_groups;
> > >>         }
> > >>
> > >> +#ifdef CONFIG_OF
> > >> +       if (dev->of_node) {
> > > 
> > > if (IS_ENABLED(CONFIG_OF) && dev->of_node)
> > 
> > struct device doesn't have an of_node member if !CONFIG_OF, so we'll
> > need to disable this block in the preprocessor.
> 
> Actually that's no longer the case since 2.6.39 afaik 

I wonder if we should create a small helper for this, like

static inline struct device_node *dev_of_node(struct device *of_node)
{
	if (!IS_ENABLED(CONFIG_OF))
		return NULL;

	return dev->of_node;
}

Adding the IS_ENABLED() in a lot of drivers isn't horrible, but we seem
to be doing it a lot.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
