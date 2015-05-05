From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH V2 1/3] phy: Add binding document for Pistachio USB2.0 PHY
Date: Tue, 5 May 2015 15:16:23 -0700
Message-ID: <CAL1qeaFacmDaCW6VSp247HZx+RwJKjYTWQhu5qxjH5JE3ET6Nw@mail.gmail.com>
References: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
	<1428444258-25852-2-git-send-email-abrestic@chromium.org>
	<20150505220116.GE17687@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150505220116.GE17687@jhogan-linux.le.imgtec.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Kishon Vijay Abraham I <kishon@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, James Hartley <james.hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi James,

On Tue, May 5, 2015 at 3:01 PM, James Hogan <james.hogan@imgtec.com> wrote:
> Hi Andrew,
>
> On Tue, Apr 07, 2015 at 03:04:16PM -0700, Andrew Bresticker wrote:
>> Add a binding document for the USB2.0 PHY found on the IMG Pistachio SoC.
>>
>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Pawel Moll <pawel.moll@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
>> Cc: Kumar Gala <galak@codeaurora.org>
>> ---
>> No changes from v1.
>> ---
>>  .../devicetree/bindings/phy/pistachio-usb-phy.txt  | 29 ++++++++++++++++++++++
>>  include/dt-bindings/phy/phy-pistachio-usb.h        | 16 ++++++++++++
>>  2 files changed, 45 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
>>  create mode 100644 include/dt-bindings/phy/phy-pistachio-usb.h
>>
>> diff --git a/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
>> new file mode 100644
>> index 0000000..afbc7e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
>> @@ -0,0 +1,29 @@
>> +IMG Pistachio USB PHY
>> +=====================
>> +
>> +Required properties:
>> +--------------------
>> + - compatible: Must be "img,pistachio-usb-phy".
>> + - #phy-cells: Must be 0.  See ./phy-bindings.txt for details.
>> + - clocks: Must contain an entry for each entry in clock-names.
>> +   See ../clock/clock-bindings.txt for details.
>> + - clock-names: Must include "usb_phy".
>> + - img,cr-top: Must constain a phandle to the CR_TOP syscon node.
>> + - img,refclk: Indicates the reference clock source for the USB PHY.
>> +   See <dt-bindings/phy/phy-pistachio-usb.h> for a list of valid values.
>
> Possibly dumb question: why isn't the reference clock source specified
> in the normal ways like the "usb_phy" clock is?
>
> Does the value required here depend on what usb_phy clock gets muxed
> from or something?

Right, the value indicates what clock "usb_phy" is: whether it comes
from the core clock controller, the XO crystal, or is some external
clock.  It's a mux internal to the PHY.

Thanks,
Andrew
