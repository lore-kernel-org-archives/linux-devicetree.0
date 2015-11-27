From: Troy Dack <troy-yfroEPzt3eC6c6uEtOJ/EA@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun8i-h3-orangepi-plus:
 Enable USB host controllers
Date: Thu, 26 Nov 2015 19:56:41 -0800 (PST)
Message-ID: <7c740ea8-3bbb-462f-8e87-e4abb4f86a50@googlegroups.com>
References: <1447616777-24660-1-git-send-email-hdegoede@redhat.com>
 <1447616777-24660-5-git-send-email-hdegoede@redhat.com>
 <CAGb2v669Cu6+G=P8yH-g5KbOsWTHBgnYUYf2fGt+jKXbqVAKfQ@mail.gmail.com>
 <56498FA8.3050908@redhat.com> <564B51D7.7090500@gmail.com>
 <fff9e78a-e23e-4226-9cec-67550bf09efb@googlegroups.com>
 <565424B9.5010601@redhat.com>
Reply-To: troy-yfroEPzt3eC6c6uEtOJ/EA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_198_1885283168.1448596601837"
Return-path: <linux-sunxi+bncBDCKB7GE2ABBB65I36ZAKGQEBEPESUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <565424B9.5010601-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: troy-yfroEPzt3eC6c6uEtOJ/EA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_198_1885283168.1448596601837
Content-Type: multipart/alternative;
	boundary="----=_Part_199_488008298.1448596601837"

------=_Part_199_488008298.1448596601837
Content-Type: text/plain; charset=UTF-8



On Tuesday, 24 November 2015 19:50:14 UTC+11, Hans de Goede wrote:
>
> Hi, 
>
> On 23-11-15 23:20, Troy Dack wrote: 
> > 
> > 
> > On Wednesday, 18 November 2015 03:12:11 UTC+11, Jens Kuske wrote: 
> >> 
> >> Enable the 2 USB host controllers used on the Orange Pi Plus 
> >> and add the necessary regulators. 
> >> 
> > I've been trying to test these patches by using Hans' github sunxi-wip 
> > branches of the kernel and U-Boot. 
> > 
> > U-Boot at commit 7e17fd2 "suxni: Add support for Orangepi Plus and 
> Orangepi 
> > PC boards" 
> > Kernel at commit cb45b8  "ARM: dts: sun8i-h3-orangepi-plus: Enable USB 
> host 
> > controllers" 
> > 
> > Both have been built using the default defconfig for an OrangePi Plus 
> > 
> > U-Boot starts and successfully boots the kernel, but the kernel does not 
> > appear to boot fully and hangs at: 
> > 
> > [    0.861175] cpu cpu0: failed to get cpu0 clock: -2 
> > [    0.865973] cpufreq-dt: probe of cpufreq-dt failed with error -2 
> > [    0.872017] Registering SWP/SWPB emulation handler 
> > 
> > Full boot log: http://pastebin.com/VGkEix9p 
> > 
> > Building the kernel (or just using a dab) with the dts from commit 
> 0a8c01 
> > "ARM: dts: sun8i: Add Orange Pi Plus support" results in the kernel 
> booting 
> > fully to a login prompt.  Of course without enabled/working USB. 
> > 
> > There is a fair chance I've done something wrong that is causing this. 
>  Any 
> > advice on how to get a bootable kernel? 
>
> Weird, are you sure you updated both the dtb and [u|z]image at the same 
> time ? 
>
> I'm using this kernel config: 
>
> https://fedorapeople.org/~jwrdegoede/kernel-driver-programming/kernel-config 
>
> With that everything you need is builtin, no need to build modules. 
>
> Regards, 
>
> Hans 
>

My apologies, it appears I had a power supply issue.  Using a different 
power supply resulted in a successful boot.

Strange that the board would boot into 3.4.39 with this power supply but 
4.4 won't.

Again, my apologies.

