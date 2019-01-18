From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
Date: Fri, 18 Jan 2019 22:06:21 +0100
Message-ID: <09d31d456e727a27bab66c89004f1d6c42588fd9.camel@baylibre.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
         <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
         <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
         <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
         <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
         <CAFBinCAdJu2C-LWspiHR4vVr=PUD2HGNi4zz+CSJP96ZE4GoJw@mail.gmail.com>
         <98166e2c-f5f8-55b9-6acb-7374bf10d80c@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <98166e2c-f5f8-55b9-6acb-7374bf10d80c@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianxin Pan <jianxin.pan@amlogic.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Victor Wan <victor.wan@amlogic.com>
List-Id: devicetree@vger.kernel.org

On Sat, 2019-01-19 at 02:09 +0800, Jianxin Pan wrote:
> Hi Martin and Jerome,
> 
> On 2019/1/18 5:20, Martin Blumenstingl wrote:
> > On Thu, Jan 17, 2019 at 9:39 PM Jerome Brunet <jbrunet@baylibre.com>
> > wrote:
> > > On Thu, 2019-01-17 at 21:27 +0100, Martin Blumenstingl wrote:
> > > > OK, but we had incorrect documentation in the past. did you check this
> > > > with someone from Amlogic?
> > > > 
> > > > I'm curious because there seem to be two different approaches here:
> > > > 1) hiubus name and offsets are being fixed within this patch
> > > > 2) aobus is being dropped here and re-introduced with a different name
> > > > later
> > > > on
> > > > 
> > > 
> > > because hiu exist and aobus does not, for which both the name and size
> > > was
> > > wrong
> > > 
> > > > approach 1) can also be used for the "rti" region (at least in my
> > > > opinion, the patch doesn't explain why it can't be done):
> > > 
> > > THe patch remove aobus (instead of fixing name and size) because, of the
> > > multiple region documented covered by this 'made region', I did not
> > > anticipate
> > > which one will be required and I did not want to add them all.
> > > 
> > > Better to add them as needed, which is want I done for pinctrl as you
> > > pointed
> > > out
> > > 
> > > > rename "aobus" to "rti" and change the size to either 0x1000 or 0xb000
> > > > (both values can be found in mesong12a.dtsi from
> > > > buildroot_openlinux_kernel_4.9_fbdev_20180706)
> > > 
> > > RTI is added here:
> > > https://lkml.kernel.org/r/20190117103151.3349-1-jbrunet@baylibre.com
> > > 
> > > I don't really understand the problem ? result is the same
> > the actual problem is "me" as I have conflicting information:
> > - Amlogic's buildroot kernel (for G12A) uses similar bus definitions
> > as the GX SoCs (for which there are public datasheets) - this is how
> > Jianxin added it to meson-g12a.dtsi originally
> > - this patch does it different - but cannot check if this is correct
> > (no public datasheet is available for G12A or AXG) nor do I have a
> > "big picture" of upcoming changes
> > 
> > Cc'ing Jianxin: can you please review Jerome's patch and give some
> > more details on the memory map on G12A so further contributions can be
> > reviewed easier?
> > 
> 1. "aobus: bus@ff800000" describes the following registers:
> ahb	ao_reg	reserved	980	FF80B000
> ahb	ao_reg	ao_mailbox	4	FF80A000
> ahb	ao_reg	sar_adc		4	FF809000
> ahb	ao_reg	ir_dec		4	FF808000
> ahb	ao_reg	pwm_ab		4	FF807000
> ahb	ao_reg	i2c_s		4	FF806000
> ahb	ao_reg	i2c_m		4	FF805000
> ahb	ao_reg	uart2		4	FF804000
> ahb	ao_reg	uart		4	FF803000
> ahb	ao_reg	pwm_cd		4	FF802000
> ahb	ao_reg	reserved	4	FF801000
> ahb	ao_reg	rti		4	FF800000
> 
> 
> 2. "cbus: bus@ffd00000" describes the following registers:
> capb3	cbus	reserved	872	FFD26000	FFDFFFFF
> capb3	cbus	sc		4	FFD25000	FFD25FFF
> capb3	cbus	uart0		4	FFD24000	FFD24FFF
> capb3	cbus	uart1		4	FFD23000	FFD23FFF
> capb3	cbus	uart2		4	FFD22000	FFD22FFF
> capb3	cbus	reserved	4	FFD21000	FFD21FFF
> capb3	cbus	reserved	4	FFD20000	FFD20FFF
> capb3	cbus	i2c_m0		4	FFD1F000	FFD1FFFF
> capb3	cbus	i2c_m1		4	FFD1E000	FFD1EFFF
> capb3	cbus	i2c_m2		4	FFD1D000	FFD1DFFF
> capb3	cbus	i2c_m3		4	FFD1C000	FFD1CFFF
> capb3	cbus	pwm_ab		4	FFD1B000	FFD1BFFF
> capb3	cbus	pwm_cd		4	FFD1A000	FFD1AFFF
> capb3	cbus	pwm_ef		4	FFD19000	FFD19FFF
> capb3	cbus	msr_clk		4	FFD18000	FFD18FFF
> capb3	cbus	reserved	4	FFD17000	FFD17FFF
> capb3	cbus	reserved	4	FFD16000	FFD16FFF
> capb3	cbus	spicc_1		4	FFD15000	FFD15FFF
> capb3	cbus	spifc		4	FFD14000	FFD14FFF
> capb3	cbus	spicc_0		4	FFD13000	FFD13FFF
> capb3	cbus	reserved	4	FFD12000	FFD12FFF
> capb3	cbus	reserved	4	FFD11000	FFD11FFF
> capb3	cbus	reserved	4	FFD10000	FFD10FFF
> capb3	cbus	isa		4	FFD0F000	FFD0FFFF
> capb3	cbus	parser		4	FFD0E000	FFD0EFFF
> capb3	cbus	reserved	4	FFD0D000	FFD0DFFF
> capb3	cbus	sana		4	FFD0C000	FFD0CFFF
> capb3	cbus	stream		4	FFD0B000	FFD0BFFF
> capb3	cbus	async_fifo	4	FFD0A000	FFD0AFFF
> capb3	cbus	async_fifo2	4	FFD09000	FFD09FFF
> capb3	cbus	assist		4	FFD08000	FFD08FFF
> capb3	cbus	mipi_dsi_host	4	FFD07000	FFD07FFF
> capb3	cbus	stb		4	FFD06000	FFD06FFF
> capb3	cbus	aififo		4	FFD05000	FFD05FFF
> capb3	cbus	reserved	4	FFD04000	FFD04FFF
> capb3	cbus	reserved	4	FFD03000	FFD03FFF
> capb3	cbus	reserved	4	FFD02000	FFD02FFF
> capb3	cbus	reset		4	FFD01000	FFD01FFF
> capb3	cbus	reserved	4	FFD00000	FFD00FFF

Hu Jianxin,

Thanks for sharing this. Any other region we should know about ? what about
the apb region that isn't documented either ?

> 
> 3. In public data sheet, I can only found memory map about sub-regions of
> each bus. 
> And no information about the bus itself.
> 
> > Regards
> > Martin
> > 
> > .
> > 
