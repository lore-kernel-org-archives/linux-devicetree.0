From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 2/4] dmaengine: mmp-pdma: add number of requestors
Date: Tue, 23 Feb 2016 18:45:09 +0100
Message-ID: <8737sjwcbe.fsf@belgarion.home>
References: <1455569868-25017-1-git-send-email-robert.jarzmik@free.fr>
	<1455569868-25017-2-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455569868-25017-2-git-send-email-robert.jarzmik@free.fr>
	(Robert Jarzmik's message of "Mon, 15 Feb 2016 21:57:46 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> The DMA chip has a fixed number of requestor lines used for flow
> control. This number is platform dependent. The pxa_dma dma driver will
> use this value to activate or not the flow control.
>
> There won't be any impact on mmp_pdma driver.
Haojian,

Even if mmp_pdma will not be impacted, it would be good to have have your ack on
this trivial patch.

Cheers.
