From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Subject: Re: [PATCH] SPI: at25: Parse dt settings
Date: Thu, 21 Jun 2012 08:55:43 -0300
Message-ID: <CAAAP30F1gWgvPwO2VT8fcP7X8veJuMfFjg34LkRaz-q7mwGfWg@mail.gmail.com>
References: <1339678763-14509-1-git-send-email-aletes.xgr@gmail.com>
	<CAMSQXEHOtgk7wRRqOdpMaTvpxFd1Cpom=BG65GheY6Z4p2Jc3A@mail.gmail.com>
	<CAAAP30G6zE5UmVMPPDGpwzHXG5zN3ZZfJ9u4W2TM1B5ccF50Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAAAP30G6zE5UmVMPPDGpwzHXG5zN3ZZfJ9u4W2TM1B5ccF50Lw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ivo Sieben <meltedpianoman@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <w.sang@pengutronix.de>, Chris Wright <chrisw@sous-sol.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Roland Stigge <stigge@antcom.de>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 21, 2012 at 8:10 AM, Alexandre Pereira da Silva
<aletes.xgr@gmail.com> wrote:
> On Thu, Jun 21, 2012 at 6:49 AM, Ivo Sieben <meltedpianoman@gmail.com=
> wrote:
>> One small remark:
>> In case of platform_data, the "if (!chip)" check has been removed an=
d
>> is now only handled in the device tree initialization.
>> Maybe add this check to the platform initialization as well:
>>
>> } else {
>> =A0 =A0 =A0 =A0if (!spi->dev.platform_data) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_dbg(&spi->dev, "no chip descripti=
on\n");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D -ENODEV;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail;
>> =A0 =A0 =A0 =A0}
>> =A0 =A0 =A0 =A0chip =3D =A0*(struct spi_eeprom *)spi->dev.platform_d=
ata;
>> }

Please ignore my last email. Not enough coffee.

I'm sorry. The code looks right to me.

-       chip =3D spi->dev.platform_data;
-       if (!chip) {
-               dev_dbg(&spi->dev, "no chip description\n");
-               err =3D -ENODEV;
-               goto fail;
-       }
+       if (!spi->dev.platform_data) {
+               if (np) {
                             /* No platform data and DT node present,
DT handling */
+               } else {
                            /* No DT and No platform description,
handle error */
+                       dev_dbg(&spi->dev, "no chip description\n");
+                       err =3D -ENODEV;
+                       goto fail;
+               }
+       } else
                 /* At this point chip is guaranteed to have valid data=
 */
+               chip =3D *(struct spi_eeprom *)spi->dev.platform_data;
