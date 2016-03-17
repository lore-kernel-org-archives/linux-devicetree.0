From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: WARNING: DT compatible string vendor "mips" appears un-documented
Date: Thu, 17 Mar 2016 06:02:23 +0300
Message-ID: <20160317060223.e14ebbdf05224845279843c3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

checkpatch.pl notes that DT compatible string vendor "mips" appears un-=
documented.

On the one hand there are several users of this vendor string:

    linux$ git grep \"mips,
    Documentation/devicetree/bindings/mips/img/xilfpga.txt: - compatibl=
e: Must be "mips,m14Kc".
    Documentation/devicetree/bindings/mips/img/xilfpga.txt:            =
     compatible =3D "mips,m14Kc";
    arch/mips/boot/dts/lantiq/danube.dtsi:                  compatible =
=3D "mips,mips24Kc";
    arch/mips/boot/dts/qca/ar9132.dtsi:                     compatible =
=3D "mips,mips24Kc";
    arch/mips/boot/dts/ralink/mt7620a.dtsi:                 compatible =
=3D "mips,mips24KEc";
    arch/mips/boot/dts/ralink/rt2880.dtsi:                  compatible =
=3D "mips,mips4KEc";
    arch/mips/boot/dts/ralink/rt3050.dtsi:                  compatible =
=3D "mips,mips24KEc";
    arch/mips/boot/dts/ralink/rt3883.dtsi:                  compatible =
=3D "mips,mips74Kc";
    arch/mips/boot/dts/xilfpga/microAptiv.dtsi:                     com=
patible =3D "mips,m14Kc";

On the other hand we already have the "mti" vendor string:

    linux$ grep MIPS Documentation/devicetree/bindings/vendor-prefixes.=
txt
    mti    Imagination Technologies Ltd. (formerly MIPS Technologies In=
c.)

Can we add an another one vendor string for MIPS?

Any advice and suggestions will be greatly appreciated!

--=A0
Best regards,
=A0 Antony Pavlov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
