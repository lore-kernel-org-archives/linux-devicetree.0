From: Rongrong Zou <zourongrong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Thu, 31 Dec 2015 22:12:19 +0800
Message-ID: <568537C3.3060902@huawei.com>
References: <1451396032-23708-1-git-send-email-zourongrong@gmail.com>
 <1451396032-23708-4-git-send-email-zourongrong@gmail.com>
 <1899302.RWIn6Bg3Dr@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1899302.RWIn6Bg3Dr@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: minyard-HInyCGIudOg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sorry for so late reply, it is difficult for me to understand ISA confi=
g :( .

=E5=9C=A8 2015/12/30 17:06, Arnd Bergmann =E5=86=99=E9=81=93:
> On Tuesday 29 December 2015 21:33:52 Rongrong Zou wrote:
>> Signed-off-by: Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   .../devicetree/bindings/arm64/low-pin-count.txt      | 20 ++++++++=
++++++++++++
>>   1 file changed, 20 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm64/low-pin=
-count.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm64/low-pin-count.t=
xt b/Documentation/devicetree/bindings/arm64/low-pin-count.txt
>> new file mode 100644
>> index 0000000..215f2c4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm64/low-pin-count.txt
>> @@ -0,0 +1,20 @@
>> +Low Pin Count bus driver
>> +
>> +Usually LPC controller is part of PCI host bridge, so the legacy IS=
A
>> +port locate on LPC bus can be accessed directly. But some SoC have
>> +independent LPC controller, and we can access the legacy port by sp=
ecifying
>> +LPC address cycle. Thus, LPC driver is introduced.
>> +
>> +Required properties:
>> +- compatible: "low-pin-count"
>> +- reg: specifies low pin count address range
>> +
>> +
>> +Example:
>> +
>> +        lpc_0: lpc@a01b0000 {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <1>;
>> +                compatible =3D "low-pin-count";
>> +                reg =3D <0x0 0xa01b0000 0x0 0x10000>;
>> +        };
>
> One more thought: please try to stick as closely as possible to the e=
xisting
> ISA binding that is documented at
>
> http://www.firmware.org/1275/bindings/isa/isa0_4d.ps
 From the specification, I think I should use 2 32bit integer to descri=
be the isa addr in dts.
>
> In particular, this should cover the possibility of describing both m=
emory
> and I/O spaces in child devices.
>

I found below config in powerpc dts "arch/powerpc/boot/dts/mpc8544ds.dt=
s"

isa@1e {
                                 device_type =3D "isa";
                                 #interrupt-cells =3D <2>;
                                 #size-cells =3D <1>;
                                 #address-cells =3D <2>;
                                 reg =3D <0xf000 0x0 0x0 0x0 0x0>;
                                 ranges =3D <0x1 0x0 0x1000000 0x0 0x0
                                           0x1000>;
                                 interrupt-parent =3D <&i8259>;



                                 rtc@70 {
                                         compatible =3D "pnpPNP,b00";
                                         reg =3D <0x1 0x70 0x2>;
                                 };
  the isa space in child-node: reg =3D <0x1 0x70 0x2>;
  0x1 means IO space, 70 means addr, 0x2 is size.
  but when i config the following in dts, the ipmi_0 node can't be prob=
ed,
  I think there may be some problems.

lpc_0: lpc@a01b0000 {
	compatible =3D "low-pin-count";
	device_type =3D "isa";
	#address-cells =3D <2>;
	#size-cells =3D <1>;
	reg =3D <0x0 0xa01b0000 0x0 0x10000>;

	ipmi_0:ipmi@000000e4{
		device_type =3D "ipmi";
		compatible =3D "ipmi-bt";
		reg =3D <0x1 0x000000e4 0x4>;
};







> 	Arnd
> _______________________________________________
> linuxarm mailing list
> linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
> http://rnd-openeuler.huawei.com/mailman/listinfo/linuxarm
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
