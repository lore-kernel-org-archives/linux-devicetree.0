From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [RFC 1/7] soc: qcom: Add device tree binding for SMEM
Date: Tue, 30 Sep 2014 13:00:53 -0700
Message-ID: <20140930200052.GU28481@sonymobile.com>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1412037291-16880-2-git-send-email-bjorn.andersson@sonymobile.com>
 <542AFE79.6030304@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <542AFE79.6030304@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

On Tue 30 Sep 12:03 PDT 2014, Stephen Boyd wrote:

> On 09/29/14 17:34, Bjorn Andersson wrote:
> > +
> > +- reg:
> > +	Usage: required
> > +	Value type: <prop-encoded-array>
> > +	Definition: base address and size pair for each area representing the
> > +		    shared memory. The first pair will must represent the "main"
> > +		    area, where the shared memory header and table-of-content
> > +		    can be found.
> >
> > +
> > += EXAMPLE
> > +
> > +        smem: smem@fa00000 {
> > +                compatible = "qcom,smem";
> > +                reg = <0x0fa00000 0x200000>,
> > +                      <0xfc428000 0x4000>;
> 
> Isn't this second entry rpm message ram? That isn't the same as smem.
> Plus smem is part of ram (and rpm message ram is not) so we need to do
> memory reservations or something.
> 

Correct they are different, but smem covers both of those and allocations are
only supposed to be done in the first of these.

And I forgot to mention that I have the following in my dt:

/ {
        reserved-memory {
                #address-cells = <1>;
                #size-cells = <1>;
                ranges;

                smem@fa00000 {
                        #memory-region-cells = <0>;
                        reg = <0x0fa00000 0x200000>;
                        no-map;
                };
        };
};

Regards,
Bjorn
