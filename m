From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH v4 22/22] phy: Add support for Qualcomm's USB HS phy
Date: Fri, 16 Sep 2016 17:05:24 -0700
Message-ID: <147407072439.8245.12292695359399379462@sboyd-linaro>
References: <20160907213519.27340-1-stephen.boyd@linaro.org>
 <20160907213519.27340-23-stephen.boyd@linaro.org>
 <20160916151950.GA31804@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160916151950.GA31804@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>, Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2016-09-16 08:19:51)
> On Wed, Sep 07, 2016 at 02:35:19PM -0700, Stephen Boyd wrote:
> > The high-speed phy on qcom SoCs is controlled via the ULPI
> > viewport.
> > 
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: <devicetree@vger.kernel.org>
> > Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> > ---
> >  .../devicetree/bindings/phy/qcom,usb-hs-phy.txt    |  83 ++++++
> >  drivers/phy/Kconfig                                |   8 +
> >  drivers/phy/Makefile                               |   1 +
> >  drivers/phy/phy-qcom-usb-hs.c                      | 289 +++++++++++++++++++++
> >  4 files changed, 381 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
> >  create mode 100644 drivers/phy/phy-qcom-usb-hs.c
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
> > new file mode 100644
> > index 000000000000..d7eacd63d06b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
> > @@ -0,0 +1,83 @@
> > +Qualcomm's USB HS PHY
> > +
> > +PROPERTIES
> > +
> > +- compatible:
> > +    Usage: required
> > +    Value type: <string>
> > +    Definition: Should contain "qcom,usb-hs-phy" and more specifically one of the
> > +                following:
> > +
> > +                        "qcom,usb-hs-phy-apq8064"
> > +                        "qcom,usb-hs-phy-msm8916"
> > +                        "qcom,usb-hs-phy-msm8974"
> 
> This is fine, but things are usually named <soc>-<ipblock>.
> 
> > +
> > +- #phy-cells:
> > +    Usage: required
> > +    Value type: <u32>
> > +    Definition: Should contain 0
> > +
> > +- clocks:
> > +    Usage: required
> > +    Value type: <prop-encoded-array>
> > +    Definition: Should contain clock specifier for the reference and sleep
> > +                clocks
> > +
> > +- clock-names:
> > +    Usage: required
> > +    Value type: <stringlist>
> > +    Definition: Should contain "ref" and "sleep" for the reference and sleep
> > +                clocks respectively
> > +
> > +- resets:
> > +    Usage: required
> > +    Value type: <prop-encoded-array>
> > +    Definition: Should contain the phy and POR resets
> > +
> > +- reset-names:
> > +    Usage: required
> > +    Value type: <stringlist>
> > +    Definition: Should contain "phy" and "por" for the phy and POR resets
> > +                respectively
> > +
> > +- v3p3-supply:
> > +    Usage: required
> > +    Value type: <phandle>
> > +    Definition: Should contain a reference to the 3.3V supply
> > +
> > +- v1p8-supply:
> > +    Usage: required
> > +    Value type: <phandle>
> > +    Definition: Should contain a reference to the 1.8V supply
> > +
> > +- extcon:
> 
> I don't recommend using extcon binding. It needs some work to put it 
> nicely.

:sadface:

> 
> > +    Usage: optional
> > +    Value type: <prop-encoded-array>
> > +    Definition: Should contain the vbus and ID extcons in the first and second
> > +                cells respectively
> > +
> > +- qcom,init-seq:
> > +    Usage: optional
> > +    Value type: <u8 array>
> > +    Definition: Should contain a sequence of ULPI register and address pairs to
> > +                program into the ULPI_EXT_VENDOR_SPECIFIC area. This is related
> > +                to Device Mode Eye Diagram test.
> 
> We generally nak this type of property. For 1 register I don't care so 
> much. For 100, that would be another story.
> 
> Is this value per unit, per board, per SoC? Can you limit it to certain 
> registers?

I'm told that this can be per board, depending on how it's wired from
the phy pins to the usb port. Typically it's the same though for the
boards I have, mostly because those boards are similar designs with
respect to how USB is wired. The set of registers is not that many, 4 or
5 at most. My understanding is these are tuning registers. Right now the
register part in the binding is the full register offset, and not an
offset from ULPI_EXT_VENDOR_SPECIFIC (0x80). I could change this to be
an offset from that area if you like so that this can't be abused to
write into standard ULPI registers (there really isn't any way to
enforce this in software though).

This is "borrowed" from another binding for this usb stuff that I'm
attempting to kill off, bindings/usb/msm-hsusb.txt. Just historical info
in case you're interested.
