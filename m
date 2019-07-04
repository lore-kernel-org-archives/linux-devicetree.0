Return-Path: <SRS0=DFUW=VB=gmail.com=oshrialkoby85@kernel.org>
MIME-Version: 1.0
References: <20190628151327.206818-1-oshrialkoby85@gmail.com>
 <8e6ca8796f229c5dc94355437351d7af323f0c56.camel@linux.intel.com> <79e8bfd2-2ed1-cf48-499c-5122229beb2e@infineon.com>
In-Reply-To: <79e8bfd2-2ed1-cf48-499c-5122229beb2e@infineon.com>
From: Oshri Alkobi <oshrialkoby85@gmail.com>
Date: Thu, 4 Jul 2019 12:48:20 -0500
Message-ID: <CAM9mBwJC2QD5-gV1eJUDzC2Fnnugr-oCZCoaH2sT_7ktFDkS-Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] char: tpm: add new driver for tpm i2c ptp
Content-Type: multipart/alternative; boundary="0000000000000848aa058cde96af"
To: Alexander Steffen <Alexander.Steffen@infineon.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca, arnd@arndb.de, gregkh@linuxfoundation.org, oshri.alkoby@nuvoton.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, gcwilson@us.ibm.com, kgoldman@us.ibm.com, nayna@linux.vnet.ibm.com, dan.morav@nuvoton.com, tomer.maimon@nuvoton.com
List-ID: <devicetree@vger.kernel.org>

--0000000000000848aa058cde96af
Content-Type: text/plain; charset="UTF-8"

Alex, Jarkko, thank you very much for your feedbacks!



> The long descriptions are still missing



Will be expanded



> I'd still prefer not to duplicate all the high-level logic from
tpm_tis_core. But this will probably mean to introduce some new interfaces
between tpm_tis_core and the physical layers.



I totally agree, there are some duplications that can be common, indeed it
will require some work in tpm_tis_core.

Since I believe it is not going to happen soon, I would suggest to examine
what duplications can currently be dropped from the new driver, so the
kernel will support the PTP I2C interface in the meantime.

I will appreciate getting ideas about any tpm_tis_core logic that currently
can be used as is by the new drive.



> Also, shouldn't the new driver be called tpm_tis_i2c, to group it with

> all the other (TIS) drivers, that implement a vendor-independent

> protocol? With tpm_i2c_ptp users might assume that ptp is just another

> vendor



Since the TIS is an old specification that mostly defines FIFO for TPM1.2 I
would say the name tpm_tis_i2c does not completely reflect its goal.
However we really don't have any problem with any name that the group will
agree on.

Does tpm_ptp_i2c sound better than the current name?



Oshri

On Thu, Jul 4, 2019 at 6:29 AM Alexander Steffen <
Alexander.Steffen@infineon.com> wrote:

> On 04.07.2019 10:43, Jarkko Sakkinen wrote:
> > Check out tpm_tis_core.c and tpm_tis_spi.c. TPM TIS driver implements
> > that spec so you should only implement a new physical layer.
>
> I had the same thought. Unfortunately, the I2C-TIS specification
> introduces two relevant changes compared to tpm_tis/tpm_tis_spi:
>
> 1. Locality is not encoded into register addresses anymore, but stored
> in a separate register.
> 2. Several register addresses have changed (but still contain compatible
> contents).
>
> I'd still prefer not to duplicate all the high-level logic from
> tpm_tis_core. But this will probably mean to introduce some new
> interfaces between tpm_tis_core and the physical layers.
>
> Also, shouldn't the new driver be called tpm_tis_i2c, to group it with
> all the other (TIS) drivers, that implement a vendor-independent
> protocol? With tpm_i2c_ptp users might assume that ptp is just another
> vendor.
>
> Alexander
>

--0000000000000848aa058cde96af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.=
0001pt;font-size:11pt;font-family:Calibri,sans-serif">Alex, Jarkko, thank y=
ou very much for your feedbacks!</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">&gt; The long descriptions are still m=
issing</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Will be expanded </p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">&gt; I&#39;d still prefer not to dupli=
cate all the high-level
logic from tpm_tis_core. But this will probably mean to introduce some new
interfaces between tpm_tis_core and the physical layers.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">I totally agree, there are some duplic=
ations that can be
common, indeed it will require some work in=C2=A0<span style=3D"font-size:1=
4.6667px">tpm_tis_core</span>.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Since I believe it is not going to hap=
pen soon, I would
suggest to examine what duplications can currently be dropped from the new
driver, so the kernel will support the PTP I2C interface in the meantime.</=
p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">I will appreciate getting ideas about =
any tpm_tis_core
logic that currently can be used as is by the new drive.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">&gt; Also, shouldn&#39;t the new drive=
r be called
tpm_tis_i2c, to group it with </p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">&gt; all the other (TIS) drivers, that=
 implement a
vendor-independent </p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">&gt; protocol? With tpm_i2c_ptp users =
might assume that
ptp is just another </p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">&gt; vendor</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Since the TIS is an old specification =
that mostly defines
FIFO for TPM1.2 I would say the name tpm_tis_i2c does not completely reflec=
t
its goal. However we really don&#39;t have any problem with any name that t=
he group will agree on. </p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Does tpm_ptp_i2c sound better than the=
 current name?</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0in 0in 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Oshri</p></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 4, 2019 at 6:29 A=
M Alexander Steffen &lt;<a href=3D"mailto:Alexander.Steffen@infineon.com">A=
lexander.Steffen@infineon.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On 04.07.2019 10:43, Jarkko Sakkinen wrote:<br=
>
&gt; Check out tpm_tis_core.c and tpm_tis_spi.c. TPM TIS driver implements<=
br>
&gt; that spec so you should only implement a new physical layer.<br>
<br>
I had the same thought. Unfortunately, the I2C-TIS specification <br>
introduces two relevant changes compared to tpm_tis/tpm_tis_spi:<br>
<br>
1. Locality is not encoded into register addresses anymore, but stored <br>
in a separate register.<br>
2. Several register addresses have changed (but still contain compatible <b=
r>
contents).<br>
<br>
I&#39;d still prefer not to duplicate all the high-level logic from <br>
tpm_tis_core. But this will probably mean to introduce some new <br>
interfaces between tpm_tis_core and the physical layers.<br>
<br>
Also, shouldn&#39;t the new driver be called tpm_tis_i2c, to group it with =
<br>
all the other (TIS) drivers, that implement a vendor-independent <br>
protocol? With tpm_i2c_ptp users might assume that ptp is just another <br>
vendor.<br>
<br>
Alexander<br>
</blockquote></div>

--0000000000000848aa058cde96af--