Thanks,
    Troy

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_199_488008298.1448596601837
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, 24 November 2015 19:50:14 UTC+11, Hans de Goede  wrote:=
<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;bor=
der-left: 1px #ccc solid;padding-left: 1ex;">Hi,
<br>
<br>On 23-11-15 23:20, Troy Dack wrote:
<br>&gt;
<br>&gt;
<br>&gt; On Wednesday, 18 November 2015 03:12:11 UTC+11, Jens Kuske wrote:
<br>&gt;&gt;
<br>&gt;&gt; Enable the 2 USB host controllers used on the Orange Pi Plus
<br>&gt;&gt; and add the necessary regulators.
<br>&gt;&gt;
<br>&gt; I&#39;ve been trying to test these patches by using Hans&#39; gith=
ub sunxi-wip
<br>&gt; branches of the kernel and U-Boot.
<br>&gt;
<br>&gt; U-Boot at commit 7e17fd2 &quot;suxni: Add support for Orangepi Plu=
s and Orangepi
<br>&gt; PC boards&quot;
<br>&gt; Kernel at commit cb45b8 =C2=A0&quot;ARM: dts: sun8i-h3-orangepi-pl=
us: Enable USB host
<br>&gt; controllers&quot;
<br>&gt;
<br>&gt; Both have been built using the default defconfig for an OrangePi P=
lus
<br>&gt;
<br>&gt; U-Boot starts and successfully boots the kernel, but the kernel do=
es not
<br>&gt; appear to boot fully and hangs at:
<br>&gt;
<br>&gt; [ =C2=A0 =C2=A00.861175] cpu cpu0: failed to get cpu0 clock: -2
<br>&gt; [ =C2=A0 =C2=A00.865973] cpufreq-dt: probe of cpufreq-dt failed wi=
th error -2
<br>&gt; [ =C2=A0 =C2=A00.872017] Registering SWP/SWPB emulation handler
<br>&gt;
<br>&gt; Full boot log: <a href=3D"http://pastebin.com/VGkEix9p" target=3D"=
_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.=
com/url?q\75http%3A%2F%2Fpastebin.com%2FVGkEix9p\46sa\75D\46sntz\0751\46usg=
\75AFQjCNFwMnGgwoFLjyiJl2IaYpBfeynh9A&#39;;return true;" onclick=3D"this.hr=
ef=3D&#39;http://www.google.com/url?q\75http%3A%2F%2Fpastebin.com%2FVGkEix9=
p\46sa\75D\46sntz\0751\46usg\75AFQjCNFwMnGgwoFLjyiJl2IaYpBfeynh9A&#39;;retu=
rn true;">http://pastebin.com/VGkEix9p</a>
<br>&gt;
<br>&gt; Building the kernel (or just using a dab) with the dts from commit=
 0a8c01
<br>&gt; &quot;ARM: dts: sun8i: Add Orange Pi Plus support&quot; results in=
 the kernel booting
<br>&gt; fully to a login prompt. =C2=A0Of course without enabled/working U=
SB.
<br>&gt;
<br>&gt; There is a fair chance I&#39;ve done something wrong that is causi=
ng this. =C2=A0Any
<br>&gt; advice on how to get a bootable kernel?
<br>
<br>Weird, are you sure you updated both the dtb and [u|z]image at the same=
 time ?
<br>
<br>I&#39;m using this kernel config:
<br><a href=3D"https://fedorapeople.org/~jwrdegoede/kernel-driver-programmi=
ng/kernel-config" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.hr=
ef=3D&#39;https://www.google.com/url?q\75https%3A%2F%2Ffedorapeople.org%2F~=
jwrdegoede%2Fkernel-driver-programming%2Fkernel-config\46sa\75D\46sntz\0751=
\46usg\75AFQjCNGHRZ3Jy4aTOfORWFo6mV5gahQN5g&#39;;return true;" onclick=3D"t=
his.href=3D&#39;https://www.google.com/url?q\75https%3A%2F%2Ffedorapeople.o=
rg%2F~jwrdegoede%2Fkernel-driver-programming%2Fkernel-config\46sa\75D\46snt=
z\0751\46usg\75AFQjCNGHRZ3Jy4aTOfORWFo6mV5gahQN5g&#39;;return true;">https:=
//fedorapeople.org/~<wbr>jwrdegoede/kernel-driver-<wbr>programming/kernel-c=
onfig</a>
<br>
<br>With that everything you need is builtin, no need to build modules.
<br>
<br>Regards,
<br>
<br>Hans
<br></blockquote><div><br></div><div>My apologies, it appears I had a power=
 supply issue. =C2=A0Using a different power supply resulted in a successfu=
l boot.</div><div><br></div><div>Strange that the board would boot into 3.4=
.39 with this power supply but 4.4 won&#39;t.</div><div><br></div><div>Agai=
n, my apologies.</div><div><br></div><div>Thanks,</div><div>=C2=A0 =C2=A0 T=
roy</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_199_488008298.1448596601837--

------=_Part_198_1885283168.1448596601837--
