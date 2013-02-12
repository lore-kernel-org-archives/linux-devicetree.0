From: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH -next] powerpc/85xx: use for_each_compatible_node() macro
Date: Tue, 12 Feb 2013 14:02:01 -0600
Message-ID: <1C757F9C-FD71-44C5-B018-DF0F38571BC8@kernel.crashing.org>
References: <CAPgLHd_esknTwVv4EeehwSJz6ee5eFJ+zf6xntH-vaNwdxkrvg@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd_esknTwVv4EeehwSJz6ee5eFJ+zf6xntH-vaNwdxkrvg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: benh@kernel.crashing.org, paulus@samba.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Dec 3, 2012, at 7:36 AM, Wei Yongjun wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Use for_each_compatible_node() macro instead of open coding it.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
> arch/powerpc/platforms/85xx/mpc85xx_mds.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)

applied to next

- k
