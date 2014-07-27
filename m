Return-Path: <spk.linux@gmail.com>
MIME-Version: 1.0
In-Reply-To: <53D3FB9C.9080908@suse.de>
References: <1405443816-29917-1-git-send-email-lauraa@codeaurora.org>
	<53D3FB9C.9080908@suse.de>
Date: Sun, 27 Jul 2014 09:58:44 +0530
Message-ID: <CAK5sBcFeaHrLLoSYCvrSMBX+eGYWoGPrCH0Uxy3Ao2OAYXoTNA@mail.gmail.com>
Subject: Re: [RESEND][PATCHv2 0/3] Fix for buggy u-boot memory banks
From: Sachin Kamat <spk.linux@gmail.com>
Content-Type: multipart/alternative; boundary=e89a8f8397ade74a1204ff253d75
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Laura Abbott <lauraa@codeaurora.org>, Tushar Behera <trblinux@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--e89a8f8397ade74a1204ff253d75
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sunday, July 27, 2014, Andreas F=C3=A4rber <afaerber@suse.de> wrote:

> Hi Laura,
>
> Am 15.07.2014 19:03, schrieb Laura Abbott:
> > This is a resend of the series to fix the uboot bug exposed by the
> removal
> > of meminfo. I haven't gotten any acks though.
> >
> > Please help with review/acks. Grant/Rob, I'd still like this to go
> through
> > the devicetree tree if possible.
>
> Sorry for the delay in testing.
>
> With this v2 applied on top of kgene's for-next branch (plus
> https://patchwork.kernel.org/patch/4297431/ as build fix) I get:
>
> [    9.699985] Unhandled fault: asynchronous external abort (0x211) at
> 0x00000000
>
>
If this is on Arndale octa board, please try disabling MCPM option.


> Same for v1 that had worked okay before, so it's not your series, but it
> may explain why you haven't heard on v2 from the others yet.
>
> Regards,
> Andreas
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org <javascript:;>
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--=20
Regards,
Sachin.

--e89a8f8397ade74a1204ff253d75
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, July 27, 2014, Andreas F=C3=A4rber &lt;<a href=3D"mailto=
:afaerber@suse.de">afaerber@suse.de</a>&gt; wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
Hi Laura,<br>
<br>
Am 15.07.2014 19:03, schrieb Laura Abbott:<br>
&gt; This is a resend of the series to fix the uboot bug exposed by the rem=
oval<br>
&gt; of meminfo. I haven&#39;t gotten any acks though.<br>
&gt;<br>
&gt; Please help with review/acks. Grant/Rob, I&#39;d still like this to go=
 through<br>
&gt; the devicetree tree if possible.<br>
<br>
Sorry for the delay in testing.<br>
<br>
With this v2 applied on top of kgene&#39;s for-next branch (plus<br>
<a href=3D"https://patchwork.kernel.org/patch/4297431/" target=3D"_blank">h=
ttps://patchwork.kernel.org/patch/4297431/</a> as build fix) I get:<br>
<br>
[ =C2=A0 =C2=A09.699985] Unhandled fault: asynchronous external abort (0x21=
1) at<br>
0x00000000<br>
<br></blockquote><div><br></div><div>If this is on Arndale octa board, plea=
se try disabling MCPM option.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">

Same for v1 that had worked okay before, so it&#39;s not your series, but i=
t<br>
may explain why you haven&#39;t heard on v2 from the others yet.<br>
<br>
Regards,<br>
Andreas<br>
<br>
--<br>
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany<br>
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"javascript:;" onclick=3D"_e(event, &#39=
;cvml&#39;, &#39;majordomo@vger.kernel.org&#39;)">majordomo@vger.kernel.org=
</a><br>
More majordomo info at =C2=A0<a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><b=
r>
</blockquote><br><br>-- <br><div>Regards,</div><div>Sachin.</div><br>

--e89a8f8397ade74a1204ff253d75--
