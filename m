From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: Re: [PATCH v3 05/14] dt/bindings: Add bindings for PIC32/MZDA
 platforms
Date: Fri, 8 Jan 2016 17:35:17 -0700
Message-ID: <569055C5.9040003@microchip.com>
References: <1452211389-31025-1-git-send-email-joshua.henderson@microchip.com>
 <1452211389-31025-6-git-send-email-joshua.henderson@microchip.com>
 <20160108133739.9a9c63c18fee346098354b21@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20160108133739.9a9c63c18fee346098354b21@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, ralf@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/08/2016 03:37 AM, Antony Pavlov wrote:
> On Thu, 7 Jan 2016 17:00:20 -0700
> Joshua Henderson <joshua.henderson@microchip.com> wrote:
> 
>> This adds support for the Microchip PIC32 platform along with the
>> specific variant PIC32MZDA on a PIC32MZDA Starter Kit.
>>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>> Cc: Ralf Baechle <ralf@linux-mips.org>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../bindings/mips/pic32/microchip,pic32mzda.txt    |   33 ++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt b/Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt
>> new file mode 100644
>> index 0000000..bcf3e04
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt
>> @@ -0,0 +1,33 @@
>> +* Microchip PIC32MZDA Platforms
>> +
>> +PIC32MZDA Starter Kit
>> +Required root node properties:
>> +    - compatible = "microchip,pic32mzda-sk", "microchip,pic32mzda"
>> +
>> +CPU nodes:
>> +----------
>> +A "cpus" node is required.  Required properties:
>> + - #address-cells: Must be 1.
>> + - #size-cells: Must be 0.
>> +A CPU sub-node is also required.  Required properties:
>> + - device_type: Must be "cpu".
>> + - compatible: Must be "mti,mips14KEc".
>> +Example:
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "mti,mips14KEc";
>> +		};
>> +	};
>> +
>> +Boot protocol
>> +--------------
>> +In accordance with the MIPS UHI specification[1], the bootloader must pass the
>> +following arguments to the kernel:
>> + - $a0: -2.
>> + - $a1: KSEG0 address of the flattened device-tree blob.
>> +
>> +[1] http://prplfoundation.org/wiki/MIPS_documentation
> 
> At the moment the link [1] does not work. It is redirected to nonexisting "http://wiki.prplfoundation.org//MIPS_documentation" (prplfoundation.org site problem?).
> 
> The http://wiki.prplfoundation.org/wiki/MIPS_documentation URL works.
> 
> The "MIPS documentation" wiki page contains many documents so can we use 
> more accurate URL, e.g. http://wiki.prplfoundation.org/wiki/MIPS_documentation#Unified_Hosting_Interface ?
> 
> Can we use more strict name for "MIPS UHI specification", e.g. "Unified Hosting Interface Reference Manual (MD01069)"?
> 

I agree.  I will reference the name of the complete specification as suggested, however, it looks like it may be safer to drop the URL.  Search does a better job here.

> -- 
> Best regards,
>   Antony Pavlov
> 

Josh
