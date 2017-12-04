From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: [PATCH 11/12] ARM: dts: imx6qdl-nitrogen6_max: Remove unneeded
 unit address
Date: Mon, 4 Dec 2017 12:31:20 +0100
Message-ID: <20171204113120.wbofrsoxl2ekd3ch@t450s.lan>
References: <1512156285-18451-1-git-send-email-festevam@gmail.com>
 <1512156285-18451-11-git-send-email-festevam@gmail.com>
 <20171204111954.v7jexbtkjyaa6mhe@t450s.lan>
 <CAOMZO5C77f9mQQWJ5GJH3J+cj4Fxu3H-3yQYeFNDxm3xfpe8Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5C77f9mQQWJ5GJH3J+cj4Fxu3H-3yQYeFNDxm3xfpe8Gw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On Mon, Dec 04, 2017 at 09:28:08AM -0200, Fabio Estevam wrote:
> Hi Gary,
> 
> On Mon, Dec 4, 2017 at 9:19 AM, Gary Bisson
> <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> 
> > What about naming it i2c2mux and i2c3mux so it is clearer those mux
> > happen respectively for i2c2 and i2c3?
> >
> > Then I'd rename the sub-nodes i2cXmux@Y instead of i2cX@Y currently.
> >
> > Let me know your thoughts.
> 
> Is this what you suggest?

Yes exactly, I find it clearer, what do you think?

Regards,
Gary
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
