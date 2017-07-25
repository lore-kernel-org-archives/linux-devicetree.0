From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH 0/3] Add ethernet0 alias for several A64 boards
Date: Tue, 25 Jul 2017 11:04:24 +0800
Message-ID: <f4016e61dbe4655a0e672c3377f35dd2@aosc.io>
References: <20170722022852.7868-1-icenowy@aosc.io>
 <20170724075823.7ttjq4tnvoupo776@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBO7K3LFQKGQE6JHQRQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170724075823.7ttjq4tnvoupo776@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-07-24 15:58=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> On Sat, Jul 22, 2017 at 10:28:49AM +0800, Icenowy Zheng wrote:
>> Allwinner A64 SoC has an EMAC which is used to provide Ethernet
>> function on several boards.
>>=20
>> The EMAC itself doesn't have a fixed MAC address, but the sunxi
>> mainline U-Boot have the ability to generate one based on the eFUSE
>> SID in the chip, and add the generated MAC address to the device
>> tree when booting.
>>=20
>> The MAC address setting step is based on the device tree's aliases,
>> and device tree nodes prefixed "ethernet" will get the MAC address
>> added. However, in several A64 boards' device tree, the alias is not
>> set up, so that the U-Boot won't set the MAC address.
>>=20
>> Add the ethernet0 aliases to these boards.
>>=20
>> I hope this patchset can be queued in 4.13, otherwise 4.13 kernels
>> won't get non-volatile MAC addresses, and will use random ones
>> instead, which is annoying to many users.
>>=20
>> Icenowy Zheng (3):
>>   arm64: allwinner: a64: add ethernet0 alias for BPi M64 EMAC node
>>   arm64: allwinner: a64: add ethernet0 alias for Pine64 EMAC node
>>   arm64: allwinner: a64: add ethernet0 alias for SoPine EMAC node
>=20
> Applied all three, thanks!

Sorry, but could you queue them to 4.13?

Otherwise 4.13 kernel release will have annoying random MAC problem,
which heavily affects headless usages.

> Maxime
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
