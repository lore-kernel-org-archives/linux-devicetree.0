Return-Path: <SRS0=hSlk=JA=linux.intel.com=songjun.wu@kernel.org>
Subject: Re: [PATCH 1/7] MIPS: dts: Add aliases node for lantiq danube serial
References: <20180612054034.4969-1-songjun.wu@linux.intel.com>
 <20180612054034.4969-2-songjun.wu@linux.intel.com>
 <20180612222424.GA2197@rob-hp-laptop>
From: "Wu, Songjun" <songjun.wu@linux.intel.com>
Message-ID: <9fee8672-f518-eae5-e012-bb718106217b@linux.intel.com>
Date: Thu, 14 Jun 2018 14:19:35 +0800
MIME-Version: 1.0
In-Reply-To: <20180612222424.GA2197@rob-hp-laptop>
Content-Type: multipart/alternative;
 boundary="------------7E657573CA43B7DE37B04C05"
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: hua.ma@linux.intel.com, yixin.zhu@linux.intel.com, chuanhua.lei@linux.intel.com, linux-mips@linux-mips.org, qi-ming.wu@intel.com, linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------7E657573CA43B7DE37B04C05
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/13/2018 6:24 AM, Rob Herring wrote:
> On Tue, Jun 12, 2018 at 01:40:28PM +0800, Songjun Wu wrote:
>> Previous implementation uses a hard-coded register value to check if
>> the current serial entity is the console entity.
>> Now the lantiq serial driver uses the aliases for the index of the
>> serial port.
>> The lantiq danube serial dts are updated with aliases to support this.
>>
>> Signed-off-by: Songjun Wu <songjun.wu@linux.intel.com>
>> ---
>>
>>   arch/mips/boot/dts/lantiq/danube.dtsi | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/boot/dts/lantiq/danube.dtsi b/arch/mips/boot/dts/lantiq/danube.dtsi
>> index 2dd950181f8a..7a9e15da6bd0 100644
>> --- a/arch/mips/boot/dts/lantiq/danube.dtsi
>> +++ b/arch/mips/boot/dts/lantiq/danube.dtsi
>> @@ -4,6 +4,10 @@
>>   	#size-cells = <1>;
>>   	compatible = "lantiq,xway", "lantiq,danube";
>>   
>> +	aliases {
>> +		serial0 = &asc1;
>> +	};
>> +
>>   	cpus {
>>   		cpu@0 {
>>   			compatible = "mips,mips24Kc";
>> @@ -74,7 +78,7 @@
>>   			reg = <0xE100A00 0x100>;
>>   		};
>>   
>> -		serial@E100C00 {
>> +		asc1: serial@E100C00 {
> Fix this to be lower case hex while you are at it.
Thanks.
All the upper case in unit-address and hex constants will be changed to 
lower case according to the Linux conventions.
>
>>   			compatible = "lantiq,asc";
>>   			reg = <0xE100C00 0x400>;
>>   			interrupt-parent = <&icu0>;
>> -- 
>> 2.11.0
>>


--------------7E657573CA43B7DE37B04C05
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 6/13/2018 6:24 AM, Rob Herring
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180612222424.GA2197@rob-hp-laptop">
      <pre wrap="">On Tue, Jun 12, 2018 at 01:40:28PM +0800, Songjun Wu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Previous implementation uses a hard-coded register value to check if
the current serial entity is the console entity.
Now the lantiq serial driver uses the aliases for the index of the
serial port.
The lantiq danube serial dts are updated with aliases to support this.

Signed-off-by: Songjun Wu <a class="moz-txt-link-rfc2396E" href="mailto:songjun.wu@linux.intel.com">&lt;songjun.wu@linux.intel.com&gt;</a>
---

 arch/mips/boot/dts/lantiq/danube.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/lantiq/danube.dtsi b/arch/mips/boot/dts/lantiq/danube.dtsi
index 2dd950181f8a..7a9e15da6bd0 100644
--- a/arch/mips/boot/dts/lantiq/danube.dtsi
+++ b/arch/mips/boot/dts/lantiq/danube.dtsi
@@ -4,6 +4,10 @@
 	#size-cells = &lt;1&gt;;
 	compatible = "lantiq,xway", "lantiq,danube";
 
+	aliases {
+		serial0 = &amp;asc1;
+	};
+
 	cpus {
 		cpu@0 {
 			compatible = "mips,mips24Kc";
@@ -74,7 +78,7 @@
 			reg = &lt;0xE100A00 0x100&gt;;
 		};
 
-		serial@E100C00 {
+		asc1: serial@E100C00 {
</pre>
      </blockquote>
      <pre wrap="">
Fix this to be lower case hex while you are at it.</pre>
    </blockquote>
    Thanks.<br>
    All the <span class="fontstyle0">upper case in unit-address and hex
      constants will be changed to lower case according to the Linux
      conventions.</span><br style=" font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-size-adjust: auto;
      -webkit-text-stroke-width: 0px; ">
    <blockquote type="cite"
      cite="mid:20180612222424.GA2197@rob-hp-laptop">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap=""> 			compatible = "lantiq,asc";
 			reg = &lt;0xE100C00 0x400&gt;;
 			interrupt-parent = &lt;&amp;icu0&gt;;
-- 
2.11.0

</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------7E657573CA43B7DE37B04C05--
