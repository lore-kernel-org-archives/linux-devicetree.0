Return-Path: <SRS0=BHU/=VM=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20190628151327.206818-1-oshrialkoby85@gmail.com>
 <8e6ca8796f229c5dc94355437351d7af323f0c56.camel@linux.intel.com>
 <79e8bfd2-2ed1-cf48-499c-5122229beb2e@infineon.com> <CAM9mBwJC2QD5-gV1eJUDzC2Fnnugr-oCZCoaH2sT_7ktFDkS-Q@mail.gmail.com>
 <45603af2fc8374a90ef9e81a67083395cc9c7190.camel@linux.intel.com> <6e7ff1b958d84f6e8e585fd3273ef295@NTILML02.nuvoton.com>
In-Reply-To: <6e7ff1b958d84f6e8e585fd3273ef295@NTILML02.nuvoton.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 15 Jul 2019 11:08:47 +0300
Message-ID: <CAP6Zq1hPo9dG71YFyr7z9rjmi-DvoUZJOme4+2uqsfO+7nH+HQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] char: tpm: add new driver for tpm i2c ptp
Content-Type: multipart/alternative; boundary="0000000000000063fe058db3a720"
To: Oshri Alkobi <oshrialkoby85@gmail.com>, Alexander Steffen <Alexander.Steffen@infineon.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, peterhuewe@gmx.de, jgg@ziepe.ca, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, IS20 Oshri Alkoby <oshri.alkoby@nuvoton.com>, devicetree <devicetree@vger.kernel.org>, AP MS30 Linux Kernel community <linux-kernel@vger.kernel.org>, linux-integrity@vger.kernel.org, gcwilson@us.ibm.com, kgoldman@us.ibm.com, nayna@linux.vnet.ibm.com, IS30 Dan Morav <Dan.Morav@nuvoton.com>, eyal.cohen@nuvoton.com
List-ID: <devicetree@vger.kernel.org>

--0000000000000063fe058db3a720
Content-Type: text/plain; charset="UTF-8"

Hi Jarkko and All,



Thanks for your feedback and sorry for the late response.


Due to the amount of work required to handle this technical feedback and
project constraints we need to put this task on hold for the near future.
In the meantime, anyone from the community is welcome to take over this
code and handle the re-design for the benefit of the entire TPM community.

Thanks again,

Tomer

On Mon, 15 Jul 2019 at 10:54, <tomer.maimon@nuvoton.com> wrote:

>
>
> -----Original Message-----
> From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Sent: Friday, 5 July 2019 14:28
> To: Oshri Alkobi <oshrialkoby85@gmail.com>; Alexander Steffen <
> Alexander.Steffen@infineon.com>
> Cc: robh+dt@kernel.org; mark.rutland@arm.com; peterhuewe@gmx.de;
> jgg@ziepe.ca; arnd@arndb.de; gregkh@linuxfoundation.org; IS20 Oshri
> Alkoby <oshri.alkoby@nuvoton.com>; devicetree@vger.kernel.org; AP MS30
> Linux Kernel community <linux-kernel@vger.kernel.org>;
> linux-integrity@vger.kernel.org; gcwilson@us.ibm.com; kgoldman@us.ibm.com;
> nayna@linux.vnet.ibm.com; IS30 Dan Morav <Dan.Morav@nuvoton.com>; IS20
> Tomer Maimon <tomer.maimon@nuvoton.com>
> Subject: Re: [PATCH v2 0/2] char: tpm: add new driver for tpm i2c ptp
>
> On Thu, 2019-07-04 at 12:48 -0500, Oshri Alkobi wrote:
> > Alex, Jarkko, thank you very much for your feedbacks!
>
> Please configure your email client to use plain text.
>
> > I totally agree, there are some duplications that can be common,
> > indeed it will require some work in tpm_tis_core.
> > Since I believe it is not going to happen soon, I would suggest to
> > examine what duplications can currently be dropped from the new
> > driver, so the kernel will support the PTP I2C interface in the meantime.
> > I will appreciate getting ideas about any tpm_tis_core logic that
> > currently can be used as is by the new drive.
>
> I rather wait for a solution that integrates with our mature stack for TIS
> (or these days FIFO) than integrate something half-baked. If you want
> something in, please do right things right.
>
> What you are proposing would mean maintaining duplicate stacks forever.
>
> > Since the TIS is an old specification that mostly defines FIFO for
> > TPM1.2 I would say the name tpm_tis_i2c does not completely reflect
> > its goal. However we really don't have any problem with any name that
> the group will agree on.
> > Does tpm_ptp_i2c sound better than the current name?
>
> Absolutely not going to use that name. The naming convention is what it is
> for other drivers that are adapt tpm_tis_core to different HW interfaces.
>
> /Jarkko
>
>
>
>
> ===========================================================================================
> The privileged confidential information contained in this email is
> intended for use only by the addressees as indicated by the original sender
> of this email. If you are not the addressee indicated in this email or are
> not responsible for delivery of the email to such a person, please kindly
> reply to the sender indicating this fact and delete all copies of it from
> your computer and network server immediately. Your cooperation is highly
> appreciated. It is advised that any unauthorized use of confidential
> information of Nuvoton is strictly prohibited; and any information in this
> email irrelevant to the official business of Nuvoton shall be deemed as
> neither given nor endorsed by Nuvoton.
>

--0000000000000063fe058db3a720
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><=
font face=3D"arial, sans-serif" style=3D"" color=3D"#000000">Hi Jarkko and =
All,</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif" color=3D"#000000">=C2=A0</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif" color=3D"#000000">Thanks for your feedback and sorry
for the late response.</font></p><p class=3D"MsoNormal" style=3D"margin:0cm=
 0cm 0.0001pt"><font face=3D"arial, sans-serif" color=3D"#000000"><br></fon=
