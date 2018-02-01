From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: firmware: Add bindings for ZynqMP firmware
Date: Thu, 1 Feb 2018 09:11:36 -0600
Message-ID: <CAL_JsqJMfUyi06jMZOyQX956HjBvyHbKHEcBGt+GTZrj3Da5DA@mail.gmail.com>
References: <1516836074-4149-1-git-send-email-jollys@xilinx.com>
 <1516836074-4149-2-git-send-email-jollys@xilinx.com> <20180130170818.tz4hoqvyekrl7uio@rob-hp-laptop>
 <DM2PR0201MB07674CED433B7273AEFC50D2B8FB0@DM2PR0201MB0767.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DM2PR0201MB07674CED433B7273AEFC50D2B8FB0@DM2PR0201MB0767.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <JOLLYS@xilinx.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "keescook@chromium.org" <keescook@chromium.org>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rajan Vaja <RAJANV@xilinx.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "mingo@kernel.org" <mingo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 12:03 PM, Jolly Shah <JOLLYS@xilinx.com> wrote:
> Hi Rob,
> Thanks for the review,
>
>> -----Original Message-----
>> From: Rob Herring [mailto:robh@kernel.org]
>> Sent: Tuesday, January 30, 2018 9:08 AM
>> To: Jolly Shah <JOLLYS@xilinx.com>
>> Cc: ard.biesheuvel@linaro.org; mingo@kernel.org;
>> gregkh@linuxfoundation.org; matt@codeblueprint.co.uk;
>> sudeep.holla@arm.com; hkallweit1@gmail.com; keescook@chromium.org;
>> dmitry.torokhov@gmail.com; michal.simek@xilinx.com;
>> mark.rutland@arm.com; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; devicetree@vger.kernel.org; Jolly Shah
>> <JOLLYS@xilinx.com>; Rajan Vaja <RAJANV@xilinx.com>
>> Subject: Re: [PATCH v3 1/4] dt-bindings: firmware: Add bindings for ZynqMP
>> firmware
>>
>> On Wed, Jan 24, 2018 at 03:21:11PM -0800, Jolly Shah wrote:
>> > Add documentation to describe Xilinx ZynqMP firmware driver bindings.
>> > Firmware driver provides an interface to firmware APIs. Interface APIs
>> > can be used by any driver to communicate to PMUFW (Platform Management
>> > Unit).
>> >
>> > Signed-off-by: Jolly Shah <jollys@xilinx.com>
>> > Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
>> > ---
>> >  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt    | 16
>> ++++++++++++++++
>> >  1 file changed, 16 insertions(+)
>> >  create mode 100644
>> > Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware
>> > .txt
>> >
>> > diff --git
>> > a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
>> > re.txt
>> > b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
>> > re.txt
>> > new file mode 100644
>> > index 0000000..a7aaf56
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-fi
>> > +++ rmware.txt
>> > @@ -0,0 +1,16 @@
>> > +Xilinx Zynq MPSoC Firmware Device Tree Bindings
>> > +
>> > +The zynqmp-firmware node describes the interface to platform firmware.
>>
>> Please define this a is child of /firmware.
>>
> I dint get you. It is already under firmware/xilinx.

Put it under a "firmware" node in DT. See other firmware bindings for examples.

Rob
