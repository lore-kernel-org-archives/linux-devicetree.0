From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V17 2/3] dmaengine: qcom_hidma: add debugfs hooks
Date: Tue, 26 Apr 2016 09:00:30 +0530
Message-ID: <20160426033029.GB2274@localhost>
References: <1460384473-5775-1-git-send-email-okaya@codeaurora.org>
 <1460384473-5775-3-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460384473-5775-3-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 11, 2016 at 10:21:12AM -0400, Sinan Kaya wrote:

> +static int hidma_chan_stats(struct seq_file *s, void *unused)
> +{
> +	struct hidma_chan *mchan = s->private;
> +	struct hidma_desc *mdesc;
> +	struct hidma_dev *dmadev = mchan->dmadev;
> +
> +	pm_runtime_get_sync(dmadev->ddev.dev);

debug shouldn't power up device, why do you want to do that

-- 
~Vinod
