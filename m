From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: Re: [PATCH v3 3/8] dt-bindings: interrupt-controller: Add JZ4760 and
 JZ4760B bindings.
Date: Mon, 29 Jul 2019 01:39:05 +0800
Message-ID: <5D3DDDB9.20507@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-4-git-send-email-zhouyanjie@zoho.com>
 <865znoor2n.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <865znoor2n.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net
List-Id: devicetree@vger.kernel.org

Hi Marc,

These patches has been combined in v4.

Thanks

On 2019=E5=B9=B407=E6=9C=8826=E6=97=A5 21:36, Marc Zyngier wrote:
> On Mon, 15 Jul 2019 13:09:50 +0100,
> Zhou Yanjie <zhouyanjie@zoho.com> wrote:
>> Add the interrupt-controller bindings for the JZ4760 Soc and
>> the JZ4760B Soc from Ingenic.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>   Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.tx=
t | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/inge=
nic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingen=
ic,intc.txt
>> index d4373d0..fa1ad54 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,int=
c.txt
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,int=
c.txt
>> @@ -5,6 +5,8 @@ Required properties:
>>   - compatible : should be "ingenic,<socname>-intc". Valid strings are:
>>       ingenic,jz4740-intc
>>       ingenic,jz4725b-intc
>> +    ingenic,jz4760-intc
>> +    ingenic,jz4760b-intc
>>       ingenic,jz4770-intc
>>       ingenic,jz4775-intc
>>       ingenic,jz4780-intc
>> --=20
>> 2.7.4
>>
>>
> This should be combined with patches 5 and 7. I don't see the need for
> multiple patches. Same thing should happen with patches 4, 6 and 8.
>
> Thanks,
>
> =09M.
>
