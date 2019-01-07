Return-Path: <SRS0=yUvI=PP=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <20190105170518.GA1879@roeck-us.net>
 <d3a77a2f9b1741a28f5a2b394b517ea2@HXTBJIDCEMVIW02.hxtcorp.net>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <fa369fc7-23ad-8f06-e295-c591746cfa58@roeck-us.net>
Date: Sun, 6 Jan 2019 22:35:42 -0800
MIME-Version: 1.0
In-Reply-To: <d3a77a2f9b1741a28f5a2b394b517ea2@HXTBJIDCEMVIW02.hxtcorp.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Yang, Shunyong" <shunyong.yang@hxt-semitech.com>, "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
List-ID: <devicetree@vger.kernel.org>

On 1/6/19 10:30 PM, Liu, Xiaoting wrote:
> Hi Guenter Roeck,
> 
> Thanks for your reply.
> 
> On 2019/1/6 1:05, Guenter Roeck wrote:
>> On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:
>>> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
>>>
>> Misleading subject. While the DPS650AB may ber a power supply,
>> it is a PMBus hwmon driver, and should be marked accordingly in the subject.
>>
>> Guenter
> 
> We will change the subject as "dt-bindings: hwmon: Add dps650ab
> documentation", is that okey?
> 

Sure.

Thanks,
Guenter

> Thanks,
> 
> Xiaoting.
> 
>>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
>>> ---
>>>   Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> --
>>> 1.8.3.1
>>>
>>>
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>>> new file mode 100644
>>> index 000000000000..bbd601100e66
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>>> @@ -0,0 +1,11 @@
>>> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
>>> +
>>> +Required properties:
>>> +- compatible : "dps650ab"
>>> +- reg        : I2C address, one of 0x58, 0x59.
>>> +
>>> +Example:
>>> +       dps650ab@58 {
>>> +                   compatible = "dps650ab";
>>> +                   reg = <0x58>;
>>> +       };
> 
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
> 
> 
> 
