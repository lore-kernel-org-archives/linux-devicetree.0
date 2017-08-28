From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: PCI: rockchip: Add support for pcie
 wake irq
Date: Mon, 28 Aug 2017 15:44:49 -0700
Message-ID: <20170828224447.GA3119@google.com>
References: <20170822031934.8675-1-jeffy.chen@rock-chips.com>
 <20170822031934.8675-4-jeffy.chen@rock-chips.com>
 <20170825181439.d3hlwrcbmcss3sx6@rob-hp-laptop>
 <20170825181959.GA64040@google.com>
 <CAL_Jsq+MeiwOf=VDLZrxgPuLNEDvtGY=X-K1=6w9aaFVZgg1hA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+MeiwOf=VDLZrxgPuLNEDvtGY=X-K1=6w9aaFVZgg1hA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jeffy Chen <jeffy.chen@rock-chips.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, Shawn Lin <shawn.lin@rock-chips.com>, Doug Anderson <dianders@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 28, 2017 at 04:32:55PM -0500, Rob Herring wrote:
> On Fri, Aug 25, 2017 at 1:20 PM, Brian Norris <briannorris@chromium.org> wrote:
> > On Fri, Aug 25, 2017 at 01:14:39PM -0500, Rob Herring wrote:
> >> Use the wakeup source binding:
> >> Documentation/devicetree/bindings/power/wakeup-source.txt
> >
> > And I suppose this means we'd fall under this paragraph?
> >
> >     "However if the devices have dedicated interrupt as the wakeup source
> >     then they need to specify/identify the same using device specific
> >     interrupt name. In such cases only that interrupt can be used as wakeup
> >     interrupt."
> >
> > We don't expect *any* interrupt to qualify as PCI WAKE#; so we should
> > still also document the interrupt name ("wake"?) in
> > Documentation/devicetree/bindings/pci/pci.txt as Bjorn suggested, in
> > addition to using the 'wakeup-source' property documented there.
> 
> I believe the defined interrupt name is "wakeup" as example 1 shows.

That's an example, not a definition. And the definition I quoted
literally says "device specific interrupt name". The PCIe specification
calls it "WAKE#" all over the place, so I figured that's a good name to
use.

"wakeup" is also fine I suppose, as long as we document that it must be
PCIe WAKE# signal, as per the PCIe specfication.

Brian
