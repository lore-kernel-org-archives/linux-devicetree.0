From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH] ARM: socfpga: dts: Add missing clock and interrupt fields
 for Arria10 DMA
Date: Tue, 8 Mar 2016 15:18:26 -0600
Message-ID: <alpine.DEB.2.02.1603081517350.12664@linux-builds1>
References: <1457456571-25541-1-git-send-email-grmoore@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457456571-25541-1-git-send-email-grmoore@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Graham Moore <grmoore@opensource.altera.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 8 Mar 2016, Graham Moore wrote:

> The PL330 DMA driver will not load on Arria10 without devicetree entries
> for clocks and clock_names.  This patch adds those entries.  It also adds
> the ninth interrupt, which is required for error detection.
> 
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Applied.

Thanks,
Dinh
