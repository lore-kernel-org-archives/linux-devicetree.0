Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DE7C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 22:52:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73E4C24672
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 22:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BEn+7nHR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="BDBM3Xvq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfLSWwK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 17:52:10 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:42992 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726911AbfLSWwK (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Dec 2019 17:52:10 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6C0E840642;
        Thu, 19 Dec 2019 22:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576795929; bh=h8TZC0NnqMLRqPbdJX5XHDER6I+mJEayWMTvUQwfZl0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=BEn+7nHROU9zDbQEjONIcLmpgmXdWQ40JPPdcgACa0/FCgvoRSbD+hzny47fLYkYs
         B7YwG9GPzKDudWQAl1LgQVqQohz1ZK4hT9DJz4Z9sltNO6tKdxHpXPtbv2vo7FI2pW
         y/Yzce78fglhIVCgSv9vsZ2fJ6C6tWfvV4liArynpiEVFGFG9E//RnZTltzazS+A02
         REFrM3telZY+JX0cMXF+nGAjzKLnKj8js1FQcf+QKxFeG3c2hrUrJrIq4TPxQZp1bL
         oSSpCXu7BWgiZB3Xjx8q407wWVuvmve1OmXh/PZBG8iVB7ZwbSm2A7xqBf7q9goMoL
         K43uq5VQ6AOOg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 576A9A008B;
        Thu, 19 Dec 2019 22:52:09 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 19 Dec 2019 14:51:23 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 19 Dec 2019 14:51:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtEMOOM71UQBKdt3lF/P3JF2dGG8RKYa8t1bpiZHh1bgyQfytOH0jfPDpsR6uXZ9o8J113ZeE/BApz+JexsFhcpDjKiTaH4Ec7g+nZJYu9/s1NYhgPID6UxBlXOZ8lfSfN5oT1r6MluYXqfhLDLjrNgAYQMNbUzrTcmF62IiB7NGpv6UZ2b0zPzM9oMeFoqVW0/Ow66OH/s/ICaNWivpTJjIO5s8+Ou347Ll/u/DOXopBtI5JvCMohNWDM/4OJuuKaczNQLr4Z5uHmelbclFq5YbKkLJqD/YUp9IS1ZFb3mPNdwrc7jfZo+rnM70C3qynOiGpWK/z2cyJmVAtM+zoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8TZC0NnqMLRqPbdJX5XHDER6I+mJEayWMTvUQwfZl0=;
 b=Ts7857DqDdjrJ+hCenN6qlRq8BT6HUoSod9aJRCiHeA9R/MHzOvQ45zYD/uGiXpB7Ntma1Tm8EI8rlrREK6HhQweuCzZyCZdHzBl+wuw7KgSirzWqe10fWosG/XDwUjp48NxfWkgibWUCB1Q9T1sVPhG1NqXKwh7urTtST+NnGpH6+PP00GAUeEhzlc0BQAwvvVf1rlZVPqnPrvAWEQcRoHjWijxWdV7LqeSMZ3JBQOjVTixkDRBuNVt9nd8Rl+vsGbpAnRjeX7v7wSrW7OMybaemLxFykGlS2nulEsEzGakLi4wHdD95cGRtXl5M+6rREdGPYGNS4fvoXQbVbknxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8TZC0NnqMLRqPbdJX5XHDER6I+mJEayWMTvUQwfZl0=;
 b=BDBM3Xvq65QZGb67yXlZWzog9u2RLMTrQYJOlH2tvC5fRUdfYQhZD0B/uBMpVx9nM6Hkripbqzc51h3arcFkodLZycPju/YOlpBPOsqMaQHsbycHsBKkzU9PG5NM2jaZZzh9dD+5a6YRC5KqKiGsPcK5qUh6PavHs1/qM5/Ebsg=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0150.namprd12.prod.outlook.com (10.174.53.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Thu, 19 Dec 2019 22:51:21 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2538.019; Thu, 19 Dec 2019
 22:51:21 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 13/14] usb: devicetree: dwc3: Add property to disable
 mult TRB fetch
Thread-Topic: [RFC PATCH 13/14] usb: devicetree: dwc3: Add property to disable
 mult TRB fetch
Thread-Index: AQHVsJb46NEi1uYe2UuKB8LR+8hjAae2KKoAgADtFgCAAJBPAIAKbNgAgAAJkwA=
Date:   Thu, 19 Dec 2019 22:51:21 +0000
Message-ID: <b48e59f9-5339-b1c9-cc16-604900bd1cc4@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <b791f032edb8e6a739c342dbd0d2d5faa66ddfb8.1576118671.git.thinhn@synopsys.com>
 <87mubyvtuh.fsf@kernel.org>
 <6193f738-03ac-51b5-cdf0-d9b252a50146@synopsys.com>
 <87d0cswvs9.fsf@kernel.org> <20191219221704.GA29965@bogus>
