From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH 2/2] dmaengine: vdma: Add clock support
Date: Wed, 20 Apr 2016 11:39:02 -0700
Message-ID: <CAAtXAHd=QER9ukD8LKpHCGdmsv=MzJ4bxkvWVEatpfUhsh98SQ@mail.gmail.com>
References: <1461136800-20334-1-git-send-email-appanad@xilinx.com>
	<1461136800-20334-2-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461136800-20334-2-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: Rob Herring <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Appana Durga Kedareswara Rao <appanad@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Luis de Bethencourt <luis@debethencourt.com>, Anirudha Sarangi <anirudh@xilinx.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, Devicetree List <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

thanks for looking into this.

On Wed, Apr 20, 2016 at 12:20 AM, Kedareswara rao Appana
<appana.durga.rao@xilinx.com> wrote:

> +static int xdma_clk_init(struct xilinx_dma_device *xdev, bool enable)
> +{
> +       int i = 0, ret;
> +
> +       for (i = 0; i < xdev->numclks; i++) {
> +               if (enable) {
> +                       ret = clk_prepare_enable(xdev->clks[i]);
> +                       if (ret) {
> +                               dev_err(xdev->dev,
> +                                       "failed to enable the axidma clock\n");
> +                               return ret;

What happens to the ones you already turned on, if say the third fails?

Cheers,

Moritz
