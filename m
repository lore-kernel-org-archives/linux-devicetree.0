From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv1] rtc: bcm-iproc: Add support for Broadcom iproc rtc
Date: Wed, 11 Mar 2015 21:31:42 +0100
Message-ID: <3192051.z32dL5alyl@wuerfel>
References: <1418757750-3628-1-git-send-email-arun.ramamurthy@broadcom.com> <2216310.NqXA88JvvL@wuerfel> <55009ED6.4050205@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55009ED6.4050205@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Arun Ramamurthy <arun.ramamurthy@broadcom.com>, mark.rutland@arm.com, a.zummo@towertech.it, sbranden@broadcom.com, pawel.moll@arm.com, devicetree@vger.kernel.org, rtc-linux@googlegroups.com, Ray Jui <rjui@broadcom.com>, ijc+devicetree@hellion.org.uk, Arun Ramamurthy <arunrama@broadcom.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com, galak@codeaurora.org, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On Wednesday 11 March 2015 13:00:22 Arun Ramamurthy wrote:
> 
> Arnd, this is the device tree entry that I would end up with and I plan 
> to use syscon_regmap_lookup_by_phandle in the rtc driver. Does this look 
> acceptable?
> 
> rtc: iproc_rtc@0x03026000 {
>                 compatible = "brcm,iproc-rtc";
>                 reg =   <0x03026000 0xC>,
>                 iso_cell_syscon = <&crmu_iso_cell_control>;
>                 bbl_auth_syscon = <&crmu_bbl_auth>
>                 status = "okay";
> 
> crmu_iso_cell_control:crmu@0x0301C02C {
>                 compatible = "syscon";
>                 reg = <0x0301C038 0x8>
> }
> 
> crmu_bbl_auth:crmu@0x03024C74 {
>                 compatible = "syscon";
>                 reg = <0x03024C74 0x8>;
> }

This doesn't look right, sorry:

A syscon device is defined as a collection of registers that
have no logical grouping within them but that can be seen
as a single device. What you have here instead are two syscon
nodes that each have only a single 8-byte register.

What are the other registers surrounding those? I would expect
something like

	crmu0: syscon@03010000 {
                 compatible = "syscon";
                 reg = <0x03010000 0x10000>;
	};

and then use an offset into the syscon from the rtc node, like

	iproc_rtc: rtc@03026000 {
		compatible = "brcm,iproc-rtc";
		reg = <0x03026000 0x1000>;
		iso_cell_syscon = <&crmu0 0xc038>;
		bbl_auth_syscon = <&crmu1 0x4c74>;
	};

Note also that you got most of the naming wrong:

- node names should be generic strings like "rtc", "syscon", "pci" etc.
  The specific strings are defined in ePAPR.
- unit addresses should match the first 'reg' property and
  not start with '0x'.
- it seems strange that the rtc has only 12 bytes of registers,
  though that may actually be correct.

	Arnd
