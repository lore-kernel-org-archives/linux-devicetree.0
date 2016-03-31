From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC 3/8] mfd: altr_a10sr: Add Altera Arria10 DevKit System
 Resource Chip
Date: Thu, 31 Mar 2016 10:10:01 +0100
Message-ID: <20160331091001.GN3323@x1>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-4-git-send-email-tthayer@opensource.altera.com>
 <20160330115106.GJ3323@x1>
 <56FBE829.2000607@opensource.altera.com>
 <20160330145239.GM3323@x1>
 <20160330161048.GB2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160330161048.GB2350@sirena.org.uk>
Sender: linux-hwmon-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Thor Thayer <tthayer@opensource.altera.com>, linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawell.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 30 Mar 2016, Mark Brown wrote:
> On Wed, Mar 30, 2016 at 03:52:39PM +0100, Lee Jones wrote:
> > On Wed, 30 Mar 2016, Thor Thayer wrote:
>=20
> > > The read register has a different address than the write register
> > > which is handled in this function with the masks (read address is
> > > odd, write address is even).
>=20
> > Mark, do we have an API which handled such a configuration?
>=20
> No, but it sounds like this is a regmap with seven bit register value=
s
> and a read/write bit which should be using read_flag_mask rather than
> trying to treat these as separate registers.

Nice one.  Thanks Mark.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
