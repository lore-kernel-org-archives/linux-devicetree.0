From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2] arm64: allwinner: h5: add support for
 NanoPi NEO Plus 2
Date: Mon, 28 Aug 2017 20:18:58 +0800
Message-ID: <BF2F26DC-7014-4AF6-9C02-D1038A0FDA38@aosc.io>
References: <20170824231716.2623-1-antony@phenome.org> <20170825103242.5665-1-antony@phenome.org> <CAEKpxBkUKGUQR2Vh1+Ci4wbB-+x48nRjLmWME2EUECCHuuwsmQ@mail.gmail.com> <20170828121644.p7mknytubsajzctg@AntonyAntony.local>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBSMUSDGQKGQECVIS6OY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170828121644.p7mknytubsajzctg-sIi4olfLYEDaK4aX9S0K76zUEOm+Xw19@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B48=E6=9C=8828=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888:=
16:44, Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Aug 25, 2017 at 03:28:41PM +0200, Code Kipper wrote:
>> On 25 August 2017 at 12:32, Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org> wrote:
>
>> > +
>> > +       brcmf: bcrmf@1 {
>> > +               reg =3D <1>;
>> > +               compatible =3D "brcm,bcm4329-fmac";
>> > +       };
>> Incorrect wifi chip - just deliver what you've tested.

Nope, this compatible is required by the dt binding, see the
binding document or other DTs with brcmfmac SDIO.

Please complain to brcmfmac maintainers.

>
>You are right. Now I found the correct chip ID by enabling debug with=20
>Broadcom kernel module 'modprobe brcmfmac debug=3D0x3ffff6'
>
>The module is Ampak AP6212A with Broadcom 43430 rev=3D1 inside it.
>
>brcmfmac: brcmf_chip_recognition found AXI chip: BCM43430, rev=3D1
>brcmfmac: brcmf_ops_sdio_probe sdio vendor ID: 0x02d0
>brcmfmac: brcmf_ops_sdio_probe sdio device ID: 0xa9a6
>
>IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
>
>This information mostly match with https://wikidevi.com/wiki/AMPAK,
>except=20
>module is actually AP6212A. Some of the modules may not have 'A'
>printed on=20
>them. However the ones that identify as rev=3D1 is a  AP6212A.
>
>FYI: there were two things that confused me
>	- bcm4329-fmac also works.
>	- I couldn't configure it to join WiFi network with password.
>
>With change I will send a v4. Here is the propssed diff to v3.
>
>arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
>
>        /*
>-        * WiFi driver support could be incomplete,
>-        * wlan0 is able to see Base Stations, however not able to
>join.
>+        * AMPAK AP6212A WiFi module with BCM43430, rev=3D1 inside
>+        * sdio vendor ID: 0x02d0, sdio device ID: 0xa9a6
>         */
>	brcmf: wifi@1 {
>		reg =3D <1>;
>-               compatible =3D "brcm,bcm4329-fmac";
>+               compatible =3D "brcm,bcm43430-fmac";
>	};=20
>
>I think now nanopi-neo-plus2.dts, v4, is in a good shape to merge.
>
>thanks for the feedback and review.
>
>regards,
>-antony

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
