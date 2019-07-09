From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 2/4] edac: Add support for Amazon's Annapurna Labs L1
 EDAC
Date: Tue, 09 Jul 2019 10:59:31 -0700
Message-ID: <ff4ce6a96a922cff2dd929560b9167207b4899e9.camel@perches.com>
References: <1562500658-14717-1-git-send-email-hhhawa@amazon.com>
         <1562500658-14717-3-git-send-email-hhhawa@amazon.com>
         <20190709173229.0000135f@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709173229.0000135f@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Hanna Hawa <hhhawa@amazon.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-07-09 at 17:32 +0800, Jonathan Cameron wrote:
> On Sun, 7 Jul 2019 14:57:36 +0300
[]
> > +#define ARM_CA57_CPUMERRSR_REPEAT		GENMASK(39, 32)
> > +#define ARM_CA57_CPUMERRSR_OTHER		GENMASK(47, 40)
> > +#define ARM_CA57_CPUMERRSR_FATAL		GENMASK(63, 63)

GENMASK_ULL
