From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Subject: Re: [PATCH V2 03/12] dtb: amd: Fix DMA ranges in device tree
Date: Thu, 11 Feb 2016 04:13:50 +0700
Message-ID: <56BBA80E.6090205@amd.com>
References: <1454954357-8395-1-git-send-email-Suravee.Suthikulpanit@amd.com>
 <1454954357-8395-4-git-send-email-Suravee.Suthikulpanit@amd.com>
 <2845776.WTPtnQzg8d@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2845776.WTPtnQzg8d@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, brijeshkumar.singh@amd.com, thomas.lendacky@amd.com, leo.duran@amd.com
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 2/9/16 21:57, Arnd Bergmann wrote:
> On Monday 08 February 2016 11:59:08 Suravee Suthikulpanit wrote:
>> From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
>>
>> Fix DMA ranges of smb0 and pcie0 nodes in AMD Seattle SOC.
>>
>> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
>>
>
> This could use a changelog text to explain why it's broken and how the
> fix works.
>
> 	Arnd
>

So, I have not experience the breakage. However, IIUC, the GICv2m MSI 
frame is also considered DMA-able. So, I think it should be included in 
the dma-range specified here. Please let me know if my assumption is 
incorrect. Otherwise, I will include more description in the commit log 
in my next rev.

Thanks,
Suravee
