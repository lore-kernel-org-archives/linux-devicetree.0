From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 3/5] arm64: dts: ti: Add Support for AM654 SoC
Date: Thu, 21 Jun 2018 06:36:44 -0500
Message-ID: <20180621113644.g24yzcixzeegsiks@kahuna>
References: <20180619194253.27288-1-nm@ti.com>
 <20180619194253.27288-4-nm@ti.com>
 <20180621053754.GD112168@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180621053754.GD112168@atomide.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tony Lindgren <tony@atomide.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05:37-20180621, Tony Lindgren wrote:
> * Nishanth Menon <nm@ti.com> [180619 19:46]:
> > +	cbass_main: cbass@100000 {
> > +		compatible = "simple-bus";
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges = <0x00100000 0x00 0x00100000 0x00020000>, /* ctrl mmr */
> > +			 <0x00600000 0x00 0x00600000 0x00001100>, /* GPIO */
> > +			 <0x00900000 0x00 0x00900000 0x00012000>, /* serdes */
> > +			 <0x01000000 0x00 0x01000000 0x0af02400>, /* Most peripherals */
> > +			 <0x30800000 0x00 0x30800000 0x0bc00000>, /* MAIN NAVSS */
> > +			 /* MCUSS Range */
> > +			 <0x28380000 0x00 0x28380000 0x03880000>,
> > +			 <0x40200000 0x00 0x40200000 0x00900100>,
> > +			 <0x42040000 0x00 0x42040000 0x03ac2400>,
> > +			 <0x45100000 0x00 0x45100000 0x00c24000>,
> > +			 <0x46000000 0x00 0x46000000 0x00200000>,
> > +			 <0x47000000 0x00 0x47000000 0x00068400>;
> > +
> > +		cbass_mcu: cbass@28380000 {
> > +			compatible = "simple-bus";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges = <0x28380000 0x28380000 0x03880000>, /* MCU NAVSS*/
> > +				 <0x40200000 0x40200000 0x00900100>, /* First peripheral window */
> > +				 <0x42040000 0x42040000 0x03ac2400>, /* WKUP */
> > +				 <0x45100000 0x45100000 0x00c24000>, /* MMRs, remaining NAVSS */
> > +				 <0x46000000 0x46000000 0x00200000>, /* CPSW */
> > +				 <0x47000000 0x47000000 0x00068400>; /* OSPI space 1 */
> > +
> > +			cbass_wakeup: cbass@42040000 {
> > +				compatible = "simple-bus";
> > +				#address-cells = <1>;
> > +				#size-cells = <1>;
> > +				/* WKUP  Basic peripherals */
> > +				ranges = <0x42040000 0x42040000 0x03ac2400>;
> > +			};
> > +		};
> > +	};
> > +};
> 
> You should use cbass_main: interconnect@1000000 and so on here.
> Other than that looks good to me, thanks for updating it.

Thanks, will wait till Monday to see if there are any further comments,
else will post a V2.

-- 
Regards,
Nishanth Menon
