From: LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH v3 1/2] phy-sun4i-usb: Use of_match_node
 to get model specific config data
Date: Thu, 26 Nov 2015 08:14:43 +0100
Message-ID: <20151126071443.GA28184@Red>
References: <1448470202-3628-1-git-send-email-hdegoede@redhat.com>
 <CAGb2v64XL=bptxoCwiVkf8u-EfckpuASS3Foo=Q3i4a_6CaJYA@mail.gmail.com>
Reply-To: clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD7YLCN32UNBBZXC3KZAKGQEC624WRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64XL=bptxoCwiVkf8u-EfckpuASS3Foo=Q3i4a_6CaJYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "Reinder E.N. de Haan" <reinder-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 26, 2015 at 12:22:59PM +0800, Chen-Yu Tsai wrote:
> On Thu, Nov 26, 2015 at 12:50 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > +
> >  static const unsigned int sun4i_usb_phy0_cable[] = {
> >         EXTCON_USB,
> >         EXTCON_USB_HOST,
> > @@ -511,10 +578,16 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
> >         struct device *dev = &pdev->dev;
> >         struct device_node *np = dev->of_node;
> >         struct phy_provider *phy_provider;
> > -       bool dedicated_clocks;
> > +       const struct of_device_id *match;
> >         struct resource *res;
> >         int i, ret;
> >
> > +       match = of_match_node(sun4i_usb_phy_of_match, dev->of_node);
> 
> You can use of_device_get_match_data() for slightly less code. This
> will also let you keep the of_device_id table where it was, at the
> bottom.
> 
> > +       if (!match) {
> 
> I'm working on something similar in the axp20x driver. Is there any
> case of_match_node or of_device_get_match_data can fail?
> 
> 

Hello

I am working on some patch for that case and the conclusion was that case is possible.
See https://lkml.org/lkml/2015/11/12/97
So it is better to check it.

Regards
