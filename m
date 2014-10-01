From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 2/6] arm64: Add DTS support for Spreadtrum's Shark64 SoC
Date: Wed, 1 Oct 2014 12:17:17 +0100
Message-ID: <20141001111717.GH12702@e104818-lin.cambridge.arm.com>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com>
 <1411992293-7729-3-git-send-email-zhang.lyra@gmail.com>
 <4004425.NZAxCnE0qr@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4004425.NZAxCnE0qr@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "jslaby@suse.cz" <jslaby@suse.cz>, "galak@codeaurora.org" <galak@codeaurora.org>, "broonie@linaro.org" <broonie@linaro.org>, Mark Rutland <Mark.Rutland@arm.com>, "m-karicheri2@ti.com" <m-karicheri2@ti.com>, Pawel Moll <Pawel.Moll@arm.com>, "artagnon@gmail.com" <artagnon@gmail.com>, "rrichter@cavium.com" <rrichter@cavium.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Will Deacon <Will.Deacon@arm.com>, "orsonzhai@gmail.com" <orsonzhai@gmail.com>, "geng.ren@spreadtrum.com" <geng.ren@spreadtrum.com>, "zhizhou.zhang@spreadtrum.com" <zhizhou.zhang@spreadtrum.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 29, 2014 at 02:47:47PM +0100, Arnd Bergmann wrote:
> On Monday 29 September 2014 20:04:49 zhang.lyra@gmail.com wrote:
> > +	cpus {
> > +		#address-cells = <2>;
> > +		#size-cells = <0>;
> > +
> > +		cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "arm,armv8";
> > +			reg = <0x0 0x0>;
> > +			enable-method = "spin-table";
> > +			cpu-release-addr = <0x0 0x8000fff8>;
> > +		};
> 
> New platforms should avoid using "spin-table" method. Please
> change the boot loader to implement PSCI if you can.

As usual, I strongly recommend PSCI here if the CPU supports EL3. It
would solve the cpuidle kernel support as well with the generic cpuidle
driver and the PSCI back-end.

-- 
Catalin
