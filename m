From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v7 5/5] soc: zte: pm_domains: Add support for zx296718
Date: Mon, 9 Jan 2017 10:16:36 +0800
Message-ID: <20170109021634.GI20956@dragon>
References: <1483694164-7668-1-git-send-email-baoyou.xie@linaro.org>
 <1483694164-7668-5-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483694164-7668-5-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: jun.nie@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, davem@davemloft.net, geert+renesas@glider.be, akpm@linux-foundation.org, mchehab@kernel.org, krzk@kernel.org, arnd@arndb.de, claudiu.manoil@nxp.com, amitdanielk@gmail.com, pankaj.dubey@samsung.com, yangbo.lu@nxp.com, scott.branden@broadcom.com, simon.horman@netronome.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 06, 2017 at 05:16:04PM +0800, Baoyou Xie wrote:
> This patch introduces the power domain driver of zx296718
> which belongs to zte's zx2967 family.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> Reviewed-by: Jun Nie <jun.nie@linaro.org>

Except the need of PCU_DM_xxx enum (I'm not strong on that,so would
leave it to author's decision), the patch series looks good to me.
I'm going to queue it up for 4.11 after getting Rob's ACK on bindings.
Let me know if anyone has any objections.

Shawn
