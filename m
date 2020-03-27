Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8356AC43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 09:43:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C3C120716
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 09:43:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="U0oYIeV3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wSw3bLZy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgC0Jn2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 05:43:28 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:44306 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726165AbgC0Jn2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Mar 2020 05:43:28 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5B09BC0F99;
        Fri, 27 Mar 2020 09:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585302207; bh=yje/6p3VRM7gILAC9PmL8/xj8kqq9doFUjxCa8ICEMQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=U0oYIeV3KuKKYJMuEMPd5CnDrNZW+GhLJ7No6lTn5T3CPSAI2t/vcAG9k0o77jRMC
         uA6xMreBfTzZ4aXvh5jVmMNXgSMcrdAdaH56xXYXyzflnB0mTrmQbdrewWhAgZvDdm
         CbM2tWccAJ7LCANQe6d7NF4JZPvBGmr3iFmSBpbkOzh1Wa/NGEs/noqyp5XcL9QCmL
         mmVDMWGC57mk95P/PWsWRf5ZsFFNJyoy9QwPM8t4/SOeeUWCS6vCSF1+YLs0Hcbu+9
         EuwYlnEBDeXtvYrvWesKIBSIMZC7tbTb3VcPFhyilYHOUI491/UglCGnBVpiPotUj9
         E9rUM401HAHGQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1A4C3A006F;
        Fri, 27 Mar 2020 09:43:25 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 27 Mar 2020 02:43:24 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 27 Mar 2020 02:43:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4ROdKdfKO7100SbuHgiSmZOrZbU28pU7HnzWMgBeZSgVqlKXgnym3Q9ZIFvbsU71hsF8QgmFnFwOOABk9bfFpA7RFM1ko/1Y8B/91BPNAIk03YqJcSVJsJaqjKUjCz/cPgAxKaRJEhO/jUvHIg7VkW4pUN3Bt5Bwao8POKeDWL+ixs/wnHolk6XTPkJErY7/5AvSrNRSHTx9fZtos/zQZ5fDJHJmL58B20df0GRM1eZF/ZhkBSIn/z9QFmjWnwAtvST717lURgZAF4Eo9V93halMddrRPYBpGQD+X3C69COHU69v/oUQLCUDLE2RgS/cMt19fHIjmkDkuDPQZElxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yje/6p3VRM7gILAC9PmL8/xj8kqq9doFUjxCa8ICEMQ=;
 b=Xv91S4LVjTWXnmIqaINKZXAKuXfi+Y4VSPfQqhAWHs33o6ZDI3nfaxtXmDuLUQlee2FzhXNquSArqV0vA2jxnHzxzHxhQe0qhDKBIBFHYOU4iRAxGKKXZlJ2IfxeEC1c+d7/OlBvmBqxcxg1Jc7E8iFKSnMgIlybwmSoXUSc+emvZxiYOnKd0olUONZnbH4+mT4iF8jKaTlGnMh1bZh0DIQnbBuBzt268fYOOE5aaqE40/nn+Q2NusK8Zhsdb+1f8eFfi79BO5RnRBTNImiCoAYCSvXswC4fbGhQB5iR2wm4dIl1t2iE/MJDJ5tzyRTyrZe1IefTaB1jQ+5uGkEWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yje/6p3VRM7gILAC9PmL8/xj8kqq9doFUjxCa8ICEMQ=;
 b=wSw3bLZyapRM9Mmo55dQ7cFSpjJ/Imo1O/onyCNTJMW5ylt2akvp9PHsmOCEq2jrbedWHAV2ahZVN9Qnk9lbzBkL2N3o6lYCS990fa6A8HSDGGGbd07WPzQFFofVnVmGWTyUINafu9UVTnp9OiXuTrBA//G50NBiWxt0m0/89CM=
