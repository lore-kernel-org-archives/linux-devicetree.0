Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1D1C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 09:16:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 529D020722
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 09:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbgGAJQY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 05:16:24 -0400
Received: from mga11.intel.com ([192.55.52.93]:21544 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728776AbgGAJQY (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Jul 2020 05:16:24 -0400
IronPort-SDR: ttru2E9b2dBHY+bbHvbro0c7gwP00b/HugUFSpEltYkNcOH7SOu/+dOKGNrPJFcAV5+y/ElKYw
 YxEt7kQJepsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="144689083"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; 
   d="scan'208";a="144689083"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 02:16:24 -0700
IronPort-SDR: Nbl7zm0UC4Q0tOalM8IapjeJbZy3GvjOB3grt6wLAxXu6vAIm/hp2QstzuSPYNdFYsvvlTsHB0
 ETX1pUk8u9sg==
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; 
   d="scan'208";a="321182597"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 02:16:20 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2AB0C20760; Wed,  1 Jul 2020 12:16:18 +0300 (EEST)
Date:   Wed, 1 Jul 2020 12:16:18 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
Message-ID: <20200701091618.GN16711@paasikivi.fi.intel.com>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Dongchun,

On Tue, Jun 30, 2020 at 02:22:09PM +0800, Dongchun Zhu wrote:
> Hello,
> 
> This series adds DT bindings and V4L2 sub-device driver for Dongwoon's DW9768,
> which is a 10-bit DAC with 100mA output current sink capability.
> 
> The driver is designed for linear control of voice coil motor(VCM).
> It creates a V4L2 sub-device and provides control to set the desired focus.

Thanks for the update.

There seem to be trailing whitespaces at least in the first patch, and a
conflict in MAINTAINERS vs. current media tree master.

Could you address these, please?

-- 
Regards,

Sakari Ailus
