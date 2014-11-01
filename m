From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v4] iio: iadc: Qualcomm SPMI PMIC current ADC driver
Date: Sat, 01 Nov 2014 18:39:05 +0200
Message-ID: <1414859945.2207.1.camel@mm-sol.com>
References: <1413987213-22218-1-git-send-email-iivanov@mm-sol.com>
	 <5453ED55.2000003@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <5453ED55.2000003@gmx.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Hartmut Knaack <knaack.h@gmx.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Fri, 2014-10-31 at 21:13 +0100, Hartmut Knaack wrote:
> Ivan T. Ivanov schrieb am 22.10.2014 16:13:
> > The current ADC is peripheral of Qualcomm SPMI PMIC chips. It has
> > 16 bits resolution and register space inside PMIC accessible across
> > SPMI bus.
> > 
> > The driver registers itself through IIO interface.
> Pretty much there, just one question I would like to double-check: 
> The CPU of these chips is Little Endian, right?

Yes, it is Little Endian.

> Annoyingly, you introduced a small typo in this revision, 

No it is not a typo. Calculation is really in nano Ohms.

Regards,
Ivan
