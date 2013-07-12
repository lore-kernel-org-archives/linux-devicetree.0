From: Hongbo Zhang <hongbo.zhang@freescale.com>
Subject: Re: [PATCH V2 1/2] DMA: Freescale: Add new 8-channel DMA engine device
 tree nodes
Date: Fri, 12 Jul 2013 13:33:31 +0800
Message-ID: <51DF952B.8050802@freescale.com>
References: <1373005626-20726-1-git-send-email-hongbo.zhang@freescale.com> <1373005626-20726-2-git-send-email-hongbo.zhang@freescale.com> <1373388526.8183.191@snotra>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1373388526.8183.191@snotra>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Cc: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, vakul@freescale.com
List-Id: devicetree@vger.kernel.org

On 07/10/2013 12:48 AM, Scott Wood wrote:
> On 07/05/2013 01:27:05 AM, hongbo.zhang@freescale.com wrote:
>> From: Hongbo Zhang <hongbo.zhang@freescale.com>
>>
>> Freescale QorIQ T4 and B4 introduce new 8-channel DMA engines, this 
>> patch add
>> the device tree nodes for them.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>
>> ---
>>  arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi   |   90 
>> +++++++++++++++++++++++++++
>>  arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi   |   90 
>> +++++++++++++++++++++++++++
>>  arch/powerpc/boot/dts/fsl/t4240si-post.dtsi |    4 +-
>>  3 files changed, 182 insertions(+), 2 deletions(-)
>>  create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
>>  create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi
>
> Please update Documentation/devicetree/bindings/powerpc/fsl/dma.txt 
> for the new compatible and dgsr1.
OK, thanks.
What's more, some text string in the driver and Kconfig files should be 
updated too, e.g. "Elo / Elo Plus DMA" may be changed to "Elo series 
DMA", will send out v3 patches soon.
>
> -Scott
