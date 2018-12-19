From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v4 0/6] media/sun6i: Allwinner A64 CSI support
Date: Wed, 19 Dec 2018 16:11:50 +0530
Message-ID: <CAMty3ZB04E46kMKVvo-QxpVQBus74at3uKJC_QzS788UiCAeeg@mail.gmail.com>
References: <20181218113320.4856-1-jagan@amarulasolutions.com>
 <20181218152122.4zj6wgbukhrl6ly6@flea> <CAMty3ZA4xXVLKx-yj+2_iJ700+yTLesjEAgS8Wu2i8otPScpaw@mail.gmail.com>
 <20181219102450.picswsg3yevba23j@flea>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBB66A5DQAKGQE3326X5I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181219102450.picswsg3yevba23j@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-media <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 19, 2018 at 3:55 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Tue, Dec 18, 2018 at 08:58:22PM +0530, Jagan Teki wrote:
> > On Tue, Dec 18, 2018 at 8:51 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > >
> > > On Tue, Dec 18, 2018 at 05:03:14PM +0530, Jagan Teki wrote:
> > > > This series support CSI on Allwinner A64.
> > > >
> > > > Tested 640x480, 320x240, 720p, 1080p resolutions UYVY8_2X8 format.
> > > >
> > > > Changes for v4:
> > > > - update the compatible string order
> > > > - add proper commit message
> > > > - included BPI-M64 patch
> > > > - skipped amarula-a64 patch
> > > > Changes for v3:
> > > > - update dt-bindings for A64
> > > > - set mod clock via csi driver
> > > > - remove assign clocks from dtsi
> > > > - remove i2c-gpio opendrian
> > > > - fix avdd and dovdd supplies
> > > > - remove vcc-csi pin group supply
> > > >
> > > > Note: This series created on top of H3 changes [1]
> > > >
> > > > [1] https://patchwork.kernel.org/cover/10705905/
> > >
> > > You had memory corruption before, how was this fixed?
> >
> > Memory corruption observed with default 600MHz on 1080p. It worked
> > fine on BPI-M64 (with 300MHz)
>
> I don't get it. In the previous version of those patches, you were
> mentionning you were still having this issue, even though you had the
> clock running at 300MHz, and then you tried to convince us to merge
> the patches nonetheless.
>
> Why would you say that then if that issue was fixed?

Previous version has A64-Relic board, which has some xclk issue on
sensor side wrt 1080p. I have tried 300MHz on the same hardware, it's
failing to capture on 30fps and so I tried 600MHz(which is default) on
the same configuration but it encounter memory corruption.

So, for checking whether there is an issue with hardware on A64-Relic
I moved with BPI-M64 dev board. which is working 1080p with 300MHz, ie
reason I have not included A64-Relic on this version and included
BPI-M64. We processed A64-Relic to hardware team to figure out the
clock and once ie fixed I'm planning to send DTS patch for that.

This is overall summary, hope you understand.
