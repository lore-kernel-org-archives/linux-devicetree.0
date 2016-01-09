From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [V5,4/6] i2c: qup: Add bam dma capabilities
Date: Fri, 8 Jan 2016 22:38:09 -0600
Message-ID: <20160109043809.GC4616@hector.attlocal.net>
References: <1447760727-4897-5-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447760727-4897-5-git-send-email-sricharan@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: iivanov@mm-sol.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, galak@codeaurora.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, agross@codeaurora.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 17, 2015 at 05:15:25PM +0530, Sricharan R wrote:
> QUP cores can be attached to a BAM module, which acts as a dma engine for the
> QUP core. When DMA with BAM is enabled, the BAM consumer pipe transmitted data
> is written to the output FIFO and the BAM producer pipe received data is read
> from the input FIFO.
> 
> With BAM capabilities, qup-i2c core can transfer more than 256 bytes, without a
> 'stop' which is not possible otherwise.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---

Reviewed-by: Andy Gross <andy.gross@linaro.org>
