From: matthew.gerlach@linux.intel.com
Subject: Re: [PATCH 3/4] fpga dt: bindings for Altera Partial Reconfiguraion
 IP.
Date: Mon, 27 Feb 2017 08:27:49 -0800 (PST)
Message-ID: <alpine.DEB.2.20.1702270822260.13342@mgerlach-VirtualBox>
References: <1487193038-3490-1-git-send-email-matthew.gerlach@linux.intel.com> <1487193038-3490-4-git-send-email-matthew.gerlach@linux.intel.com> <20170227143230.b3frg3rg2sdttt64@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170227143230.b3frg3rg2sdttt64@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: atull@opensource.altera.com, moritz.fischer@ettus.com, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org



On Mon, 27 Feb 2017, Rob Herring wrote:

Hi Rob,


> On Wed, Feb 15, 2017 at 01:10:37PM -0800, matthew.gerlach@linux.intel.com wrote:
>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>
>> Device Tree bindings for Altera Partial Reconfiguraion IP?
>>
>> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>> ---
>>  Documentation/devicetree/bindings/fpga/altera-pr-ip.txt | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
>>
>> diff --git a/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt b/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
>> new file mode 100644
>> index 0000000..ada821f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
>> @@ -0,0 +1,12 @@
>> +Altera Partial Reconfiguration IP
>> +
>> +Required properties:
>> +- compatible : should contain "altr,pr-ip"
>
> Kind of generic. There's only one version of h/w?


Fair point on being generic.  It does match the published documentation, 
but we could be more specific with "altr,a10-pr-ip" because it 
really is only for an Arria10.

Matthew Gerlach

>
>> +- reg        : base address and size for memory mapped io.
>> +
>> +Example:
>> +
>> +	fpga_mgr: fpga-mgr@ff20c000 {
>> +		compatible = "altr,pr-ip";
>> +		reg = <0xff20c000 0x10>;
>> +	};
>> --
>> 2.7.4
>>
>
