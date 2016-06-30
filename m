From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Thu, 30 Jun 2016 19:33:36 +1000
Message-ID: <CAGRGNgVCXCoUk0SYpEJanMcvyecMK3LWhe_T1NRhvEjdpRTfSA@mail.gmail.com>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
	<CAOiHx=n6itfmvwYQh+jUSDNguQFkos=MzjkDWP=GsupdgvF6KQ@mail.gmail.com>
	<b49a9e4b-d591-d978-8005-413f39ebf2bd@redhat.com>
	<871t3gdj6p.fsf@purkki.adurom.net>
	<ea10ff70-26e6-e151-5cea-c54bd12a054c@redhat.com>
	<f8995599-115d-87e5-7928-c029b48584f1@broadcom.com>
	<87mvm36p4d.fsf@kamboji.qca.qualcomm.com>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a1144cfae86499305367b9082
Return-path: <linux-sunxi+bncBDQIP76OUQLBB4OO2O5QKGQEY7GDFJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <87mvm36p4d.fsf-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--001a1144cfae86499305367b9082
Content-Type: text/plain; charset=UTF-8

Hi Kalle,

On 30 Jun 2016 6:46 p.m., "Kalle Valo" <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
> Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:
>
> >> Since we are dealing with a per-board config-file here, which is
> >> loaded from the os filesystem we really need to specify a basename
> >> here as the list of possible boards is endless, so we cannot
> >> have a lookup table in the driver.
> >
> > As Jonas mentioned the general principle of device tree is to be
> > agnostic with regards to OS and/or driver as you undoubtedly know. His
> > proposal seems like a usable solution for your problem while complying
> > to the device tree principle. So instead of overriding the default
> > brcmfmac should modify it when dt specifies the "module" property, ie:
> >
> > no "module" in DT:    nvram filename = brcm/brcmfmac43362-sdio.txt
> > "module=ap6210" in DT:        nvram filename =
brcm/brcmfmac43362-ap6210.txt
>
> Just out of curiosity, what does "ap6210" exactly mean? I get that 43362
> is the chip id, but not ap6210. Is it just an arbitrary name?

Ap6210 is a chip that contains a 43362 and probably some Bluetooth chip
also.

Thanks,

Julian Calaby

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a1144cfae86499305367b9082
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Kalle,</p>
<p dir=3D"ltr">On 30 Jun 2016 6:46 p.m., &quot;Kalle Valo&quot; &lt;<a href=
=3D"mailto:kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org">kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Arend Van Spriel &lt;<a href=3D"mailto:arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org">a=
rend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org</a>&gt; writes:<br>
&gt;<br>
&gt; &gt;&gt; Since we are dealing with a per-board config-file here, which=
 is<br>
&gt; &gt;&gt; loaded from the os filesystem we really need to specify a bas=
ename<br>
&gt; &gt;&gt; here as the list of possible boards is endless, so we cannot<=
br>
&gt; &gt;&gt; have a lookup table in the driver.<br>
&gt; &gt;<br>
&gt; &gt; As Jonas mentioned the general principle of device tree is to be<=
br>
&gt; &gt; agnostic with regards to OS and/or driver as you undoubtedly know=
. His<br>
&gt; &gt; proposal seems like a usable solution for your problem while comp=
lying<br>
&gt; &gt; to the device tree principle. So instead of overriding the defaul=
t<br>
&gt; &gt; brcmfmac should modify it when dt specifies the &quot;module&quot=
; property, ie:<br>
&gt; &gt;<br>
&gt; &gt; no &quot;module&quot; in DT:=C2=A0 =C2=A0 nvram filename =3D brcm=
/brcmfmac43362-sdio.txt<br>
&gt; &gt; &quot;module=3Dap6210&quot; in DT:=C2=A0 =C2=A0 =C2=A0 =C2=A0 nvr=
am filename =3D brcm/brcmfmac43362-ap6210.txt<br>
&gt;<br>
&gt; Just out of curiosity, what does &quot;ap6210&quot; exactly mean? I ge=
t that 43362<br>
&gt; is the chip id, but not ap6210. Is it just an arbitrary name?</p>
<p dir=3D"ltr">Ap6210 is a chip that contains a 43362 and probably some Blu=
etooth chip also.</p>
<p dir=3D"ltr">Thanks,</p>
<p dir=3D"ltr">Julian Calaby<br>
</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a1144cfae86499305367b9082--
