From: Alexander Popov <alex.popov@linux.com>
Subject: Re: [PATCH v3 3/3] dmaengine: mpc512x: initialize with
 subsys_initcall()
Date: Mon, 28 Sep 2015 16:15:08 +0300
Message-ID: <56093D5C.70809@linux.com>
References: <1443115737-3948-1-git-send-email-alex.popov@linux.com>
 <1443115737-3948-4-git-send-email-alex.popov@linux.com>
 <5604925C.1050803@tabi.org>
Reply-To: alex.popov@linux.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5604925C.1050803@tabi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Timur Tabi <timur@tabi.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Anatolij Gustschin <agust@denx.de>, Gerhard Sittig <gsi@denx.de>, Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@linaro.org>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Popov <alex.popov@linux.com>
List-Id: devicetree@vger.kernel.org

On 25.09.2015 03:16, Timur Tabi wrote:
> Alexander Popov wrote:
>> Initialize Freescale MPC512x DMA driver with subsys_initcall()
>> to allow the depending drivers to call dma_request_slave_channel()
>> during their probe.
>>
>> Signed-off-by: Alexander Popov<alex.popov@linux.com>
> 
> Is there any way we can use -EPROBEDEFER instead?

Thanks Timur, I'll try.

Best regards,
Alexander
