From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 01/12] dt-bindings: usb: add support for dwc3
 controller on HiSilicon SoCs
Date: Thu, 20 Dec 2018 07:48:43 -0600
Message-ID: <CAL_JsqKooF=R93enNTvP9MLaJgoygoOEYyh4OU6-RP6E3Fv0vA@mail.gmail.com>
References: <20181203034515.91412-1-chenyu56@huawei.com> <20181203034515.91412-2-chenyu56@huawei.com>
 <fde4d37b-0c4d-055b-a0ba-4e9fe87717ad@cogentembedded.com> <33cda716-d09c-28e7-d4b4-26f246786f5e@huawei.com>
 <680c5b9f-e2c7-926d-7d10-4ce2cd091282@cogentembedded.com> <bbe390f0-2fa6-515b-42c5-ede620b2b8c7@huawei.com>
 <20181219140953.GA9910@bogus> <87y38ku24b.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87y38ku24b.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Chen Yu <chenyu56@huawei.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wangbinghui <wangbinghui@hisilicon.com>, Suzhuangluan <suzhuangluan@hisilicon.com>, kongfei@hisilicon.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 20, 2018 at 12:46 AM Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
>
>
> Hi,
>
> Rob Herring <robh@kernel.org> writes:
> >> >>>> +Example:
> >> >>>> +    usb3: hisi_dwc3 {
> >> >>>> +        compatible = "hisilicon,hi3660-dwc3";
> >> >>>> +        #address-cells = <2>;
> >> >>>> +        #size-cells = <2>;
> >> >>>> +        ranges;
> >> >>>> +
> >> >>>> +        clocks = <&crg_ctrl HI3660_CLK_ABB_USB>,
> >> >>>> +             <&crg_ctrl HI3660_ACLK_GATE_USB3OTG>;
> >> >>>> +        clock-names = "clk_usb3phy_ref", "aclk_usb3otg";
> >> >>>> +        assigned-clocks = <&crg_ctrl HI3660_ACLK_GATE_USB3OTG>;
> >> >>>> +        assigned-clock-rates = <229000000>;
> >> >>>> +        resets = <&crg_rst 0x90 8>,
> >> >>>> +             <&crg_rst 0x90 7>,
> >> >>>> +             <&crg_rst 0x90 6>,
> >> >>>> +             <&crg_rst 0x90 5>;
> >> >>>> +
> >> >>>> +        dwc3: dwc3@ff100000 {
> >
> > Please combine these into a single node. Unless you have a wrapper with
> > registers, you don't need these 2 nodes. Clocks and reset can go in the
> > dwc3 node.
> >
> >> >>>
> >> >>>      According to the DT spec, the node names should be generic, not chip specific, i.e. usb@ff100000 in this case.
> >> >>>
> >> >>
> >> >> Do you mean it should be usb@ff100000: dwc3@ff100000 ?
> >> >
> >> >     dwc3: usb@ff100000
> >> >
> >> >    "dwc3:" is a label, not name.
> >>
> >> I use the node name "dwc3@ff100000" according to Documentation/devicetree/bindings/usb/dwc3.txt
> >> and documentations of vendor drivers, i.e. qcom,dwc3.txt, rockchip,dwc3.txt.
> >>
> >> In these documentations, the dwc3 sub-node name uses "dwc3@xxxxxxxx".
> >>
> >> I think it is better to be same as the other vendor's dwc3 drivers.
> >
> > It's not. The other bindings are wrong. Follow the DT Spec.
>
> what's wrong about them? They clearly describe the HW:
>
> 1) a company-specific glue/adaptation/integration IP
> 2) a generic licensed IP inside it

That is *every* licensed IP block and DWC3 is the oddball where we did
this 2 node thing. It is not a pattern we should continue. If there's
registers in the wrapper, then yes, having 2 nodes makes sense. But
just additional clocks or resets, no. I would guess these extra clocks
and resets are inter-connect related and are needed as an artifact of
not describing and managing inter-connects.

I can just as easily argue it doesn't describe the hardware. I'm
pretty sure the DWC3 has clocks and resets yet there are none in the
DWC3 node. How can it operate with no clocks?

> dwc3.ko is compatible with Synopsys' documentation and there's only one
> incarnation of dwc3. Everything that can be detected in runtime, we do
> so. Everything that can't, we use quirk flags. Keep in mind dwc3.ko is
> also used as is by non-DT systems where we can't simply change a
> compatible flag.

Linux driver architecture doesn't dictate bindings.

Rob
