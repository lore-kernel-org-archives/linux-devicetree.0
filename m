From: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] usb: dwc3: of-simple: reset host controller at
 suspend/resume
Date: Mon, 09 Jul 2018 19:09:21 -0300
Message-ID: <d9ea42a39a80c12b9d5730376d2f8e5a953771ef.camel@collabora.com>
References: <20180709150844.32505-1-enric.balletbo@collabora.com>
         <536642654ca55f08877497c86a5cb106d5458384.camel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <536642654ca55f08877497c86a5cb106d5458384.camel@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, linux-kernel@vger.kernel.org
Cc: briannorris@chromium.org, kernel@collabora.com, heiko@sntech.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sigh, now actually Cc devicetree folks

On Mon, 2018-07-09 at 19:04 -0300, Ezequiel Garcia wrote:
> (Cc devicetree folks)
> 
> Hi Enric,
> 
> Thanks for the patch.
> 
> On Mon, 2018-07-09 at 17:08 +0200, Enric Balletbo i Serra wrote:
> > If we power off the SoC logic rail in S3, we can find that the
> > Type-C
> > PHY can't initialize correctly after system resume. We need to
> > toggle
> > the USB3-OTG reset before trying to initialize the PHY, or else it
> > times out.
> > 
> >     phy phy-ff800000.phy.9: phy poweron failed --> -110
> >     dwc3 fe900000.dwc3: failed to initialize core
> >     dwc3: probe of fe900000.dwc3 failed with error -110
> > 
> > Note that the RK3399 TRM suggests that we should keep the whole
> > usb3
> > controller in reset for the duration of the Type-C PHY
> > initialization.
> > However, it's hard to assert the reset in the current framework of
> > reset. We're still skeptical about that, and we haven't yet found a
> > case where this seems to have mattered. This approach is much
> > easier,
> > it
> > simply holds the USB3-OTG reset while device is supended.
> > 
> > The dwc3 core is going to reinitialize the controller at
> > suspend/resume
> > anyway (including a "soft reset"), so it should be safe to do this.
> > 
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com
> > >
> > ---
> > Dear all,
> > 
> > Now that the usb3-phy otg port support for rk3399 has been merged
> > [1]
> > we
> > found that suspend/resume is broken. The problem is well known for
> > ChromeOS kernels, they solved it in a similar way adding a reset
> > pulse on
> > resume in the specific usb glue layer (dwc3-rockchip). In mainline,
> > though, we use the dwc3-of-simple glue layer instead of a specific
> > layer
> > for rockchip. The patch is based on the Brian Norris work but
> > slightly
> > different, it holds the reset while device is suspended. It was
> > tested
> > on a Samsung Chromebook Plus with usbc docking station attached by
> > doing
> > different suspend/resume cycles and checking no usb devices has
> > been
> > lost.
> > 
> > I am not sure this is the better way to solve this but I did not
> > find
> > any other way, and, as I am not sure this can be generic, the reset
> > is only
> > done on rockchip platforms.
> > 
> 
> I don't really understand why there are per-platform hacks in glue
> drivers, instead of having per-platform glue drivers, or some other
> pluggable hooks.
> 
> > Best regards,
> >  Enric
> > 
> > [1] bfdca1736ea76345071bbc5607d18928e54909ac ('arm64: dts:
> > rockchip:
> > add
> >     usb3-phy otg-port support for rk3399')
> > 
> >  drivers/usb/dwc3/dwc3-of-simple.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-of-simple.c
> > b/drivers/usb/dwc3/dwc3-of-simple.c
> > index dbeff5e6ad14..1d1ece99ed94 100644
> > --- a/drivers/usb/dwc3/dwc3-of-simple.c
> > +++ b/drivers/usb/dwc3/dwc3-of-simple.c
> > @@ -201,9 +201,30 @@ static int
> > dwc3_of_simple_runtime_resume(struct
> > device *dev)
> >  
> >  	return 0;
> >  }
> > +
> > +static int dwc3_of_simple_suspend(struct device *dev)
> > +{
> > +	struct dwc3_of_simple *simple = dev_get_drvdata(dev);
> > +
> > +	if (of_device_is_compatible(dev->of_node,
> > "rockchip,rk3399-
> > dwc3"))
> > 
> 
> Instead of calling of_device_is_compatible in each suspend/resume,
> which seems quite expensive, how about having a per-device boolean
> 'needs_reset' or something like that?
> 
> Or maybe just have a boolean devicetree property for this?
> 
> Regards,
> Eze
> 
