From: Alexander Popov <alex.popov@linux.com>
Subject: Re: [PATCH v3 2/3] powerpc/512x: add a device tree binding for
 LocalPlus Bus FIFO
Date: Mon, 28 Sep 2015 16:24:25 +0300
Message-ID: <56093F89.1020004@linux.com>
References: <1443115737-3948-1-git-send-email-alex.popov@linux.com>
 <1443115737-3948-3-git-send-email-alex.popov@linux.com>
 <560492C1.307@tabi.org>
Reply-To: alex.popov@linux.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <560492C1.307@tabi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Timur Tabi <timur@tabi.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Anatolij Gustschin <agust@denx.de>, Gerhard Sittig <gsi@denx.de>, Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@linaro.org>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25.09.2015 03:18, Timur Tabi wrote:
> Alexander Popov wrote:
>> +- dma-names: should be "rx-tx";
> 
> Why bother, if it can only be one value?

I've just followed devicetree/bindings/dma/dma.txt...
This "rx-tx" doesn't mean much but it could show that LocalPlus Bus FIFO
uses a single DMA read-write channel. Should I really drop it?

Best regards,
Alexander
