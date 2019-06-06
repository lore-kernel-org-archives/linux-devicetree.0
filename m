From: "Hawa, Hanna" <hhhawa@amazon.com>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Thu, 6 Jun 2019 10:53:42 +0300
Message-ID: <ce01a2bc-7973-5978-b033-a6bdc61b9d4b@amazon.com>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
 <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
 <DB09EE2A-7397-4063-B925-66658D0105A5@alien8.de>
 <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
 <20190531051400.GA2275@cz.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531051400.GA2275@cz.tnic>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>, "Herrenschmidt, Benjamin" <benh@amazon.com>, "james.morse@arm.com" <james.morse@arm.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Hanoch, Uri" <hanochu@amazon.com>
List-Id: devicetree@vger.kernel.org



On 5/31/2019 8:14 AM, Borislav Petkov wrote:
> On Fri, May 31, 2019 at 01:15:33AM +0000, Herrenschmidt, Benjamin wrote:
>> This isn't terribly helpful, there's nothing telling anybody which of
>> those files corresponds to an ARM SoC :-)
> 
> drivers/edac/altera_edac.c is one example.
> 
> Also, James and I have a small writeup on how an arm driver should look
> like, we just need to polish it up and post it.
> 
> James?
> 
>> That said ...
>>
>> You really want a single EDAC driver that contains all the stuff for
>> the caches, the memory controller, etc... ?
> 
> Yap.

Disagree. The various drivers don't depend on each other.
I think we should keep the drivers separated as they are distinct and 
independent IP blocks.

> 
