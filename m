From: Rongrong Zou <zourongrong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Tue, 5 Jan 2016 19:59:49 +0800
Message-ID: <568BB035.1050801@huawei.com>
References: <1451396032-23708-1-git-send-email-zourongrong@gmail.com>
 <15026471.7nGZ0rWlIf@wuerfel> <568A9803.6050108@gmail.com>
 <6384244.Uhpjfgly6O@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6384244.Uhpjfgly6O@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, liviu.dudau-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2016/1/5 0:34, Arnd Bergmann =E5=86=99=E9=81=93:
> On Tuesday 05 January 2016 00:04:19 Rongrong Zou wrote:
>> =E5=9C=A8 2016/1/4 19:13, Arnd Bergmann =E5=86=99=E9=81=93:
>>> On Sunday 03 January 2016 20:24:14 Rongrong Zou wrote:
>>>> =E5=9C=A8 2015/12/31 23:00, Rongrong Zou =E5=86=99=E9=81=93:
>>>> */
>>>>       compatible =3D "low-pin-count";
>>>>       device_type =3D "isa";
>>>>       #address-cells =3D <2>;
>>>>       #size-cells =3D <1>;
>>>>       reg =3D <0x0 0xa01b0000 0x0 0x10000>;
>>>>       ranges =3D <0x1 0x0 0x0 0x0 0x1000>;
>>>> /*
>>>> *  ranges is required, then i can get the IORESOURCE_IO <0xe4,4> f=
rom "reg =3D <0x1, 0x000000e4, 4>".
>>>> *
>>>> */
>>>>       ipmi_0:ipmi@000000e4{
>>>>               device_type =3D "ipmi";
>>>>               compatible =3D "ipmi-bt";
>>>>               reg =3D <0x1 0x000000e4 0x4>;
>>>> };
>>>>
>>>
>>> This looks wrong: the property above says that the I/O port range i=
s
>>> translated to MMIO address 0x00000000 to 0x00010000, which is not
>>> true on your hardware. I think this needs to be changed in the code
>>> so the ranges property is not required for I/O ports.
>>
>> Ranges property can set empty, but this means 1:1 translation. the I=
/O
>> port range is translated to MMIO address 0x00000001 00000000 to
>> 0x00000001 00000004, it looks wrong else. I wonder if anyone get leg=
acy
>> I/O port resource from dts.
>
> As I said, nothing should really require the ranges property here, un=
less
> you have a valid IORESOURCE_MEM translation. The code that requires
> the ranges to be present is wrong.
>

I think the openfirmware(DT) do not support for those unmapped I/O port=
s, because I
must get resource by calling of_address_to_resource(), which have to ca=
ll
pci_address_to_pio() when resource type is IORESOURCE_IO. I'm sorry I h=
ave no
better idea for this now. Maybe liviu can give me some opinions.

/**
  * of_address_to_resource - Translate device tree address and return a=
s resource
  *
  * Note that if your address is a PIO address, the conversion will fai=
l if
  * the physical address can't be internally converted to an IO token w=
ith
  * pci_address_to_pio(), that is because it's either called to early o=
r it
  * can't be matched to any host bridge IO space
  */
int of_address_to_resource(struct device_node *dev, int index,
			   struct resource *r)

>> For ipmi driver, I can get I/O port resource by DMI rather than dts.
>
> No, the ipmi driver uses the resource that belongs to the platform
> device already, you can't rely on DMI data to be present there.

Ipmi has a lot of way to be discovered(ACPI, DMI, hardcoded, hot-add,
openfirmware and a few other), I think we just use one of them, not all=
 of them.
It depend on vendor's hardware solution actually.


>
> 	Arnd
>
> .
>

Thanks,

Rongrong

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
