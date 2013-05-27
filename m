From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH -next] pci: mvebu: fix return value check in
 mvebu_pcie_probe()
Date: Mon, 27 May 2013 12:05:28 -0400
Message-ID: <20130527160528.GH31290@titan.lakedaemon.net>
References: <CAPgLHd_B-RBGTcQPeeWeJb9QVkf-RjO1WtBC0JK2KOEoBaus_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd_B-RBGTcQPeeWeJb9QVkf-RjO1WtBC0JK2KOEoBaus_Q@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: bhelgaas@google.com, grant.likely@linaro.org, rob.herring@calxeda.com, thomas.petazzoni@free-electrons.com, yongjun_wei@trendmicro.com.cn, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

All,

On Mon, May 27, 2013 at 11:38:41AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> In case of error, function of_clk_get_by_name() returns
> ERR_PTR() never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/pci/host/pci-mvebu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to mvebu/pcie.

FYI: mvebu/pcie_bridge, and mvebu/pcie_kirkwood have been rebased on top
of this change.

thx,

Jason.
