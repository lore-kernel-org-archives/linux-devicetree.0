Return-Path: <devicetree-owner@vger.kernel.org>
Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]:7555 "EHLO
	co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752587Ab3G3CKJ (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Mon, 29 Jul 2013 22:10:09 -0400
Message-ID: <51F72081.8060803@freescale.com>
Date: Tue, 30 Jul 2013 10:10:09 +0800
From: Hongbo Zhang <hongbo.zhang@freescale.com>
MIME-Version: 1.0
Subject: Re: [PATCH v7 2/3] DMA: Freescale: Add new 8-channel DMA engine device
 tree nodes
References: <1375094944-3343-1-git-send-email-hongbo.zhang@freescale.com> <1375094944-3343-3-git-send-email-hongbo.zhang@freescale.com> <1375135852.30721.60@snotra>
In-Reply-To: <1375135852.30721.60@snotra>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Cc: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 07/30/2013 06:10 AM, Scott Wood wrote:
> On 07/29/2013 05:49:03 AM, hongbo.zhang@freescale.com wrote:
>> From: Hongbo Zhang <hongbo.zhang@freescale.com>
>>
>> Freescale QorIQ T4 and B4 introduce new 8-channel DMA engines, this 
>> patch adds
>> the device tree nodes for them.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>
>> ---
>>  .../devicetree/bindings/powerpc/fsl/dma.txt        |   66 
>> ++++++++++++++++
>>  arch/powerpc/boot/dts/fsl/b4si-post.dtsi           |    4 +-
>>  arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi          |   81 
>> ++++++++++++++++++++
>>  arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi          |   81 
>> ++++++++++++++++++++
>>  arch/powerpc/boot/dts/fsl/t4240si-post.dtsi        |    4 +-
>>  5 files changed, 232 insertions(+), 4 deletions(-)
>>  create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
>>  create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi
>
> ACK
Thank you Scott for all the review comments.
>
> -Scott



