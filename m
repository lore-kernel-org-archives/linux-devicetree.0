From: Alexander Popov <alex.popov@linux.com>
Subject: Re: [PATCH v3 3/3] dmaengine: mpc512x: initialize with
 subsys_initcall()
Date: Thu, 8 Oct 2015 00:31:34 +0300
Message-ID: <56158F36.1080602@linux.com>
References: <1443115737-3948-1-git-send-email-alex.popov@linux.com>
 <1443115737-3948-4-git-send-email-alex.popov@linux.com>
 <20151007141740.GF3320@vkoul-mobl.iind.intel.com>
Reply-To: alex.popov@linux.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151007141740.GF3320@vkoul-mobl.iind.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Anatolij Gustschin <agust@denx.de>, Gerhard Sittig <gsi@denx.de>, Rob Herring <robh@kernel.org>, Timur Tabi <timur@tabi.org>, Grant Likely <grant.likely@linaro.org>, Dan Williams <dan.j.williams@intel.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Popov <alex.popov@linux.com>
List-Id: devicetree@vger.kernel.org

On 07.10.2015 17:17, Vinod Koul wrote:
> On Thu, Sep 24, 2015 at 08:28:57PM +0300, Alexander Popov wrote:
>> Initialize Freescale MPC512x DMA driver with subsys_initcall()
>> to allow the depending drivers to call dma_request_slave_channel()
>> during their probe.
> 
> Why can't we use defered probe ? I have been asking people to not move init
> levels and esnure we have right solutions using defered probe

Thanks, Vinod, I'll do it in v4.

Best regards,
Alexander
