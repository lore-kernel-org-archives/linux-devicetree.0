From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] dma: tegra: use list_move_tail instead of list_del/list_add_tail
Date: Fri, 7 Sep 2012 12:02:31 +0530
Message-ID: <504994FF.2070706@nvidia.com>
References: <CAPgLHd9DHDY9-oxFRK6coarc8JqKGporKSXTFG5fkRioZz6xFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd9DHDY9-oxFRK6coarc8JqKGporKSXTFG5fkRioZz6xFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: "vinod.koul@intel.com" <vinod.koul@intel.com>, "djbw@fb.com" <djbw@fb.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "yongjun_wei@trendmicro.com.cn" <yongjun_wei@trendmicro.com.cn>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 05 September 2012 12:38 PM, Wei Yongjun wrote:
> From: Wei Yongjun<yongjun_wei@trendmicro.com.cn>
>
> Using list_move_tail() instead of list_del() + list_add_tail().
>
> spatch with a semantic match is used to found this problem.
> (http://coccinelle.lip6.fr/)
>
> Signed-off-by: Wei Yongjun<yongjun_wei@trendmicro.com.cn>
> ---
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
Looks good to me.
