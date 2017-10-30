From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: add bindings doc for hi3798cv200
 combphy
Date: Mon, 30 Oct 2017 22:51:52 +0800
Message-ID: <20171030145150.GB6270@dragon>
References: <1509073651-23730-1-git-send-email-shawnguo@kernel.org>
 <1509073651-23730-2-git-send-email-shawnguo@kernel.org>
 <20171027142606.zilypg7tuxwy3fj2@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171027142606.zilypg7tuxwy3fj2@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 27, 2017 at 09:38:30AM -0500, Rob Herring wrote:
> On Fri, Oct 27, 2017 at 11:07:30AM +0800, Shawn Guo wrote:
> > From: Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> > 
> > It adds the device tree bindings for PCIE/SATA/USB3 combo PHY found on
> > HiSilicon STB SoCs.
> > 
> > Signed-off-by: Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../bindings/phy/phy-hi3798cv200-combphy.txt       | 57 ++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt b/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt
> > new file mode 100644
> > index 000000000000..efb6cd5eae04
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt
> > @@ -0,0 +1,57 @@
> > +HiSilicon STB PCIE/SATA/USB3 PHY
> 
> Please add a reference to the parent node binding.
> 
> With that,
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Just noticed that we do not have a bindings doc for the parent
peripheral controller yet.  I will add a new patch for that in v5.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
