From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 0/5] usb: change clock information for chipidea
Date: Tue, 22 Sep 2015 07:56:56 +0800
Message-ID: <20150921235655.GD23664@shlinux2>
References: <1442796186-2574-1-git-send-email-peter.chen@freescale.com>
 <CAOMZO5BG9=m18tLqtv8Dsg6bEQVtzGMC2e1oOfHQ__aknW1Mjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5BG9=m18tLqtv8Dsg6bEQVtzGMC2e1oOfHQ__aknW1Mjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 21, 2015 at 09:49:11PM -0300, Fabio Estevam wrote:
> On Sun, Sep 20, 2015 at 9:43 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > This patch set changes usb clock information for legacy i.mx platforms.
> > At these platforms, they needs three clocks to let controller work.
> >
> > Hi Fabio,
> >
> > Would you please have a test at imx27 and imx25 boards, thanks.
> 
> Works fine on both boards, thanks

Hi Shawn,

Would you please help to queue dts changes (2/5, 3/5, 4/5)?
I will queue others, thanks.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
