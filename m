Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80A2C433E2
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 17:05:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDEA720771
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 17:05:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y9lsdwUm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PFljy1Mz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730449AbgGURFa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 13:05:30 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:41040 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728268AbgGURF3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jul 2020 13:05:29 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 979A2C00AE;
        Tue, 21 Jul 2020 16:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595350680; bh=6IEKf5IcZ4gel7f8CN3kjGa3YpRzkWLIMa6NCMNtwPo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Y9lsdwUmkmd8Yj42tN0w1/6OuxpFCx+Gruk9Ge8XJUuCBsoZYb2adUlvV2/6lPcci
         UcWcguwFlVf+3ADJtpPhjrBn5qxlLxJKNPeTD+g50PboptBDcsN7ZYL/P3AUxr+8Dr
         lC+Qc9MVaVpUzJcXOcUXH7wOqsqVc3p46MYl0HLWsR+fB/EisXSPEI2O0M44lK/92l
         CNUapYHTlFyBSwr6opGurBfNTtr7e4Je2q5QKTi7jkNUJm1uJq1d/SF7TX8fi54yrh
         uFLpAqlz9qT2a4xcn/Qv6HIbCGEJW2vNS7/HX034cbHG27+CLIyYUMfN3DMOTAWv97
         hVNg1DunlZbIQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 23058A005A;
        Tue, 21 Jul 2020 16:58:00 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9F4EE4014B;
        Tue, 21 Jul 2020 16:57:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="PFljy1Mz";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzyqOuZay3NXV7kbcmXpjiUdZL2xrgLC/uKAryH0VjderqmOFLHB+gmlmqofnOpue5pqXuYCiZH2EHBiF0pRO2RcF2NXtr3X1V++dkfEquHPMHIObCPBtAdFtizA7DA7WDibvC9TeaFg500I8ja4P1crYSmrCMz2jwgun6iv7XHxRe3UKAEG6c6cgV8Pq4Vs8ta+Omr+oI4h7lIdfMndmLf35zNCDrIHtYgGTGand8TJpZ2WMkZBbLJCQD+hyADS0RmHkdOjy8UMu2YuvwIgz7niYK5CGEeO+4XqW0WA9n91w7Dst8DzdM6X2lt2GM4c7e6jcZuhwSVOqauF7oEw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IEKf5IcZ4gel7f8CN3kjGa3YpRzkWLIMa6NCMNtwPo=;
 b=ebbEd4LgMCaGzHGGAIrd+mCC3fB8or62d1JWGh3UPV3BGTic2s7LComChKksNaammUzIyOvUO6St0pAfGDEmZpJFKH0OF8pd3MHpTfPBhPYaWl++34Q0FtZZNgSeKR1w1vdt/w1clhwLW71r1YGhLhnAyAUmCmWPUXlS7vRRLfBrJctrQlNzlna/20+8RGDilvz5WGmBeZz9XGD2cqxhOLC7PBjdqAm/kZyT3+cT/ptsnjR0pgM8iEmY4tgouF+buRIr7YGaPAmM6/Ha2tiekHMCpnhc4QZA7fW9V98k7pai7nyj4pw6Da+Cs92VTdMIfdLGnKWCoGA1JQ9luSdYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IEKf5IcZ4gel7f8CN3kjGa3YpRzkWLIMa6NCMNtwPo=;
 b=PFljy1Mz933eeP5WZP+Zp4700fOe7hYrqXsfLP3oOAKxhj1Gdt4+PtKG4bUB/QIJNGI1OoRHN8x1/gunpxeDPdAAx63y2/1dlognQedyhEDMgLZxaxq4gKY1qQOKqgYPzWC1B+/2ZxkLnElp0RtEAVE4mgjm6oaQT5k3c1h9Cs0=
