From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 4/4] edac: Add support for Amazon's Annapurna Labs L2
 EDAC
Date: Tue, 3 Sep 2019 10:58:16 +0200
Message-ID: <20190903085816.GA11641@zn.tnic>
References: <1563197049-12679-1-git-send-email-hhhawa@amazon.com>
 <1563197049-12679-5-git-send-email-hhhawa@amazon.com>
 <20190903072655.kz5x7n3477dg4yap@rric.localdomain>
 <2bce020a-bf7e-1d54-48c3-0aa6d23c84d8@amazon.com>
 <20190903084614.mthff6hzbchkw7t2@rric.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190903084614.mthff6hzbchkw7t2@rric.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Richter <rrichter@marvell.com>
Cc: "Hawa, Hanna" <hhhawa@amazon.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "davem@davemloft.net" <davem@davemloft.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "benh@amazon.com" <benh@amazon.com>, "ronenk@amazon.com" <ronenk@amazon.com>, "talel@amazon.com" <talel@amazon.com>, "jonnyc@amazon.com" <jonnyc@amazon.com>, "hanochu@amazon.com" <hano>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 03, 2019 at 08:46:24AM +0000, Robert Richter wrote:
> This is good, but recent practice is also to have all the drivers for
> the same piece of hardware in a single file, see e.g. thunderx_edac.c.
> I don't know how detailed this was discussed already, but I would
> prefer to join the code.

This is no longer needed anymore. Check out this thread:

https://lkml.kernel.org/r/1559211329-13098-3-git-send-email-hhhawa@amazon.com

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
