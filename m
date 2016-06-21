From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: Using DT overlays for adding virtual hardware
Date: Tue, 21 Jun 2016 12:13:22 +0200
Message-ID: <57691342.2020502@siemens.com>
References: <575828C0.5000008@siemens.com>
 <20160608151745.GB13355@leverpostej>
 <28BC1AEC-6A7D-4A97-82F4-5670E884C41D@konsulko.com>
 <20160608162343.GD13355@leverpostej>
 <999B1CFF-C204-4C19-AE76-AF9DB54E51E4@konsulko.com>
 <57584A2C.4030507@siemens.com> <5759069B.4080800@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <jailhouse-dev+bncBCJI7SMNV4NBBR5GUS5QKGQEFHNIKJI@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <5759069B.4080800@siemens.com>
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jailhouse <jailhouse-dev@googlegroups.com>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@denx.de>, Antonios Motakis <antonios.motakis@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

coming back to this topic:

On 2016-06-09 08:03, Jan Kiszka wrote:
> OK, trial and error, and some interesting insights: I've played with DT
> fragments and the overlay configfs patch of Pantelis [1] to have a
> convenient start. Interestingly, I wasn't able to load a fragment that
> followed the format specification for overlays ("Failed to resolve
> tree"). By chance, I got this one working:
> 
> /dts-v1/;
> / {
> 	fragment {
> 		target-path = "/soc@01c00000";
> 		__overlay__ {
> 			#address-cells = <2>;
> 			#size-cells = <2>;
> 
> 			vpci@0x2000000 {
> 				compatible = "pci-host-cam-generic";
> 				device_type = "pci";
> 				#address-cells = <3>;
> 				#size-cells = <2>;
> 				reg = <0 0x2000000 0 0x1000000>;
> 				ranges =
> 					<0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0x30000000>;
> 			};
> 		};
> 	};
> };
> 
> It successfully makes a BananaPi kernel add a pci host with the
> specified config space and MMIO window.
> 
> [   81.619583] PCI host bridge /soc@01c00000/vpci@0x2000000 ranges:
> [   81.619610]   No bus range found for /soc@01c00000/vpci@0x2000000, using [bus 00-ff]
> [   81.619634]   MEM 0x10000000..0x3fffffff -> 0x10000000
> [   81.620482] pci-host-generic 2000000.vpci: ECAM at [mem 0x02000000-0x02ffffff] for [bus 00-ff]
> [   81.620779] pci-host-generic 2000000.vpci: PCI host bridge to bus 0000:00
> [   81.620801] pci_bus 0000:00: root bus resource [bus 00-ff]
> [   81.620814] pci_bus 0000:00: root bus resource [mem 0x10000000-0x3fffffff]
> [   81.620851] PCI: bus0: Fast back to back transfers enabled
> 
> So, no /plugin/ statement, no phandles resolution. This format even
> builds with the in-kernel dtc. Any explanations? Does the code make
> sense (at least it builds without warnings)?
> 
> Now I need to back this with some code in Jailhouse.

Meanwhile I got a virtual PCI device recognized by Linux when running
over Jailhouse. However, my hack above doesn't get me to proper
interrupt mapping yet. This is what I was trying with upstream dtc:

/dts-v1/;
/ {
	compatible = "lemaker,bananapi", "allwinner,sun7i-a20";

	fragment@0 {
		target-path = "/soc@01c00000";
		__overlay__ {
			#address-cells = <2>;
			#size-cells = <2>;

			vpci@2000000 {
				compatible = "pci-host-ecam-generic";
				device_type = "pci";
				bus-range = <0 0>;
				#address-cells = <3>;
				#size-cells = <2>;
				#interrupt-cells = <1>;
				interrupt-map-mask = <0 0 0 7>;
				interrupt-map = <0 0 0 1 &gic 0 0 0 123 4>,
						<0 0 0 2 &gic 0 0 0 124 4>,
						<0 0 0 3 &gic 0 0 0 125 4>,
						<0 0 0 4 &gic 0 0 0 126 4>;
				reg = <0 0x2000000 0 0x100000>;
				ranges =
					<0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0x30000000>;
			};
		};
	};

	gic: fragment@1 {
		target-path = "/soc@01c00000/interrupt-controller@01c81000";
		__overlay__ {
		};
	};
};

And this is what Linux detects on that PCI bus:

00:0f.0 RAM memory: Red Hat, Inc Inter-VM shared memory
        Subsystem: Red Hat, Inc Inter-VM shared memory
        Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 17
        Region 0: Memory at 10000000 (64-bit, non-prefetchable) [size=256]
        Region 4: Memory at 10000100 (64-bit, non-prefetchable) [size=32]
        Kernel modules: ivshmem_net

However, registering a handler on IRQ 17 fails (-EINVAL).


With your dtc [2] (dtc -@ -I dts -O dtb -o vpci-bpi.dtb vpci-bpi.dts)
and this fragment, I'm still not able to load the blob:

/dts-v1/;
/plugin/;
/ {
	compatible = "lemaker,bananapi", "allwinner,sun7i-a20";

	fragment@0 {
		target-path = "/soc@01c00000";
		__overlay__ {
			#address-cells = <2>;
			#size-cells = <2>;

			vpci@2000000 {
				compatible = "pci-host-ecam-generic";
				device_type = "pci";
				bus-range = <0 0>;
				#address-cells = <3>;
				#size-cells = <2>;
				#interrupt-cells = <1>;
				interrupt-map-mask = <0 0 0 7>;
				interrupt-map = <0 0 0 1 &gic 0 0 0 123 4>,
						<0 0 0 2 &gic 0 0 0 124 4>,
						<0 0 0 3 &gic 0 0 0 125 4>,
						<0 0 0 4 &gic 0 0 0 126 4>;
				reg = <0 0x2000000 0 0x100000>;
				ranges =
					<0x02000000 0x00 0x10000000 0x00 0x10000000 0x00 0x30000000>;
			};
		};
	};
};

Any suggestions? Any patches I'm missing in upstream to make that work?

Jan

[1] https://github.com/pantoniou/linux-beagle-track-mainline/commit/160e68ec89eca33e8ed0abb13d52c07c54d7fc10
[2] https://github.com/pantoniou/dtc/tree/dgibson-overlay-panto

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux
