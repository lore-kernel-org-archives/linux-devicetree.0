From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC 3/8] mfd: altr_a10sr: Add Altera Arria10 DevKit System
 Resource Chip
Date: Wed, 30 Mar 2016 15:52:39 +0100
Message-ID: <20160330145239.GM3323@x1>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-4-git-send-email-tthayer@opensource.altera.com>
 <20160330115106.GJ3323@x1>
 <56FBE829.2000607@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FBE829.2000607@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>, broonie@kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawell.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Mr Brown,

On Wed, 30 Mar 2016, Thor Thayer wrote:
> On 03/30/2016 06:51 AM, Lee Jones wrote:
> >On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:
> >
> >>From: Thor Thayer <tthayer@opensource.altera.com>
> >>
> >>Add support for the Altera Arria10 Development Kit System Resource
> >>chip which is implemented using a MAX5 as a external gpio extender,
> >>and hardware monitor with the regmap framework over a SPI bus.
> >>
> >>Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> >>---
>=20
> [...]
>=20
> >>index 0000000..13665d4
> >>--- /dev/null
> >>+++ b/drivers/mfd/altera-a10sr.c
> >>@@ -0,0 +1,177 @@
> >>+/*
> >>+ * Copyright Altera Corporation (C) 2014-2016. All Rights Reserved
> >>+ *
> >>+ * This program is free software; you can redistribute it and/or m=
odify it
> >>+ * under the terms and conditions of the GNU General Public Licens=
e,
> >>+ * version 2, as published by the Free Software Foundation.
> >>+ *
> >>+ * This program is distributed in the hope it will be useful, but =
WITHOUT
> >>+ * ANY WARRANTY; without even the implied warranty of MERCHANTABIL=
ITY or
> >>+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public L=
icense for
> >>+ * more details.
> >>+ *
> >>+ * You should have received a copy of the GNU General Public Licen=
se along with
> >>+ * this program.  If not, see <http://www.gnu.org/licenses/>.
> >
> >Any chance you can use the shorter copyright header?
> >
>=20
> This is the header that Altera has specified and that we're
> operating under. We haven't received guidance on Intel's header yet
> but it may change as a result of our acquisition by Intel.

=46air enough.

> >>+
> >>+	/*
> >>+	 * We can't use the standard regmap_update_bits function because
> >>+	 * the read register has a different address than the write regis=
ter.
> >>+	 * Therefore, just do a read, modify, write operation here.
> >>+	 */
> >>+	ret =3D regmap_read(a10sr->regmap, (reg | READ_REG_MASK), &rval);
> >>+	if (ret < 0)
> >>+		return ret;
> >>+
> >>+	rval =3D ((rval & ~bit_mask) | (reg_val & bit_mask));
> >>+
> >>+	ret =3D regmap_write(a10sr->regmap, (reg & WRITE_REG_MASK), rval)=
;
> >>+
> >>+	return ret;
> >>+}
> >
> >Why can't you use the Regmap update function(s)?
>=20
> The read register has a different address than the write register
> which is handled in this function with the masks (read address is
> odd, write address is even).

Mark, do we have an API which handled such a configuration?

> Thank you for the review of my patch set. I will implement the
> changes that you pointed out. Thank you for reviewing!

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
