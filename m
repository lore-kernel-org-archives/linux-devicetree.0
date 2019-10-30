Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E6CCA9EAF
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 09:00:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C803C2083E
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 09:00:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfJ3JAe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 05:00:34 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:24213 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726028AbfJ3JAe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 05:00:34 -0400
X-UUID: bc5682e452c14115802eac09a742e131-20191030
X-UUID: bc5682e452c14115802eac09a742e131-20191030
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1767353363; Wed, 30 Oct 2019 17:00:24 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 30 Oct
 2019 17:00:22 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 30 Oct 2019 17:00:21 +0800
Message-ID: <1572426023.21623.257.camel@mhfsdcap03>
Subject: Re: [V2, 1/2] media: dt-bindings: media: i2c: Add bindings for
 ov8856
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        <mchehab@kernel.org>, <mark.rutland@arm.com>,
        <drinkcat@chromium.org>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>
Date:   Wed, 30 Oct 2019 17:00:23 +0800
In-Reply-To: <20190917144412.GA23952@bogus>
References: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
         <20190910130446.26413-2-dongchun.zhu@mediatek.com>
         <20190910173743.GI2680@smile.fi.intel.com>
         <20190917120205.GO5781@paasikivi.fi.intel.com>
         <20190917144412.GA23952@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: EBDC59C3BCA94102C3AB13CA12A967D7417CB8D1D0988A04DF1CB39C3D08FD852000:8
X-MTK:  N
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Tue, 2019-09-17 at 09:44 -0500, Rob Herring wrote:
> On Tue, Sep 17, 2019 at 03:02:06PM +0300, Sakari Ailus wrote:
> > On Tue, Sep 10, 2019 at 08:37:43PM +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 10, 2019 at 09:04:45PM +0800, dongchun.zhu@mediatek.com wrote:
> > > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > 
> > > > This patch adds device tree bindings documentation for the ov8856 CMOS
> > > > image sensor.
> > > 
> > > New bindings in YAML, please.
> > 
> > My understanding is text documents are still fine.
> 
> Schema are preferred, but still up to the subsystem for now.
>  

It seems that there are no bindings in YAML under the path:
Documentation/devicetree/bindings/media/i2c.
So we would keep the text documents for OV8856.

> > We don't have things like graph.txt or video-interfaces.txt in YAML yet
> > either.
> 
> That doesn't really matter too much. You can assume common properties 
> will have a common schema and just define what's device specific. The 
> device specific bindings have to define 'port' or 'port@N' nodes.
> 
> Rob


