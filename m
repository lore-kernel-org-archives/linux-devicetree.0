From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/2] dt-bindings: regulator: Add regulator suspend state
 for PM state
Date: Tue, 10 Jun 2014 10:30:13 +0900
Message-ID: <53965FA5.3020901@samsung.com>
References: <1402309780-8118-1-git-send-email-cw00.choi@samsung.com>
 <1402309780-8118-3-git-send-email-cw00.choi@samsung.com>
 <20140609191645.GC5099@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140609191645.GC5099@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 06/10/2014 04:16 AM, Mark Brown wrote:
> On Mon, Jun 09, 2014 at 07:29:40PM +0900, Chanwoo Choi wrote:
> 
>> +- regulator-initial-state: initial state for suspend state
>> +- regulator-state-[standby/mem/disk] sub-root node for suspend state
>> +	regulator-volt: voltage consumers may set in suspend state
>> +	regulator-mode: voltage mode in suspend state
>> +	regulator-on-in-suspend: regulator should be on in suspend state
>> +	regulator-off-in-suspend: regulator should be off in suspend state
> 
> These need to define what the states are in general terms - in
> particular it's very unclear what standby is and how it differs from
> suspend to RAM.  You also need to define what happens if neither
> X-in-suspend property is set.

OK, I'll add more description.

> 
>> +		regulator-state-mem {
>> +			regulator-volt = <1000000>;
>> +			regulator-mode = <0x8>;
>> +			regulator-off-in-suspend;
>> +		};
> 
> Probably best to remove mode from this.
> 

OK, I'll remove it. (regulator-mode)


I modify description as following. Please review this description.

--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -19,6 +19,24 @@ Optional properties:
   design requires. This property describes the total system ramp time
   required due to the combination of internal ramping of the regulator itself,
   and board design issues such as trace capacitance and load on the supply.
+- regulator-initial-state: initial state for suspend state
+- regulator-state-standby sub-root node for Standby mode
+  : the device is in a power-saving state, but can also receive certain events,
+  specific behavior depends on the specific device.
+- regulator-state-mem sub-root node for Suspend-to-RAM mode
+  : suspend to memory, the device goes to sleep, but all data stored in memory,
+  only some external interrupt can wake the device.
+- regulator-state-disk sub-root node for Suspend-to-disk mode
+  : suspend to disk, this state operates similarly to Suspend-to-RAM,
+  but includes a final step of writing memory contents to disk.
+- regulator-state-[standby/mem/disk] node has following common properties:
+	- regulator-volt: voltage consumers may set in suspend state.
+	- regulator-mode: voltage mode in suspend state.
+	- regulator-on-in-suspend: regulator should be on in suspend state.
+	- regulator-off-in-suspend: regulator should be off in suspend state.
+	If node don't include regulator-[on/off]-in-suspend, can't change
+	regulator state in suspend mode and only should sustain the regulator
+	state of normal state.
 
 Deprecated properties:
 - regulator-compatible: If a regulator chip contains multiple
@@ -34,6 +52,11 @@ Example:
 		regulator-max-microvolt = <2500000>;
 		regulator-always-on;
 		vin-supply = <&vin>;
+
+		regulator-state-mem {
+			regulator-volt = <1000000>;
+			regulator-off-in-suspend;
+		};
 	};
 

Best Regards,
Chanwoo Choi
