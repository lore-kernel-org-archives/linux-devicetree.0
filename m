From: "Hawa, Hanna" <hhhawa@amazon.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: EDAC: Add Amazon's Annapurna Labs L1
 EDAC
Date: Mon, 26 Aug 2019 17:49:11 +0300
Message-ID: <1d23d7c5-cd7b-1512-5300-d43e82ba6dc1@amazon.com>
References: <20190805143911.12185-1-hhhawa@amazon.com>
 <20190805143911.12185-2-hhhawa@amazon.com> <20190821191704.GA32425@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821191704.GA32425@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, linus.walleij@linaro.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 8/21/2019 10:17 PM, Rob Herring wrote:
> Why is this even in DT? AFAICT, this is all just CortexA57 core features
> (i.e. nothing Amazon specific). The core type and the ECC capabilities
> are discoverable.

Added to the DT in order to easily enable/disable the driver. You are 
correct that they are CortexA57 core features and nothing Amazon 
specific, but it's IMPLEMENTATION DEFINED, meaning that in different 
cortex revisions (e.g. A57) the register bitmap may change. Because of 
that we added an Amazon compatible which corresponds to the specific 
core we are using.

Thanks,
Hanna

> 
> Rob
