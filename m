From: Zhou Wang <wangzhou.bry@gmail.com>
Subject: Re: [PATCH 1/3] mtd: hisilicon: add device tree node for nand controller
Date: Fri, 11 Jul 2014 10:40:20 +0800
Message-ID: <53BF4E94.7030104@gmail.com>
References: <1404115409-20200-1-git-send-email-wangzhou.bry@gmail.com> <1404115409-20200-2-git-send-email-wangzhou.bry@gmail.com> <53BCEA77.2080004@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <53BCEA77.2080004@huawei.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jerome FORISSIER <jerome.forissier@huawei.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Grant Likely <grant.likely@linaro.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Pekon Gupta <pekon@ti.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Alexander Shiyan <shc_work@mail.ru>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Jussi Kivilinna <jussi.kivilinna@iki.fi>, Joern Engel <joern@logfs.org>, Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, caizhiyong@huawei.com, wangzhou1@hisilicon.com
List-Id: devicetree@vger.kernel.org

On 2014=E5=B9=B407=E6=9C=8809=E6=97=A5 15:08, Jerome FORISSIER wrote:
> On 30-Jun-14 10:03, Zhou Wang wrote:
>> Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
>> ---
>>   arch/arm/boot/dts/hip04.dtsi |   31 ++++++++++++++++++++++++++++++=
+
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/hip04.dtsi b/arch/arm/boot/dts/hip04.=
dtsi
>> index abb42ca..e63fc61 100644
>> --- a/arch/arm/boot/dts/hip04.dtsi
>> +++ b/arch/arm/boot/dts/hip04.dtsi
>> @@ -386,5 +386,36 @@
>>   				interrupts =3D <0 389 4>;
>>   			};
>>   		};
>> +
>> +		nand: nand@4020000 {
>> +			compatible =3D "hisilicon,504-nfc";
>
> In PATCH 2/3 and 3/3 you are using "hisilicon,nfc504".
>

It was my mistake. All should be "hisilicon,504-nfc". Thanks a lot.

>> +			reg =3D <0x4020000 0x10000>, <0x5000000 0x1000>;
>> +			interrupts =3D <0 379 4>;
>> +			nand-bus-width =3D <8>;
>> +			nand-ecc-mode =3D "none";
>> +			hisi,nand-ecc-bits =3D <0>;
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <1>;
>> +
>> +			partition@0 {
>> +				label =3D "nand_text";
>> +				reg =3D <0x00000000 0x00400000>;
>> +			};
>> +
>> +			partition@00400000 {
>> +				label =3D "nand_monitor";
>> +				reg =3D <0x00400000 0x00400000>;
>> +			};
>> +
>> +			partition@00800000 {
>> +				label =3D "nand_kernel";
>> +				reg =3D <0x00800000 0x00800000>;
>> +			};
>> +
>> +			partition@01000000 {
>> +				label =3D "nand_fs";
>> +				reg =3D <0x01000000 0x1f000000>;
>> +			};
>> +		};
>>   	};
>>   };
>>
>

