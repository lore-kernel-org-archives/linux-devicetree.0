From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dma: mmp_pdma: Add the #dma-requests DT property
 documentation
Date: Thu, 18 Feb 2016 08:38:31 -0600
Message-ID: <20160218143831.GC9654@rob-hp-laptop>
References: <1455569868-25017-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455569868-25017-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 15, 2016 at 09:57:45PM +0100, Robert Jarzmik wrote:
> For pxa based platforms, the number of requestor lines should be
> specified, so that the driver can check if the flow control should be
> activated (when a requestor line is asked for) or not.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> Since v1: rename of property to #dma-requests
>       	  modify default value to 32 as suggested by Vinod
> ---
>  Documentation/devicetree/bindings/dma/mmp-dma.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
