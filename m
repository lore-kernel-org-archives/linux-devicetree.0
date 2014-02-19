From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 01/10] mfd: Add TI LMU driver
Date: Wed, 19 Feb 2014 08:13:50 +0000
Message-ID: <20140219081350.GA10504@lee--X1>
References: <1392359450-6890-1-git-send-email-milo.kim@ti.com>
 <20140217095734.GD17875@lee--X1>
 <53030F9C.8000605@ti.com>
 <20140218082127.GD20218@lee--X1>
 <5303F3B5.6050806@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5303F3B5.6050806@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Bryan Wu <cooloney@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

> >>>>+	pdata->en_gpio =3D of_get_named_gpio(node, "ti,enable-gpio", 0)=
;
> >>>
> >>>There is a global DT property for this already.
> >>
> >>I've not found it yet, but I agree it looks like general property.
> >>So I'll replace "ti,enable-gpio" with "ti,lmu-en-gpio".
> >
> >Just re-use "gpio-enable". No need for it to be vendor specific.
> >
>=20
> Got it. Thanks!
>=20
> This GPIO is used for enabling the device. So, "enable-gpio" is more
> appropriate name, isn't it?

Yes, I wrote it the wrong way round (typo).

Just grep for both, you will see which one to use.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
