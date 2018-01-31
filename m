From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v3 1/4] dt-bindings: firmware: Add bindings for ZynqMP
 firmware
Date: Wed, 31 Jan 2018 18:03:14 +0000
Message-ID: <DM2PR0201MB07674CED433B7273AEFC50D2B8FB0@DM2PR0201MB0767.namprd02.prod.outlook.com>
References: <1516836074-4149-1-git-send-email-jollys@xilinx.com>
 <1516836074-4149-2-git-send-email-jollys@xilinx.com>
 <20180130170818.tz4hoqvyekrl7uio@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180130170818.tz4hoqvyekrl7uio@rob-hp-laptop>
Content-Language: en-US
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "keescook@chromium.org" <keescook@chromium.org>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rajan Vaja <RAJANV@xilinx.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "mingo@kernel.org" <mingo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,
Thanks for the review,

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, January 30, 2018 9:08 AM
> To: Jolly Shah <JOLLYS@xilinx.com>
> Cc: ard.biesheuvel@linaro.org; mingo@kernel.org;
> gregkh@linuxfoundation.org; matt@codeblueprint.co.uk;
> sudeep.holla@arm.com; hkallweit1@gmail.com; keescook@chromium.org;
> dmitry.torokhov@gmail.com; michal.simek@xilinx.com;
> mark.rutland@arm.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; Jolly Shah
> <JOLLYS@xilinx.com>; Rajan Vaja <RAJANV@xilinx.com>
> Subject: Re: [PATCH v3 1/4] dt-bindings: firmware: Add bindings for ZynqMP
> firmware
> 
> On Wed, Jan 24, 2018 at 03:21:11PM -0800, Jolly Shah wrote:
> > Add documentation to describe Xilinx ZynqMP firmware driver bindings.
> > Firmware driver provides an interface to firmware APIs. Interface APIs
> > can be used by any driver to communicate to PMUFW (Platform Management
> > Unit).
> >
> > Signed-off-by: Jolly Shah <jollys@xilinx.com>
> > Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> > ---
> >  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt    | 16
> ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware
> > .txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
> > re.txt
> > b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmwa
> > re.txt
> > new file mode 100644
> > index 0000000..a7aaf56
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-fi
> > +++ rmware.txt
> > @@ -0,0 +1,16 @@
> > +Xilinx Zynq MPSoC Firmware Device Tree Bindings
> > +
> > +The zynqmp-firmware node describes the interface to platform firmware.
> 
> Please define this a is child of /firmware.
>
I dint get you. It is already under firmware/xilinx.

 
> Also, some brief summary of what functions the firmware provides would be
> nice.
> 
Sure. Will add it in next version.


> > +
> > +Required properties:
> > + - compatible:	Must contain:  "xlnx,zynqmp-firmware"
> > + - method:	The method of calling the PM-API firmware layer.
> > +		Permitted values are:
> > +		 - "smc" : To be used in configurations without a hypervisor
> > +		 - "hvc" : To be used when hypervisor is present
> 
> Do you really need to support hvc?
Yes we do support hvc and smc both.

> 
> > +
> > +Examples:
> > +	zynqmp_firmware: zynqmp-firmware {
> > +		compatible = "xlnx,zynqmp-firmware";
> > +		method = "smc";
> > +	};
> > --
> > 2.7.4
> >
