From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH 1/1] of/overlay: of overlay callbacks
Date: Thu, 18 Feb 2016 09:10:20 -0600
Message-ID: <alpine.DEB.2.02.1602180907560.28357@linuxheads99>
References: <1455730885-1514-1-git-send-email-atull@opensource.altera.com> <1455730885-1514-2-git-send-email-atull@opensource.altera.com> <CAAtXAHdYhWP==Vtt+i_0xOmSzZNmbJJuY470XLUxBSxmZ12BYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHdYhWP==Vtt+i_0xOmSzZNmbJJuY470XLUxBSxmZ12BYw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, 18 Feb 2016, Moritz Fischer wrote:

> Hi Alan,
> 
> a couple of nits below.
> 
> On Wed, Feb 17, 2016 at 9:41 AM, Alan Tull <atull@opensource.altera.com> wrote:
> 
> >
> > +/*
> > + * Send overlay callbacks to handlers that match.  This call is blocking.  In
> Can we make this 'Invoke' instead of send?
> 
> > @@ -370,6 +448,13 @@ int of_overlay_create(struct device_node *tree)
> >                 goto err_free_idr;
> >         }
> >
> > +       err = send_overlay_callbacks(ov, OF_OVERLAY_PRE_APPLY);
> 
> Again ... maybe invoke ;-)

Hi Moritz,

Yes, that's better.  I'll make the sends to be invokes.

> 
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index dc6e396..def9481 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -101,9 +101,33 @@ static inline int of_node_is_attached(struct device_node *node)
> >         return node && node->kobj.state_in_sysfs;
> >  }
> >
> > +/* Callback types */
> > +#define OF_OVERLAY_PRE_APPLY   (0)
> > +#define OF_OVERLAY_POST_APPLY  (1)
> > +#define OF_OVERLAY_PRE_REMOVE  (2)
> > +#define OF_OVERLAY_POST_REMOVE (3)
> 
> Can we make this an enum?

Yes.  And I can move it from of.h to overlay.c.

Thanks for the nits!

Alan


> 
> Cheers,
> 
> Moritz
> 
