Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:42967 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754421Ab3HXFKg (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 24 Aug 2013 01:10:36 -0400
Received: by mail-pd0-f179.google.com with SMTP id v10so1437705pde.24
        for <devicetree@vger.kernel.org>; Fri, 23 Aug 2013 22:10:36 -0700 (PDT)
Date: Fri, 23 Aug 2013 22:10:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH -next] mtd: ofpart: use for_each_child_of_node() macro
Message-ID: <20130824051032.GD19575@brian-ubuntu>
References: <CAPgLHd_zSXzRWGgQUzsmsM4beiTFKoWtcic6QmJdxhfBvNEZYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgLHd_zSXzRWGgQUzsmsM4beiTFKoWtcic6QmJdxhfBvNEZYg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, devicetree@vger.kernel.org, yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org, Huang Shijie <b32955@freescale.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 23, 2013 at 11:04:27AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Use for_each_child_of_node() macro instead of open coding it.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Pushed to l2-mtd.git. Thanks!

Brian
