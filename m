From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: ufs: ti,j721e-ufs.yaml: Add binding for
 TI UFS wrapper
Date: Tue, 1 Oct 2019 17:48:30 +0530
Message-ID: <c3490572-8230-3e41-0916-097091386b21@ti.com>
References: <20190918133921.25844-1-vigneshr@ti.com>
 <20190918133921.25844-2-vigneshr@ti.com> <20191001120826.GA4214@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001120826.GA4214@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, jejb@linux.ibm.com, Martin K Petersen <martin.petersen@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, Janek Kotas <jank@cadence.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, nsekhar@ti.com
List-Id: devicetree@vger.kernel.org



On 01/10/19 5:38 PM, Rob Herring wrote:
> On Wed, Sep 18, 2019 at 07:09:20PM +0530, Vignesh Raghavendra wrote:
>> Add binding documentation of TI wrapper for Cadence UFS Controller.
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>  .../devicetree/bindings/ufs/ti,j721e-ufs.yaml | 45 +++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
>> new file mode 100644
>> index 000000000000..dabd7c795fbe
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/ufs/ti,j721e-ufs.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TI J721e UFS Host Controller Glue Driver
>> +
>> +maintainers:
>> +  - Vignesh Raghavendra <vigneshr@ti.com>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: ti,j721e-ufs
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: address of TI UFS glue registers
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: phandle to the M-PHY clock
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - power-domains
>> +
>> +examples:
>> +  - |
>> +    ufs_wrapper: ufs-wrapper@4e80000 {
>> +       compatible = "ti,j721e-ufs";
>> +       reg = <0x0 0x4e80000 0x0 0x100>;
>> +       power-domains = <&k3_pds 277>;
>> +       clocks = <&k3_clks 277 1>;
>> +       assigned-clocks = <&k3_clks 277 1>;
>> +       assigned-clock-parents = <&k3_clks 277 4>;
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
> 
> Based on the driver you expect to have a child node here with the UFS 
> controller? You need to show that and have a schema for it.
> 

Yes, Cadence UFS controller node will be the child node. Its bindings
are documented at: Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
(which in turn refers to
Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt)

But they are not in .yaml yet. How would you suggest to reference that?
Or should I just write plain text DT binding doc given that subsystem is
not converted to yaml?

>> +    };
>> -- 
>> 2.23.0
>>

-- 
Regards
Vignesh
