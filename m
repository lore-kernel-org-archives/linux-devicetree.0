From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCH 4/4] dts, altera: Arria10 SDRAM EDAC DTS additions.
Date: Fri, 15 May 2015 16:01:39 -0500
Message-ID: <55565EB3.7040102@opensource.altera.com>
References: <1431553787-27741-1-git-send-email-tthayer@opensource.altera.com>
 <1431553787-27741-5-git-send-email-tthayer@opensource.altera.com>
 <5383549.sAl5szqT14@wuerfel>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5383549.sAl5szqT14@wuerfel>
Sender: linux-doc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 05/15/2015 05:55 AM, Arnd Bergmann wrote:
> On Wednesday 13 May 2015 16:49:47 tthayer@opensource.altera.com wrote:
>> +               sdr: sdr@ffc25000 {
>> +                       compatible = "syscon";
>> +                       reg = <0xffcfb100 0x80>;
>> +               };
>> +
>>
>
> A syscon node with just 128 bytes seems very odd. Can you check the
> hardware manual to see if this is part of some bigger unit?
>
> 	Arnd
>

This is an unfortunate legacy of our previous SDRAM controller (in the 
CycloneV) which had ECC registers interspersed with registers other 
drivers needed - thus the use of syscon.

In the Arria10 chip, the ECC registers are in their own partitioned 
group but I kept the syscon to remain consistent with the Device Tree 
bindings from the CycloneV family.

I've implemented your other suggestions. Thank you for reviewing!

Thor
