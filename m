From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 1/1] ARM: kirkwood-ds112.dts: use unique machine name
Date: Mon, 08 Feb 2016 16:58:27 +0100
Message-ID: <87h9hj19ek.fsf@free-electrons.com>
References: <1454870066-3353-1-git-send-email-xypron.glpk@gmx.de>
	<20160207192632.GA28121@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160207192632.GA28121@lunn.ch> (Andrew Lunn's message of "Sun,
	7 Feb 2016 20:26:32 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ben Peddell <klightspeed@killerwolves.net>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Heinrich,
=20
 On dim., f=C3=A9vr. 07 2016, Andrew Lunn <andrew@lunn.ch> wrote:

> On Sun, Feb 07, 2016 at 07:34:26PM +0100, Heinrich Schuchardt wrote:
>> Downstream packages like Debian flash-kernel use
>> /proc/device-tree/model
>> to determine which dtb file to install.
>>=20
>> Hence each dts in the Linux kernel should provide a unique model
>> identifier.
>>=20
>> Commit 2d0a7addbd10 ("ARM: Kirkwood: Add support for many Synology N=
AS
>> devices") created the new files kirkwood-ds111.dts and kirkwood-ds11=
2.dts
>> using the same model identifier.
>>=20
>> This patch provides a unique model identifier for the
>> Synology DiskStation DS112.
>>=20
>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>
> Fixes: 2d0a7addbd10 ("ARM: Kirkwood: Add support for many Synology NA=
S devices")
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Applied on mvebu/fixes with the Fixes tag and Andrew Reviewed-by tag.

Thanks,

Gregory



>
>     Thanks
> 	Andrew	    =20
>
>> ---
>>  arch/arm/boot/dts/kirkwood-ds112.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm/boot/dts/kirkwood-ds112.dts b/arch/arm/boot/dt=
s/kirkwood-ds112.dts
>> index bf4143c..b84af3d 100644
>> --- a/arch/arm/boot/dts/kirkwood-ds112.dts
>> +++ b/arch/arm/boot/dts/kirkwood-ds112.dts
>> @@ -14,7 +14,7 @@
>>  #include "kirkwood-synology.dtsi"
>> =20
>>  / {
>> -	model =3D "Synology DS111";
>> +	model =3D "Synology DS112";
>>  	compatible =3D "synology,ds111", "marvell,kirkwood";
>> =20
>>  	memory {
>> --=20
>> 2.1.4
>>=20

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
