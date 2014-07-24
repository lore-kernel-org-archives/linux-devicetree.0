From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: zynq: DT: Add CAN node
Date: Thu, 24 Jul 2014 08:44:59 +0200
Message-ID: <2fe3a869-d17c-4521-a5c1-7c347ae34726@BN1BFFO11FD060.protection.gbl>
References: <52d799e17cd3539713625c6f6a6666620f52d692.1406120732.git.michal.simek@xilinx.com>
 <20140723160702.GA14564@xsjandreislx>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140723160702.GA14564@xsjandreislx>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/23/2014 06:07 PM, S=C3=B6ren Brinkmann wrote:
> On Wed, 2014-07-23 at 03:05PM +0200, Michal Simek wrote:
>> Add node describing Zynq's CAN controller.
>>
>> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> ---
>>
>>  arch/arm/boot/dts/zynq-7000.dtsi | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zy=
nq-7000.dtsi
>> index 366ca6434f54..2287d9b4ed1a 100644
>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>> @@ -71,7 +71,18 @@
>>  			interrupts =3D <0 7 4>;
>>  			interrupt-parent =3D <&intc>;
>>  			clocks =3D <&clkc 12>;
>> -		};
>> +		};
>> +
>> +		can0: can@e0008000 {
>> +			compatible =3D "xlnx,zynq-can-1.0";
>> +			clocks =3D <&clkc 19>, <&clkc 36>;
>> +			clock-names =3D "can_clk", "pclk";
>> +			reg =3D <0xe0008000 0x1000>;
>> +			interrupts =3D <0 28 4>;
>> +			interrupt-parent =3D <&intc>;
>> +			tx-fifo-depth =3D <0x40>;
>> +			rx-fifo-depth =3D <0x40>;
>> +		};
>=20
> What about the second CAN core? You also probably want to add
> 'status =3D "disabled"' in the dtsi.

Second can core - yes.

I can add status =3D "disabled" but then question is if make
sense to change status for any zynq dts file. Or just
keep enable both.

In our repo is enabled can0 on zc702.

What do you think?

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