In-Reply-To: <20191219221704.GA29965@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3c9f3d3-7454-4617-cc2d-08d784d5f7b7
x-ms-traffictypediagnostic: CY4PR1201MB0150:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0150E3437C9B230A194C1816AA520@CY4PR1201MB0150.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(376002)(39860400002)(346002)(136003)(189003)(199004)(54094003)(107886003)(2616005)(31686004)(6506007)(186003)(26005)(71200400001)(4326008)(6512007)(478600001)(8676002)(81166006)(66476007)(76116006)(66946007)(66446008)(81156014)(66556008)(64756008)(86362001)(8936002)(316002)(31696002)(5660300002)(36756003)(6486002)(2906002)(110136005)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0150;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: avOvkayf+E94T4S3oSixeekO4nhbyMD9AVz6bRjGzbb4naIAoq5IruJKAo4yWaGugzB7nMlNMCU7ppQgvLi/Dw6Bs3HwFW86JIO1K81+27YSR0i1F59Z1D2/9mtyIaemgCBGNCFtQmLebAg8aB9k3XifRB48u+WnNe+pDoEgd1yO3aXAJbm8fCfpZnMJ9fQOwAX6ajvFLnvbONKVwtAbve22QldljKq4MRH9mtVEt9SNLanB06n9oxV/IqOgPdrh6SEWXDFtqa7Ib0jjri8vOa8OCCbPLmiJUQUoxrVZZ2VZrAzwrsFjBcILIg3wdmgwashl8IEbd0tVA8bZZ/R85BafPvUUYEoa7tzYwF7WiHyVOeeZCwhUdr+FJp4SYA4XhnWkyok6Dix5KRHxR7pW2u3KYAzocouUHUShyXIR4cBZfqrKPzrJgjT/MXU+EVcMXcgQRXnBD0FS1Z+bTkmuzvzS5y+bD835hMzIKP6bVkiZPy135x/k4Kh0Kb/rS4WI
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6D43BF522FE184FAAC97FE9A9940BFB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c9f3d3-7454-4617-cc2d-08d784d5f7b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 22:51:21.3583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rGO3s/norauJLl9IS5tjQPQd1r0njkS3NBEIs7YAFlI3WvA2hRS+5wRmIBkMHG6FROeKtJRR/gYAKbNoWlQD5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0150
X-OriginatorOrg: synopsys.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGksDQoNClJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBGcmksIERlYyAxMywgMjAxOSBhdCAwOTow
NDo1NEFNICswMjAwLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4+Pj4gVGhpbmggTmd1
eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3cml0ZXM6DQo+Pj4+PiBEV0NfdXNiMzIg
aGFzIGEgZmVhdHVyZSB3aGVyZSBpdCBjYW4gaXNzdWUgbXVsdGlwbGUgVFJCIGZldGNoIHJlcXVl
c3RzLg0KPj4+Pj4gQWRkIGEgbmV3IHByb3BlcnR5IHRvIGxpbWl0IGFuZCBvbmx5IGRvIG9ubHkg
c2luZ2xlIFRSQiBmZXRjaCByZXF1ZXN0Lg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFRo
aW5oIE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gICAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dCB8IDIgKysNCj4+Pj4+
ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4+Pj4+IGluZGV4
IGZmMzVmYTZkZTJlYi4uMjlkNmY5YjFmYzcwIDEwMDY0NA0KPj4+Pj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4+Pj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4+Pj4gQEAgLTEwOCw2
ICsxMDgsOCBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPj4+Pj4gICAgIC0gc25wcyxudW0tdHJi
LXByZWZldGNoOiBtYXggdmFsdWUgdG8gZG8gVFJCcyBjYWNoZSBmb3IgRFdDX3VzYjMyLiBUaGUg
dmFsdWUNCj4+Pj4+ICAgIAkJCWNhbiBiZSBmcm9tIDEgdG8gRFdDX1VTQjMyX0NBQ0hFX1RSQlNf
UEVSX1RSQU5TRkVSLg0KPj4+Pj4gICAgCQkJRGVmYXVsdCB2YWx1ZSBpcyBEV0NfVVNCMzJfQ0FD
SEVfVFJCU19QRVJfVFJBTlNGRVIuDQo+Pj4+PiArIC0gc25wcyxkaXMtbXVsdC10cmItZmV0Y2g6
IHNldCB0byBpc3N1ZSBvbmx5IHNpbmdsZSBUUkIgZmV0Y2ggcmVxdWVzdCBpbg0KPj4+Pj4gKwkJ
CURXQ191c2IzMi4NCj4+Pj4gdHdvIHF1ZXN0aW9uczoNCj4+Pj4NCj4+Pj4gLSBob3cgaXMgdGhp
cyBkaWZmZXJlbnQgZnJvbSBwYXNzaW5nIDEgdG8gdGhlIHByZXZpb3VzIERUIGJpbmRpbmcNCj4+
PiBUaGUgcHJldmlvdXMgRFQgYmluZGluZyBpcyByZWxhdGVkIHRvIHRoZSBudW1iZXIgVFJCcyB0
byBjYWNoZSB3aGlsZQ0KPj4+IHRoaXMgb25lIGlzIHJlbGF0ZWQgdG8gd2hldGhlciB0aGUgY29u
dHJvbGxlciB3aWxsIHNlbmQgbXVsdGlwbGUNCj4+PiAoaW50ZXJuYWwpIGZldGNoIGNvbW1hbmRz
IHRvIGZldGNoIHRoZSBUUkJzLg0KPj4+DQo+Pj4+IC0gZG8gd2Uga25vdyBvZiBhbnlib2R5IGhh
dmluZyBpc3N1ZXMgd2l0aCBtdWx0aS10cmIgcHJlZmV0Y2g/DQo+Pj4gTm8sIHdlIGFkZGVkIHRo
aXMgZm9yIHZhcmlvdXMgaW50ZXJuYWwgdGVzdHMuDQo+PiBXZSByZWFsbHkgYSBiZXR0ZXIgd2F5
IGZvciB5b3UgZ3V5cyB0byBoYXZlIHlvdXIgdGVzdCBjb3ZlcmFnZSBlbmFibGVkDQo+PiB3aXRo
IHVwc3RyZWFtIGtlcm5lbC4gSSB3b25kZXIgaWYgRFQgZ3V5cyB3b3VsZCBhY2NlcHQgYSBzZXQg
b2YgYmluZGluZ3MNCj4+IG1hcmtlZCBhcyAiZm9yIHRlc3RpbmcgcHVycG9zZXMiLiBJbiBhbnkg
Y2FzZSwgd2UgcmVhbGx5IG5lZWQgdG8gZW5hYmxlDQo+PiBTaWxpY29uIFZhbGlkYXRpb24gd2l0
aCB1cHN0cmVhbSBrZXJuZWwuDQo+IFdlbGwsIGFueXRoaW5nIHdvdWxkIGJlIGJldHRlciB0aGFu
IHRoZSBlbmRsZXNzIHN0cmVhbSBvZiBuZXcNCj4gcHJvcGVydGllcy4gSW5jbHVkZSAndGVzdC1t
b2RlJyBpbiB0aGUgcHJvcGVydHkgbmFtZXMgd291bGQgYmUgZmluZSBJDQo+IGd1ZXNzLg0KPg0K
DQpHZW5lcmFsbHkgdGhlIHByb3BlcnRpZXMgYXJlIGZvciBzb21lIHF1aXJrcyBvciBjb25maWd1
cmF0aW9ucyB0aGF0IHRoZSANCmNvbnRyb2xsZXIgbXVzdCB1c2UgdG8gd29yayBwcm9wZXJseSBh
bmQgbm90IGZvciBkZWJ1Z2dpbmcgcHVycG9zZXMuIA0KVW5mb3J0dW5hdGVseSwgdGhpcyBsaXN0
IGNhbiBiZSBsb25nLi4NCg0KPiBIb3dldmVyLCB3aHkgZG8gdGhleSBuZWVkIHRvIGJlIGluIERU
IHJhdGhlciB0aGFuIG1vZHVsZSBwYXJhbXMgb3INCj4gZGVidWdmcyBzZXR0aW5ncz8gQ2hhbmdp
bmcgYXQgcnVudGltZSBvciByZWxvYWRpbmcgdGhlIG1vZHVsZSBpcyBhDQo+IGJldHRlciBleHBl
cmllbmNlIHRoYW4gZWRpdHRpbmcgYSBEVCBhbmQgcmVib290aW5nLg0KPg0KPiBSb2INCg0KSW50
ZXJuYWxseSwgb3VyIHRvb2wgY2FuIGRlYnVnIGRpZmZlcmVudCBwcm9wZXJ0aWVzIGFzIGlmIHRo
ZXkgYXJlIA0KbW9kdWxlIHBhcmFtZXRlcnMuIFRoZXkgY2FuIGJlIGNoYW5nZWQgYXQgcnVudGlt
ZS4gU2V0dGluZyBwcm9wZXJ0aWVzIGlzIA0Kb25lIG9mIHRoZSBvcHRpb25zIHdoaWNoIHdlIGNh
biBjb25maWd1cmUgd2l0aG91dCB0YW1wZXJpbmcgbXVjaCBvZiB0aGUgDQpleGlzdGluZyBjb2Rl
Lg0KDQpCUiwNClRoaW5oDQoNCg==
