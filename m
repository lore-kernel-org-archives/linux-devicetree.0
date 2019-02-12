From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add Qualcomm USB Super-Speed PHY bindings
Date: Tue, 12 Feb 2019 14:47:19 -0600
Message-ID: <CAL_Jsq+3Ttr8wGsDkx0q0VJRVWx2Zt41xY=NUB8GCJ1LjLk_tw@mail.gmail.com>
References: <1548761715-4004-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548761715-4004-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190130200218.GB5908@bogus> <f6823a9e-f2d0-ca5b-a2f8-eb362221ab81@linaro.org>
 <63959c4f-211e-bc2e-12a4-c4ef61c818a9@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <63959c4f-211e-bc2e-12a4-c4ef61c818a9@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, jackp@codeaurora.org, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Shawn Guo <shawn.guo@linaro.org>, Vinod <vkoul@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 6, 2019 at 8:11 AM Jorge Ramirez
<jorge.ramirez-ortiz@linaro.org> wrote:
>
> On 2/5/19 12:02, Jorge Ramirez wrote:
> > On 1/30/19 21:02, Rob Herring wrote:
> >> On Tue, Jan 29, 2019 at 12:35:14PM +0100, Jorge Ramirez-Ortiz wrote:
> >>> Binding description for Qualcomm's Synopsys 1.0.0 super-speed PHY
> >>> controller embedded in QCS404.
> >>>
> >>> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
> >>> definitions.
> >>>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> >>> ---
> >>>  .../devicetree/bindings/usb/qcom,usb-ssphy.txt     | 73 ++++++++++++++++++++++
> >>>  1 file changed, 73 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> >>> new file mode 100644
> >>> index 0000000..8ef6e39
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> >>> @@ -0,0 +1,73 @@
> >>> +Qualcomm Synopsys 1.0.0 SS phy controller
> >>> +===========================================
> >>> +
> >>> +Synopsys 1.0.0 ss phy controller supports SS usb connectivity on Qualcomm
> >>> +chipsets
> >>> +
> >>> +Required properties:
> >>> +
> >>> +- compatible:
> >>> +    Value type: <string>
> >>> +    Definition: Should contain "qcom,usb-ssphy".
> >>
> >> This is in no way specific enough.
> >
> > ok. will remove the old unused bindings and reuse qcom,dwc3-ss-usb-phy
> >
> >>
> >>> +
> >>> +- reg:
> >>> +    Value type: <prop-encoded-array>
> >>> +    Definition: USB PHY base address and length of the register map.
> >>> +
> >>> +- #phy-cells:
> >>> +    Value type: <u32>
> >>> +    Definition: Should be 0. See phy/phy-bindings.txt for details.
> >>> +
> >>> +- clocks:
> >>> +    Value type: <prop-encoded-array>
> >>> +    Definition: See clock-bindings.txt section "consumers". List of
> >>> +            three clock specifiers for reference, phy core and
> >>> +            pipe clocks.
> >>> +
> >>> +- clock-names:
> >>> +    Value type: <string>
> >>> +    Definition: Names of the clocks in 1-1 correspondence with the "clocks"
> >>> +            property. Must contain "ref", "phy" and "pipe".
> >>> +
> >>> +- vdd-supply:
> >>> +    Value type: <phandle>
> >>> +    Definition: phandle to the regulator VDD supply node.
> >>> +
> >>> +- vdda1p8-supply:
> >>> +    Value type: <phandle>
> >>> +    Definition: phandle to the regulator 1.8V supply node.
> >>> +
> >>> +
> >>> +Optional child nodes:
> >>> +
> >>> +- vbus-supply:
> >>> +    Value type: <phandle>
> >>> +    Definition: phandle to the VBUS supply node.
> >>
> >> Does the phy actually get supplied by Vbus? If not, then Vbus supply
> >> should be defined in a USB connector node.
> >
> > yes per the documentation vbus can optionally be routed to the phy to
> > drive a signal to the controller.
>
>
> funny enough when vbus is optionally routed to the phy is not to be
> controlled like we do when the vbus-supply property is present.
>
> So to all effects no, you are right, the phy does not get supplied by VBUS.
>
> would defining the connector like this be enough?
>
> usb3_phy: usb3-phy@78000 {
>         compatible = "qcom,snps-usb-ssphy";
>         [...]
>         usb3_c_connector: usb3-c-connector {
>                 compatible = "usb-c-connector";
>                 label = "USB-C";
>                 type = "micro";
>                 vbus-supply = <&usb3_vbus_reg>;
>         };
> };

IIRC, the connector node is defined to go under either the USB
controller or a USB-C controller (if a separate chip controlling the
USB-PD and alternate modes). We generally don't put PHYs into a node
topology, but keep them as a phandle reference.

Rob
