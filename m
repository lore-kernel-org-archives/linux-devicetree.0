From: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v8] mtd: nand: add tango NAND flash controller support
Date: Fri, 11 Nov 2016 17:01:52 +0100
Message-ID: <5825EB70.4070406@free.fr>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B37.5090100@sigmadesigns.com> <580F8407.5070706@sigmadesigns.com>
 <20161106235812.0bcbbdc5@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161106235812.0bcbbdc5@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, linux-mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/11/2016 23:58, Boris Brezillon wrote:

> Applied after fixing a few coding style issues to make checkpatch happy.

First of all, I want to thank you for all the help you provided
along the way.

I have to admit that I'm a bit frustrated by some of the changes you made
to the patch.

Specifically, changing

from:  if (ptr_expr == NULL)
  to:  if (!ptr_expr)

I dislike the second form, because it "hides" what is being tested.
I've even seen people use !count to mean count == 0, and I find that
very unintuitive.

I also have a hard time discerning a '!' after a '('


The other change is the chip->options initialization. I thought
you said on IRC I could keep my preferred formatting.


In the end, these are tiny issues in the grand scheme of things,
but it was important for me to point them out.

Regards.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
