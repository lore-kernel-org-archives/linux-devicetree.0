From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] arm: dts: Add support for National Instruments
 Project Sulfur SDRs
Date: Tue, 26 Sep 2017 14:54:48 +0200
Message-ID: <6b87e902-3201-6710-4921-d465dea19dcd@xilinx.com>
References: <20170911232223.91894-1-mdf@kernel.org>
 <314acb1f-1f0f-7893-70a8-9379c01112ac@xilinx.com>
 <20170925161136.GA12943@tyrael.ni.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170925161136.GA12943-KFgJe6S/L2nknyRNNOXSQ2IaLvZF3x2V0E9HWUfgJXw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 25.9.2017 18:11, Moritz Fischer wrote:
> Hi Michal,
> 
> On Mon, Sep 25, 2017 at 10:19:44AM +0200, Michal Simek wrote:
>> Hi Moritz
>>
>> sorry for delay.
> 
> No problem.
> 
>>
>> On 12.9.2017 01:22, Moritz Fischer wrote:
>>> Add support for the National Instruments Project Sulfur SDR
>>> motherboards Rev 2,3 and 4.
>>>
>>> Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/Makefile                |   3 +
>>>  arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts |  84 +++++++++++++++++++
>>>  arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts | 118 ++++++++++++++++++++++++++
>>>  arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts |  26 ++++++
>>>  arch/arm/boot/dts/zynq-ni-sulfur.dtsi     | 133 ++++++++++++++++++++++++++++++
>>>  5 files changed, 364 insertions(+)
>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts
>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts
>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts
>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur.dtsi
>>
>> Is this publicly available board?
> 
> Will be in Q1 2018 was announced at GRCon'17 ([1]).
> Some of the Rev3s are currently deployed in Norway as part of a radar
> system.
> 
>> I am not quite sure we should apply these dts files. There are a lot of
>> boards with zynq and there must be any strong argument for applying this
>> to the tree. For arm32 with even flat tree structure.
> 
> What's the issue with merging them, except for having 3 more files? 

For me this is not a problem because on Linux side it is not increasing
build time.
I want to see the value for community. All xilinx platforms are
evaluation generic purpose boards which are showing how to connect stuff
together.
On the other hand this is real product.

I would let arm-soc maintainer to decide if this is fine or not. I
definitely don't want to end up in situation that we will have dts for
real products which are not bringing any value for others.

Thanks,
Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
