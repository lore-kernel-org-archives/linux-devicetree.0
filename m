From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 0/4] Fix pxa dma requestor lines
Date: Thu, 11 Feb 2016 22:23:14 +0100
Message-ID: <1455225798-9510-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Vinod Koul <vinod.koul@intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This serie aims at fixing a bug which arose in the pxa_dma driver, which needs
to know the number of requestor lines which are connected to the DMA IP.

The current implementation of pxa_dma is limited to 32 lines, which pxa27x has
75 lines and pxa3xx has 100 of them. As a consequence, DMA clients with a
requestor greater that 32 are not working, namely the pxa_camera driver.

The proposed fix by Vinod is to make the driver aware of the number of lines,
which is done by this patchset.

I'd like to have this reviewed and then taken through the PXA tree. For this
I'll need :
 - Rob/Grant/Kumar/Ian ack on patch 1/4
 - Haojian's ack on patch 2/4
 - Vinod's ack on patch 4/4

Thanks in advance.
