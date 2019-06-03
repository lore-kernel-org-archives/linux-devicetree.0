From: "Hawa, Hanna" <hhhawa@amazon.com>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Mon, 3 Jun 2019 09:56:44 +0300
Message-ID: <c608e269-e409-cd2b-d421-f185a706bbc5@amazon.com>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
 <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
 <DB09EE2A-7397-4063-B925-66658D0105A5@alien8.de>
 <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Herrenschmidt, Benjamin" <benh@amazon.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "james.morse@arm.com" <james.morse@arm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "bp@alien8.de" <bp@alien8.de>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Hanoch, Uri" <hanochu@amazon.com>
List-Id: devicetree@vger.kernel.org



On 5/31/2019 4:15 AM, Herrenschmidt, Benjamin wrote:
> On Thu, 2019-05-30 at 11:19 -0700, Boris Petkov wrote:
>> On May 30, 2019 3:15:29 AM PDT, Hanna Hawa <hhhawa@amazon.com> wrote:
>>> Add support for error detection and correction for Amazon's
>>> Annapurna
>>> Labs SoCs for L1/L2 caches.
>>
>>
>> So this should be a driver for the whole annapurna platform and not
>> only about the RAS functionality in an IP like the caches. See other
>> ARM EDAC drivers in drivers/edac/ for an example.
> 
> This isn't terribly helpful, there's nothing telling anybody which of
> those files corresponds to an ARM SoC :-)
> 
> That said ...
> 
> You really want a single EDAC driver that contains all the stuff for
> the caches, the memory controller, etc... ?
> 
> The idea here was to separate the core L1/L2 EDAC from the memory
> controller EDAC I think ... Roben, Hanna, can you describe the long run
> strategy here ?
Correct our target to separate the L1/L2 EDAC from mc, and to maintain 
both in separate drivers.

Thanks,
Hanna
> 
> Cheers,
> Ben.
> 
