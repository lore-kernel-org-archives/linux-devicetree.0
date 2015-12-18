From: Yoann Sculo <yoann@printk.fr>
Subject: Re: [PATCH 3/4] ARM: dts: kirkwood: add Seagate GoFlex Home
Date: Fri, 18 Dec 2015 10:32:45 +0100
Message-ID: <5673D2BD.8070805@printk.fr>
References: <1446675888-24495-1-git-send-email-luka.perkov@sartura.hr>
 <00000150d49a8745-1c2bc8d4-1333-46bb-bf0e-5508ef988c73-000000@email.amazonses.com>
 <563CCFE3.7080603@printk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <563CCFE3.7080603@printk.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Luka Perkov <luka.perkov@sartura.hr>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: gregory.clement@free-electrons.com, andrew@lunn.ch, jason@lakedaemon.net
List-Id: devicetree@vger.kernel.org

Hi Luka,

Did you have the time to look at those issues ?

Yoann

Le 06/11/2015 17:05, Yoann Sculo a =E9crit :
> Hi Luka,
>
> I tested your patch on the GoFlex Home.
>
>> +    gpio-leds {
>> +        compatible =3D "gpio-leds";
>> +
>> +        health {
>> +            label =3D "status:green:health";
>> +            gpios =3D <&gpio1 14 1>;
>> +            linux,default-trigger =3D "default-on";
>> +        };
>> +        fault {
>> +            label =3D "status:orange:fault";
>> +            gpios =3D <&gpio1 15 1>;
>> +        };
>> +        misc {
>> +            label =3D "status:white:misc";
>> +            gpios =3D <&gpio1 8 1>;
>> +            linux,default-trigger =3D "ide-disk";
>> +        };
>> +    };
>
> I noticed green and orange leds were working fine (0 =3D=3D off, 1 =3D=3D=
 on).
> But white led polarity is inverted (1 =3D=3D off, 0 =3D=3D on).
>
>> +    partition@500000 {
>> +        label =3D "pogoplug";
>> +        reg =3D <0x0500000 0x2000000>;
>> +    };
>
> I don't think pogoplug is the proper label for this partition. It seems
> duplicated from "kirkwood-goflexnet.dts" I guess you could label it
> "data" for instance.
>
> Tested-by: Yoann Sculo <yoann@printk.fr>
>
> Yoann
