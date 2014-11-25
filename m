From: Ian Campbell <ijc-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: support passing console options with stdout-path
Date: Tue, 25 Nov 2014 15:41:52 +0000
Message-ID: <1416930112.11944.2.camel@debian.org>
References: <1416867838-18652-1-git-send-email-leif.lindholm@linaro.org>
	 <20141125145854.A46EDC44343@trevor.secretlab.ca>
	 <20141125151515.GG2361@bivouac.eciton.net>
	 <CACxGe6v2i3iJGjK9s6HSBxV6bUwVrAtGYj=FAOb0AFEx3KVYEg@mail.gmail.com>
	 <1416929071.16769.1.camel@debian.org>
	 <CACxGe6vekjF4M0J4s7g2Q_E-KYUrT_3Pna2z6nobSMZ7bc8Bhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6vekjF4M0J4s7g2Q_E-KYUrT_3Pna2z6nobSMZ7bc8Bhw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-11-25 at 15:39 +0000, Grant Likely wrote:
> On Tue, Nov 25, 2014 at 3:24 PM, Ian Campbell <ijc-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> >> sed s/of_find_node_by_path\((.*)\)/of_find_node_by_path\(\1, NULL\)
> >
> > Coccinelle rules for this sort of transformation...
> 
> /me still hasn't gotten his head around how to use Coccinelle properly. :-(

Me neither, but for the "add an extra NULL parameter" case I can
generally find something to cargo cult from ;-) (it's been ages since I
had a need though)

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
