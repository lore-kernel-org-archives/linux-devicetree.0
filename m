From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: condor/v3hsk: add
 DU/LVDS/HDMI support
Date: Wed, 22 Aug 2018 22:27:45 +0300
Message-ID: <47f27732-e276-9808-a580-e31061258fec@cogentembedded.com>
References: <95d0db34-713d-8206-00c2-ee9a42aab823@cogentembedded.com>
 <c78f1228-afb0-54cf-5d9e-5c812b678de3@cogentembedded.com>
 <2345061.kvOJ0NRlsT@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2345061.kvOJ0NRlsT@avalon>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello!

On 08/13/2018 06:19 PM, Laurent Pinchart wrote:

>> Define the Condor/V3HSK board dependent parts of the DU and  LVDS device
>> nodes. Also add the device nodes for Thine THC63LVD1024 LVDS decoder and
>> Analog Devices ADV7511W HDMI transmitter...
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> Changes in version 2:
>> - added the V3HSK DT update, reworded the description, renamed the patch;
>> - added a space between the HDMI node name and a brace.
>>
>>  arch/arm64/boot/dts/renesas/r8a77980-condor.dts |  106 ++++++++++++++++++++
>>  arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  |  120 ++++++++++++++++++++
>>  2 files changed, 226 insertions(+)
> 
> I would have split that in two patchees.
> 
>>
>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
>> ===================================================================
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
[...]
>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
>> ===================================================================
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
>> @@ -27,6 +27,63 @@
>>  		/* first 128MB is reserved for secure area. */
>>  		reg = <0 0x48000000 0 0x78000000>;
>>  	};
>> +
>> +	hdmi-out {
>> +		compatible = "hdmi-connector";
>> +		type = "a";
>> +
>> +		port {
>> +			hdmi_con: endpoint {
>> +				remote-endpoint = <&adv7511_out>;
>> +			};
>> +		};
>> +	};
>> +
>> +	lvds-decoder {
>> +		compatible = "thine,thc63lvd1024";
>> +		vcc-supply = <&vcc3v3_d5>;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				thc63lvd1024_in: endpoint {
>> +					remote-endpoint = <&lvds0_out>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +				thc63lvd1024_out: endpoint {
>> +					remote-endpoint = <&adv7511_in>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	vcc1v8_d4: regulator-0 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VCC1V8_D4";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vcc3v3_d5: regulator-1 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VCC3V3_D5";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +};
>> +
>> +&du {
>> +	status = "okay";
> 
> No dot clock for the DU ?

   You're right, there's OSC1 providing 148.5 MHz. Fixed.
 
> Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

  Thanks.

MBR, Sergei
