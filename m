From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: ARC dw-mshc binding compat string
Date: Sat, 26 Mar 2016 17:46:26 +0000
Message-ID: <6d6cf7b0-5bfd-40f4-9547-ae7ef48eed4a@email.android.com>
References: <56F66121.8050507@denx.de>
 <56F6C639.5000301@mentor.com>,<56F6C71B.6070002@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56F6C71B.6070002@denx.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marex@denx.de>, "vladimir_zapolskiy@mentor.com" <vladimir_zapolskiy@mentor.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Marek, Vladimir,

26 =CD=C1=D2=D4=C1 2016 =C7. 20:30 =D0=CF=CC=D8=DA=CF=D7=C1=D4=C5=CC=D8=
 Marek Vasut <marex@denx.de> =CE=C1=D0=C9=D3=C1=CC:
>
> On 03/26/2016 06:26 PM, Vlad

On 03/26/2016 06:26 PM, Vladimir Zapolskiy wrote:
> On 26.03.2016 12:14, Marek Vasut wrote:
>> Hi!
>>
>> I noticed that arch/arc/boot/dts/axs10x_mb.dtsi uses "altr," prefix =
in
>> the DT compatible string:
>>
>> mmc@0x15000 {
>>         compatible =3D "altr,socfpga-dw-mshc";
>>         reg =3D < 0x15000 0x400 >;
>>         num-slots =3D < 1 >;
>>         fifo-depth =3D < 16 >;
>>         card-detect-delay =3D < 200 >;
>>         clocks =3D <&apbclk>, <&mmcclk>;
>>         clock-names =3D "biu", "ciu";
>>         interrupts =3D < 7 >;
>>         bus-width =3D < 4 >;
>> };
>>
>> I don't think this is OK, since ARC is unrelated to Altera, which is
>> what the "altr," prefix stands for. I think the socfpga-dw-mshc shim
>> should be extended with another compatibility string, something like
>> "snps,arc-dw-mshc" and the axs10x_mb.dtsi should be adjusted
>> accordingly. What do you think ?
>>
>
> There is "snps,dw-mshc" described in
> Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt and suppor=
ted by
> dw_mmc host controller driver.

Thanks, that's even better.

btw what do you think of using altr, prefix on non-altera system, that
doesn't seem ok, right ?
