From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: adc: Add Xilinx AMS binding
 documentation
Date: Sat, 27 Apr 2019 13:05:00 +0100
Message-ID: <20190427130500.7b695b33@archlinux>
References: <1555943870-15353-1-git-send-email-manish.narani@xilinx.com>
        <1555943870-15353-2-git-send-email-manish.narani@xilinx.com>
        <20190426193309.GA9084@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426193309.GA9084@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Manish Narani <manish.narani@xilinx.com>, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, mark.rutland@arm.com, michal.simek@xilinx.com, Jisheng.Zhang@synaptics.com, olof@lixom.net, dinguyen@kernel.org, amit.kucheria@linaro.org, stefan.popa@analog.com, dmurphy@ti.com, marcus.folkesson@gmail.com, tmaimon77@gmail.com, ricardo@ribalda.com, xc-racer2@live.ca, contact@artur-rojek.eu, geert@linux-m68k.org, smohanad@codeaurora.org, charles-antoine.couret@essensium.com, stefan@agner.ch, max.krummenacher@toradex.com, lee.jones@linaro.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 26 Apr 2019 14:33:09 -0500
Rob Herring <robh@kernel.org> wrote:

> On Mon, Apr 22, 2019 at 08:07:48PM +0530, Manish Narani wrote:
> > Xilinx AMS have several ADC channels that can be used for measurement of
> > different voltages and temperatures. Document the same in the bindings.
> > 
> > Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> > ---
> >  .../devicetree/bindings/iio/adc/xilinx-ams.txt     | 183 +++++++++++++++++++++
> >  1 file changed, 183 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-ams.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/xilinx-ams.txt b/Documentation/devicetree/bindings/iio/adc/xilinx-ams.txt
> > new file mode 100644
> > index 0000000..cacb6d4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/xilinx-ams.txt
> > @@ -0,0 +1,183 @@
> > +Xilinx AMS controller
> > +`````````````````````
> > +The AMS (Analog Monitoring System) includes an ADC as well as on-chip sensors
> > +that can be used to sample external voltages and monitor on-die operating
> > +conditions, such as temperature and supply voltage levels.
> > +The AMS has two SYSMON blocks which are PL (Programmable Logic) SYSMON and
> > +PS (Processing System) SYSMON.
> > +All designs should have AMS registers, but PS and PL are optional. The
> > +AMS controller can work with only PS, only PL and both PS and PL
> > +configurations. Please specify registers according to your design. Devicetree
> > +should always have AMS module property. Providing PS & PL module is optional.
> > +
> > +Required properties:
> > +	- compatible: Should be "xlnx,zynqmp-ams"
> > +	- reg: Should specify AMS register space
> > +	- interrupts: Interrupt number for the AMS control interface
> > +	- interrupt-names: Interrupt name, must be "ams-irq"
> > +	- clocks: Should contain a clock specifier for the device
> > +	- ranges: keep the property empty to map child address space
> > +	          (for PS and/or PL) nodes 1:1 onto the parent address
> > +	          space  
> 
> empty is not what you've done in the example. Non-empty is preferred.
> 
> > +
> > +	AMS sub-nodes:
> > +		- ams-ps : Used as PS-SYSMON node
> > +		- ams-pl : Used as PL-SYSMON node
> > +
> > +
> > +
> > +AMS PS-SYSMON
> > +`````````````
> > +PS (Processing System) SYSMON is memory mapped to PS. This block has built-in
> > +alarm generation logic that is used to interrupt the processor based on
> > +condition set.
> > +
> > +Required properties:
> > +	- compatible: Should be "xlnx,zynqmp-ams-ps"
> > +	- reg: Register space for PS-SYSMON
> > +
> > +
> > +
> > +AMS PL-SYSMON
> > +`````````````
> > +PL-SYSMON is capable of monitoring off chip voltage and temperature. PL-SYSMON
> > +block has DRP, JTAG and I2C interface to enable monitoring from external master.
> > +Out of this interface currently only DRP is supported. This block has alarm
> > +generation logic that is used to interrupt the processor based on condition set.
> > +
> > +Required properties:
> > +	- compatible: Should be "xlnx,zynqmp-ams-pl"
> > +	- reg: Register space for PL-SYSMON
> > +
> > +PL-SYSMON optional sub-nodes:
> > +	- xlnx,ext-channels: List of external channels that are connected to the
> > +	                     AMS PL module.  
> 
> Why not just get rid of this and move 'channel' nodes up a level?
> 
> > +
> > +	  The child nodes of PL-SYSMON represent the external channels which are
> > +	  connected to this Module. If the property is not present
> > +	  no external channels will be assumed to be connected.
> > +
> > +	  Each child node represents one channel and has the following
> > +	  properties:
> > +
> > +	Required properties:
> > +		* reg: Pair of pins the channel is connected to. This value is
> > +		       same as Channel Number for particular channel.
> > +
> > +		    'reg' value		Channel Name
> > +		    -----------		------------
> > +			30		VP/VN
> > +			31		VUSER0
> > +			32		VUSER1
> > +			33		VUSER3
> > +			34		VUSER4
> > +			35		VAUXP[0]/VAUXN[0]
> > +			36		VAUXP[1]/VAUXN[1]
> > +			...
> > +			50		VAUXP[15]/VAUXN[15]
> > +
> > +		Each channel number should only be used at most once. For
> > +		more details on channels, refer to the table given at the end.
> > +
> > +	Optional properties:
> > +		* xlnx,bipolar: If set the channel is used in bipolar
> > +		  mode.  
> 
> I think we have a standard property for this now.
Yes, in the meantime we introduced a standard binding for
child channels, including bipolar.

Documentation/devicetree/bindings/iio/adc/adc.txt

I haven't totally thought through how it maps to this particular device
but from a quick glance, it should be possible.

You will need to be more explicit with the pair of channels, rather
than basically using an enum though.
Have a go and let's see how it looks before concluding if that
binding perhaps needs further extension.

Thanks,

Jonathan


> 
> > +
> > +
> > +Example:
> > +	xilinx_ams: ams@ffa50000 {
> > +		compatible = "xlnx,zynqmp-ams";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <0 56 4>;
> > +		interrupt-names = "ams-irq";
> > +		reg = <0x0 0xffa50000 0x0 0x800>;
> > +		reg-names = "ams-base";
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		#io-channel-cells = <1>;
> > +		ranges = <0 0 0xffa50800 0x800>;
> > +
> > +		ams_ps: ams-ps@0,0 {  
> 
> unit address should be '0'
> 
> > +			compatible = "xlnx,zynqmp-ams-ps";
> > +			reg = <0 0x400>;
> > +		};
> > +
> > +		ams_pl: ams-pl@1,0 {  
> 
> unit address should be '400'
> 
> > +			compatible = "xlnx,zynqmp-ams-pl";
> > +			reg = <0x400 0x400>;
> > +			xlnx,ext-channels {  
> 
> Needs #address-cells and #size-cells. dtc should complain here.
> 
> > +				channel@30 {
> > +					reg = <30>;
> > +					xlnx,bipolar;
> > +				};
> > +				channel@31 {
> > +					reg = <31>;
> > +				};
> > +				channel@38 {
> > +					reg = <38>;
> > +					xlnx,bipolar;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +
> > +AMS Channel Details
> > +```````````````````
> > +Sysmon Block	|Channel|			Details					|Measurement
> > +		|Number	|							 	|Type
> > +---------------------------------------------------------------------------------------------------------
> > +AMS CTRL	|0	|System PLLs voltage measurement, VCC_PSPLL.			|Voltage
> > +		|1	|Battery voltage measurement, VCC_PSBATT.			|Voltage
> > +		|2	|PL Internal voltage measurement, VCCINT.			|Voltage
> > +		|3	|Block RAM voltage measurement, VCCBRAM.			|Voltage
> > +		|4	|PL Aux voltage measurement, VCCAUX.				|Voltage
> > +		|5	|Voltage measurement for six DDR I/O PLLs, VCC_PSDDR_PLL.	|Voltage
> > +		|6	|VCC_PSINTFP_DDR voltage measurement.				|Voltage
> > +---------------------------------------------------------------------------------------------------------
> > +PS Sysmon	|7	|LPD temperature measurement.					|Temperature
> > +		|8	|FPD temperature measurement (REMOTE).				|Temperature
> > +		|9	|VCC PS LPD voltage measurement (supply1).			|Voltage
> > +		|10	|VCC PS FPD voltage measurement (supply2).			|Voltage
> > +		|11	|PS Aux voltage reference (supply3).				|Voltage
> > +		|12	|DDR I/O VCC voltage measurement.				|Voltage
> > +		|13	|PS IO Bank 503 voltage measurement (supply5).			|Voltage
> > +		|14	|PS IO Bank 500 voltage measurement (supply6).			|Voltage
> > +		|15	|VCCO_PSIO1 voltage measurement.				|Voltage
> > +		|16	|VCCO_PSIO2 voltage measurement.				|Voltage
> > +		|17	|VCC_PS_GTR voltage measurement (VPS_MGTRAVCC).			|Voltage
> > +		|18	|VTT_PS_GTR voltage measurement (VPS_MGTRAVTT).			|Voltage
> > +		|19	|VCC_PSADC voltage measurement.					|Voltage
> > +---------------------------------------------------------------------------------------------------------
> > +PL Sysmon	|20	|PL temperature measurement.					|Temperature
> > +		|21	|PL Internal voltage measurement, VCCINT.			|Voltage
> > +		|22	|PL Auxiliary voltage measurement, VCCAUX.			|Voltage
> > +		|23	|ADC Reference P+ voltage measurement.				|Voltage
> > +		|24	|ADC Reference N- voltage measurement.				|Voltage
> > +		|25	|PL Block RAM voltage measurement, VCCBRAM.			|Voltage
> > +		|26	|LPD Internal voltage measurement, VCC_PSINTLP (supply4).	|Voltage
> > +		|27	|FPD Internal voltage measurement, VCC_PSINTFP (supply5).	|Voltage
> > +		|28	|PS Auxiliary voltage measurement (supply6).			|Voltage
> > +		|29	|PL VCCADC voltage measurement (vccams).			|Voltage
> > +		|30	|Differential analog input signal voltage measurment.		|Voltage
> > +		|31	|VUser0 voltage measurement (supply7).				|Voltage
> > +		|32	|VUser1 voltage measurement (supply8).				|Voltage
> > +		|33	|VUser2 voltage measurement (supply9).				|Voltage
> > +		|34	|VUser3 voltage measurement (supply10).				|Voltage
> > +		|35	|Auxiliary ch 0 voltage measurement (VAux0).			|Voltage
> > +		|36	|Auxiliary ch 1 voltage measurement (VAux1).			|Voltage
> > +		|37	|Auxiliary ch 2 voltage measurement (VAux2).			|Voltage
> > +		|38	|Auxiliary ch 3 voltage measurement (VAux3).			|Voltage
> > +		|39	|Auxiliary ch 4 voltage measurement (VAux4).			|Voltage
> > +		|40	|Auxiliary ch 5 voltage measurement (VAux5).			|Voltage
> > +		|41	|Auxiliary ch 6 voltage measurement (VAux6).			|Voltage
> > +		|42	|Auxiliary ch 7 voltage measurement (VAux7).			|Voltage
> > +		|43	|Auxiliary ch 8 voltage measurement (VAux8).			|Voltage
> > +		|44	|Auxiliary ch 9 voltage measurement (VAux9).			|Voltage
> > +		|45	|Auxiliary ch 10 voltage measurement (VAux10).			|Voltage
> > +		|46	|Auxiliary ch 11 voltage measurement (VAux11).			|Voltage
> > +		|47	|Auxiliary ch 12 voltage measurement (VAux12).			|Voltage
> > +		|48	|Auxiliary ch 13 voltage measurement (VAux13).			|Voltage
> > +		|49	|Auxiliary ch 14 voltage measurement (VAux14).			|Voltage
> > +		|50	|Auxiliary ch 15 voltage measurement (VAux15).			|Voltage
> > +---------------------------------------------------------------------------------------------------------
> > -- 
> > 2.1.1
> >   
