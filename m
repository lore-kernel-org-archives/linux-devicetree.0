From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx7d: cl-som-imx7: add basic module support
Date: Mon, 21 Dec 2015 21:59:59 +0800
Message-ID: <20151221135959.GA18858@tiger>
References: <20151208151401.GA20042@rob-hp-laptop>
 <1449756097-2921-1-git-send-email-grinberg@compulab.co.il>
 <20151214024315.GC25756@tiger>
 <56716EA4.2080107@compulab.co.il>
 <20151221063608.GB4703@tiger>
 <5677B341.6040203@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5677B341.6040203-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 21, 2015 at 10:07:29AM +0200, Igor Grinberg wrote:
> >> Do you think we should document it in:
> >> Documentation/devicetree/bindings/arm/compulab-boards.txt
> >> (this file should already exist in arm-soc/next/dt)?
> > 
> > Yeah, if the file already exist, it's the best option.  But, as it
> > doesn't exist on my tree, I can not apply this change.
> 
> It is already in linux-next.
> Who do you think should apply the v2 patch then?
> May be the arm-soc guys? (Cc'ed Olof and Arnd)

I think you can leave out the change from the patch, so that I can
apply.  And you send that change separately to arm-soc folks.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
