From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH -next] pci: mvebu: fix return value check in
 mvebu_pcie_probe()
Date: Mon, 27 May 2013 09:12:49 +0200
Message-ID: <20130527091249.52902073@skate>
References: <CAPgLHd_B-RBGTcQPeeWeJb9QVkf-RjO1WtBC0JK2KOEoBaus_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd_B-RBGTcQPeeWeJb9QVkf-RjO1WtBC0JK2KOEoBaus_Q@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: bhelgaas@google.com, grant.likely@linaro.org, rob.herring@calxeda.com, jason@lakedaemon.net, yongjun_wei@trendmicro.com.cn, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Dear Wei Yongjun,

On Mon, 27 May 2013 11:38:41 +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> In case of error, function of_clk_get_by_name() returns
> ERR_PTR() never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Jason, this needs to be in the mvebu/pcie branch, so I'll guess you
would have to rebase mvebu/pcie_bridge on top of it.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
