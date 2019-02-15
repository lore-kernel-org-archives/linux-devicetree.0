From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH 2/2] usb: dwc3: Add workaround for host mode VBUS glitch
 when boot
Date: Fri, 15 Feb 2019 08:39:19 +0000
Message-ID: <AM5PR0402MB286587BA0B90A50FB0AC8A58F1600@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190116064820.20007-3-ran.wang_1@nxp.com>
 <201901162139.dkm3lJv5%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201901162139.dkm3lJv5%fengguang.wu@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe,

    Sorry for the late response, I didn't receive your mail.

Felipe Balbi <balbi@kernel.org> wrotes:
>Hi,
>
>Ran Wang <ran.wang_1@nxp.com> writes:
>> +static void dwc3_power_off_all_roothub_ports(struct dwc3 *dwc)
>> +{
>> +	int i, port_num;
>> +	u32 reg, op_regs_base, offset;
>> +	void __iomem		*xhci_regs;
>> +
>> +	/* xhci regs is not mapped yet, do it temperary here */
>> +	if (dwc->xhci_resources[0].start) {
>> +		xhci_regs =3D ioremap(dwc->xhci_resources[0].start,
>> +				DWC3_XHCI_REGS_END);
>> +		if (IS_ERR(xhci_regs)) {
>> +			dev_err(dwc->dev, "Failed to ioremap xhci_regs\n");
>> +			return;
>> +		}
>> +
>> +		op_regs_base =3D HC_LENGTH(readl(xhci_regs));
>> +		reg =3D readl(xhci_regs + XHCI_HCSPARAMS1);
>> +		port_num =3D HCS_MAX_PORTS(reg);
>> +
>> +		for (i =3D 1; i <=3D port_num; i++) {
>> +			offset =3D op_regs_base + XHCI_PORTSC_BASE + 0x10*(i-1);
>> +			reg =3D readl(xhci_regs + offset);
>> +			reg &=3D ~PORT_POWER;
>> +			writel(reg, xhci_regs + offset);
>> +		}
>> +
>> +		iounmap(xhci_regs);
>
>why can't this be done during xhci_gen_setup()?

Actually I have done experiment like what you suggested (in xhci-plat.c), b=
ut the timing
seems too late--making VBUS waveform look like a square wave as below:

              Here DWC3 enable host mode, VBUS on
              |
+5V          /---------\ 40ms  /---------------------------....
0V  ________/   90ms   \______/
                       |      |          =20
                       |      Here do xhci reset, VBUS back to +5V again
                       Here set all PORTSC[PP] to 0 in xhci_gen_setup()

So I am afraid the solution might have to be added in DWC3 core driver wher=
e just after host mode enabling code if want fix this :(

Regards,
Ran
