From: "Hawa, Hanna" <hhhawa@amazon.com>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Tue, 11 Jun 2019 10:29:55 +0300
Message-ID: <07977a4a-0927-3427-e102-5a850b2f6dce@amazon.com>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
 <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
 <DB09EE2A-7397-4063-B925-66658D0105A5@alien8.de>
 <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
 <20190531051400.GA2275@cz.tnic>
 <ce01a2bc-7973-5978-b033-a6bdc61b9d4b@amazon.com>
 <32431fa2-2285-6c41-ce32-09630205bb54@arm.com>
 <9a2aaf4a9545ed30568a0613e64bc3f57f047799.camel@kernel.crashing.org>
 <20190608090556.GA32464@zn.tnic>
 <1ae5e7a3464f9d8e16b112cd371957ea20472864.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1ae5e7a3464f9d8e16b112cd371957ea20472864.camel@kernel.crashing.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@alien8.de>
Cc: James Morse <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Hanoch, Uri" <hanochu@amazon.com>
List-Id: devicetree@vger.kernel.org

Hi Ben, Boris

On 6/11/2019 8:50 AM, Benjamin Herrenschmidt wrote:
> 
> Anyway, let's get back to the specific case of our Amazon platform here
> since it's a concrete example.
> 
> Hanna, can you give us a reasonably exhaustive list of how many such
> "drivers" we'll want in the EDAC subsystem and whether you envision any
> coordination requirement between them or not ?
In the near future we plan to push EDAC drivers for L1/L2 and memory 
controller.
There's no common resources/shared data between them.

Thanks,
Hanna
> 
> Cheers,
> Ben.
> 
> 
> 
