From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv2 6/7] ARM: socfpga: Enable Arria10 OCRAM ECC on
 startup
Date: Tue, 5 Apr 2016 13:37:49 -0500
Message-ID: <alpine.DEB.2.02.1604051333070.32718@linux-builds1>
References: <1459450087-24792-1-git-send-email-tthayer@opensource.altera.com> <1459450087-24792-7-git-send-email-tthayer@opensource.altera.com> <57034C4D.9010204@opensource.altera.com> <20160405053110.GA17541@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160405053110.GA17541-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 5 Apr 2016, Borislav Petkov wrote:

> On Tue, Apr 05, 2016 at 12:25:33AM -0500, Thor Thayer wrote:
> > I realize that I'm not calling iounmap(ecc_block_base) and I'll fix that in
> > the next revision with a goto.
> 
> I'm assuming nothing else changes. Because I've applied 1-4 already.
> 
> Yes, no?
> 
> If no, then please send only an updated version of this patch as a reply
> to this thread here.
> 

My only suggestion was to change the 3 helper functions(ecc_set_bits,
ecc_clear_bits, and ecc_test_bits) should be static inline.

So with that change:

Acked-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

BR,
Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
