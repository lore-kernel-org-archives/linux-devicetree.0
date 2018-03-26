From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH 2/7] dt-bindings: add binding for the
 Allwinner A64 DE2 bus
Date: Tue, 27 Mar 2018 07:31:18 +0800
Message-ID: <9A6A8961-D45C-4033-962E-83CCE8F01651@aosc.io>
References: <20180316175354.21437-1-icenowy@aosc.io> <20180320184646.dynqv6qubzabroe4@flea> <AAC74653-C6EB-4BE3-BB19-210687C1E158@aosc.io> <2866474.lRHIcLtROC@jernej-laptop> <9520BDDE-BFE3-4220-B48D-01A00CFA94DE@aosc.io> <20180326222258.uxpgj4bk4pg56b7o@rob-hp-laptop>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBU4F43KQKGQEDWXPMLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180326222258.uxpgj4bk4pg56b7o@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B43=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=886:=
22:58, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> =E5=86=99=E5=88=B0:
>On Thu, Mar 22, 2018 at 02:08:43PM +0800, Icenowy Zheng wrote:
>>=20
>>=20
>> =E4=BA=8E 2018=E5=B9=B43=E6=9C=8822=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=881:13:42, "Jernej =C5=A0krabec"
><jernej.skrabec-gGgVlfcn5nU@public.gmane.org> =E5=86=99=E5=88=B0:
>> >Hi all,
>> >
>> >Dne sreda, 21. marec 2018 ob 03:18:13 CET je Icenowy Zheng
>napisal(a):
>> >> =E4=BA=8E 2018=E5=B9=B43=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=
=8D=882:46:46, Maxime Ripard
>> ><maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>=20
>> >=E5=86=99=E5=88=B0:
>> >> >On Sat, Mar 17, 2018 at 01:53:49AM +0800, Icenowy Zheng wrote:
>> >> >> All the sub-blocks of Allwinner A64 DE2 needs the SRAM C on A64
>> >SoC
>> >> >
>> >> >to
>> >> >
>> >> >> be claimed, otherwise the whole DE2 space is inaccessible.
>> >> >>=20
>> >> >> Add a device tree binding of the DE2 part as a sub-bus.
>> >> >
>> >> >Where did you get the info that it was a bus?
>> >>=20
>> >> There's no direct evidence, just some guess.
>> >>=20
>> >> The DE2 is a whole part that is just allocated a memory
>> >> space at the user manual, and the SRAM controls the
>> >> access to all modules in the DE2.
>> >>=20
>> >> So it might be a bus.
>> >>=20
>> >> Implement it as a bus is a clear representation on A64.
>> >
>> >Since there is already syscon for same mmio region, we migh as well
>use
>> >it=20
>> >when loading ccu-sun8i-de2 driver on A64.
>> >
>> >Other options, like SRAM driver or bus driver, might better
>represent
>> >HW, but=20
>>=20
>> I think the device tree should properly represent the HW,
>> it's a basic requirment.
>>=20
>> >then we would have two DT nodes covering same mmio region, which I
>> >think is=20
>> >not really acceptable.
>>=20
>> It's acceptable, and DE2 is not the only user of SRAM controller so
>far.
>
>No, it's not acceptable. Don't create overlapping mmio regions in DT.

Then should the SRAM controller driver be configured to take the syscon?

>
>>=20
>> VE will also need a SRAM region to be claimed.
>>=20
>> >
>> >Any suggestions?
>> >
>> >BTW, H6 has same design in this regard.
>> >
>> >Best regards,
>> >Jernej
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree"
>in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
