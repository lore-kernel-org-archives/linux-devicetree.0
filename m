From: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [PATCH V2 09/12] dtb: amd: Add KCS device tree node
Date: Tue, 9 Feb 2016 09:47:55 -0600
Message-ID: <56BA0A2B.5000705@amd.com>
References: <1454954357-8395-1-git-send-email-Suravee.Suthikulpanit@amd.com>
 <1454954357-8395-10-git-send-email-Suravee.Suthikulpanit@amd.com>
 <4018438.bPuTyoUuqf@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4018438.bPuTyoUuqf@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Cc: brijesh.singh@amd.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, brijeshkumar.singh@amd.com, thomas.lendacky@amd.com, leo.duran@amd.com
List-Id: devicetree@vger.kernel.org

Hi,

On 02/09/2016 08:59 AM, Arnd Bergmann wrote:
> On Monday 08 February 2016 11:59:14 Suravee Suthikulpanit wrote:
>> +
>> +               ipmi_kcs: kcs@e0010000 {
>> +                       status = "disabled";
>> +                       compatible = "ipmi-kcs";
>> +                       device_type = "ipmi";
>> +                       reg = <0x0 0xe0010000 0 0x8>;
>> +                       interrupts = <0 389 4>;
>> +                       interrupt-names = "ipmi_kcs";
>> +                       reg-size = <1>;
>> +                       reg-spacing = <4>;
>> +               };
>>         };
>>
> 
> I see we don't have a binding file for this, can you add one please?
>
There is binding file ipmi.txt [1]. Am I missing something ?
 
[1] http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/ipmi.txt

> 
> Why the strange name for the interrupt?
> 

Now I don't remember the doc but sometime back while implementing BMC on Seattle I saw that interrupt was labeled as "ipmi_kcs"
hence used the same name in DT. But if you want to use different name then let me know the string and will update it.

Theoretically IPMI system interface supports the following interface and any of these interfaces can be used by
A57 to communicate with BMC:

* Keyboard controller style (KCS)
* System Management Interface (SMIC)
* Block transfer (BT)
* SMBus system interface (SSIF)

AMD Seattle platform supports "KCS".



> 	Arnd
> 
