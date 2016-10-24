From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: mbox-name vs. mbox-names (was: Re: [PATCH v4 1/5] mailbox: dt:
 Supply bindings for ST's Mailbox IP)
Date: Mon, 24 Oct 2016 09:41:07 +0100
Message-ID: <20161024084107.GD14477@dell>
References: <CAMuHMdXqOZ=eKJ=SkY4TM=fu8qnZ2gLmh-2iH0jB2pAu_v2vNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXqOZ=eKJ=SkY4TM=fu8qnZ2gLmh-2iH0jB2pAu_v2vNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 21 Oct 2016, Geert Uytterhoeven wrote:

> On Fri, Oct 16, 2015 at 9:21 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../devicetree/bindings/mailbox/sti-mailbox.txt    | 51 ++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> > new file mode 100644
> > index 0000000..b61eec9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> > @@ -0,0 +1,51 @@
> > +ST Microelectronics Mailbox Driver
> > +
> > +Each ST Mailbox IP currently consists of 4 instances of 32 channels.  Messages
> > +are passed between Application and Remote processors using shared memory.
> > +
> > +Controller
> > +----------
> > +
> > +Required properties:
> > +- compatible           : Should be "st,stih407-mailbox"
> > +- reg                  : Offset and length of the device's register set
> > +- mbox-name            : Name of the mailbox
> 
> All other mailbox drivers use "mbox-names". Oops, it's in v4.9-rc1...
> 
> Can we still fix that?

So long as all the fixes; changes to the driver and DT are merged in a
single kernel release, we can change it.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
