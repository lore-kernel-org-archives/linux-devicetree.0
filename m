From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] devicetree: bindings: improve description for
 GPIO assisted NAND flash
Date: Tue, 4 Nov 2014 23:56:25 -0800
Message-ID: <20141105075625.GB22361@norris-Latitude-E6410>
References: <1407227846-3257-1-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1407227846-3257-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 05, 2014 at 10:37:25AM +0200, Gerhard Sittig wrote:
> Expand the description of the 'gpios' property in the GPIO assisted
> NAND flash binding, to explicitly list the required GPIO pin references
> and their order.
> 
> Update the example section to individually bracket the GPIO references,
> and capitalize the signal names for improved readability.
> 
> Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>

Applied both to l2-mtd.git.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
