From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/3] mfd: lubbock_io: add lubbock_io board
Date: Wed, 21 Jan 2015 08:16:45 +0000
Message-ID: <20150121081645.GC9258@x1>
References: <1421406010-14851-1-git-send-email-robert.jarzmik@free.fr>
 <1421406010-14851-2-git-send-email-robert.jarzmik@free.fr>
 <20150119091705.GG21886@x1>
 <87ppaah9k5.fsf@free.fr>
 <20150120102919.GP5767@x1>
 <20150120115658.GJ26493@n2100.arm.linux.org.uk>
 <873874fuei.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <873874fuei.fsf@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>
List-Id: devicetree@vger.kernel.org

On Wed, 21 Jan 2015, Robert Jarzmik wrote:
> > > > platform_get_irq()?
> > > No. I need the flags.
> > Where are they used?
> A couple of lines below, using local "irqflags" variable :
>        ret =3D devm_request_irq(&pdev->dev, cot->irq, lubbock_irq_han=
dler,
>                               irqflags, dev_name(&pdev->dev), cot);

No, I mean where are they _used_?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
