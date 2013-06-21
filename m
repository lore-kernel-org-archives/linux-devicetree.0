From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/2] regulator: palmas: model SMPS10 as two regulators
Date: Fri, 21 Jun 2013 18:55:28 +0530
Message-ID: <51C45448.4080201@nvidia.com>
References: <1371717458-10307-1-git-send-email-kishon@ti.com> <1371717458-10307-3-git-send-email-kishon@ti.com> <51C2DEEB.9090600@nvidia.com> <51C3089F.5030003@ti.com> <51C30B95.4010406@nvidia.com> <51C30F60.3060100@ti.com> <51C31537.9030705@nvidia.com> <51C31F30.5000307@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51C31F30.5000307@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Stephen Warren <swarren@nvidia.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thursday 20 June 2013 08:56 PM, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Thursday 20 June 2013 08:14 PM, Laxman Dewangan wrote:
>>
>> Have you added the regulator supply entries?
>> Are you testing on mainline linux-next?
> Not in linux-next :-( Tested only with mainline.
> Does inverting the order helps?
>

I think because you do not have entry of supply in your dt node, it gets 
ignored by regulator_dev_lookup() and continue.

I made the entry like (added entry form smps10-out2-supply and 
smps10-in-supply in dt node) and then it failed.
/***

+                           smps10-out2-supply = <&palmas_smps10_out2_reg>;
+                           smps10-in-supply = <&tps65090_dcdc3_reg>;
                             ldo3-in-supply = <&palmas_smps3_reg>;
@@ -903,6 +905,20 @@
                                         regulator-always-on;
                                 };

+                               palmas_smps10_out1_reg: smps10_out1 {
+                                       regulator-name = "smps10_out1";
+                                       regulator-min-microvolt = <5000000>;
+                                       regulator-max-microvolt = <5000000>;
+                                       regulator-always-on;
+                               };
+
+                               palmas_smps10_out2_reg: smps10_out2 {
+                                       regulator-name = "smps10_out2";
+                                       regulator-min-microvolt = <5000000>;
+                                       regulator-max-microvolt = <5000000>;
+                                       regulator-always-on;
+                               };
+
**/


After reversing the sequence, it worked fine.

