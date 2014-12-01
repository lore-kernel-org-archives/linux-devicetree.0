From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mtd: hisilicon: add device tree binding documentation
Date: Mon, 01 Dec 2014 21:08:07 +0800
Message-ID: <547C6837.5070309@gmail.com>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com> <1415105221-7732-3-git-send-email-wangzhou.bry@gmail.com> <20141130085654.GE3608@norris-Latitude-E6410>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141130085654.GE3608@norris-Latitude-E6410>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014=E5=B9=B411=E6=9C=8830=E6=97=A5 16:56, Brian Norris wrote:
> On Tue, Nov 04, 2014 at 08:47:01PM +0800, Zhou Wang wrote:
>> Signed-off-by: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   .../devicetree/bindings/mtd/hisi504-nand.txt       |   40 ++++++++=
++++++++++++
>>   1 file changed, 40 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/hisi504-n=
and.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/hisi504-nand.txt =
b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
>> new file mode 100644
>> index 0000000..c8b3988
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
>> @@ -0,0 +1,40 @@
>> +Hisilicon Hip04 Soc NAND controller DT binding
>> +
>> +Required properties:
>> +- compatible:          Should be "hisilicon,504-nfc".
>> +- reg:                 The first contains base physical address and=
 size of
>> +                       NAND controller's registers. The second cont=
ains base
>> +                       physical address and size of NAND controller=
's buffer.
>> +- interrupts:          Interrupt number for nfc.
>> +- nand-bus-width:      See nand.txt.
>> +- nand-ecc-mode:       See nand.txt.
>
> Do you support all modes, or just "hw"? Might be worth noting here.
>

The driver just supports "hw" mode, will modify this.

>> +- hisi,nand-ecc-bits:  ECC bits type support.
>> +                 <0>:  none ecc
>> +                 <1>:  Can correct 1bit per 512byte.
>> +                 <6>:  Can correct 16bits per 1K byte.
>
> You should re-use the nand-ecc-strength and nand-ecc-step-size
> properties here. So you'll support these options:
>
>    nand-ecc-strength=3D0  nand-ecc-step-size=3D<don't care>
>    nand-ecc-strength=3D1  nand-ecc-step-size=3D512
>    nand-ecc-strength=3D16 nand-ecc-step-size=3D1024

Thanks, will modify this!

>
>> +- #address-cells:      partition address, should be set 1.
>> +- #size-cells:         partition size, should be set 1.
>> +
>> +Flash chip may optionally contain additional sub-nodes describing p=
artitions of
>> +the address space. See partition.txt for more detail.
>> +
>> +Example:
>> +
>> +	nand: nand@4020000 {
>> +		compatible =3D "hisilicon,504-nfc";
>> +		reg =3D <0x4020000 0x10000>, <0x5000000 0x1000>;
>> +		interrupts =3D <0 379 4>;
>> +		nand-bus-width =3D <8>;
>> +		nand-ecc-mode =3D "hw";
>> +		hisi,nand-ecc-bits =3D <1>;
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <1>;
>> +
>> +		partition@0 {
>> +			label =3D "nand_text";
>> +			reg =3D <0x00000000 0x00400000>;
>> +		};
>> +
>> +		...
>> +
>> +	};
>
> Brian
>

Thanks,
Zhou Wang

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
