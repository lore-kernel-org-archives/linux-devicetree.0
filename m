From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6dl-udoo: Add board support based off
 imx6q-udoo
Date: Tue, 6 Jan 2015 19:09:16 +0800
Message-ID: <20150106110913.GJ24511@dragon>
References: <1419269361-6095-1-git-send-email-robertcnelson@gmail.com>
 <CAOMZO5ByFrTFoPUeRPBYxjB74Xn1BPQXzDxSaa+SiW_Ks5JZOw@mail.gmail.com>
 <CAOCHtYgr3uXkmZgBmmy_KDQxjCrnbE5WyR5d+ONRXJABj=xNUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOCHtYgr3uXkmZgBmmy_KDQxjCrnbE5WyR5d+ONRXJABj=xNUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Nelson <robertcnelson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 22, 2014 at 11:48:19AM -0600, Robert Nelson wrote:
> On Mon, Dec 22, 2014 at 11:41 AM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Mon, Dec 22, 2014 at 3:29 PM, Robert Nelson <robertcnelson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> >> +/dts-v1/;
> >> +#include "imx6dl.dtsi"
> >> +#include "imx6qdl-udoo.dtsi"
> >> +
> >> +/ {
> >> +       model = "Udoo i.MX6 Dual Board";
> >
> > It would be better to use "Udoo i.MX6 Dual-lite Board" in order to
> > avoid confusion with the i.MX6 Dual variant.
> >
> > Other than that:
> >
> > Reviewed-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> True! That would correctly match the other dual-lite boards on mainline too.
> 
> Shawn, if you want me to respin the patch i will, otherwise can you
> tweak that line?

Fixed it up and applied.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
