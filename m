From: Kevin Hilman <khilman@deeprootsystems.com>
Subject: Re: [PATCH] ARM: OMAP: omap_device: fix return value check in omap_device_build_ss()
Date: Tue, 02 Oct 2012 14:36:52 -0700
Message-ID: <87lifo8sjv.fsf@deeprootsystems.com>
References: <CAPgLHd8ys7uU8wBhMF7JWZEDAddOnGo4vHPu1V_+Q3__WWK-3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd8ys7uU8wBhMF7JWZEDAddOnGo4vHPu1V_+Q3__WWK-3g@mail.gmail.com>
	(Wei Yongjun's message of "Fri, 21 Sep 2012 14:32:04 +0800")
Sender: linux-omap-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: tony@atomide.com, linux@arm.linux.org.uk, grant.likely@secretlab.ca, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Wei Yongjun <weiyj.lk@gmail.com> writes:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function omap_device_alloc() returns ERR_PTR()
> and never returns NULL pointer. The NULL test in the return value
> check should be replaced with IS_ERR().
>
> dpatch engine is used to auto generated this patch.
> (https://github.com/weiyj/dpatch)
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Thanks, queueing this for v3.7-rc.

Kevin
