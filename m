From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Wed, 5 Jun 2019 16:13:03 +0100
Message-ID: <d897559e-fcc7-6733-e117-e81ef3739ab1@arm.com>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
 <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
 <DB09EE2A-7397-4063-B925-66658D0105A5@alien8.de>
 <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
 <20190531051400.GA2275@cz.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531051400.GA2275@cz.tnic>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>, "Herrenschmidt, Benjamin" <benh@amazon.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Hawa, Hanna" <hhhawa@amazon.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Hanoch, Uri" <hanochu@amazon.com>
List-Id: devicetree@vger.kernel.org

Hi guys,

On 31/05/2019 06:14, Borislav Petkov wrote:
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

Yes I should get on with that. Its mostly for platforms which end up with multiple
piecemeal drivers and some co-ordination is needed. It doesn't look like that will be a
problem here.


>> That said ...
>>
>> You really want a single EDAC driver that contains all the stuff for
>> the caches, the memory controller, etc... ?

This has to be platform specific as it has integration-time dependencies and firmware
dependencies. Doing it as a platform driver matched from the machine-compatible may be
more straightforward today.

The DT will already say "compatible = arm,cortex-a57" for the Alpine-v2, what that
'edac_l1_l2' node is telling us is the integration/firmware stuff has been done, and the
imp-def instructions can be used.


Thanks,

James
