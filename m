From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 2/2 v2] ARC: [axs10x] Specify reserved memory for frame
 buffer
Date: Fri, 29 Apr 2016 16:19:36 +0530
Message-ID: <57233C40.9040909@synopsys.com>
References: <1461853196-15599-1-git-send-email-abrodkin@synopsys.com>
 <1461853196-15599-3-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461853196-15599-3-git-send-email-abrodkin@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 28 April 2016 07:49 PM, Alexey Brodkin wrote:
> Even though for AXS101 (which sorts ARC770 CPU) IOC is not
> an option for a sake of keeping one DT description for the
> base-board (axs10x_mb.dtsi) we're still defining reserved
> memory location in the very end of DDR.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Acked-by: Vineet Gupta <vgupta@synopsys.com>
