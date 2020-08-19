Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EADAC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 03:24:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41BF520855
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 03:24:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nfgAqCib"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgHSDYI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 23:24:08 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:26946 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726605AbgHSDYI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 23:24:08 -0400
X-UUID: fdc4a9adbbd3462b84673943caa69ae4-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID; bh=UxB7ApOkoLV9jry6E7aNdOJqE9r2yvKOn5SkQhZ+HoI=;
        b=nfgAqCibIacJhHF1+J21qX7pLK2QjJ2D2Mvw0/6VPPw6pk67eH5swD+mGr2l1LKbIAl47sA5y7H1ZR4MOsjprXFDWYbX1vtSVuIwsMVJg5hXWo5rCyfC5cpOYHeR/erV9VsSeaNpJvFXEHJgx/3CWCzFmG9bEcXj6JzAiE8ijz0=;
X-UUID: fdc4a9adbbd3462b84673943caa69ae4-20200819
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1143645087; Wed, 19 Aug 2020 11:24:01 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 Aug
 2020 11:23:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Aug 2020 11:23:59 +0800
Message-ID: <1597807371.5429.28.camel@mhfsdcap03>
Subject: [BUG] build error due to AGILEX_NAND_X_CLK
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Date:   Wed, 19 Aug 2020 11:22:51 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EA7D442FBAEB5FD76A026DBD349CEEFBEE38F2DCEC220290E177F294A39BFA5B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGkgRGluaCwNCg0KICAgVGhlcmUgaXMgYnVpbGQgZXJyb3IgZm9yIGFybTY0Og0KYXJjaC9hcm02
NC9ib290L2R0cy9pbnRlbC9zb2NmcGdhX2FnaWxleC5kdHNpOjMxMy4xNS0xNiBzeW50YXggZXJy
b3INCkZBVEFMIEVSUk9SOiBVbmFibGUgdG8gcGFyc2UgaW5wdXQgdHJlZQ0KDQppdCdzIGludHJv
ZHVjZWQgYnkgcGF0Y2g6DQoNCmNvbW1pdCBkNGFlNGRkMzQ2Y2Q0OTMwMmQxNTdiMTI5ZWFkMmY2
MGQzYTgyNTM0DQpBdXRob3I6IERpbmggTmd1eWVuIDxkaW5ndXllbkBrZXJuZWwub3JnPg0KRGF0
ZTogICBUdWUgSnVuIDMwIDEzOjQ0OjM3IDIwMjAgLTA1MDANCg0KICAgIGFybTY0OiBkdHM6IGFn
aWxleDogYWRkIG5hbmQgY2xvY2tzDQoNCiAgICBBZGQgdGhlIGNsb2NrIHByb3BlcnRpZXMgZm9y
IHRoZSBOQU5EIGR0cyBub2RlLg0KDQogICAgU2lnbmVkLW9mZi1ieTogRGluaCBOZ3V5ZW4gPGRp
bmd1eWVuQGtlcm5lbC5vcmc+DQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2lu
dGVsL3NvY2ZwZ2FfYWdpbGV4LmR0c2kNCmIvYXJjaC9hcm02NC9ib290L2R0cy9pbnRlbC9zb2Nm
cGdhX2FnaWxleC5kdHNpDQppbmRleCBlMzAwMzMwLi5hYzFiMjQyIDEwMDY0NA0KLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9pbnRlbC9zb2NmcGdhX2FnaWxleC5kdHNpDQorKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4LmR0c2kNCkBAIC0zMDksNiArMzA5LDEw
IEBADQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MHhmZmI4MDAwMCAweDEwMDA+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgcmVnLW5hbWVzID0gIm5hbmRfZGF0YSIsICJkZW5hbGlf
cmVnIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MCA5NyA0PjsNCisg
ICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xrbWdyIEFHSUxFWF9OQU5EX0NMSz4s
DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNsa21nciBBR0lMRVhfTkFORF9Y
X0NMSz4sDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNsa21nciBBR0lMRVhf
TkFORF9FQ0NfQ0xLPjsNCisgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gIm5h
bmQiLCAibmFuZF94IiwgImVjYyI7DQogICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8
JnJzdCBOQU5EX1JFU0VUPiwgPCZyc3QNCk5BTkRfT0NQX1JFU0VUPjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAgICAgICAgICAgICAgfTsNCg0K

