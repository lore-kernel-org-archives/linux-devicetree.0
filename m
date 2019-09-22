From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [UNVERIFIED SENDER] Re: [UNVERIFIED SENDER] Re: [PATCH v2 2/3]
 soc: amazon: al-pos: Introduce Amazon's Annapurna Labs POS driver
Date: Sun, 22 Sep 2019 09:55:36 +0300
Message-ID: <dde86fec-ca92-a2a9-2d63-42c33c8594b0@amazon.com>
References: <1568142310-17622-1-git-send-email-talel@amazon.com>
 <1568142310-17622-3-git-send-email-talel@amazon.com>
 <86d0g6syva.wl-maz@kernel.org>
 <3205f7ae-5568-c064-23ac-ea726246173b@amazon.com>
 <865zlxsxtd.wl-maz@kernel.org>
 <36f19b3f-46d3-f6d0-3681-71e3a9bb52ce@amazon.com>
 <93e5ac72-13e1-4672-16f0-62ee6b8a8390@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <93e5ac72-13e1-4672-16f0-62ee6b8a8390@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, robh+dt@kernel.org, tglx@linutronix.de, jason@lakedaemon.net, mark.rutland@arm.com, nicolas.ferre@microchip.com, mchehab+samsung@kernel.org, shawn.lin@rock-chips.com, gregkh@linuxfoundation.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 9/19/2019 5:42 PM, James Morse wrote:
> Hi guys,
>
> On 12/09/2019 10:19, Shenhar, Talel wrote:
>> On 9/12/2019 11:50 AM, Marc Zyngier wrote:
>>> On Thu, 12 Sep 2019 07:50:03 +0100,
>>> "Shenhar, Talel" <talel@amazon.com> wrote:
>>>> On 9/11/2019 5:15 PM, Marc Zyngier wrote:
>>>>> On Tue, 10 Sep 2019 20:05:09 +0100,
>>>>> Talel Shenhar <talel@amazon.com> wrote:
>>>>>
>> James, will love your input from EDAC point of view, does it make sense to plug
>> un-correctable only event to EDAC?
> I think this device is an example of something like a "Fabric switch units" in
> Documentation/driver-api/edac.rst. It makes sense that it should be described as a
> 'device' to edac. You can then use the existing user-space tools to control/report/monitor
> the values.

Thank you James,

Will port this logic to be edac device.

>
>
> Thanks,
>
> James
