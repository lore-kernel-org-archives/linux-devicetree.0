From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] Addition of Altera Arria10 System Resource Chip
Date: Wed, 30 Mar 2016 09:14:14 +0100
Message-ID: <20160330081414.GE3323@x1>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawell.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 29 Mar 2016, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:

You need to submit this properly, using `git send-email`, since it
will look after you by listing each patch, together with their author,
and provide a nice diff-stat, which is very helpful to reviewers.

> The Altera Arria10 Development Kit includes a system resource chip
> that fits under the Multi-Function Device framework. The chip has
> hardware monitoring functions and a GPIO expander over the SPI bus.
>=20
> [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource Chip
> [RFC 2/8] MAINTAINERS: Addition of Altera Arria10 System Resource
> [RFC 3/8] mfd: altr_a10sr: Add Altera Arria10 DevKit System Resource
> [RFC 4/8] gpio: altera-a10sr: Add A10 System Resource Chip GPIO
> [RFC 5/8] ARM: socfpga: dts: Add Devkit A10-SR fields for Arria10
> [RFC 6/8] ARM: socfpga: dts: Add LED framework to A10-SR GPIO
> [RFC 7/8] hwmon: Altera Arria10 System Resource Chip - HW Monitor
> [RFC 8/8] ARM: socfpga: dts: Add Devkit Arria10-SR HWMON

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
