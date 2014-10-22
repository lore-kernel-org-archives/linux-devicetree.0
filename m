From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v3] iio: iadc: Qualcomm SPMI PMIC current ADC driver
Date: Wed, 22 Oct 2014 13:00:56 +0300
Message-ID: <1413972056.4214.0.camel@mm-sol.com>
References: <1412180088-24683-1-git-send-email-iivanov@mm-sol.com>
	 <544416EF.8080603@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <544416EF.8080603@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Hartmut Knaack <knaack.h@gmx.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Cameron <jic23@kernel.org>, Grant Likely <grant.likely@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Fugang Duan <B38611@freescale.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Sun, 2014-10-19 at 21:54 +0200, Hartmut Knaack wrote:
> Ivan T. Ivanov schrieb am 01.10.2014 18:14:
> >  The current ADC is peripheral of Qualcomm SPMI PMIC chips. It has
> >  16 bits resolution and register space inside PMIC accessible 
> > across
> >  SPMI bus.
> > 
> >  The driver registers itself through IIO interface.
> > 
> Hi, I spotted some issues, see inline.

Thank you. All of them look reasonable. Will fix them and resend.

Regards,
Ivan
