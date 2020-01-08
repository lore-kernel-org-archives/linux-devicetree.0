Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BB3C00523
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 06:45:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF6302075D
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 06:45:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ubeiuVfx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgAHGpf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 01:45:35 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:8986 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725908AbgAHGpe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 01:45:34 -0500
X-UUID: 202beb45ec1a4f53918319c7e9b9bed8-20200108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=b7MxCRV4c6ykzn8P/QIeDE9UBQhBmdDMdpvNNPeFj2M=;
        b=ubeiuVfxidbd1YW6ZkmN7Zryv/T/LXX1IcKl+yhv7wFwFbTOB5/O2Gun69M7jfARdEagWLi55P+Mdwm05wOVM1V5tslQTvCGNjsHNDMnmHZW+2NMCJGvGhi1w1dngPR6mUsuPVblIeG4CGk2atVHgVp2d9/ONx17v0RDpJiBmMg=;
X-UUID: 202beb45ec1a4f53918319c7e9b9bed8-20200108
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 868151829; Wed, 08 Jan 2020 14:45:30 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 Jan 2020 14:45:28 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 8 Jan 2020 14:43:55 +0800
Message-ID: <1578465928.29698.21.camel@mtkswgap22>
Subject: Re: [RFC] MAX_RESERVED_REGIONS hard-coded value
From:   Miles Chen <miles.chen@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        <devicetree@vger.kernel.org>
Date:   Wed, 8 Jan 2020 14:45:28 +0800
In-Reply-To: <CAL_JsqLgMJty+EgzEV-AfyWM7mKzWyB0X4ohxk5FUksMLcSL3w@mail.gmail.com>
References: <CAA2QUqKK+XcR5oqpZPrMNnQmgk=BV7s05UR7Efc2kCcYUs8=2w@mail.gmail.com>
         <CAL_JsqLgMJty+EgzEV-AfyWM7mKzWyB0X4ohxk5FUksMLcSL3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FF3FEFE389535A95AD79E6BDD602FB771E8620F5781F3A6F244333A4452F69F72000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGksDQoNCk9uIFR1ZSwgMjAyMC0wMS0wNyBhdCAxNToxMyAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6DQo+IE9uIE1vbiwgSmFuIDYsIDIwMjAgYXQgMTI6MDUgUE0gRGFuaWVsZSBBbGVzc2FuZHJl
