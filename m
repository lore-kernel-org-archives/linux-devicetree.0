From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: arm: Convert Actions Semi bindings to
 jsonschema
Date: Fri, 14 Jun 2019 22:34:50 +0530
Message-ID: <20190614170450.GA29654@Mani-XPS-13-9360>
References: <20190517153223.7650-1-robh@kernel.org>
 <20190613224435.GA32572@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613224435.GA32572@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 04:44:35PM -0600, Rob Herring wrote:
> On Fri, May 17, 2019 at 10:32:23AM -0500, Rob Herring wrote:
> > Convert Actions Semi SoC bindings to DT schema format using json-schema.
> > 
> > Cc: "Andreas Färber" <afaerber@suse.de>
> > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > v3:
> > - update MAINTAINERS
> > 
> >  .../devicetree/bindings/arm/actions.txt       | 56 -------------------
> >  .../devicetree/bindings/arm/actions.yaml      | 38 +++++++++++++
> >  MAINTAINERS                                   |  2 +-
> >  3 files changed, 39 insertions(+), 57 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/actions.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/actions.yaml
> 
> Ping. Please apply or modify this how you'd prefer. I'm not going to 
> keep respinning this.
> 

Sorry for that Rob.

Andreas, are you going to take this patch? Else I'll pick it up (If you
want me to do the PR for next cycle)

Thanks,
Mani

> Rob
