From: Timur Tabi <timur@tabi.org>
Subject: Re: [PATCH v3 3/3] dmaengine: mpc512x: initialize with
 subsys_initcall()
Date: Thu, 24 Sep 2015 19:16:28 -0500
Message-ID: <5604925C.1050803@tabi.org>
References: <1443115737-3948-1-git-send-email-alex.popov@linux.com>
 <1443115737-3948-4-git-send-email-alex.popov@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443115737-3948-4-git-send-email-alex.popov@linux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Popov <alex.popov@linux.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Anatolij Gustschin <agust@denx.de>, Gerhard Sittig <gsi@denx.de>, Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@linaro.org>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Alexander Popov wrote:
> Initialize Freescale MPC512x DMA driver with subsys_initcall()
> to allow the depending drivers to call dma_request_slave_channel()
> during their probe.
>
> Signed-off-by: Alexander Popov<alex.popov@linux.com>

Is there any way we can use -EPROBEDEFER instead?
