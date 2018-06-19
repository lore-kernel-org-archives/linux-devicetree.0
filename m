From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 15/20] dts: arm: imx7{d,s}: Update coresight binding for
 hardware ports
Date: Tue, 19 Jun 2018 12:35:08 +0200
Message-ID: <145043d7ed3ef7890b5fc78a59c1668a@agner.ch>
References: <1528235011-30691-1-git-send-email-suzuki.poulose@arm.com>
 <1528235011-30691-16-git-send-email-suzuki.poulose@arm.com>
 <20180619021218.GV16091@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619021218.GV16091@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, mark.rutland@arm.com, robh@kernel.org, mathieu.poirier@linaro.org, devicetree@vger.kernel.org, coresight@lists.linaro.org, john.horley@arm.com, linux-kernel@vger.kernel.org, arm@kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, sudeep.holla@arm.com, Fabio Estevam <fabio.estevam@nxp.com>, matt.sealey@arm.com, mike.leach@linaro.org, frowand.list@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, charles.garcia-tobin@arm.com
List-Id: devicetree@vger.kernel.org

On 19.06.2018 04:12, Shawn Guo wrote:
> Hi Stefan,
> 
> Can you take a look at the patch?  Thanks.
> 
> Shawn
> 
> On Tue, Jun 05, 2018 at 10:43:26PM +0100, Suzuki K Poulose wrote:
>> Switch to the updated coresight bindings.

Looks good to me.

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan

>>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Fabio Estevam <fabio.estevam@nxp.com>
>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>  arch/arm/boot/dts/imx7d.dtsi |  5 ++++-
>>  arch/arm/boot/dts/imx7s.dtsi | 41 ++++++++++++++++++++++++++++++-----------
>>  2 files changed, 34 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
>> index 200714e..5faff17 100644
>> --- a/arch/arm/boot/dts/imx7d.dtsi
>> +++ b/arch/arm/boot/dts/imx7d.dtsi
>> @@ -87,7 +87,9 @@
>>
>>  			port {
>>  				etm1_out_port: endpoint {
>> +					direction = <1>;
>>  					remote-endpoint = <&ca_funnel_in_port1>;
>> +					coresight,hwid = <0>;
>>  				};
>>  			};
>>  		};
>> @@ -174,8 +176,9 @@
>>  	port@1 {
>>  		reg = <1>;
>>  		ca_funnel_in_port1: endpoint {
>> -			slave-mode;
>> +			direction = <0>;
>>  			remote-endpoint = <&etm1_out_port>;
>> +			coresight,hwid = <1>;
>>  		};
>>  	};
>>  };
>> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
>> index 4d42335..8e90915 100644
>> --- a/arch/arm/boot/dts/imx7s.dtsi
>> +++ b/arch/arm/boot/dts/imx7s.dtsi
>> @@ -151,23 +151,28 @@
>>  			port@0 {
>>  				reg = <0>;
>>  				replicator_out_port0: endpoint {
>> +					direction = <1>;
>>  					remote-endpoint = <&tpiu_in_port>;
>> +					coresight,hwid = <0>;
>>  				};
>>  			};
>>
>>  			port@1 {
>>  				reg = <1>;
>>  				replicator_out_port1: endpoint {
>> +					direction = <1>;
>>  					remote-endpoint = <&etr_in_port>;
>> +					coresight,hwid = <1>;
>>  				};
>>  			};
>>
>>  			/* replicator input port */
>>  			port@2 {
>> -				reg = <0>;
>> +				reg = <2>;
>>  				replicator_in_port0: endpoint {
>> -					slave-mode;
>> +					direction = <0>;
>>  					remote-endpoint = <&etf_out_port>;
>> +					coresight,hwid = <0>;
>>  				};
>>  			};
>>  		};
>> @@ -203,16 +208,19 @@
>>  				port@0 {
>>  					reg = <0>;
>>  					ca_funnel_in_port0: endpoint {
>> -						slave-mode;
>> +						direction = <0>;
>>  						remote-endpoint = <&etm0_out_port>;
>> +						coresight,hwid = <0>;
>>  					};
>>  				};
>>
>>  				/* funnel output port */
>>  				port@2 {
>> -					reg = <0>;
>> +					reg = <2>;
>>  					ca_funnel_out_port0: endpoint {
>> +						direction = <1>;
>>  						remote-endpoint = <&hugo_funnel_in_port0>;
>> +						coresight,hwid = <0>;
>>  					};
>>  				};
>>
>> @@ -229,7 +237,9 @@
>>
>>  			port {
>>  				etm0_out_port: endpoint {
>> +					direction = <1>;
>>  					remote-endpoint = <&ca_funnel_in_port0>;
>> +					coresight,hwid = <0>;
>>  				};
>>  			};
>>  		};
>> @@ -248,22 +258,26 @@
>>  				port@0 {
>>  					reg = <0>;
>>  					hugo_funnel_in_port0: endpoint {
>> -						slave-mode;
>> +						direction = <0>;
>>  						remote-endpoint = <&ca_funnel_out_port0>;
>> +						coresight,hwid = <0>;
>>  					};
>>  				};
>>
>>  				port@1 {
>>  					reg = <1>;
>>  					hugo_funnel_in_port1: endpoint {
>> -						slave-mode; /* M4 input */
>> +						direction = <0>; /* M4 input */
>> +						coresight,hwid = <1>;
>>  					};
>>  				};
>>
>>  				port@2 {
>> -					reg = <0>;
>> +					reg = <2>;
>>  					hugo_funnel_out_port0: endpoint {
>> +						direction = <1>;
>>  						remote-endpoint = <&etf_in_port>;
>> +						coresight,hwid = <0>;
>>  					};
>>  				};
>>
>> @@ -284,15 +298,18 @@
>>  				port@0 {
>>  					reg = <0>;
>>  					etf_in_port: endpoint {
>> -						slave-mode;
>> +						direction = <0>;
>>  						remote-endpoint = <&hugo_funnel_out_port0>;
>> +						coresight,hwid = <0>;
>>  					};
>>  				};
>>
>>  				port@1 {
>> -					reg = <0>;
>> +					reg = <1>;
>>  					etf_out_port: endpoint {
>> +						direction = <1>;
>>  						remote-endpoint = <&replicator_in_port0>;
>> +						coresight,hwid = <0>;
>>  					};
>>  				};
>>  			};
>> @@ -306,8 +323,9 @@
>>
>>  			port {
>>  				etr_in_port: endpoint {
>> -					slave-mode;
>> +					direction = <0>;
>>  					remote-endpoint = <&replicator_out_port1>;
>> +					coresight,hwid = <0>;
>>  				};
>>  			};
>>  		};
>> @@ -320,8 +338,9 @@
>>
>>  			port {
>>  				tpiu_in_port: endpoint {
>> -					slave-mode;
>> +					direction = <0>;
>>  					remote-endpoint = <&replicator_out_port1>;
>> +					coresight,hwid = <0>;
>>  				};
>>  			};
>>  		};
>> --
>> 2.7.4
>>
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
