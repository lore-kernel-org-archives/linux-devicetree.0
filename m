Return-Path: <gordon@bosvangennip.nl>
Message-ID: <54D657D5.3010709@bosvangennip.nl>
Date: Sat, 07 Feb 2015 19:22:13 +0100
From: Gordon Bos <gordon@bosvangennip.nl>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] arm: Fix unavailable MTD userland devices on Excito
 B3 boards
References: <1423212311-10793-1-git-send-email-gordon@bosvangennip.nl> <54D484D8.8090801@free-electrons.com> <54D6299B.70707@bosvangennip.nl> <20150207160945.GA22306@lunn.ch> <54D64820.7020002@bosvangennip.nl> <20150207173642.GI25985@lunn.ch>
In-Reply-To: <20150207173642.GI25985@lunn.ch>
Content-Type: multipart/alternative;
 boundary="------------030507020809070200040009"
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030507020809070200040009
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

I may be mistaken here, but this here references the driver that is to 
be used, or not?

|            compatible = "st,m25p16";

|For me that does not work with CONFIG_MTD_M25P80. As far as I can see 
there is also no
reference whatsoever to the kernel selectable m25p80 in the current DT 
for kirkwood-b3,
so I'm not sure why you'd find this consistent with it.

In the kernels I tried, m25p80 driver is simply not happy with m25p16 
being defined in DT.

Regards,
Gordon Bos

On 07/02/2015 18:36, Andrew Lunn wrote:
> On Sat, Feb 07, 2015 at 06:15:12PM +0100, Gordon Bos wrote:
>> Hi Andrew,
>>
>> Unsure how it can work for you, but this is the corresponding entry
>> from the Excito release:
>>
>> ---
>> |/*****************************************************************************
>>   * 2048KB SPI Flash on Boot Device (Numonyx MP25P16)
>>   ****************************************************************************/
>>
>> static struct mtd_partition bubba3_flash_parts[] = {
>>   {
>>   .name = "u-boot",
>>   .size = SZ_512K+SZ_256K,
>>   .offset = 0,
>>   },
>>   {
>>   .name = "env",
>>   .size = SZ_128K,
>>   .offset = MTDPART_OFS_NXTBLK,
>>   },
>>   {
>>   .name = "data",
>>   .size = MTDPART_SIZ_FULL,
>>   .offset = MTDPART_OFS_NXTBLK,
>>   },
>> };
>>
>> static const struct flash_platform_data bubba3_flash = {
>>   .type = "m25p16",
> So the device is a m25p16.
>
>>   .name = "spi_flash",
>>   .parts = bubba3_flash_parts,
>>   .nr_parts = ARRAY_SIZE(bubba3_flash_parts),
>> };
>>
>> static struct spi_board_info __initdata bubba3_spi_slave_info[] = {
>>   {
>>   .modalias = "m25p80",
> And the driver is m25p80.
>
> This is consistent with the current device tree description.
>
> So what actually happens when you use the mainline DT on your device?
>
> I'm not going to accept any changes until we understand what problems
> you have and why it works for me.
>
> Thanks
>      Andrew
>
>
>


--------------030507020809070200040009
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
      I may be mistaken here, but this here references the driver that
      is to be used, or not?<br>
      <br>
      <code>=A0 =A0=A0 =A0=A0 =A0=A0=A0 compatible =3D "st,m25p16";<br>
        <br>
      </code>For me that does not work with CONFIG_MTD_M25P80. As far as
      I can see there is also no<br>
      reference whatsoever to the kernel selectable m25p80 in the
      current DT for kirkwood-b3,<br>
      so I'm not sure why you'd find this consistent with it.<br>
      <br>
      In the kernels I tried, m25p80 driver is simply not happy with
      m25p16 being defined in DT.<br>
      <br>
      Regards,<br>
      Gordon Bos<br>
      <br>
      On 07/02/2015 18:36, Andrew Lunn wrote:<br>
    </div>
    <blockquote cite=3D"mid:20150207173642.GI25985@lunn.ch" type=3D"cite"=
>
      <pre wrap=3D"">On Sat, Feb 07, 2015 at 06:15:12PM +0100, Gordon Bos=
 wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Hi Andrew,

Unsure how it can work for you, but this is the corresponding entry
from the Excito release:

---
|/***********************************************************************=
******
 * 2048KB SPI Flash on Boot Device (Numonyx MP25P16)
 ************************************************************************=
****/

static struct mtd_partition bubba3_flash_parts[] =3D {
 {
 .name =3D "u-boot",
 .size =3D SZ_512K+SZ_256K,
 .offset =3D 0,
 },
 {
 .name =3D "env",
 .size =3D SZ_128K,
 .offset =3D MTDPART_OFS_NXTBLK,
 },
 {
 .name =3D "data",
 .size =3D MTDPART_SIZ_FULL,
 .offset =3D MTDPART_OFS_NXTBLK,
 },
};

static const struct flash_platform_data bubba3_flash =3D {
 .type =3D "m25p16",
</pre>
      </blockquote>
      <pre wrap=3D"">
So the device is a m25p16.=20

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D""> .name =3D "spi_flash",
 .parts =3D bubba3_flash_parts,
 .nr_parts =3D ARRAY_SIZE(bubba3_flash_parts),
};

static struct spi_board_info __initdata bubba3_spi_slave_info[] =3D {
 {
 .modalias =3D "m25p80",
</pre>
      </blockquote>
      <pre wrap=3D"">
And the driver is m25p80.

This is consistent with the current device tree description.=20

So what actually happens when you use the mainline DT on your device?

I'm not going to accept any changes until we understand what problems
you have and why it works for me.

Thanks
    Andrew



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030507020809070200040009--
