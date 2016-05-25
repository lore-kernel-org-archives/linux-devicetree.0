From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v5 0/5] da8xx USB PHY platform devices and clocks (was
 "da8xx UBS clocks")
Date: Wed, 25 May 2016 16:48:34 +0530
Message-ID: <57458A0A.5010100@ti.com>
References: <1462837612-7803-1-git-send-email-david@lechnology.com>
 <57431E73.5030304@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57431E73.5030304@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, khilman@kernel.org
Cc: petr@barix.com, sergei.shtylyov@cogentembedded.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 23 May 2016 08:44 PM, David Lechner wrote:
> On 05/09/2016 06:46 PM, David Lechner wrote:
>> v5 changes: renamed "usbphy" to "usb_phy" or "usb-phy" as appropriate
>>
>> David Lechner (5):
>>    ARM: davinci: da8xx: add usb phy clocks
>>    ARM: davinci: da8xx: Add CFGCHIP syscon platform declaration.
>>    ARM: davinci: da8xx: Add USB PHY platform declaration
>>    ARM: DTS: da850: Add cfgchip syscon node
>>    ARM: DTS: da850: Add usb phy node
>>
>>   arch/arm/boot/dts/da850.dtsi                |   9 ++
>>   arch/arm/mach-davinci/board-da830-evm.c     |  52 +++----
>>   arch/arm/mach-davinci/board-da850-evm.c     |   4 +
>>   arch/arm/mach-davinci/board-mityomapl138.c  |   4 +
>>   arch/arm/mach-davinci/board-omapl138-hawk.c |  23 ++-
>>   arch/arm/mach-davinci/devices-da8xx.c       |  28 ++++
>>   arch/arm/mach-davinci/include/mach/da8xx.h  |   6 +
>>   arch/arm/mach-davinci/usb-da8xx.c           | 230
>> +++++++++++++++++++++++++++-
>>   8 files changed, 314 insertions(+), 42 deletions(-)
>>
> 
> What should I be doing to keep this moving along?

We need the related driver changes to be applied first. I could then use
an immutable branch to push the platform changes against.

I did take a look at the patches and they look good to me. Except the
one comment from Sergei which I just now indicated that I agree with.

Thanks,
Sekhar
