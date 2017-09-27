From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH 0/3] Simple DVFS support for Allwinner A64 SoC
Date: Wed, 27 Sep 2017 19:51:30 +0800
Message-ID: <9b3aeb6cb155bb2f9a7cee438de82ccb@aosc.io>
References: <20170923001531.14285-1-icenowy@aosc.io>
 <20170925101027.lghnnll4h6inreqm@flea.home>
 <27EF78BD-6285-4D8D-AA65-8294D797E2FB@aosc.io>
 <20170925102744.qixfwlheeimemhcf@flea.home>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBRNBV3HAKGQELYRSHRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170925102744.qixfwlheeimemhcf-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-09-25 18:27=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> On Mon, Sep 25, 2017 at 10:12:09AM +0000, Icenowy Zheng wrote:
>> =E4=BA=8E 2017=E5=B9=B49=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=886:10:27, Maxime Ripard=20
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>> >Hi,
>> >
>> >On Sat, Sep 23, 2017 at 12:15:28AM +0000, Icenowy Zheng wrote:
>> >> This patchset imports simple DVFS support for Allwinner A64 SoC.
>> >>
>> >> As the thermal sensor driver is not yet implemented and some boards
>> >> have still no AXP PMIC support, now only two OPPs are present --
>> >> 648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.
>> >>
>> >> PATCH 1 is a fix to the CCU driver of A64, and the remaining patches
>> >> set up the device tree bits of the DVFS on Pine64.
>> >
>> >How has this been tested?
>> >
>> >What tasks did you run, with what governor, etc...
>>=20
>> I only tested manual frequency switching between 648MHz and
>> 816MHz, and tested the PLL stuck issue by change the OPPs to
>> some random value.
>=20
> Ideally, we should test that it's actually reliable. Poorly chosen
> OPPs might lead to corrupt data that you might not get before a while.
>=20
> Please test using:
> https://linux-sunxi.org/Hardware_Reliability_Tests#Reliability_of_cpufreq=
_voltage.2Ffrequency_settings
>=20
> And post the report.

```
root@p64 [ cpuburn-arm@master ] # ./cpuburn-a53 &
[1] 2543
root@p64 [ cpuburn-arm@master ] # ./cpufreq-ljt-stress-test
Creating './whitenoise-1920x1080.jpg' ... done
CPU stress test, which is doing JPEG decoding by libjpeg-turbo
at different cpufreq operating points.

Testing CPU 0
   816 MHz ............................................................=20
OK
   648 MHz ............................................................=20
OK

Testing CPU 1
   816 MHz ............................................................=20
OK
   648 MHz ............................................................=20
OK

Testing CPU 2
   816 MHz ............................................................=20
OK
   648 MHz ............................................................=20
OK

Testing CPU 3
   816 MHz ............................................................=20
OK
   648 MHz ............................................................=20
OK

Overall result : PASSED
```

>=20
> Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
