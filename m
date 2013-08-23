From: David Daney <ddaney.cavm@gmail.com>
Subject: Re: [PATCH 4/6] DT: MIPS: ralink: add RT2880 dts files
Date: Fri, 23 Aug 2013 11:44:49 -0700
Message-ID: <5217ADA1.4070100@gmail.com>
References: <1365843026-11015-1-git-send-email-blogic@openwrt.org> <1365843026-11015-4-git-send-email-blogic@openwrt.org> <5217AB25.3050106@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <5217AB25.3050106@cogentembedded.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: John Crispin <blogic@openwrt.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 08/23/2013 11:34 AM, Sergei Shtylyov wrote:
> On 04/13/2013 12:50 PM, John Crispin wrote:
>
>> Add a dtsi file for RT2880 SoC and a sample dts file.
>
>     You forgot to mention Kconfig entry...
>
>> Signed-off-by: John Crispin <blogic@openwrt.org>
> [...]
>
>> diff --git a/arch/mips/ralink/dts/Makefile
>> b/arch/mips/ralink/dts/Makefile
>> index 1a69fb3..f635a01 100644
>> --- a/arch/mips/ralink/dts/Makefile
>> +++ b/arch/mips/ralink/dts/Makefile
>> @@ -1 +1,2 @@
>> +obj-$(CONFIG_DTB_RT2880_EVAL) := rt2880_eval.dtb.o
>>   obj-$(CONFIG_DTB_RT305X_EVAL) := rt3052_eval.dtb.o
>> diff --git a/arch/mips/ralink/dts/rt2880.dtsi
>> b/arch/mips/ralink/dts/rt2880.dtsi
>> new file mode 100644
>> index 0000000..182afde
>> --- /dev/null
>> +++ b/arch/mips/ralink/dts/rt2880.dtsi
>> @@ -0,0 +1,58 @@
>> +/ {
>> +    #address-cells = <1>;
>> +    #size-cells = <1>;
>> +    compatible = "ralink,rt2880-soc";
>> +
>> +    cpus {
>> +        cpu@0 {
>> +            compatible = "mips,mips4KEc";
>> +        };
>> +    };
>> +
>> +    cpuintc: cpuintc@0 {
>
>     According to ePAPR spec [1], the node name should be
> "interrupt-controller".
>
>> +        #address-cells = <0>;
>> +        #interrupt-cells = <1>;
>> +        interrupt-controller;
>> +        compatible = "mti,cpu-interrupt-controller";
>
>     So, it's "mips" or "mti"?

I agree that it should be consistent.  vendor-prefixes.txt doesn't have 
an entry for MIPS, so ...

Isn't this the CP0 interrupt controller?  I wonder if something like:

"mips,r4k-cp0-interrupt-controller" might be more descriptive.

David Daney
