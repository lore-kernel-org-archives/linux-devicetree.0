From: Stefan Roese <sr@denx.de>
Subject: physmap_of and partitions (mtd concat support)
Date: Mon, 23 Mar 2009 11:51:10 +0100
Message-ID: <200903231151.10373.sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: linuxppc-dev@ozlabs.org, devicetree-discuss list <devicetree-discuss@ozlabs.org>
List-Id: devicetree@vger.kernel.org

I just noticed that physmap_of can't handle multiple devices of different type  
described in one device node. For example the Intel P30 48F4400 (64MByte) 
consists internally of 2 non-identical NOR chips. So a "simple" 

	flash@0,0 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "cfi-flash";
		reg = <0 0 0x04000000>;
		bank-width = <2>;
		device-width = <2>;
		partition@0 {
			label = "test-part";
			reg = <0 0x04000000>;
		};
	}

is not working. It will "detect" 2 identical 32MByte chips which is wrong. 
Adding a 2nd flash node solves this problem:

	flash@0,0 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "cfi-flash";
		reg = <0 0 0x02000000>;
		bank-width = <2>;
		device-width = <2>;
		partition@0 {
			label = "test-part1";
			reg = <0 0x02000000>;
		};
	}
	flash@1,0 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "cfi-flash";
		reg = <0 0x02000000 0x02000000>;
		bank-width = <2>;
		device-width = <2>;
		partition@0 {
			label = "test-part2";
			reg = <0 0x02000000>;
		};
	}

This way both chips are detected correctly.

Now the real problem: How should I describe a partition in the device tree 
spanning over both devices (concat)?. The current physmap_of driver doesn't 
handle concat at all (physmap.c does). I already have some ideas on how to 
implement this concat support in physmap_of. But ideas about a device-tree 
syntax for such partitions are very welcome.

Thanks.

Best regards,
Stefan
