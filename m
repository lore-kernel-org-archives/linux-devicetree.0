From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 1/2] mtd: maps: physmap: Store gpio_values correctly
Date: Thu, 28 Mar 2019 19:59:30 +0000
Message-ID: <1ab4e2f0c6d4404895877ecf539504bd@svr-chch-ex1.atlnz.lc>
References: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
 <20190328040217.1895-2-chris.packham@alliedtelesis.co.nz>
 <20190328093228.5ab79718@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 28/03/19 9:32 PM, Boris Brezillon wrote:=0A=
> On Thu, 28 Mar 2019 17:02:15 +1300=0A=
> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> When the gpio-addr-flash.c driver was merged with physmap-core.c the=0A=
>> code to store the current gpio_values was lost. This meant that once a=
=0A=
>> gpio was asserted it was never de-asserted. Fix this by storing the=0A=
>> current offset in gpio_values like the old driver used to.=0A=
>>=0A=
>> Fixes: commit ba32ce95cbd9 ("mtd: maps: Merge gpio-addr-flash.c into phy=
smap-core.c")=0A=
> =0A=
> You miss=0A=
> =0A=
> Cc: <stable@vger.kernel.org>=0A=
> =0A=
=0A=
I wasn't sure. As the original commit said there are no in-tree users of =
=0A=
  addr-gpios so maybe no-one else noticed. I'll wait for any other =0A=
comments and send a v2 with a Cc for stable.=0A=
=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> =0A=
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>=0A=
> =0A=
>> ---=0A=
>>   drivers/mtd/maps/physmap-core.c | 2 ++=0A=
>>   1 file changed, 2 insertions(+)=0A=
>>=0A=
>> diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-=
core.c=0A=
>> index d9a3e4bebe5d..21b556afc305 100644=0A=
>> --- a/drivers/mtd/maps/physmap-core.c=0A=
>> +++ b/drivers/mtd/maps/physmap-core.c=0A=
>> @@ -132,6 +132,8 @@ static void physmap_set_addr_gpios(struct physmap_fl=
ash_info *info,=0A=
>>   =0A=
>>   		gpiod_set_value(info->gpios->desc[i], !!(BIT(i) & ofs));=0A=
>>   	}=0A=
>> +=0A=
>> +	info->gpio_values =3D ofs;=0A=
>>   }=0A=
>>   =0A=
>>   #define win_mask(order)		(BIT(order) - 1)=0A=
> =0A=
> =0A=
=0A=
