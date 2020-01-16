Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MIME_BASE64_TEXT,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCFCC47409
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 02:56:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F4C72465A
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 02:56:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oRAd9PJN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729476AbgAPC4p (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 21:56:45 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:22993 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729057AbgAPC4o (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 21:56:44 -0500
X-UUID: caf87e9e076b4a4e92e206d6a5b6c2c0-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=l3wpXk/uhyCXKXXtWKjWF1p9bNTWnEdUHRhkP+uqsEM=;
        b=oRAd9PJNDWPZ+Bt7oHyrdILizsirn8o0jSP+HO6gWsVWqilulzOg6s+Qk3wuohKXWugLhlpe/63g7Uq3rBanXG2ufnP4Ipbk543KPoixNljJoarPG+W23CLQ4n4R4IVXmfwqDWJEeMzoz7TL0+FFDAxi4M4vOrgfc9VMTknLcmE=;
X-UUID: caf87e9e076b4a4e92e206d6a5b6c2c0-20200116
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1369943095; Thu, 16 Jan 2020 10:56:39 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 10:56:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 Jan 2020 10:57:26 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v10 1/4] dt-binding: eeprom: at24: add vcc-supply property
Date:   Thu, 16 Jan 2020 10:56:34 +0800
Message-ID: <20200116025637.3524-2-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200116025637.3524-1-bibby.hsieh@mediatek.com>
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SW4gc29tZSBwbGF0Zm9ybXMsIHRoZXkgZGlzYWJsZSB0aGUgcG93ZXItc3VwcGx5IG9mIGVlcHJv
bSBkdWUNCnRvIHBvd2VyIGNvbnN1bXB0aW9uIHJlZHVjdGlvbi4gVGhpcyBwYXRjaCBhZGQgdmNj
LXN1cHBseSBwcm9wZXJ0eS4NCg0KU2lnbmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5Lmhz
aWVoQG1lZGlhdGVrLmNvbT4NClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2VlcHJvbS9hdDI0
LnlhbWwgfCA0ICsrKysNCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQoNCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXByb20vYXQyNC55YW1sDQpp
bmRleCBlODc3ODU2MGQ5NjYuLmMwNGEzYjhhNmViYSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZXByb20vYXQyNC55YW1sDQorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjQueWFtbA0KQEAgLTE2Nyw2ICsxNjcs
MTAgQEAgcHJvcGVydGllczoNCiAgICAgbWluaW11bTogMQ0KICAgICBtYXhpbXVtOiA4DQogDQor
ICB2Y2Mtc3VwcGx5Og0KKyAgICBkZXNjcmlwdGlvbjoNCisgICAgICBwaGFuZGxlIG9mIHRoZSBy
ZWd1bGF0b3IgdGhhdCBwcm92aWRlcyB0aGUgc3VwcGx5IHZvbHRhZ2UuDQorDQogcmVxdWlyZWQ6
DQogICAtIGNvbXBhdGlibGUNCiAgIC0gcmVnDQotLSANCjIuMTguMA0K

