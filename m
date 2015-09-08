From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH linux-next v9 0/3] mfd: flexcom: add a driver for Flexcom
Date: Tue, 8 Sep 2015 17:26:59 +0100
Message-ID: <20150908162659.GA3260@x1>
References: <cover.1441118159.git.cyrille.pitchen@atmel.com>
 <55EF070C.7020600@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55EF070C.7020600@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 08 Sep 2015, Cyrille Pitchen wrote:

> Hi all,
>=20
> Le 01/09/2015 16:46, Cyrille Pitchen a =C3=A9crit :
> > ChangeLog
> >=20
> > v9:
> > - go back to v5 (use the new "atmel,flexcom-mode" DT property).
> > - fix the name of the spi node in the DT example: from spi@f8034400=
 to
> >   spi@400
> > - align the fields of the struct platform_driver atmel_flexcom_driv=
er as
> >   suggested by Lee Jones.
> >=20
> [...]
>=20
> Are there any remaining blocking points for this series ?

Yes.  The merge window is open, so it's Maintainer sleepy time [0].

Will get back to reviewing next week probably.

[0] AKA: Breath out and catch up with real-work for a bit.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
