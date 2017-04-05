From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [Query] DT warnings with ranges and sub-nodes
Date: Wed, 5 Apr 2017 14:58:13 +0100
Message-ID: <5b1fc8af-b5e1-75bd-6cf3-84ea75e4987f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

I am seeing some warning in juno DTS files. I would like to get your
feedback on how to resolve them.

Warning messages:

Warning (simple_bus_reg): Node /smb@8000000/motherboard/flash@0,00000000
simple-bus unit address format error, expected "0"
Warning (simple_bus_reg): Node
/smb@8000000/motherboard/ethernet@2,00000000 simple-bus unit address
format error, expected "200000000"
Warning (simple_bus_reg): Node
/smb@8000000/motherboard/iofpga@3,00000000 simple-bus unit address
format error, expected "300000000"

We have

        smb@8000000 {
                compatible = "simple-bus";
                #address-cells = <2>;
                #size-cells = <1>;
                ranges = <0 0 0 0x08000000 0x04000000>,
                         <1 0 0 0x14000000 0x04000000>,
                         <2 0 0 0x18000000 0x04000000>,
                         <3 0 0 0x1c000000 0x04000000>,
                         <4 0 0 0x0c000000 0x04000000>,
                         <5 0 0 0x10000000 0x04000000>;
		...
	
		flash@0,00000000 {
			...
		};
		ethernet@2,00000000 {
			...
		};
		iofpga@3,00000000 {
			...
		};
	};

All of which are @offset 0x0 in their respective ranges.

How do we specify the range as well as the offset ? Does the below
look like correct way of fixing those warnings ?
	flash@0
	ethernet@200000000
	iofpga@300000000

Or can I ignore these warning as I see the syntax to be correct as
provided in example in ePAPR(page 99 under Appendix B1 Ebony Device
Tree). Sorry if I have missed to follow any other thread on the same.

-- 
Regards,
Sudeep
