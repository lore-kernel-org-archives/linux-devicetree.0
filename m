From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [UNVERIFIED SENDER] Re: [PATCH v2 2/3] soc: amazon: al-pos:
 Introduce Amazon's Annapurna Labs POS driver
Date: Thu, 12 Sep 2019 09:50:03 +0300
Message-ID: <3205f7ae-5568-c064-23ac-ea726246173b@amazon.com>
References: <1568142310-17622-1-git-send-email-talel@amazon.com>
 <1568142310-17622-3-git-send-email-talel@amazon.com>
 <86d0g6syva.wl-maz@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86d0g6syva.wl-maz@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>
Cc: robh+dt@kernel.org, tglx@linutronix.de, jason@lakedaemon.net, mark.rutland@arm.com, nicolas.ferre@microchip.com, mchehab+samsung@kernel.org, shawn.lin@rock-chips.com, gregkh@linuxfoundation.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, James Morse <james.morse@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Marc,


On 9/11/2019 5:15 PM, Marc Zyngier wrote:
> [+James]
>
> Hi Talel,
>
> On Tue, 10 Sep 2019 20:05:09 +0100,
> Talel Shenhar <talel@amazon.com> wrote:
>
>> +	log1 = readl(pos->mmio_base + AL_POS_ERROR_LOG_1);
> Do you actually need the implied barriers? I'd expect that relaxed
> accesses should be enough.

You are correct. Barriers are not needed, In v1 this driver indeed used 
_relaxed versions.

Due to request coming from Arnd in v1 patch series I removed it. As this 
is not data path I had no strong objection for removing it.

>
>> +	if (!FIELD_GET(AL_POS_ERROR_LOG_1_VALID, log1))
>> +		return IRQ_NONE;
>> +
>> +	log0 = readl(pos->mmio_base + AL_POS_ERROR_LOG_0);
>> +	writel(0, pos->mmio_base + AL_POS_ERROR_LOG_1);
>> +
>> +	addr = FIELD_GET(AL_POS_ERROR_LOG_0_ADDR_LOW, log0);
>> +	addr |= (FIELD_GET(AL_POS_ERROR_LOG_1_ADDR_HIGH, log1) << 32);
>> +	request_id = FIELD_GET(AL_POS_ERROR_LOG_1_REQUEST_ID, log1);
>> +	bresp = FIELD_GET(AL_POS_ERROR_LOG_1_BRESP, log1);
>> +
>> +	dev_err(&pdev->dev, "addr=0x%llx request_id=0x%x bresp=0x%x\n",
>> +		addr, request_id, bresp);
> What is this information? How do we make use of it? Given that this is
> asynchronous, how do we correlate it to the offending software?

Indeed this information arriving from the HW is asynchronous.

There is no direct method to get the offending software.

There are all kinds of hacks we do to find the offending software once 
we find this error. most of the time its a new patch introduced but some 
of the time is just digging.

> The whole think looks to me like a poor man's EDAC handling, and I'd
> expect to be plugged in that subsystem instead. Any reason why this
> isn't the case? It would certainly make the handling uniform for the
> user.

This logic was not plugged into EDAC as there is no "Correctable" error 
here. its just error event. Not all errors are EDAC in the sense of 
Error Detection And *Correction*. There are no correctable errors for 
this driver.

So plugging it  under EDAC seems like abusing the EDAC system.

Now that I've emphasize the reason for not putting this under EDAC, what 
do you think? should this "only uncorrectable event" driver should be 
part of EDAC?


Thanks,

Talel
