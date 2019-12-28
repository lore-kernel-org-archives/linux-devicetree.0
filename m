Return-Path: <SRS0=t0cN=2S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B3EC2D0C3
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Dec 2019 02:54:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F22D207E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Dec 2019 02:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eD08jS+X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbfL1CyX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Dec 2019 21:54:23 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:60158 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725957AbfL1CyX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Dec 2019 21:54:23 -0500
X-UUID: 6f8a195f94a94c1db1db6633e7a40227-20191228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=DuK72F7gBZXvEYq3y3vW4ZuOMFEZduG7ni5TClqn+Jw=;
        b=eD08jS+XMS6lxdLuWJZUq3UTil5RDa6ktIO9N6cibeIztxAFTT91MQJ8FSGMYEwZRUx1ccjQdhYxp65Iiyo2l90x/StMH8+yc9K2K46nu0dKpdtVKOcwYKOL4zkpxR/J6MfJpSfAaNsl7azmsCuv/wVjc2l+pTtUsY8FVYfcUuU=;
X-UUID: 6f8a195f94a94c1db1db6633e7a40227-20191228
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1593761629; Sat, 28 Dec 2019 10:54:16 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Sat, 28 Dec
 2019 10:53:43 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 28 Dec 2019 10:54:44 +0800
Message-ID: <1577501595.21256.8.camel@mhfsdcap03>
Subject: Re: [PATCH v3 3/6] phy: amlogic: Add Amlogic A1 USB2 PHY Driver
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Hanjie Lin <hanjie.lin@amlogic.com>
CC:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Date:   Sat, 28 Dec 2019 10:53:15 +0800
In-Reply-To: <1577428606-69855-4-git-send-email-hanjie.lin@amlogic.com>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
         <1577428606-69855-4-git-send-email-hanjie.lin@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7D6A139BDF8753CECA92F2F08A4142A8071CBE782207FE70DB2AA7114E397CFB2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

T24gRnJpLCAyMDE5LTEyLTI3IGF0IDE0OjM2ICswODAwLCBIYW5qaWUgTGluIHdyb3RlOg0KPiBU
aGlzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIFVTQjIgUEhZIGZvdW5kIGluIHRoZSBBbWxvZ2ljIEEx
IFNvQyBGYW1pbHkuDQo+IA0KPiBJdCBzdXBwb3J0cyBob3N0IG1vZGUgb25seS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEhhbmppZSBMaW4gPGhhbmppZS5saW5AYW1sb2dpYy5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IFl1ZSBXYW5nIDx5dWUud2FuZ0BhbWxvZ2ljLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3BoeS9hbWxvZ2ljL3BoeS1tZXNvbi1nMTJhLXVzYjIuYyB8IDkzICsrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspLCAy
OSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9hbWxvZ2ljL3Bo
eS1tZXNvbi1nMTJhLXVzYjIuYyBiL2RyaXZlcnMvcGh5L2FtbG9naWMvcGh5LW1lc29uLWcxMmEt
dXNiMi5jDQo+IGluZGV4IDkwNjVmZmMuLmE1NjQ3NDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
cGh5L2FtbG9naWMvcGh5LW1lc29uLWcxMmEtdXNiMi5jDQo+ICsrKyBiL2RyaXZlcnMvcGh5L2Ft
bG9naWMvcGh5LW1lc29uLWcxMmEtdXNiMi5jDQo+IEBAIC0xNDYsMTEgKzE0NiwxNyBAQA0KWy4u
Ll0NCj4gKwlwcml2LT5zb2NfaWQgPSAoZW51bSBtZXNvbl9zb2NfaWQpb2ZfZGV2aWNlX2dldF9t
YXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0KPiArDQo+ICAJcHJpdi0+cmVnbWFwID0gZGV2bV9yZWdt
YXBfaW5pdF9tbWlvKGRldiwgYmFzZSwNCj4gIAkJCQkJICAgICAmcGh5X21lc29uX2cxMmFfdXNi
Ml9yZWdtYXBfY29uZik7DQo+ICAJaWYgKElTX0VSUihwcml2LT5yZWdtYXApKQ0KPiAgCQlyZXR1
cm4gUFRSX0VSUihwcml2LT5yZWdtYXApOw0KPiAgDQo+IC0JcHJpdi0+Y2xrID0gZGV2bV9jbGtf
Z2V0KGRldiwgInh0YWwiKTsNCj4gLQlpZiAoSVNfRVJSKHByaXYtPmNsaykpDQo+IC0JCXJldHVy
biBQVFJfRVJSKHByaXYtPmNsayk7DQo+ICsJaWYgKHByaXYtPnNvY19pZCA9PSBNRVNPTl9TT0Nf
RzEyQSkgew0KPiArCQlwcml2LT5jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAieHRhbCIpOw0KPiAr
CQlpZiAoSVNfRVJSKHByaXYtPmNsaykpDQo+ICsJCQlyZXR1cm4gUFRSX0VSUihwcml2LT5jbGsp
Ow0KPiArCX0NCkhvdyBhYm91dCB1c2UgZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCksIHRoZW4gbWFr
ZSBpdCBhcyBvcHRpb25hbCBjbG9jaw0KYWxzbyBpbiBkdC1iaW5kaW5nDQo+ICANCg0KPiAgDQoN
Cg==

