Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48390C47E49
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 13:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 271782087E
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 13:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfJ3N4E (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 09:56:04 -0400
Received: from mga17.intel.com ([192.55.52.151]:29612 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbfJ3N4E (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 30 Oct 2019 09:56:04 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 06:56:03 -0700
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="193975489"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 06:55:58 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id BEC0E208A0; Wed, 30 Oct 2019 15:55:27 +0200 (EET)
Date:   Wed, 30 Oct 2019 15:55:27 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V2, 2/2] media: i2c: Add more sensor modes for ov8856 camera
 sensor
Message-ID: <20191030135527.GH10211@paasikivi.fi.intel.com>
References: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
 <20190910130446.26413-3-dongchun.zhu@mediatek.com>
 <20190910174450.GJ2680@smile.fi.intel.com>
 <1572440653.21623.272.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572440653.21623.272.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Oct 30, 2019 at 09:04:13PM +0800, Dongchun Zhu wrote:
> > > +	ov8856->is_1B_revision = (val == OV8856_1B_MODULE) ? 1 : 0;
> > 
> > !! will give same result without using ternary operator.
> > 
> 
> Fixed in next release.

But casting to bool will have the same effect. Integers are also not
needed. I.e. this can be written as:

	ov8856->is_1B_revision = val == OV8856_1B_MODULE;

-- 
Sakari Ailus
