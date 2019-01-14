Return-Path: <SRS0=rhSe=PW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from [223.203.96.18] ([223.203.96.18]:47269 "EHLO
        barracuda02.hxt-semitech.com" rhost-flags-FAIL-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726677AbfANClY (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sun, 13 Jan 2019 21:41:24 -0500
From: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Date: Mon, 14 Jan 2019 02:41:04 +0000
Message-ID: <d51a1a5fe99b4227a596ff66c05ad67c@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <20190111193612.GA23166@bogus>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Yang, Shunyong" <shunyong.yang@hxt-semitech.com>, "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
List-ID: <devicetree@vger.kernel.org>

Hi Rob Herring,

Thanks for your reply.

On 2019/1/12 3:42, Rob Herring wrote:
> On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:
>> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
> s/monitering/monitoring/

I delivered the latest v3 patch and updated the subject. you can refer
to the following link:

https://patchwork.ozlabs.org/patch/1022664/

>
>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
>> ---
>>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>> new file mode 100644
>> index 000000000000..bbd601100e66
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>> @@ -0,0 +1,11 @@
>> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
>> +
>> +Required properties:
>> +- compatible : "dps650ab"
> Needs a vendor prefix.g
Add vendor delta on v3 patch.
>
>> +- reg        : I2C address, one of 0x58, 0x59.
>> +
>> +Example:
>> +       dps650ab@58 {
>> +                   compatible = "dps650ab";
>> +                   reg = <0x58>;
>> +       };
>> --
>> 1.8.3.1
>>
>>
>>
>>
>> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
> We can't accept emails with these clauses.
>
> Rob

Delete the message on v3 patch.

Thanks,

Xiaoting
