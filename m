From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] dt-bindings: drm: rcar-du: Document optional reset properties
Date: Fri, 07 Apr 2017 15:55:19 +0300
Message-ID: <2015685.1dmalSy0Yr@avalon>
References: <1488817556-21410-1-git-send-email-geert+renesas@glider.be> <20170316205639.xufbtbnqgy72bwyc@rob-hp-laptop> <CAMuHMdU0=WfkUUjXTYpp4JWM4mzFcV3AwSwf_7p+YnQQh=uE-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdU0=WfkUUjXTYpp4JWM4mzFcV3AwSwf_7p+YnQQh=uE-w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert and Rob,

On Thursday 16 Mar 2017 21:59:04 Geert Uytterhoeven wrote:
> On Thu, Mar 16, 2017 at 9:56 PM, Rob Herring <robh@kernel.org> wrote:
> > On Thu, Mar 16, 2017 at 09:13:16AM +0100, Geert Uytterhoeven wrote:
> >> On Wed, Mar 15, 2017 at 6:01 PM, Rob Herring <robh@kernel.org> wrote:
> >>> On Mon, Mar 06, 2017 at 05:25:56PM +0100, Geert Uytterhoeven wrote:
> >>>> Document the optional properties for describing module resets, to
> >>>> support resetting display channels and LVDS encoders on R-Car Gen2 and
> >>>> Gen3.
> >>>> 
> >>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>> ---
> >>>> See "[v2,1/4] dt-bindings: clock: renesas: cpg-mssr: Document reset
> >>>> control support" (https://patchwork.kernel.org/patch/9536627/) for the
> >>>> format of a reset specifier in the Renesas CPG/MSSR case.
> >>>> 
> >>>> E.g. "resets = <&cpg 310>;"
> >>>> 
> >>>> v2:
> >>>>   - s/phandles/phandle/.
> >>>> 
> >>>> ---
> >>>> 
> >>>>  Documentation/devicetree/bindings/display/renesas,du.txt | 10 ++++++++
> >>>>  1 file changed, 10 insertions(+)
> >>>> 
> >>>> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
> >>>> b/Documentation/devicetree/bindings/display/renesas,du.txt index
> >>>> 1a02f099a0ff0a3a..3db418c827193e82 100644
> >>>> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> >>>> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> >>>> @@ -36,6 +36,16 @@ Required Properties:
> >>>>        When supplied they must be named "dclkin.x" with "x" being the
> >>>>        input clock numerical index.
> >>>> 
> >>>> +Optional properties:
> >>>> +  - resets: A list of phandle + reset-specifier pairs, one for each
> >>>> entry in
> >>>> +    the reset-names property.
> >>>> +  - reset-names: Names of the resets. This property is
> >>>> model-dependent.
> >>>> +    - R8A779[0123456] use one reset for a group of one or more
> >>>> successive
> >>>> +      channels, and one reset per LVDS encoder (if available). The
> >>>> resets
> >>>> +      must be named "du.x" with "x" being the numerical index of the
> >>>> lowest
> >>>> +      channel in the group. The LVDS resets must be named "lvds.x"
> >>>> with "x"
> >>>> +      being the LVDS encoder numerical index.
> >>> 
> >>> LVDS is not a separate block?
> >> 
> >> Well... from a hardware point of view, the LVDS encoders and DU channels
> >> are all separate blocks (they have separate reg blocks, clocks, and
> >> resets). But due to the dependencies between the blocks, they're modeled
> >> in DT as a single device, with multiple reg, clocks, and resets
> >> properties.
> >
> > Dependencies being DRM requirement of wanting a single device with
> > sub-devices or some h/w dependencies? The former shouldn't define your
> > binding.
> 
> Hardware dependencies. Laurent can tell you more about them (when he'll
> be back).

I believe we could model the LVDS encoder as a separate DT node. It was 
probably a historical mistake (that would however need to be confirmed, I 
haven't double-checked all details). Obviously I can't break backward 
compatibility, so we're kind of stuck :-S

-- 
Regards,

Laurent Pinchart
