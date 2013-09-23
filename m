From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 4/4] Documentation: add LP3943 DT bindings and document
Date: Mon, 23 Sep 2013 08:58:10 +0100
Message-ID: <20130923075810.GC2185@lee--X1>
References: <1378949700-6384-1-git-send-email-milo.kim@ti.com>
 <20130912152455.GN11227@lee--X1>
 <523F0040.6050900@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <523F0040.6050900@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> >>+++ b/Documentation/lp3943.txt
> >>@@ -0,0 +1,62 @@
> >>+TI/National Semiconductor LP3943 MFD driver
> >>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

<snip>

> >Why do you need to document your driver in this way?
> >
> >If this stuff is really important (and most of it really isn't), the=
n
> >put it either in the commit log or in the driver.
>=20
> Unnecessary documentation makes it noisy, but I think the LP3943
> still needs the driver documentation for better understanding.
>=20
> Many people think LP3943 is just LED driver, but I really want to
> share the application usages - PWM generators and GPIO expanders.
> If the driver just supports LED functionality, then it would be
> created as LED class driver. However, this patch-set enables more
> generic driver usages.
> So, this documentation would be helpful.
>=20
> And I want to keep the code and the documentation separate.
> If the link address is changed, then only documentation file will be
> modified, not source file.
>=20
> So, I'd like to create the fifth patch-set with new MFD
> documentation subdirectory.
> Additionally, LP3943 platform data example code will be added in the
> 'Documentation/mfd/lp3943.txt'. It's for a platform which doesn't
> support the device tree.

So, I'd actually like to get Sam's opinion on this.

NB: The documentation looks pretty rough at the moment. If we decide
to accept the concept, it will have to be adapted quite a bit before
full acceptance of the document will be granted.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
