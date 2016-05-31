From: luoyi <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun7i: Add dts file for
 Bananapi M1 Plus board
Date: Tue, 31 May 2016 10:03:15 +0800
Message-ID: <CAFfxPQu-WerarpCPDo81Q1O9B10CseHrAWuGBNPDibhWi8G+SQ@mail.gmail.com>
References: <20160530123013.11575-1-luoyi.ly@gmail.com>
	<20160530194340.GE4908@lukather>
	<574CA1ED.8050007@web.de>
Reply-To: luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a113d3e04a98811053419c6a9
Return-path: <linux-sunxi+bncBCLONWF5WQNBBY7BWO5AKGQENFI6LFI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <574CA1ED.8050007-S0/GAf8tV78@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Bernhard Nortmann <bernhard.nortmann-S0/GAf8tV78@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--001a113d3e04a98811053419c6a9
Content-Type: text/plain; charset=UTF-8

bpi m1+'s i2s/spdif  pinout is different with the bpi pro .

2016-05-31 4:26 GMT+08:00 Bernhard Nortmann <bernhard.nortmann-S0/GAf8tV78@public.gmane.org>:

> Am 30.05.2016 um 21:43 schrieb Maxime Ripard:
>
>> Hi,
>>
>> On Mon, May 30, 2016 at 08:30:13PM +0800, luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>
>>> From: luoyi <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> Add support for the Bananapi M1 Plus A20 development board from
>>> sinovoip.com.cn .
>>> This board features 1G RAM, 2 USB A receptacles, 1 micro USB receptacle
>>> for
>>> OTG, 1 micro USB receptacle for power, HDMI, sata, Gbit ethernet, ir
>>> receiver,
>>> 3.5 mm jack for stero sound out, on board microphone, 40 gpio pins and
>>> sdio wifi.
>>>
>> What is the difference between the M1+ and the M1?
>>
>
> The M1+ is an updated version of the original Banana Pi. If you're
> interested
> in the details, have a look at http://linux-sunxi.org/Banana_Pi#Variants .
> "BPi-M1+" is SinoVoip's counterpart of LeMaker's "Banana Pro", for which a
> .dts
> already exists. Judging from .fex files, only a single pin assignment
> seems to
> differ between the two (audio_pa_ctrl, PH26 vs. PH15).
>
> Regards, B. Nortmann
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a113d3e04a98811053419c6a9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">bpi m1+&#39;s i2s/spdif=C2=A0 pinout is different with the=
 bpi pro .<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">2016-05-31 4:26 GMT+08:00 Bernhard Nortmann <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:bernhard.nortmann-S0/GAf8tV78@public.gmane.org" target=3D"_blank">bernhard.nortmann@w=
eb.de</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">Am=
 30.05.2016 um 21:43 schrieb Maxime Ripard:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi,<br>
<br>
On Mon, May 30, 2016 at 08:30:13PM +0800, <a href=3D"mailto:luoyi.ly@gmail.=
com" target=3D"_blank">luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: luoyi &lt;<a href=3D"mailto:luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">luo=
yi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
<br>
Add support for the Bananapi M1 Plus A20 development board from <a href=3D"=
http://sinovoip.com.cn" rel=3D"noreferrer" target=3D"_blank">sinovoip.com.c=
n</a> .<br>
This board features 1G RAM, 2 USB A receptacles, 1 micro USB receptacle for=
<br>
OTG, 1 micro USB receptacle for power, HDMI, sata, Gbit ethernet, ir receiv=
er,<br>
3.5 mm jack for stero sound out, on board microphone, 40 gpio pins and sdio=
 wifi.<br>
</blockquote>
What is the difference between the M1+ and the M1?<br>
</blockquote>
<br></span>
The M1+ is an updated version of the original Banana Pi. If you&#39;re inte=
rested<br>
in the details, have a look at <a href=3D"http://linux-sunxi.org/Banana_Pi#=
Variants" rel=3D"noreferrer" target=3D"_blank">http://linux-sunxi.org/Banan=
a_Pi#Variants</a> .<br>
&quot;BPi-M1+&quot; is SinoVoip&#39;s counterpart of LeMaker&#39;s &quot;Ba=
nana Pro&quot;, for which a .dts<br>
already exists. Judging from .fex files, only a single pin assignment seems=
 to<br>
differ between the two (audio_pa_ctrl, PH26 vs. PH15).<br>
<br>
Regards, B. Nortmann<br>
</blockquote></div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a113d3e04a98811053419c6a9--