Received: from DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12)
 by DM6PR12MB3868.namprd12.prod.outlook.com (2603:10b6:5:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Fri, 27 Mar
 2020 09:43:23 +0000
Received: from DM6PR12MB4251.namprd12.prod.outlook.com
 ([fe80::65a9:e78c:7f63:81ab]) by DM6PR12MB4251.namprd12.prod.outlook.com
 ([fe80::65a9:e78c:7f63:81ab%6]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 09:43:23 +0000
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Greg KH <greg@kroah.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Fredrik Noring <noring@nocrew.org>,
        "Mathias Nyman" <mathias.nyman@intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Raul E Rangel <rrangel@chromium.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        "Marek Szyprowski" <m.szyprowski@samsung.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RESENDING RFC PATCH 0/4] Add logic to consolidate TRBs for
 Synopsys xHC
Thread-Topic: [RESENDING RFC PATCH 0/4] Add logic to consolidate TRBs for
 Synopsys xHC
Thread-Index: AQHWBBopbjB2gkcIzEC2bM2Y0BcPK6hcMBoA
Date:   Fri, 27 Mar 2020 09:43:23 +0000
Message-ID: <83732263-d8f0-760c-ca62-ec697d39ae30@synopsys.com>
References: <cover.1585297723.git.joglekar@synopsys.com>
 <20200327092826.GB1693819@kroah.com>
In-Reply-To: <20200327092826.GB1693819@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joglekar@synopsys.com; 
x-originating-ip: [198.182.52.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d819a7f4-38f2-4c1e-deb7-08d7d2334a7f
x-ms-traffictypediagnostic: DM6PR12MB3868:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3868ECC57154E6D311B1F192A4CC0@DM6PR12MB3868.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(136003)(376002)(346002)(39860400002)(2906002)(7416002)(316002)(31696002)(66476007)(66556008)(64756008)(66946007)(5660300002)(54906003)(4326008)(2616005)(66446008)(36756003)(6486002)(31686004)(71200400001)(186003)(107886003)(8676002)(8936002)(81166006)(81156014)(478600001)(76116006)(91956017)(53546011)(110136005)(26005)(6506007)(86362001)(6512007);DIR:OUT;SFP:1102;SCL:1;SRVR:DM6PR12MB3868;H:DM6PR12MB4251.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 818ZRJXdeQhyXQY97til3NXyZUdIHlEGNv+OW+EkcRq90BQbAh2H9eAMpLZguYKiQyZRaTKeYxt+AxjzxRT4iqBm7XzBWPphp3NQebWEgaErsMQbmOQzN/vWiExNo2k54GAp72lIF74G2jUZ2QuiZRJDrGybg9sw49A6MaF+3oUlOE9E3+/+ZLmNPhZkEIZzNdB6B3aE6GWW/XEhOU4GD1urf2WhxXSAOoO8XFrKSkjdxN93Nu3Cey283PtbaF2xprxCDzMZtOpsCoW++FiGzTMqpNOj0xHANaG/Hv1iqhO3J524t477L8Z8jFpGslk3bq75PT0rz2CBpG4FL++s+fwdMdA+ZCYZW8TWQ1QP4I084489F6ccAC+zoyPH4UTTMPFjYK4VWXr3H11RYsut6LjGeGcAunnOulxKP0HjRI6pd8XuN/XXhfbJFbZT0QAr
x-ms-exchange-antispam-messagedata: ThYZSuwAwR3V0RUxXChkzV62g9OgrkUK9TO4RnQ4jCJHGBCuv9ZU7FRnyXm1ypiUD+NFQkyXrOqyyeZARjQ/MU3P6WMw5oG3898MfJUQcQwAK/lYv6vvliR0rfy5iocC58xqfG0F1N1ztCRB8o/byg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <3552661C379E184D900DADC3749932F2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d819a7f4-38f2-4c1e-deb7-08d7d2334a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 09:43:23.0228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zneN8UkaZdvu/jp0UlJg9nC11DA/f1oVqR0oVtGRHDFQRfUmwBu4i9nm0eCbuOFn/NAD7ScvMULy3SNcPwARMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3868
X-OriginatorOrg: synopsys.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

T24gMy8yNy8yMDIwIDI6NTggUE0sIEdyZWcgS0ggd3JvdGU6DQo+IE9uIEZyaSwgTWFyIDI3LCAy
MDIwIGF0IDAyOjIyOjIzUE0gKzA1MzAsIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0KPj4gVGhlIFN5
bm9wc3lzIHhIQyBoYXMgYW4gaW50ZXJuYWwgVFJCIGNhY2hlIG9mIHNpemUgVFJCX0NBQ0hFX1NJ
WkUgZm9yDQo+PiBlYWNoIGVuZHBvaW50LiBUaGUgZGVmYXVsdCB2YWx1ZSBmb3IgVFJCX0NBQ0hF
X1NJWkUgaXMgMTYgZm9yIFNTIGFuZCA4DQo+PiBmb3IgSFMuIFRoZSBjb250cm9sbGVyIGxvYWRz
IGFuZCB1cGRhdGVzIHRoZSBUUkIgY2FjaGUgZnJvbSB0aGUNCj4+IHRyYW5zZmVyIHJpbmcgaW4g
c3lzdGVtIG1lbW9yeSB3aGVuZXZlciB0aGUgZHJpdmVyIGlzc3VlcyBhIHN0YXJ0DQo+PiB0cmFu
c2ZlciBvciB1cGRhdGUgdHJhbnNmZXIgY29tbWFuZC4NCj4+DQo+PiBGb3IgY2hhaW5lZCBUUkJz
LCB0aGUgU3lub3BzeXMgeEhDIHJlcXVpcmVzIHRoYXQgdGhlIHRvdGFsIGFtb3VudCBvZg0KPj4g
Ynl0ZXMgZm9yIGFsbCBUUkJzIGxvYWRlZCBpbiB0aGUgVFJCIGNhY2hlIGJlIGdyZWF0ZXIgdGhh
biBvciBlcXVhbCB0bw0KPj4gMSBNUFMuIE9yIHRoZSBjaGFpbiBlbmRzIHdpdGhpbiB0aGUgVFJC
IGNhY2hlICh3aXRoIGEgbGFzdCBUUkIpLg0KPj4NCj4+IElmIHRoaXMgcmVxdWlyZW1lbnQgaXMg
bm90IG1ldCwgdGhlIGNvbnRyb2xsZXIgd2lsbCBub3QgYmUgYWJsZSB0bw0KPj4gc2VuZCBvciBy
ZWNlaXZlIGEgcGFja2V0IGFuZCBpdCB3aWxsIGhhbmcgY2F1c2luZyBhIGRyaXZlciB0aW1lb3V0
IGFuZA0KPj4gZXJyb3IuDQo+Pg0KPj4gVGhpcyBwYXRjaCBzZXQgYWRkcyBsb2dpYyB0byB0aGUg
WEhDSSBkcml2ZXIgdG8gZGV0ZWN0IGFuZCBwcmV2ZW50IHRoaXMNCj4+IGZyb20gaGFwcGVuaW5n
IGFsb25nIHdpdGggdGhlIHF1aXJrIHRvIGVuYWJsZSB0aGlzIGxvZ2ljIGZvciBTeW5vcHN5cw0K
Pj4gSEFQUyBwbGF0Zm9ybS4NCj4+DQo+PiBCYXNlZCBvbiBNYXRoaWFzJ3MgZmVlZGJhY2sgb24g
cHJldmlvdXMgaW1wbGVtZW50YXRpb24gd2hlcmUgY29uc29saWRhdGlvbg0KPj4gd2FzIGRvbmUg
aW4gVFJCIGNhY2hlLCB3aXRoIHRoaXMgcGF0Y2ggc2VyaWVzIHRoZSBpbXBsZW1lbnRhdGlvbiBp
cyBkb25lDQo+PiBkdXJpbmcgbWFwcGluZyBvZiB0aGUgVVJCIGJ5IGNvbnNvbGlkYXRpbmcgdGhl
IFNHIGxpc3QgaW50byBhIHRlbXBvcmFyeQ0KPj4gYnVmZmVyIGlmIHRoZSBTRyBsaXN0IGJ1ZmZl
ciBzaXplcyB3aXRoaW4gVFJCX0NBQ0hFX1NJWkUgaXMgbGVzcyB0aGFuIE1QUy4NCj4+DQo+Pg0K
Pj4gVGVqYXMgSm9nbGVrYXIgKDQpOg0KPj4gICBkdC1iaW5kaW5nczogdXNiOiBBZGQgc25wcyxj
b25zb2xpZGF0ZS1zZ2wgJiBjb25zb2xpZGF0ZS1zZ2wNCj4+ICAgdXNiOiB4aGNpOiBTZXQgcXVp
cmsgZm9yIFhIQ0lfQ09OU09MSURBVEVfU0dfTElTVA0KPj4gICB1c2I6IGR3YzM6IEFkZCBkZXZp
Y2UgcHJvcGVydHkgY29uc29saWRhdGUtc2dsDQo+PiAgIHVzYjogeGhjaTogVXNlIHRlbXBvcmFy
eSBidWZmZXIgdG8gY29uc29saWRhdGUgU0cNCj4+DQo+PiBSZXNlbmRpbmcgYXMgJ3VtbGF1dCcg
aXMgbm90IGFjY2VwdGVkIGJ5IHNvbWUgc2VydmVycyBpbiBlbWFpbC4NCj4gDQo+IE9ubHkgcGF0
Y2ggNC80IHNlZW1zIHRvIGhhdmUgZ29uZSB0aHJvdWdoIDooDQo+IA0KDQpSZXNlbnQgdGhlIG1p
c3NpbmcgcGF0Y2hlcw0K
