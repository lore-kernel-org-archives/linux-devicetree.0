From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: drm/bridge: adv7511: Add regulator bindings
Date: Mon, 26 Sep 2016 11:12:48 +0300
Message-ID: <1527982.jPo8JkVTxZ@avalon>
References: <1472640730-24326-1-git-send-email-architt@codeaurora.org> <737415023.GKbfqYIf4s@avalon> <57E8C2CB.9000806@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <57E8C2CB.9000806@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Archit,

On Monday 26 Sep 2016 12:10:11 Archit Taneja wrote:
> On 9/25/2016 10:58 PM, Laurent Pinchart wrote:
> > On Friday 23 Sep 2016 14:50:27 Archit Taneja wrote:
> >> Add the regulator supply properties needed by ADV7511 and ADV7533. The
> >> regulator names are named after the pin names, except for DVDD_3V on
> >> ADV7511, which is left v3p3 to have the same name as it's on ADV7533.
> >> 
> >> ADV7511 has a BGVDD pin for which the voltage to be configured isn't
> >> clear. This needs to be updated in the document later.
> >> 
> >> The regulators are specified as optional properties since there can
> >> be boards which have a fixed supply directly routed to the pins, and
> >> these may not be modelled as regulator supplies.
> >> 
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: devicetree@vger.kernel.org
> >> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> >> ---
> >> v2:
> >> - Specify regulator supplies for ADV7511 too.
> >> - Have separate supply entries for AVDD, DVDD, PVDD, A2VDD pins.
> >> - Add additional BGVDD supply for ADV7511.
> >> 
> >>   .../devicetree/bindings/display/bridge/adi,adv7511.txt     | 14 +++++++
> >>   1 file changed, 14 insertions(+)
> >> 
> >> diff --git
> >> a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> >> b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt index
> >> 6532a59..66e6bae 100644
> >> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> >> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
> >> 
> >> @@ -56,6 +56,20 @@ Optional properties:
> >>   - adi,disable-timing-generator: Only for ADV7533. Disables the internal
> >> 
> >> timing generator. The chip will rely on the sync signals in the DSI data
> >> lanes, rather than generate its own timings for HDMI output.
> >> +- avdd-supply: A 1.8V supply that powers up the AVDD pin on the chip.
> >> +- dvdd-supply: A 1.8V supply that powers up the DVDD pin on the chip.
> >> +- pvdd-supply: A 1.8V supply that powers up the PVDD pin on the chip.
> >> +- v3p3-supply: A 3.3V supply that powers up the pin called DVDD_3V on
> >> +  ADV7511 and V3P3 on ADV7533.
> >> +
> >> +ADV7511 specific supplies:
> >> +- bgvdd-supply: Powers the BGVDD pin. The voltage isn't clear from
> >> +  available datasheets.
> > 
> > It's a 1.8V supply. The ADV7511 hardware user's guide recommends tying it
> > to the PVDD supply, so I'm not sure we need a separate supply in DT.
> 
> Thanks for providing the info. I'll update it in the doc.
> 
> > Similarly, the user's guide recommends supplying the AVDD, DVDD and PVDD
> > pins with a single 1.8V LDO and three independent filters. We could thus
> > possibly combine them into a single 1.8V supply.
> 
> I'd originally specified only one AVDD supply for all the 1.8 V
> supplies, but Rob had recommended using separate supplies for each pin.
> 
> I guess it doesn't do much harm specifying separate supplies, a
> board can just provide avdd-supply, and the rest would be assumed dummy.

DT should use the same regulator phandle for all power supplies in that case, 
not specify a single one.

> It could also help describe boards which may not have followed the
> user guide's recommendation, but I agree that's probably a rare
> scenario.
> 
> Is it okay if we stick with multiple supplies as it is in this version?

It seems overkill to me but I can live with that. I'd remove the bgvdd supply 
though.

Rob, what's your opinion on this ? Is there a specific reason why you prefer 
splitting the 1.8V supply in one supply per pin, when the hardware user's 
guide recommend powering them from the same LDO ?

> >> +ADV7533 specific supplies:
> >> +- a2vdd-supply: 1.8V supply that powers up the A2VDD pin on the chip.
> >> +- v1p2-supply: A supply that powers up the V1P2 pin on the chip. It can
> >> be
> >> +  either 1.2V or 1.8V.
> >> 
> >>   Required nodes:

-- 
Regards,

Laurent Pinchart
