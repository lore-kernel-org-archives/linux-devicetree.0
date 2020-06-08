Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91001C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 04:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57AD22076A
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 04:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="crS6o1FT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nVOJp7ao"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgFHEcu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 00:32:50 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:58126 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725945AbgFHEct (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 8 Jun 2020 00:32:49 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E9CBB40523;
        Mon,  8 Jun 2020 04:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1591590769; bh=dmKUXWt12TJfURyy/y9N3eWj60KEkWTYQ7+2JnV2UHQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=crS6o1FTuO2xofSMo9xAbgIeq/Rp0r+LmO6i+GBlNjt63o1G21AeErOELukjko4dd
         pGTAQzP490dFLyVWpD/0mYtu/2efAvd+Gvt6Ibyb12chn7szM16sgeCuPVUN1/Mh1E
         VmV+gmGbg+LkUo2CgfRuR5cZu1Z8kzJPugg22/g5SlD4/KVZmo0IXWf2VgbwRqIKlz
         qTvnaHIOQgdgBPSSinQHBEOpU9Nsmxa7+JKQ5AmEXgOw7YHe/DGeRRUkLxjoiPX/Fa
         dZKRqDT5T4Hzx3Yn0YhylOgEAp9UmJcATZ2hCleRNUc7pIuinQP2cqftoD/MM4RpHy
         t6RuDoSSEx/6g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 57CA4A0071;
        Mon,  8 Jun 2020 04:32:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; spf=pass (mailfrom) smtp.mailfrom=synopsys.com (client-ip=104.47.38.59; helo=nam02-bl2-obe.outbound.protection.outlook.com; envelope-from=joglekar@synopsys.com; receiver=<UNKNOWN>)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="nVOJp7ao";
        dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (mail-bl2nam02lp2059.outbound.protection.outlook.com [104.47.38.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B16E7400E8;
        Mon,  8 Jun 2020 04:32:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAzkPXFw1WLVezCHHDZqhONpvDaF8rxDRm827xF+jxlcOdNQb60hto5m3BkMXJg7nk/Tm3fjxzLACgAE778XTWWbmdqCRdXAbrW1OwrlYcBwb3gRY7g6VSFyQ3Dfmpu7TaanO7uNOeB7ctStQIbCEp81svmw5OWVMOKgCDn52xrYEL/rAp6y/nI2ptHNC0dQM1bWE8Nwdhrf+GMOtaW2k1z4fWA+tTVcPCfh4lbW+xKStHX5wsMgjr67qlNGucO4DqSJ/BVHmQn0VnpHGvi/ZUySYVdIdMEW95e9brviZBHcoaBxSitlsjOYHcU/Dvyou82UzYKaYSY2yPnI6cDtjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmKUXWt12TJfURyy/y9N3eWj60KEkWTYQ7+2JnV2UHQ=;
 b=PyoXH4Aftzktsg4oGvChQRoV2reAsYQUz25XwqdNtbjDokvODOAl6cZxPv7h5x24WFAZmJclJ6owfik11eqWw0x3aCIq4YevL08INfz41DJ8AAVadvro+YgAwZy1JNW85M4K8CJ4xun3qvwLXTkits3pu+sgBJiLf9i8LYQ5B/PhRgbe1YF8oRwj4YkQbzXnDu9sdLd1y1HKsP04CeA8uNlotsHeTuCCKMVNdWCydt89P8rXKMZTViBsinIpbqYQmsMRnMzqPYxSxl5E+0d/D/nkCwOSepqP2+HOMDS4UCD4CJfTimUdJEz/UMh92tjn5KO2Bqn2qlTljZtffXnahg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmKUXWt12TJfURyy/y9N3eWj60KEkWTYQ7+2JnV2UHQ=;
 b=nVOJp7ao17GFUZfQka9rwmjJ9LA5KWTNnGEytORQiIBaVj+nAyr4D0So4ICZRBOHqUfke33/V/q9TQnrPvkJzrXW35d7hAt0e9iJYsPEY+OTa2J5RkJIvtp0O9NpoEewDoqm84Q5cKmu0ynSihVkML7ZwJiswPaKAZ0qld+l4po=
Received: from CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 04:32:44 +0000
Received: from CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467]) by CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467%5]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 04:32:44 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 0/4] Add logic to consolidate TRBs for Synopsys xHC
Thread-Topic: [PATCH v3 0/4] Add logic to consolidate TRBs for Synopsys xHC
Thread-Index: AQHWNBOcKSGY3EC5WEe37t+laBwpCKjOM4yA
Date:   Mon, 8 Jun 2020 04:32:44 +0000
Message-ID: <ba1eb639-7c58-c2b2-1bd9-dacec5d1092b@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
In-Reply-To: <cover.1590415123.git.joglekar@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [198.182.52.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5edae7be-96af-4226-d0f4-08d80b64fd63
x-ms-traffictypediagnostic: CH2PR12MB4152:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB41524A3E0919D4B798D96F29A4850@CH2PR12MB4152.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jxHTo3rlI98gYhqEAy3jCXujPabdZ/ucb37uJOyxOliVV/AVbZLuzsvDCNHdLDjOXm6EhGpL+MEIC0yA3Muvcia8DGFplGCs8gNMIyP64ulT/CoMQ9qWjdw7F34/nFN1AJJv/od92WmUoZrjmBj/VSAe1CK1HMCUOJJUwvDlFDpzUetx2zFo69O4BxgRCLOqhU2qZ8SI48RzQbEZY64CAyIoK/WXLrtSUAvQP1DGOazcclGVNjKgBeLtPifYesx5XwnpMxippfGszne7txik7dzBxcojApBLWVR4yKzDTVgYSLJmKAYUw2ThZ3e5gTe6NDQGzHqGszZjSTEnJq8gjQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4311.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(136003)(39850400004)(366004)(478600001)(110136005)(8676002)(6506007)(8936002)(107886003)(53546011)(316002)(2616005)(4326008)(83380400001)(26005)(6512007)(6486002)(66556008)(66946007)(5660300002)(64756008)(66446008)(66476007)(2906002)(31696002)(31686004)(71200400001)(76116006)(91956017)(86362001)(186003)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: laCPPajmjlJY2w45KmM1jyT3HPTZv8852rNxS17KdTO+Y0LINYkDBnChjXPVFy7PIqRHFYL/6uhd6cpe+7YkK5A7/f4KCjTdu6ln7UBLtQq/Xlv7o79Txyk8mJiUzBdhz6PIhFduFWxRDzHpEe2qY7LyNliik0FqIpdTkglFnG4N4NCGDGn2NLFypaj2nSYZvMmfwSeiMwHRP12PtCFK6BSwpFqawFOcxs7UkE+PcY8pRibZ+i9vHxCs31ZSJZ91HFjFdDJUtdNoUB0bDq9W0YGOQ486ooKj2hj8hkZ+HOSlnjiHyI0VwDI8zqSAYOtGNa54xYgEeFA2hvnICyyH7NxDRtNYuDZt+Mgjqs+SpjSV0RfyuBUx4DsVyMqohWP9H8kP1tSyg1uV+suPw1jELu9xwH7TgQVIGuHflCEJFYGP9tVOHe4LKOvuJXGsTjp81F7ud2fBDBf00PiCBlJxL7VOzUh91frd12n0mAjshdo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D14AE32B3E61347AE977CC5C23DCA45@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5edae7be-96af-4226-d0f4-08d80b64fd63
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 04:32:44.7592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y3B8313ahc0FaaQmylMfcMDx/99zTEa8zPLoBs3bK8VCTSTXSEwWMoE1P32kBcmWAGKnvEI/9AVNVq5uyZ9s2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGkgTWF0aGlhcywNCiAgIFdpbGwgdGhpcyBiZSBhZGRlZCB0byB5b3VyIG5leHQgYnJhbmNoID8N
Ck9uIDUvMjcvMjAyMCA0OjEwIFBNLCBUZWphcyBKb2dsZWthciB3cm90ZToNCj4gVGhlIFN5bm9w
c3lzIHhIQyBoYXMgYW4gaW50ZXJuYWwgVFJCIGNhY2hlIG9mIHNpemUgVFJCX0NBQ0hFX1NJWkUg
Zm9yDQo+IGVhY2ggZW5kcG9pbnQuIFRoZSBkZWZhdWx0IHZhbHVlIGZvciBUUkJfQ0FDSEVfU0la
RSBpcyAxNiBmb3IgU1MgYW5kIDgNCj4gZm9yIEhTLiBUaGUgY29udHJvbGxlciBsb2FkcyBhbmQg
dXBkYXRlcyB0aGUgVFJCIGNhY2hlIGZyb20gdGhlDQo+IHRyYW5zZmVyIHJpbmcgaW4gc3lzdGVt
IG1lbW9yeSB3aGVuZXZlciB0aGUgZHJpdmVyIGlzc3VlcyBhIHN0YXJ0DQo+IHRyYW5zZmVyIG9y
IHVwZGF0ZSB0cmFuc2ZlciBjb21tYW5kLg0KPiANCj4gRm9yIGNoYWluZWQgVFJCcywgdGhlIFN5
bm9wc3lzIHhIQyByZXF1aXJlcyB0aGF0IHRoZSB0b3RhbCBhbW91bnQgb2YNCj4gYnl0ZXMgZm9y
IGFsbCBUUkJzIGxvYWRlZCBpbiB0aGUgVFJCIGNhY2hlIGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVh
bCB0bw0KPiAxIE1QUy4gT3IgdGhlIGNoYWluIGVuZHMgd2l0aGluIHRoZSBUUkIgY2FjaGUgKHdp
dGggYSBsYXN0IFRSQikuDQo+IA0KPiBJZiB0aGlzIHJlcXVpcmVtZW50IGlzIG5vdCBtZXQsIHRo
ZSBjb250cm9sbGVyIHdpbGwgbm90IGJlIGFibGUgdG8NCj4gc2VuZCBvciByZWNlaXZlIGEgcGFj
a2V0IGFuZCBpdCB3aWxsIGhhbmcgY2F1c2luZyBhIGRyaXZlciB0aW1lb3V0IGFuZA0KPiBlcnJv
ci4NCj4gDQo+IFRoaXMgcGF0Y2ggc2V0IGFkZHMgbG9naWMgdG8gdGhlIFhIQ0kgZHJpdmVyIHRv
IGRldGVjdCBhbmQgcHJldmVudCB0aGlzDQo+IGZyb20gaGFwcGVuaW5nIGFsb25nIHdpdGggdGhl
IHF1aXJrIHRvIGVuYWJsZSB0aGlzIGxvZ2ljIGZvciBTeW5vcHN5cw0KPiBIQVBTIHBsYXRmb3Jt
Lg0KPiANCj4gQmFzZWQgb24gTWF0aGlhcydzIGZlZWRiYWNrIG9uIHByZXZpb3VzIGltcGxlbWVu
dGF0aW9uIHdoZXJlIGNvbnNvbGlkYXRpb24NCj4gd2FzIGRvbmUgaW4gVFJCIGNhY2hlLCB3aXRo
IHRoaXMgcGF0Y2ggc2VyaWVzIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBkb25lDQo+IGR1cmluZyBt
YXBwaW5nIG9mIHRoZSBVUkIgYnkgY29uc29saWRhdGluZyB0aGUgU0cgbGlzdCBpbnRvIGEgdGVt
cG9yYXJ5DQo+IGJ1ZmZlciBpZiB0aGUgU0cgbGlzdCBidWZmZXIgc2l6ZXMgd2l0aGluIFRSQl9D
QUNIRV9TSVpFIGlzIGxlc3MgdGhhbiBNUFMuDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYyOg0KPiAg
LSBNb2RpZmllZCB0aGUgeGhjaV91bm1hcF90ZW1wX2J1ZmZlciBmdW5jdGlvbiB0byB1bm1hcCBk
bWEgYW5kIGNsZWFyDQo+ICAgIHRoZSBkbWEgZmxhZw0KPiAgLSBSZW1vdmVkIFJGQyB0YWcNCj4g
DQo+IENoYW5nZXMgc2luY2UgdjE6DQo+ICAtIENvbW1lbnRzIGZyb20gR3JlZyBhcmUgYWRkcmVz
c2VkIG9uIFtQQVRDSCA0LzRdIGFuZCBbUEFUQ0ggMS80XQ0KPiAgLSBSZW5hbWVkIHRoZSBwcm9w
ZXJ0eSBhbmQgcXVpcmsgYXMgaW4gb3RoZXIgcGF0Y2hlcyBiYXNlZCBvbiBbUEFUQ0ggMS80XQ0K
PiANCj4gVGVqYXMgSm9nbGVrYXIgKDQpOg0KPiAgIGR0LWJpbmRpbmdzOiB1c2I6IEFkZCBkb2N1
bWVudGF0aW9uIGZvciBTRyB0cmIgY2FjaGUgc2l6ZSBxdWlyaw0KPiAgIHVzYjogeGhjaTogU2V0
IHF1aXJrIGZvciBYSENJX1NHX1RSQl9DQUNIRV9TSVpFX1FVSVJLDQo+ICAgdXNiOiBkd2MzOiBB
ZGQgZGV2aWNlIHByb3BlcnR5IHNnbC10cmItY2FjaGUtc2l6ZS1xdWlyaw0KPiAgIHVzYjogeGhj
aTogVXNlIHRlbXBvcmFyeSBidWZmZXIgdG8gY29uc29saWRhdGUgU0cNCj4gDQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0ICAgICB8ICAgNCArDQo+ICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi14aGNpLnR4dCB8ICAgMyAr
DQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMiArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMiArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtaGFwcy5jICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2hvc3QuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNiArLQ0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLXBjaS5j
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKw0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNp
LXBsYXQuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKw0KPiAgZHJpdmVycy91c2IvaG9z
dC94aGNpLXJpbmcuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gIGRyaXZlcnMv
dXNiL2hvc3QveGhjaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTM1ICsrKysrKysr
KysrKysrKysrKysrKw0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLmggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDUgKw0KPiAgMTEgZmlsZXMgY2hhbmdlZCwgMTY1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+IA0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQogVGVqYXMgSm9n
bGVrYXINCg==
