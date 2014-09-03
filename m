From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 02/12] clk: mmp: add spin lock for clk-frac
Date: Wed, 03 Sep 2014 11:04:24 -0700
Message-ID: <20140903180424.11368.36053@quantum>
References: <1409027904-21859-1-git-send-email-chao.xie@marvell.com>
 <1409027904-21859-3-git-send-email-chao.xie@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409027904-21859-3-git-send-email-chao.xie@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chao Xie <chao.xie@marvell.com>, haojian.zhuang@gmail.com, haojian.zhuang@linaro.orgchao.xie@marvell.com, xiechao_mail@163.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Chao Xie (2014-08-25 21:38:14)
> From: Chao Xie <chao.xie@marvell.com>
> 
> The register used by clk-frac may be shared with
> other clocks.
> So it needs to use spin lock to protect the register
> access.
> 
> Signed-off-by: Chao Xie <chao.xie@marvell.com>

This patch will break against the latest clk-next due to api changes.
You can see more here[0] and use this script to update your code if you
like[1].

Basically the calls to clk_set_rate need to be changed to
clk_provider_set_rate.

[0] http://lkml.kernel.org/r/<1409758148-20104-1-git-send-email-tomeu.vizoso@collabora.com>
[1] http://cgit.collabora.com/git/user/tomeu/linux.git/commit/?h=clk-refactoring-9&id=ea48c0d655346cce26329523cf24574f9ea8feee

Regards,
Mike
