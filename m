From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Question about shared interrupts in devicetree
Date: Sat, 4 Apr 2015 23:40:13 +0200 (CEST)
Message-ID: <2039290448.1160624.1428183613109.JavaMail.open-xchange@oxbaltgw03.schlund.de>
Reply-To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kernelnewbies <kernelnewbies-7JyXY6prKcjpASu1u0TL5ti2O/JbrIOy@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

i'm currently working on drivers (regulator and power switch) for a power
subsystem of a ARM9 processor (Freescale i.MX28). There are interrupts for the
power subsystem which share the same interrupt line. This interrupt line is
needed by both drivers (regulator and power switch).

Now the question what is the right way (tm) to specify the interrupt in the
devicetree and fetch the irq number during driver probe?

Option A (define interrupt in parent node):

  power: power@80044000 {
	compatible = "fsl,imx28-power", "syscon";
	reg = <0x80044000 0x2000>;
	interrupts = <6>;

	reg_vddd: regulator@1 {
		compatible = "fsl,imx28-vddd";
	};

	pswitch: pswitch@5 {
		compatible = "fsl,mxs-pswitch";
		linux,code = <116>;
	};
  }

  int irq = irq_of_parse_and_map(parent, 0);

Option B (define interrupt for each child node):

  power: power@80044000 {
	compatible = "fsl,imx28-power", "syscon";
	reg = <0x80044000 0x2000>;

	reg_vddd: regulator@1 {
		compatible = "fsl,imx28-vddd";
		interrupts = <6>;
	};

	pswitch: pswitch@5 {
		compatible = "fsl,mxs-pswitch";
		linux,code = <116>;
		interrupts = <6>;
	};
  }

  int irq = platform_get_irq(pdev, 0);

Best regards
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