bGxpDQo+IDxkYW5pZWxlLmFsZXNzYW5kcmVsbGlAZ21haWwuY29tPiB3cm90ZToNCj4gPg0KPiA+
IEhpLA0KPiA+DQo+ID4gSSdtIHVzaW5nIGEgRGV2aWNlIFRyZWUgd2l0aCBtb3JlIHRoZW4gMzIg
cmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMgYW5kDQo+ID4gSSdtIHNlZWluZyB0aGUgZm9sbG93aW5n
IGVycm9yIHdoaWxlIGJvb3RpbmcgdGhlIEtlcm5lbDoNCj4gPiBbICAgIDAuMDAwMDAwXSBPRjog
cmVzZXJ2ZWQgbWVtOiBub3QgZW5vdWdoIHNwYWNlIGFsbCBkZWZpbmVkIHJlZ2lvbnMuDQo+IA0K
PiBIb3cgbWFueSBkbyB5b3UgaGF2ZT8gSXMgdGhhdCBEVCBhdmFpbGFibGUgc29tZXdoZXJlPw0K
PiANCj4gPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhpcyBpcyBkdWUgdG8gdGhlIGhhcmQt
Y29kZWQgdmFsdWUgb2YNCj4gPiBNQVhfUkVTRVJWRURfUkVHSU9OUyBpbiBkcml2ZXJzL29mL29m
X3Jlc2VydmVkX21lbS5jDQo+ID4NCj4gPiBHb29nbGluZyBhcm91bmQsIEkgZm91bmQgdGhpcyBv
bGQgZGlzY3Vzc2lvbiBbMV0gaW4gd2hpY2ggTWlsZXMNCj4gPiBzdWdnZXN0cyB0byBhZGQgYSBD
T05GSUdfTUFYX09GX1JFU0VSVkVEX1JFR0lPTlMga2NvbmZpZyBvcHRpb24gdG8NCj4gPiBjb25m
aWd1cmUgTUFYX1JFU0VSVkVEX1JFR0lPTlMuIFJvYiByZXBsaWVkIHRvIE1pbGVzJyBlbWFpbCBz
YXlpbmcNCj4gPiB0aGF0IGhlIHdvdWxkIHByZWZlciBNQVhfUkVTRVJWRURfUkVHSU9OUyB0byBi
ZSBkeW5hbWljLiBIb3dldmVyLA0KPiA+IGxhdGVyIGluIHRoZSB0aHJlYWQsIGl0IGxvb2tzIGxp
a2UgbWFraW5nIE1BWF9SRVNFUlZFRF9SRUdJT05TIGR5bmFtaWMNCj4gPiBwb3NlcyBzb21lIGlt
cGxlbWVudGF0aW9uIGlzc3VlcyBbMl0uIEF0IHRoYXQgcG9pbnQgdGhlIGRpc2N1c3Npb24NCj4g
PiBzZWVtZWQgdG8gaGF2ZSBzdG9wcGVkLg0KPiANCj4gTm90IHN1cmUgd2hhdCB0aGUgcHJvYmxl
bSB3YXMgYXMgdGhlcmUncyBubyBjb2RlLCBidXQgSSdkIGd1ZXNzIHRoZQ0KPiBhcnJheSBhbGxv
YyBhbmQgcG9wdWxhdGluZyBoYXZlIHRvIGJlIGRvbmUgbGF0ZXIgKHBlcmhhcHMgaW4NCj4gdW5m
bGF0dGVuaW5nKS4NCg0KSSBtaXNzZWQgbXkgZHJhZnQgcGF0Y2guDQoNCkZyb20gd2hhdCBJIHJl
Y2FsbCwgdGhlIHByb2JsZW0gSSBoYWQgdGhhdCB0aW1lIGlzIHRoYXQNCmVhcmx5X2luaXRfZmR0
X3NjYW5fcmVzZXJ2ZWRfbWVtKCkgaXMgY2FsbGVkIGJlZm9yZSBwYWdpbmdfaW5pdCgpLiBTbyBJ
DQpjYW5ub3QgYWxsb2NhdGUgYWNjZXNzaWJsZSBtZW1vcnkgaW4gZWFybHlfaW5pdF9mZHRfc2Nh
bl9yZXNlcnZlZF9tZW0oKS4NCg0KRm9yIGV4YW1wbGU6IGFhcmNoNjQgc2V0dXBfYXJjaCgpDQpz
ZXR1cF9hcmNoKCkNCnsNCiAgICBtZW1ibG9ja19pbml0KCk7IC8qIGVhcmx5X2luaXRfZmR0X3Nj
YW5fcmVzZXJ2ZWRfbWVtKCkgaXMgY2FsbGVkICovDQogICAgcGFnaW5nX2luaXQoKTsgLyogbWFw
IG1lbW9yeSAqLw0KfQ0KDQo+IA0KPiA+IElzIHRoZXJlIGFueSBjaGFuY2UgZm9yIHRoZSBwYXRj
aCBwcm9wb3NlZCBieSBNaWxlcyB0byBiZSByZWNvbnNpZGVyZWQ/DQo+IA0KPiBBIGtjb25maWcg
b3B0aW9uIHdvdWxkIHN0aWxsIGJlIG15IDNyZCBjaG9pY2UgYWZ0ZXIgZHluYW1pY2FsbHkNCj4g
YWxsb2NhdGluZyB0aGUgYXJyYXkgb3IganVzdCBncm93aW5nIHRoZSBmaXhlZCBhcnJheSBzaXpl
Lg0KDQpOb3Qgc3VyZSBob3cgbWFueSBvZiByZXNlcnZlIG1lbW9yeSByZWdpb25zIERhbmllbGUg
aGFzLiBJbiBteSBjYXNlLA0Kd2UgZ3JvdyB0aGUgTUFYX1JFU0VSVkVEX1JFR0lPTlMgdG8gNjQg
KDN4IHVzZWQpIGFuZCB3ZSBhcmUgc3RpbGwgdHJ5aW5nDQp0byBzdXBwcmVzcyB0aGUgYW1vdW50
IG9mIHJlc2VydmVkIG1lbW9yeSB0byBmaXQNCk1BWF9SRVNFUlZFRF9SRUdJT05TPTMyLg0KDQoN
Cg0KdGhhbmtzLA0KTWlsZXMNCj4gDQo+IFJvYg0KDQo=

