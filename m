From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [RFC] ARM: dts: sunxi: Add regulators and
 board-specific operating points for LeMaker BananaPi
Date: Mon, 27 Jul 2015 21:14:09 +0800
Message-ID: <CAGb2v65ApKvrj6K+kw43u=0q6=auTsmQjCXhibgZkW+vd5nDqA@mail.gmail.com>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de>
	<55B5E6DB.8020009@redhat.com>
	<20150727123653.36C046C8007E@dd34104.kasserver.com>
	<55B62A1B.6030601@redhat.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a1142e4fc107e2f051bdb2152
Return-path: <linux-sunxi+bncBCMILY6JWQBBBKO53CWQKGQEKEKSPOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <55B62A1B.6030601-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--001a1142e4fc107e2f051bdb2152
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2015=E5=B9=B47=E6=9C=8827=E6=97=A5 =E4=B8=8B=E5=8D=888:54=E6=96=BC "Hans de=
 Goede" <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
>
> On 27-07-15 14:36, public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org wrote:
>>
>> Hi again,
>>
>> one more thing...
>>
>> Hans de Goede schrieb am 27.07.2015 10:07:
>>>
>>> IMHO we should just stick with the standard operating points unless we
know
>>> that there are stability issues with them (such as e.g. on the A10
OlinuxIno
>>> Lime).
>>
>>
>> If we stick to the standard operating points, shouldn't we honor their
voltages
>> as well? If we set the minimum voltage for dcdc2 to 1.0V (as you did) or
1.05V
>> (as I did), this means that the lowest operating point of 144MHz@0.9V
defined
>> in sun7i-a20.dtsi (and with my definition the 312MHz opp as well) will
not be
>> available because cpufreq-dt simply ignores operating points that aren't
within
>> the set voltage range for that regulator.
>
>
> Ah, good point. I don't know what is the right thing todo here.
>
> ChenYu (in the CC), since you did most of the original work here, do
> you know why we have an op at 0.9 volt, but none of our boards allow the
> voltage to go that low in the regulator settings ?

I'm on vacation now, so apologies for the bad formatting.

The OPPs are from a common subset
of the settings from the fex files available
at the time. Some fex files actually set
min and max voltage thus eliminating
the highest and lowest OPPs.

At least that is how Maxime and I
interpreted them.

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a1142e4fc107e2f051bdb2152
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
2015=E5=B9=B47=E6=9C=8827=E6=97=A5 =E4=B8=8B=E5=8D=888:54=E6=96=BC &quot;Ha=
ns de Goede&quot; &lt;<a href=3D"mailto:hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">hdegoede@redha=
t.com</a>&gt;=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt;<br>
&gt; On 27-07-15 14:36, <a href=3D"mailto:public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org">pub=
lic_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org</a> wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi again,<br>
&gt;&gt;<br>
&gt;&gt; one more thing...<br>
&gt;&gt;<br>
&gt;&gt; Hans de Goede schrieb am 27.07.2015 10:07:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; IMHO we should just stick with the standard operating points u=
nless we know<br>
&gt;&gt;&gt; that there are stability issues with them (such as e.g. on the=
 A10 OlinuxIno<br>
&gt;&gt;&gt; Lime).<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; If we stick to the standard operating points, shouldn&#39;t we hon=
or their voltages<br>
&gt;&gt; as well? If we set the minimum voltage for dcdc2 to 1.0V (as you d=
id) or 1.05V<br>
&gt;&gt; (as I did), this means that the lowest operating point of 144MHz@0=
.9V defined<br>
&gt;&gt; in sun7i-a20.dtsi (and with my definition the 312MHz opp as well) =
will not be<br>
&gt;&gt; available because cpufreq-dt simply ignores operating points that =
aren&#39;t within<br>
&gt;&gt; the set voltage range for that regulator.<br>
&gt;<br>
&gt;<br>
&gt; Ah, good point. I don&#39;t know what is the right thing todo here.<br=
>
&gt;<br>
&gt; ChenYu (in the CC), since you did most of the original work here, do<b=
r>
&gt; you know why we have an op at 0.9 volt, but none of our boards allow t=
he<br>
&gt; voltage to go that low in the regulator settings ?</p>
<p dir=3D"ltr">I&#39;m on vacation now, so apologies for the bad formatting=
.</p>
<p dir=3D"ltr">The OPPs are from a common subset<br>
of the settings from the fex files available<br>
at the time. Some fex files actually set<br>
min and max voltage thus eliminating<br>
the highest and lowest OPPs.</p>
<p dir=3D"ltr">At least that is how Maxime and I<br>
interpreted them.<br></p>
<p dir=3D"ltr">ChenYu</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a1142e4fc107e2f051bdb2152--