Received: from BN8PR12MB3458.namprd12.prod.outlook.com (2603:10b6:408:44::32)
 by BN6PR1201MB0001.namprd12.prod.outlook.com (2603:10b6:404:a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Tue, 21 Jul
 2020 16:57:58 +0000
Received: from BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6]) by BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6%2]) with mapi id 15.20.3216.020; Tue, 21 Jul 2020
 16:57:58 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Topic: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Index: AQHWNBPIzVDQozhV20CqjRBnx+8J26j6PmiAgAAa/YCADhZwgIAJsAyAgAB4IAA=
Date:   Tue, 21 Jul 2020 16:57:58 +0000
Message-ID: <48f1764e-4383-a149-b93b-3851095394e7@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
 <83eba2e9f0069f20ccc94537e3b99cbaec209441.1590415123.git.joglekar@synopsys.com>
 <5534d9d6-5452-dade-e46e-f4b0910becdb@synopsys.com>
 <877dvhqh2e.fsf@kernel.org>
 <2f61133b-319d-80dc-f3f3-7e08e0228953@synopsys.com>
 <878sfdp5bk.fsf@kernel.org>
In-Reply-To: <878sfdp5bk.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.204.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df1453a2-fd58-45b9-3cfd-08d82d973880
x-ms-traffictypediagnostic: BN6PR1201MB0001:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1201MB0001C10C7325F92192BC7CFCA4780@BN6PR1201MB0001.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fBJQZBSgREdLkVfQ14TRP7hU9tYvsAlETSke9f7kEhRpYJbMKU4f5ZYU2KZ3SIhEk8T490xCOxzeoOGgdz3ZyIpwK5WjhWTY3TChvqdX6W0mmP8Xus4QAGTsY3aN87l+HT1AUnM9I6IB/xy9Q4O46jypZBkk0QHaqrNtBXwUzRe0+Nr5n4B5hjc6UBSksORIORP02gM10u4swoliZuPryfhDczv6vO1ZppS/2AIMl6CDlCWuADlq+npoIOfoXCxfdbwGbvxpL7Y/ysrh2dyV2e9eA5bd1TeaGTba0uB1gj1Jm932MSZXYx5Bmz03I64DImF2v7C8A7i0U+srH1I/Vg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3458.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(136003)(366004)(346002)(396003)(376002)(86362001)(2906002)(71200400001)(31696002)(26005)(55236004)(53546011)(6506007)(31686004)(66446008)(64756008)(76116006)(91956017)(66476007)(66556008)(6486002)(186003)(2616005)(66946007)(110136005)(83380400001)(4326008)(8676002)(36756003)(54906003)(6512007)(478600001)(8936002)(316002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: LQaX+6jFtJNZclDDwrXrfCqhDyWDitFLeJPdWJRrlwmJ95Jpw/wZvUbnfYQRz4TQN4+VbYaVKtdlch7+Kkf4upYSJZ/uwYYI+aYiG9LuCmdJN970UXTzh99YL3QPxI98J42HR/7H5c8qtdBjeiEitJklB2BuOBQZeRIFY3vip+rpSMe1umTV8D1r1zZKn1U7rRqdY7GNBiCxlTBkzpk7GK1Jpay2pNPE1jmgDctt1l+Qk2g3MebhwLuN4OjnWVNSnrTeXEKSJ3GNWQMgt+MIHebkOI9789kMjoBRhIeMwcWOHQGOc3F/TuzqD3AoIJoEBv/zqKdYxEDlqMCTTu4PcOn8hYSkhV0PGYbG8gYF8CRTyxnZVnHUi7ia/6ggidA7L6Hcnv/quOozHnrkmLgVxvxKwE3AvuoLHi6sItzwiUkpwzmW3iz2/8mVIH3tzC+1UE3V+vFwuLjphp3+OyT2Vpzf8OLalAe+xdUbaMF/lrVXQ1DvmeRpQncRcQ2AYfGP
Content-Type: text/plain; charset="utf-8"
Content-ID: <6ACF93066DF85C4B84E163ECC25953D8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3458.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1453a2-fd58-45b9-3cfd-08d82d973880
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 16:57:58.2705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibKGMl3/iPpsuCL4g4LnbYyE/ZdEgZBoauqNxgeN8VN3T9xIJSLJCzMuJSENnw44c6gQu57A4xdNSOPdL304SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0001
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGVsbG8sDQoNCk9uIDcvMjEvMjAyMCAzOjE3IFBNLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+IFRl
amFzIEpvZ2xla2FyIDxUZWphcy5Kb2dsZWthckBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4gDQo+
PiBIaSBSb2IsDQo+Pg0KPj4gT24gNy82LzIwMjAgMTI6MTMgUE0sIEZlbGlwZSBCYWxiaSB3cm90
ZToNCj4+Pg0KPj4+IEhpLA0KPj4+DQo+Pj4gVGVqYXMgSm9nbGVrYXIgPFRlamFzLkpvZ2xla2Fy
QHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+Pj4gQEAgLTk1LDYgKzk1LDEwIEBAIGludCBkd2Mz
X2hvc3RfaW5pdChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPj4+Pj4gIAlpZiAoZHdjLT51c2IyX2xwbV9k
aXNhYmxlKQ0KPj4+Pj4gIAkJcHJvcHNbcHJvcF9pZHgrK10gPSBQUk9QRVJUWV9FTlRSWV9CT09M
KCJ1c2IyLWxwbS1kaXNhYmxlIik7DQo+Pj4+PiAgDQo+Pj4+PiArCWlmIChkd2MtPnNnbF90cmJf
Y2FjaGVfc2l6ZV9xdWlyaykNCj4+Pj4+ICsJCXByb3BzW3Byb3BfaWR4KytdID0NCj4+Pj4+ICsJ
CQlQUk9QRVJUWV9FTlRSWV9CT09MKCJzZ2wtdHJiLWNhY2hlLXNpemUtcXVpcmsiKTsNCj4+Pj4+
ICsNCj4+Pj4+ICAJLyoqDQo+Pj4+PiAgCSAqIFdPUktBUk9VTkQ6IGR3YzMgcmV2aXNpb25zIDw9
My4wMGEgaGF2ZSBhIGxpbWl0YXRpb24NCj4+Pj4+ICAJICogd2hlcmUgUG9ydCBEaXNhYmxlIGNv
bW1hbmQgZG9lc24ndCB3b3JrLg0KPj4+Pj4NCj4+Pj4gRG9lcyB0aGlzIGltcGxlbWVudGF0aW9u
IGxvb2tzIGdvb2QgdG8geW91PyBSb2IgaGFzIHNvbWUgY29uY2VybmVkIG92ZXIgdGhlIERUIGVu
dHJpZXMsDQo+Pj4+IHlvdSBzdWdnZXN0ZWQgdXNpbmcgY29tcGF0aWJsZSBzdHJpbmcgd2l0aCB0
aGlzIHF1aXJrIGFkZGl0aW9uLg0KPj4+PiBDYW4geW91IHBsZWFzZSBicmllZiBhYm91dCBob3cg
eW91IHdvdWxkIGxpa2UgdG8gaGF2ZSB0aGlzIHF1aXJrIGltcGxlbWVudGVkPw0KPj4+PiBJIGNh
biBzZW5kIHRoZSB1cGRhdGVkIHBhdGNoLiBNeSBwYXRjaCBzZXJpZXMgaXMgcGVuZGluZyBmb3Ig
bWVyZ2UganVzdCBiZWNhdXNlIG9mIHRoZQ0KPj4+PiBEVCBhbmQgcXVpcmsgaXNzdWUuIENhbiB5
b3UgcGxlYXNlIGhlbHA/DQo+Pj4NCj4+PiBZZWFoLCB5b3UgbmVlZCB0byBnZXQgaW50byBhbiBh
Z3JlZW1lbnQgd2l0aCBSb2IgOi0pIEkgZG9uJ3QgbWluZCBoYXZpbmcNCj4+PiBleHRyYSBEVCBm
bGFncyBmb3IgdGhpbmdzIHdoaWNoIGNhbid0IGJlIGRldGVjdGVkIGluIHJ1bnRpbWUsIFJvYg0K
Pj4+IGRpc2FncmVlcy4NCj4+Pg0KPj4gVGhlIGNvbXBhdGlibGUgc3RyaW5nIGlzIG5vdCBzdWl0
YWJsZSBvcHRpb24gYXMgaXQgZG9lcyBub3Qgd29yayB3aXRoIHBsYXRmb3JtIGRyaXZlcnMNCj4+
IHdpdGggUENJIGJhc2VkIHN5c3RlbS4gQWxzbyBTeW5vcHN5cyBjb250cm9sbGVycyBJUCB2ZXJz
aW9uIHJlZ2lzdGVyIGlzIG5vdCB2aXNpYmxlIHRvIHhoY2kNCj4+IGRyaXZlciBhbmQgaGVuY2Ug
d2UgZG9uJ3QgaGF2ZSBzZXBhcmF0ZSBjb21wYXRpYmxlIHN0cmluZyBmb3IgZWFjaCBTeW5vcHN5
cyB2ZXJzaW9uIG9uIHRoZQ0KPj4geGhjaSBkcml2ZXIgc2lkZS4gDQo+PiBEdWUgdG8gd2hpY2gg
SSBkZXBlbmQgb24gRFQgZmxhZyBhZGRpdGlvbiBmb3IgdGhlIHF1aXJrLiBDYW4gd2UgYWRkIHRo
ZXNlIERUIGZsYWdzIGFuZCBxdWlyaz8NCj4gDQo+IEFzIEkgc2FpZCwgSSdtIHdlbGwgYXdhcmUg
b2YgdGhlIHNpdHVhdGlvbiByZWdhcmRpbmcgdXNhZ2Ugb2YgY29tcGF0aWJsZQ0KPiBzdHJpbmdz
IGFuZCB0aGUgZmFjdCB0aGF0IGR3YzMgbXVzdCB3b3JrIG9uIFBDSSBhbmQgbm9uLVBDSSBzeXN0
ZW1zIChJDQo+IHdyb3RlIHRoZSB0aGluZyBhcyBpdCBpcyBhZnRlciBhbGwpLiBUaGUgcGVyc29u
IGJsb2NraW5nIG5ldyBxdWlyayBmbGFncw0KPiBpcyBSb2IsIG5vdCBtZS4gWW91IG5lZWQgdG8g
Y29udmluY2UgUm9iIHRoYXQgdGhpcyBpcyB0aGUgd2F5IHRvIGdvLg0KPiANCkBGZWxpcGU6IFNv
cnJ5IGZvciBjb25mdXNpb24gaWYgYW55LCBwcmV2aW91cyBtYWlsIHdhcyBpbnRlbmRlZCBmb3Ig
Um9iIGFza2luZyBhYm91dCBoaXMgYXBwcm92YWwuDQoNCj4gUm9iLCBiYWxsJ3MgaW4geW91ciBj
b3VydC4gU29ycnkuPiANCkBSb2I6IEFzIEkgYW5kIEZlbGlwZSBoYXZlIG1lbnRpb25lZCBiZWZv
cmUsIGl0IGlzIHZlcnkgbXVjaCBuZWNlc3NhcnkgdG8gaGF2ZSBxdWlyayBmbGFncw0KZm9yIHRo
ZSBjdXJyZW50IGNoYW5nZXMgYXMgY29tcGF0aWJsZSBzdHJpbmcgd291bGQgbm90IGJlIGEgc29s
dXRpb24gZm9yIFBDSSBhbmQgbm9uLVBDSQ0Kc3lzdGVtcy4gQ2FuIHlvdSBwbGVhc2UgYXBwcm92
ZSB0aGlzIGNoYW5nZSA/IElmIHlvdSBoYXZlIGFueSBjb25jZXJuIGFib3V0IG5hbWluZyBvciBh
bnkNCm90aGVyIHRoaW5nLCBwbGVhc2UgbGV0IHVzIGtub3cuDQoNClRoYW5rcyAmIFJlZ2FyZHMs
DQogVGVqYXMgSm9nbGVrYXINCg==
