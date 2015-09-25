From: "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add regulators for
 LeMaker BananaPi
Date: Fri, 25 Sep 2015 17:05:58 +0200 (CEST)
Message-ID: <20150925150558.184E66C8385C@dd34104.kasserver.com>
References: <1438532305-5884-1-git-send-email-public_timo.s@silentcreek.de> <20150818153631.GH2547@lukather><CAMAWPa-Q7o+Ys2FjhLZt6Nwq=Ja6TTdWFDZFTCYLkoLGjpLpxw@mail.gmail.com>
Reply-To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCSJLSE35MGBBV6FSWYAKGQEKRBFKQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAMAWPa-Q7o+Ys2FjhLZt6Nwq=Ja6TTdWFDZFTCYLkoLGjpLpxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

Kevin Hilman schrieb am 25. Sept 2015 01:57:

> On Tue, Aug 18, 2015 at 8:36 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> On Sun, Aug 02, 2015 at 06:18:25PM +0200, Timo Sigurdsson wrote:
>>> sun7i-a20-bananapi.dts doesn't contain regulator nodes for the AXP209
>>> PMU
>>> driver, so add them to allow for voltage-scaling with cpufreq-dt.
>>>
>>> Signed-off-by: Timo Sigurdsson <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
>>
>> Queued, thanks!
>> Maxime
>=20
> kernelci.org started finding boot faiulres[1] on bananapi linux-next
> around next-20150918, but it was only failing in some labs and not
> others.  I finally bisected it down to this patch, which landed in
> linux-next in the form of 2d665a8a8350 ARM: dts: sunxi: Add regulators
> for LeMaker BananaPi.  Reverting that commit on top of next-20150923
> gets my bananapi booting again.
>=20
> Note it's kind of an interesting boot failure.  The kernel boots fully
> to a shell, but panics after running a few commands.  In particular
> 'dmesg -n1' seems to trigger it usually[2].
>=20
> Kevin
>=20
> [1]
> http://kernelci.org/boot/sun7i-a20-bananapi/job/next/kernel/next-20150923=
/defconfig/multi_v7_defconfig/lab/lab-khilman/?_id=3D5602504359b514be146c32=
6f
> [2]
> http://storage.kernelci.org/next/next-20150923/arm-multi_v7_defconfig/lab=
-khilman/boot-sun7i-a20-bananapi.html
>=20

Thanks for your feedback. I'm traveling at the moment, so I can't do any te=
sting but just guess wildly. I know, though, that I used dmesg frequently w=
hen I did my own testing before submitting the patch and could not see such=
 behavior.

Before this commit, the CPU of your BananaPi runs at 1.4 volts constantly. =
With this commit applied, the CPU voltage should vary between 1.0-1.4 volts=
 depending on the frequency and defined operating points. Hence, one of my =
guesses would be that your CPU is not stable at the lower voltages. Could y=
ou modify the voltages for the defined frequencies in sun7i-a20.dtsi and te=
st if that solves your issue? Say, raise the voltage by 0.1 volts for each =
operating point (but no higher than 1.4). I actually had a different patch =
that applied slightly higher voltages taken from the original fex for by Le=
Maker, but the feedback was, unless there are actual reports about boards n=
ot running stable at the current settings, we just keep them instead. So, I=
'm curious if you happen to have a board that requires slightly higher volt=
ages to run stable.

Regards,=20

Timo

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
