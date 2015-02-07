Return-Path: <gordon@bosvangennip.nl>
Message-ID: <54D64820.7020002@bosvangennip.nl>
Date: Sat, 07 Feb 2015 18:15:12 +0100
From: Gordon Bos <gordon@bosvangennip.nl>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] arm: Fix unavailable MTD userland devices on Excito
 B3 boards
References: <1423212311-10793-1-git-send-email-gordon@bosvangennip.nl> <54D484D8.8090801@free-electrons.com> <54D6299B.70707@bosvangennip.nl> <20150207160945.GA22306@lunn.ch>
In-Reply-To: <20150207160945.GA22306@lunn.ch>
Content-Type: multipart/alternative;
 boundary="------------050407080502030602030205"
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------050407080502030602030205
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

Unsure how it can work for you, but this is the corresponding entry from 
the Excito release:

---
|/*****************************************************************************
  * 2048KB SPI Flash on Boot Device (Numonyx MP25P16)
  ****************************************************************************/

static struct mtd_partition bubba3_flash_parts[] = {
  {
  .name = "u-boot",
  .size = SZ_512K+SZ_256K,
  .offset = 0,
  },
  {
  .name = "env",
  .size = SZ_128K,
  .offset = MTDPART_OFS_NXTBLK,
  },
  {
  .name = "data",
  .size = MTDPART_SIZ_FULL,
  .offset = MTDPART_OFS_NXTBLK,
  },
};

static const struct flash_platform_data bubba3_flash = {
  .type = "m25p16",
  .name = "spi_flash",
  .parts = bubba3_flash_parts,
  .nr_parts = ARRAY_SIZE(bubba3_flash_parts),
};

static struct spi_board_info __initdata bubba3_spi_slave_info[] = {
  {
  .modalias = "m25p80",
  .platform_data = &bubba3_flash,
  .irq = -1,
  .max_speed_hz = 40000000,
  .bus_num = 0,
  .chip_select = 0,
  },
};
---

I originally started out with a kernel build by user 'sakaki-' on git
(project gentoo-on-b3) and found that it had no access to MTD. The
readme on this project also states that the front led on the B3 will
go off for some 40 seconds or so and then go back on, which is achieved
by an openrc script after sysfs is mounted.

The behaviour we're seeing therefore seems to contradict what you must
be seeing, since you explicitly turn the green led off which would
indicate that the leds default to 'on' position in your case while on
multiple B3's we've now confirmed that the default is in fact off and
blue and red should be explicitly turned on.

As for MTD access I found that sakaki's original kernel did not have
CONFIG_MTD_M25P80 enabled but this did not fix access to MTD (see
discussion at http://forum.mybubba.org/viewtopic.php?f=7&t=5680&start=16
). Only after I changed the driver 'compatible' reference to match
m25p80 I got access to MTD (with that very same kernel).

As you may know, being a B3 owner, performing a shutdown requires
writing a 'magic' DWORD value to a specific location in mtd2 and mtd1
holds a key that is required for a dyndns service that is exclusive for
Excito B3 owners.

The submitted MTD patch has been confirmed to fix the issue on four
different B3's now, running gentoo patched kernels version 3.17.1, 3.18.3
and 3.18.5.


Regards,
Gordon Bos


|On 07/02/2015 17:09, Andrew Lunn wrote:
> On Sat, Feb 07, 2015 at 04:04:59PM +0100, Gordon Bos wrote:
>> Hi,
>>
>> I've had some further discussion on this with another B3 owner.
>> According to an old patch that Excito corporation built for kernel
>> version 2.6 the flash memory is in fact a ||Numonyx MP25P16
>> The driver however must be m25p80.
> Hi Gordon
>
> I need to reboot my B3 in order to see what it says. However, with the
> current DT i do have access to the MTD devices.
>
> What problems are you actually having?
>
> Thanks
>
> 	Andrew


