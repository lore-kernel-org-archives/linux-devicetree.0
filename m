From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: del redundant type conversion
Date: Mon, 29 Apr 2019 12:50:12 -0500
Message-ID: <20190429175012.GA28972@bogus>
References: <1554884981-20309-1-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554884981-20309-1-git-send-email-xiaojiangfeng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xiaojiangfeng <xiaojiangfeng@huawei.com>
Cc: frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 10, 2019 at 04:29:41PM +0800, xiaojiangfeng wrote:
> The type of variable l in early_init_dt_scan_chosen is
> int, there is no need to convert to int.
> 
> Signed-off-by: xiaojiangfeng <xiaojiangfeng@huawei.com>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Rob
