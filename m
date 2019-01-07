From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add Qualcomm USB Super-Speed PHY bindings
Date: Mon, 7 Jan 2019 14:33:42 -0600
Message-ID: <CAPBZ5Qc+yNMAyW8RBWLfJ3EBjUUFsKfXgiuet7fz3Nyv7P3hBg@mail.gmail.com>
References: <1544176558-7946-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1544176558-7946-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20181220170531.GA19862@bogus> <20181220173633.GA19912@jackp-linux.qualcomm.com>
 <2a007a91-e709-c9f1-f634-ddcf707e954d@linaro.org> <20190107202606.GC23243@jackp-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107202606.GC23243@jackp-linux.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jack Pham <jackp@codeaurora.org>
Cc: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham <kishon@ti.com>, linux-usb@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, shawn.guo@linaro.org, Vinod <vkoul@kernel.org>, Manu Gautam <mgautam@codeaurora.org>, Sriharsha Allenki <sallenki@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, 7 Jan 2019 at 14:26, Jack Pham <jackp@codeaurora.org> wrote:
>
> Hi Jorge,
>
> Sorry for the late reply as I was out during the holiday break.
>
> On Fri, Dec 28, 2018 at 01:38:59PM +0100, Jorge Ramirez wrote:
> > On 12/20/18 18:37, Jack Pham wrote:
> > >Hi Rob, Jorge,
> > >
> > >On Thu, Dec 20, 2018 at 11:05:31AM -0600, Rob Herring wrote:
> > >>On Fri, Dec 07, 2018 at 10:55:57AM +0100, Jorge Ramirez-Ortiz wrote:
> > >>>Binding description for Qualcomm's Synopsys 1.0.0 super-speed PHY
> > >>>controller embedded in QCS404.
> > >>>
> > >>>Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
> > >>>definitions.
> > >>>
> > >>>Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > >>>Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > >>>---
> > >>>  .../devicetree/bindings/usb/qcom,usb-ssphy.txt     | 78 ++++++++++++++++++++++
> > >>>  1 file changed, 78 insertions(+)
> > >>>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> > >>>
> > >>>diff --git a/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> > >>>new file mode 100644
> > >>>index 0000000..fcf4e01
> > >>>--- /dev/null
> > >>>+++ b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> > >>>@@ -0,0 +1,78 @@
> > >>>+Qualcomm Synopsys 1.0.0 SS phy controller
> > >>>+===========================================
> > >>>+
> > >>>+Synopsys 1.0.0 ss phy controller supports SS usb connectivity on Qualcomm
> > >>>+chipsets
> > >>>+
> > >>>+Required properties:
> > >>>+
> > >>>+- compatible:
> > >>>+    Value type: <string>
> > >>>+    Definition: Should contain "qcom,usb-ssphy".
> > >>
> > >>What is "qcom,dwc3-ss-usb-phy" which already exists then?
> > >
> > >Uh, apparently only the bindings doc is there but the driver never
> > >landed. I guess it fell through the cracks nearly 4 years ago.
> > >
> > >https://lore.kernel.org/patchwork/patch/499502/
> > >
> > >Jorge, does Andy's version of this driver at all resemble what can be
> > >used for QCS404?
> >
> > on close inspection I cant see any similitudes between the drivers.
> > Unfortunately I don't have access to documentation yet but the
> > control register offsets and the control bits in the drivers do not
> > match.
> >
> > because of the above I'd like to go ahead with our separate drivers
> > -already tested and validated- for HS (Shawn's) and SS (mine).
> >
> > if that is acceptable, should we reuse the upstream bindings for
> > our implementation? or perhaps Shawn Guo will do for his HS version
> > of the driver and I go ahead and create a new one? what would you
> > suggest?
>
> I'm not really sure. My understanding of the driver Andy submitted
> were for some of the older MSM and IPQ SoCs that implemented the PHY
> controls as part of the DWC3 controller's "QScratch" registers, which is
> why the bindings doc and the compatible string reference "dwc3" in both
> the compatible and the docs filename. Is the SNPS PHY on QCS404
> architected similarly in this regard? Either way, the existing bindings
> doc for the non-existent driver looks incomplete for QCS404, so you'd
> have to update it anyway. My feeling is that there should just be one
> document describing all variants of SNPS PHYs on Qualcomm chips.

Yeah the original driver was specifically for the IPQ8064 phys.  The
actual phy driver changed over time
due to some comments from a few people, but it still used the qscratch
memory for the phy control regs.

Due to this never landing, you can change the phy binding to work for
both of them or just for yours.  If the control
regs are totally different for the QCS404 phy, it should use a
different compatible and driver.  That's my 2 cents.


> Maybe we should also just delete the "qcom,dwc3-ss-usb-phy" binding
> unless there is a plan to resurrect Andy's driver.

I have the hardware I just don't have the time in the short-mid term
to resurrect this.  Unless someone else
wants to pick this up, it'll be a while.  In the meantime, I'd suggest
just changing the binding to apply to the QCS404
if that makes sense (completely different IP / register layout).

Andy