--------------050407080502030602030205
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
      Unsure how it can work for you, but this is the corresponding
      entry from the Excito release:<br>
      <br>
      ---<br>
      <code>/************************************************************=
*****************<br>
        =A0* 2048KB SPI Flash on Boot Device (Numonyx MP25P16)<br>
=A0**********************************************************************=
******/<br>
        <br>
        static struct mtd_partition bubba3_flash_parts[] =3D {<br>
        =A0{<br>
        =A0.name =3D "u-boot",<br>
        =A0.size =3D SZ_512K+SZ_256K,<br>
        =A0.offset =3D 0,<br>
        =A0},<br>
        =A0{<br>
        =A0.name =3D "env",<br>
        =A0.size =3D SZ_128K,<br>
        =A0.offset =3D MTDPART_OFS_NXTBLK,<br>
        =A0},<br>
        =A0{<br>
        =A0.name =3D "data",<br>
        =A0.size =3D MTDPART_SIZ_FULL,<br>
        =A0.offset =3D MTDPART_OFS_NXTBLK,<br>
        =A0},<br>
        };<br>
        <br>
        static const struct flash_platform_data bubba3_flash =3D {<br>
        =A0.type =3D "m25p16",<br>
        =A0.name =3D "spi_flash",<br>
        =A0.parts =3D bubba3_flash_parts,<br>
        =A0.nr_parts =3D ARRAY_SIZE(bubba3_flash_parts),<br>
        };<br>
        <br>
        static struct spi_board_info __initdata bubba3_spi_slave_info[]
        =3D {<br>
        =A0{<br>
        =A0.modalias =3D "m25p80",<br>
        =A0.platform_data =3D &amp;bubba3_flash,<br>
        =A0.irq =3D -1,<br>
        =A0.max_speed_hz =3D 40000000,<br>
        =A0.bus_num =3D 0,<br>
        =A0.chip_select =3D 0,<br>
        =A0},<br>
        };<br>
        ---<br>
        <br>
        I originally started out with a kernel build by user 'sakaki-'
        on git<br>
        (project gentoo-on-b3) and found that it had no access to MTD.
        The<br>
        readme on this project also states that the front led on the B3
        will<br>
        go off for some 40 seconds or so and then go back on, which is
        achieved<br>
        by an openrc script after sysfs is mounted.<br>
        <br>
        The behaviour we're seeing therefore seems to contradict what
        you must<br>
        be seeing, since you explicitly turn the green led off which
        would<br>
        indicate that the leds default to 'on' position in your case
        while on<br>
        multiple B3's we've now confirmed that the default is in fact
        off and<br>
        blue and red should be explicitly turned on.<br>
        <br>
        As for MTD access I found that sakaki's original kernel did not
        have<br>
        CONFIG_MTD_M25P80 enabled but this did not fix access to MTD
        (see <br>
        discussion at
        <a class=3D"moz-txt-link-freetext" href=3D"http://forum.mybubba.o=
rg/viewtopic.php?f=3D7&amp;t=3D5680&amp;start=3D16">http://forum.mybubba.=
org/viewtopic.php?f=3D7&amp;t=3D5680&amp;start=3D16</a><br>
        ). Only after I changed the driver 'compatible' reference to
        match <br>
        m25p80 I got access to MTD (with that very same kernel).<br>
        <br>
        As you may know, being a B3 owner, performing a shutdown
        requires<br>
        writing a 'magic' DWORD value to a specific location in mtd2 and
        mtd1<br>
        holds a key that is required for a dyndns service that is
        exclusive for<br>
        Excito B3 owners.<br>
        <br>
        The submitted MTD patch has been confirmed to fix the issue on
        four<br>
        different B3's now, running gentoo patched kernels version
        3.17.1, 3.18.3<br>
        and 3.18.5.<br>
        <br>
        <br>
        Regards,<br>
        Gordon Bos<br>
        <br>
        <br>
      </code>On 07/02/2015 17:09, Andrew Lunn wrote:<br>
    </div>
    <blockquote cite=3D"mid:20150207160945.GA22306@lunn.ch" type=3D"cite"=
>
      <pre wrap=3D"">On Sat, Feb 07, 2015 at 04:04:59PM +0100, Gordon Bos=
 wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Hi,

I've had some further discussion on this with another B3 owner.
According to an old patch that Excito corporation built for kernel
version 2.6 the flash memory is in fact a ||Numonyx MP25P16
The driver however must be m25p80.
</pre>
      </blockquote>
      <pre wrap=3D"">
Hi Gordon

I need to reboot my B3 in order to see what it says. However, with the
current DT i do have access to the MTD devices.

What problems are you actually having?

Thanks

	Andrew
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------050407080502030602030205--
