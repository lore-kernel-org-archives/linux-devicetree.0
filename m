From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: thermal: Add binding document for SR
 thermal
Date: Thu, 27 Sep 2018 13:59:43 -0500
Message-ID: <20180927185943.GA31385@bogus>
References: <1538062603-7490-1-git-send-email-srinath.mannam@broadcom.com>
 <1538062603-7490-2-git-send-email-srinath.mannam@broadcom.com>
 <20180927172758.GA17761@bogus>
 <b1099893-f704-8ca6-a945-2711d6945a0f@gmail.com>
 <f20afabc-e712-8f35-8dd6-d42b9a0131f0@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f20afabc-e712-8f35-8dd6-d42b9a0131f0@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <scott.branden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Srinath Mannam <srinath.mannam@broadcom.com>, daniel.lezcano@linaro.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Pramod Kumar <pramod.kumar@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 11:00:33AM -0700, Scott Branden wrote:
> 
> 
> On 18-09-27 10:31 AM, Florian Fainelli wrote:
> > On 09/27/2018 10:27 AM, Rob Herring wrote:
> > > On Thu, Sep 27, 2018 at 09:06:41PM +0530, Srinath Mannam wrote:
> > > > From: Pramod Kumar <pramod.kumar@broadcom.com>
> > > > 
> > > > Add binding document for supported thermal implementation
> > > > in Stingray.
> > > > 
> > > > Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
> > > > Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> > > > Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> > > > Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> > > > ---
> > > >   .../bindings/thermal/brcm,sr-thermal.txt           | 25 ++++++++++++++++++++++
> > > >   1 file changed, 25 insertions(+)
> > > >   create mode 100644 Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
> > > > new file mode 100644
> > > > index 0000000..717617b
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
> > > > @@ -0,0 +1,25 @@
> > > > +* Broadcom Stingray Thermal
> > > > +
> > > > +This binding describes thermal sensors that is part of Stingray SoCs.
> > > > +
> > > > +Required properties:
> > > > +- compatible : Must be "brcm,sr-thermal"
> > > > +- reg : memory where tmon data will be available.
> > > > +- brcm,tmon-mask: A one cell bit mask of valid TMON sources.
> > > > +                  Each bit represents single TMON source.
> > > > +- brcm,max-crit-temp: Maximum supported critical temperature.
> > > We already have a defined binding for setting trip points.
> > Indeed, and if you have multiple TMONs, they would in premise possibly
> > each have a different critical trip point.
> Which may be a good reason to go back to our original bindings which were
> generic and had each sensor in its own node?

Perhaps. I wouldn't call it going back to your original, but rather 
defining a complete binding. Of course, if you don't need different trip 
points, then again that is just unnecessary bloat. But I can't argue 
whether you do or don't.

Rob