t></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif" color=3D"#000000">Due to the amount of work required
to handle this technical feedback and project constraints we need to put th=
is
task on hold for the near future.</font></p>

<font face=3D"arial, sans-serif"><font color=3D"#000000">In the meantime, a=
nyone from
the community is welcome to take over this code and handle the re-design fo=
r
the benefit of the entire TPM community.</font></font><div><font face=3D"ar=
ial, sans-serif"><br></font></div><div><font face=3D"arial, sans-serif">Tha=
nks again,</font></div><div><font face=3D"arial, sans-serif"><br></font></d=
iv><div><font face=3D"arial, sans-serif">Tomer=C2=A0=C2=A0</font>=C2=A0<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, 15 Jul 2019 at 10:54, &lt;<a href=3D"mailto:tomer.maimon@nuvo=
ton.com">tomer.maimon@nuvoton.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
<br>
-----Original Message-----<br>
From: Jarkko Sakkinen &lt;<a href=3D"mailto:jarkko.sakkinen@linux.intel.com=
" target=3D"_blank">jarkko.sakkinen@linux.intel.com</a>&gt;<br>
Sent: Friday, 5 July 2019 14:28<br>
To: Oshri Alkobi &lt;<a href=3D"mailto:oshrialkoby85@gmail.com" target=3D"_=
blank">oshrialkoby85@gmail.com</a>&gt;; Alexander Steffen &lt;<a href=3D"ma=
ilto:Alexander.Steffen@infineon.com" target=3D"_blank">Alexander.Steffen@in=
fineon.com</a>&gt;<br>
Cc: <a href=3D"mailto:robh%2Bdt@kernel.org" target=3D"_blank">robh+dt@kerne=
l.org</a>; <a href=3D"mailto:mark.rutland@arm.com" target=3D"_blank">mark.r=
utland@arm.com</a>; <a href=3D"mailto:peterhuewe@gmx.de" target=3D"_blank">=
peterhuewe@gmx.de</a>; <a href=3D"mailto:jgg@ziepe.ca" target=3D"_blank">jg=
g@ziepe.ca</a>; <a href=3D"mailto:arnd@arndb.de" target=3D"_blank">arnd@arn=
db.de</a>; <a href=3D"mailto:gregkh@linuxfoundation.org" target=3D"_blank">=
gregkh@linuxfoundation.org</a>; IS20 Oshri Alkoby &lt;<a href=3D"mailto:osh=
ri.alkoby@nuvoton.com" target=3D"_blank">oshri.alkoby@nuvoton.com</a>&gt;; =
<a href=3D"mailto:devicetree@vger.kernel.org" target=3D"_blank">devicetree@=
vger.kernel.org</a>; AP MS30 Linux Kernel community &lt;<a href=3D"mailto:l=
inux-kernel@vger.kernel.org" target=3D"_blank">linux-kernel@vger.kernel.org=
</a>&gt;; <a href=3D"mailto:linux-integrity@vger.kernel.org" target=3D"_bla=
nk">linux-integrity@vger.kernel.org</a>; <a href=3D"mailto:gcwilson@us.ibm.=
com" target=3D"_blank">gcwilson@us.ibm.com</a>; <a href=3D"mailto:kgoldman@=
us.ibm.com" target=3D"_blank">kgoldman@us.ibm.com</a>; <a href=3D"mailto:na=
yna@linux.vnet.ibm.com" target=3D"_blank">nayna@linux.vnet.ibm.com</a>; IS3=
0 Dan Morav &lt;<a href=3D"mailto:Dan.Morav@nuvoton.com" target=3D"_blank">=
Dan.Morav@nuvoton.com</a>&gt;; IS20 Tomer Maimon &lt;<a href=3D"mailto:tome=
r.maimon@nuvoton.com" target=3D"_blank">tomer.maimon@nuvoton.com</a>&gt;<br=
>
Subject: Re: [PATCH v2 0/2] char: tpm: add new driver for tpm i2c ptp<br>
<br>
On Thu, 2019-07-04 at 12:48 -0500, Oshri Alkobi wrote:<br>
&gt; Alex, Jarkko, thank you very much for your feedbacks!<br>
<br>
Please configure your email client to use plain text.<br>
<br>
&gt; I totally agree, there are some duplications that can be common,<br>
&gt; indeed it will require some work in tpm_tis_core.<br>
&gt; Since I believe it is not going to happen soon, I would suggest to<br>
&gt; examine what duplications can currently be dropped from the new<br>
&gt; driver, so the kernel will support the PTP I2C interface in the meanti=
me.<br>
&gt; I will appreciate getting ideas about any tpm_tis_core logic that<br>
&gt; currently can be used as is by the new drive.<br>
<br>
I rather wait for a solution that integrates with our mature stack for TIS =
(or these days FIFO) than integrate something half-baked. If you want somet=
hing in, please do right things right.<br>
<br>
What you are proposing would mean maintaining duplicate stacks forever.<br>
<br>
&gt; Since the TIS is an old specification that mostly defines FIFO for<br>
&gt; TPM1.2 I would say the name tpm_tis_i2c does not completely reflect<br=
>
&gt; its goal. However we really don&#39;t have any problem with any name t=
hat the group will agree on.<br>
&gt; Does tpm_ptp_i2c sound better than the current name?<br>
<br>
Absolutely not going to use that name. The naming convention is what it is =
for other drivers that are adapt tpm_tis_core to different HW interfaces.<b=
r>
<br>
/Jarkko<br>
<br>
<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.<br>
</blockquote></div>

--0000000000000063fe058db3a720--
