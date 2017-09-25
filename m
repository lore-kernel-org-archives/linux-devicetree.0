From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 0/3] Simple DVFS support for Allwinner A64 SoC
Date: Mon, 25 Sep 2017 18:12:09 +0800
Message-ID: <27EF78BD-6285-4D8D-AA65-8294D797E2FB@aosc.io>
References: <20170923001531.14285-1-icenowy@aosc.io> <20170925101027.lghnnll4h6inreqm@flea.home>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBCVNUPHAKGQEL7VZOHY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170925101027.lghnnll4h6inreqm-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B49=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=886:=
10:27, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi,
>
>On Sat, Sep 23, 2017 at 12:15:28AM +0000, Icenowy Zheng wrote:
>> This patchset imports simple DVFS support for Allwinner A64 SoC.
>>=20
>> As the thermal sensor driver is not yet implemented and some boards
>> have still no AXP PMIC support, now only two OPPs are present --
>> 648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.
>>=20
>> PATCH 1 is a fix to the CCU driver of A64, and the remaining patches
>> set up the device tree bits of the DVFS on Pine64.
>
>How has this been tested?
>
>What tasks did you run, with what governor, etc...

I only tested manual frequency switching between 648MHz and
816MHz, and tested the PLL stuck issue by change the OPPs to
some random value.

>
>Thanks!
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
