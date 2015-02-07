Return-Path: <gordon@bosvangennip.nl>
Message-ID: <54D66EB2.2030006@bosvangennip.nl>
Date: Sat, 07 Feb 2015 20:59:46 +0100
From: Gordon Bos <gordon@bosvangennip.nl>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] arm: Fix unavailable MTD userland devices on Excito
 B3 boards
References: <1423212311-10793-1-git-send-email-gordon@bosvangennip.nl> <54D484D8.8090801@free-electrons.com> <54D6299B.70707@bosvangennip.nl> <20150207160945.GA22306@lunn.ch> <54D64820.7020002@bosvangennip.nl> <20150207173642.GI25985@lunn.ch> <54D657D5.3010709@bosvangennip.nl> <20150207184024.GB22306@lunn.ch>
In-Reply-To: <20150207184024.GB22306@lunn.ch>
Content-Type: multipart/alternative;
 boundary="------------060400040601080803090708"
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060400040601080803090708
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

There is a difference, and apparently it somewhere got solved:

 From running kernel 3.17.1

      ~ # dmesg | grep spi

Running an upgraded kernel 3.18.5 with the same DT blob

      ~ # dmesg | grep spi
    [    0.928832] m25p80 spi0.0: found m25p16, expected m25p80
    [    0.934124] m25p80 spi0.0: m25p16 (2048 Kbytes)
    [    0.938666] 3 ofpart partitions found on MTD device spi0.0
    [    0.944124] Creating 3 MTD partitions on "spi0.0":


In 3.17.1 the MTD devices were missing without the patch, in 3.18.5 they 
also show
up without the patch.

You may therefore consider the MTD issue as solved.

Which leaves just the (aesthetic) issue of the boot led being turned off 
while loading
the kernel.


Regards,
Gordon Bos


On 07/02/2015 19:40, Andrew Lunn wrote:
> On Sat, Feb 07, 2015 at 07:22:13PM +0100, Gordon Bos wrote:
>> Hi Andrew,
>>
>> I may be mistaken here, but this here references the driver that is
>> to be used, or not?
>>
>> |            compatible = "st,m25p16";
>
> Nope, that is the device, not the driver.
>
> The driver has a list of devices it is capable of driving. The kernel
> uses that list to find the right driver.
>
>> In the kernels I tried, m25p80 driver is simply not happy with
>> m25p16 being defined in DT.
> Please define "not happy". Please show me the kernel log of it being
> not happy.
>
> We need to compare and contrast my kernel log, where it is happy with
> "st,m25p16" against your kernel log where it is unhappy. Then we might
> have some clues to understand what is going on.
>
> Thanks
> 	Andrew


--------------060400040601080803090708
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div class=3D"moz-cite-prefix">Hi Andrew,<br>
      <br>
      There is a difference, and apparently it somewhere got solved:<br>
      <br>
      From running kernel 3.17.1<br>
      <blockquote>=A0~ # dmesg | grep spi<br>
      </blockquote>
      Running an upgraded kernel 3.18.5 with the same DT blob<br>
      <blockquote>=A0~ # dmesg | grep spi<br>
        [=A0=A0=A0 0.928832] m25p80 spi0.0: found m25p16, expected m25p80=
<br>
        [=A0=A0=A0 0.934124] m25p80 spi0.0: m25p16 (2048 Kbytes)<br>
        [=A0=A0=A0 0.938666] 3 ofpart partitions found on MTD device spi0=
.0<br>
        [=A0=A0=A0 0.944124] Creating 3 MTD partitions on "spi0.0":<br>
      </blockquote>
      <br>
      In 3.17.1 the MTD devices were missing without the patch, in
      3.18.5 they also show<br>
      up without the patch.<br>
      <br>
      You may therefore consider the MTD issue as solved.<br>
      <br>
      Which leaves just the (aesthetic) issue of the boot led being
      turned off while loading<br>
      the kernel.<br>
      <br>
      <br>
      Regards,<br>
      Gordon Bos<br>
      <br>
      <br>
      On 07/02/2015 19:40, Andrew Lunn wrote:<br>
    </div>
    <blockquote cite=3D"mid:20150207184024.GB22306@lunn.ch" type=3D"cite"=
>
      <pre wrap=3D"">On Sat, Feb 07, 2015 at 07:22:13PM +0100, Gordon Bos=
 wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Hi Andrew,

I may be mistaken here, but this here references the driver that is
to be used, or not?

|            compatible =3D "st,m25p16";
</pre>
      </blockquote>
      <pre wrap=3D"">

Nope, that is the device, not the driver.

The driver has a list of devices it is capable of driving. The kernel
uses that list to find the right driver.

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">In the kernels I tried, m25p80 driver is simply no=
t happy with
m25p16 being defined in DT.
</pre>
      </blockquote>
      <pre wrap=3D"">
Please define "not happy". Please show me the kernel log of it being
not happy.

We need to compare and contrast my kernel log, where it is happy with
"st,m25p16" against your kernel log where it is unhappy. Then we might
have some clues to understand what is going on.

Thanks
	Andrew
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060400040601080803090708--
