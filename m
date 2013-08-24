Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:49921 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754107Ab3HXEoU (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 24 Aug 2013 00:44:20 -0400
Received: by mail-pa0-f44.google.com with SMTP id fz6so1423927pac.3
        for <devicetree@vger.kernel.org>; Fri, 23 Aug 2013 21:44:19 -0700 (PDT)
Date: Fri, 23 Aug 2013 21:44:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH -next] mtd: atmel_nand: fix error return code in
 atmel_nand_probe()
Message-ID: <20130824044410.GA19575@brian-ubuntu>
References: <CAPgLHd8an7_iEV1eTNGFmQ8B4CM=FGu0jrov_A=L9JRJ8AFKPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgLHd8an7_iEV1eTNGFmQ8B4CM=FGu0jrov_A=L9JRJ8AFKPA@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, artem.bityutskiy@linux.intel.com, josh.wu@atmel.com, plagnioj@jcrosoft.com, jg1.han@samsung.com, devicetree@vger.kernel.org, yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 23, 2013 at 10:50:36AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Pushed to l2-mtd.git. Thanks!

Brian
