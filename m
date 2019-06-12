From: "Hawa, Hanna" <hhhawa@amazon.com>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Wed, 12 Jun 2019 15:35:31 +0300
Message-ID: <6911a79a-bcd7-03e1-1c90-2adb88aaa1db@amazon.com>
References: <1ae5e7a3464f9d8e16b112cd371957ea20472864.camel@kernel.crashing.org>
 <68446361fd1e742b284555b96b638fe6b5218b8b.camel@kernel.crashing.org>
 <20190611115651.GD31772@zn.tnic>
 <6df5a17bb1c900dc69b991171e55632f40d9426f.camel@kernel.crashing.org>
 <20190612034813.GA32652@zn.tnic>
 <08bd58dc0045670223f8d3bbc8be774505bd3ddf.camel@kernel.crashing.org>
 <20190612074242.53a4cf56@coco.lan> <20190612110039.GH32652@zn.tnic>
 <20190612084213.4fb9e054@coco.lan>
 <7705227ea831793cc9e45af32e0da8f5547cb14d.camel@kernel.crashing.org>
 <20190612122504.GI32652@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612122504.GI32652@zn.tnic>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Hanoch, Uri" <hanochu@amazon.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,

> 
> Yap, I think we're in agreement here. I believe the important question
> is whether you need to get error information from multiple sources
> together in order to do proper recovery or doing it per error source
> suffices.
> 
> And I think the actual use cases could/should dictate our
> drivers/orchestrators design.
> 
> Thus my question how you guys are planning on tying all that error info
> the drivers report, into the whole system design?
We have daemon script that collects correctable/uncorrectable errors 
from EDAC sysfs and reports to Amazon service that allow us to take 
action on specific error thresholds.

Thanks,
Hanna
> 
