From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 3/6] media: sun6i: Set 300MHz mod clock
 for A64
Date: Tue, 11 Dec 2018 21:20:40 +0530
Message-ID: <CAMty3ZBA9W0MA7BR=Cn73KbE-fSs=WXe_47c_69JpizhbsXa-g@mail.gmail.com>
References: <20181210115246.8188-1-jagan@amarulasolutions.com>
 <20181210115246.8188-4-jagan@amarulasolutions.com> <20181211154427.uekytnmp2wlgxwm2@flea>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBXNZX7QAKGQEGZ2QAMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181211154427.uekytnmp2wlgxwm2@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-media <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 11, 2018 at 9:14 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Mon, Dec 10, 2018 at 05:22:43PM +0530, Jagan Teki wrote:
> > The default CSI_SCLK seems unable to drive the sensor to capture
> > the image, so update it to working clock rate 300MHz for A64.
> >
> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > ---
> >  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > index bbe45e893722..4b872800b244 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > @@ -822,6 +822,11 @@ static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
> >               return PTR_ERR(sdev->clk_mod);
> >       }
> >
> > +     /* A64 need 300MHz mod clock to operate properly */
> > +     if (of_device_is_compatible(pdev->dev.of_node,
> > +                                 "allwinner,sun50i-a64-csi"))
> > +             clk_set_rate_exclusive(sdev->clk_mod, 300000000);
> > +
>
> Where is that 300MHz coming from? You claim in your comment that it

from BSP, even "Chen-Yu Tsai" mentioned the same. (Chen-Yu, can you
comment here)

> "operates properly", yet in your previous mail about this, you were
> saying that 1080p @30Hz is broken. Which one is it?

1080p is broken from sensor end, ie what I mentioned on the respective mail.
