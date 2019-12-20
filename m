Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C60C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 23:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0615520866
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 23:53:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KWVfeLG7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="TLxSmadg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfLTXxC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 18:53:02 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:41518 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726462AbfLTXxC (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Dec 2019 18:53:02 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2341340514;
        Fri, 20 Dec 2019 23:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576885981; bh=I85nqu2G6SejCkM4Lnl3Rfg2curiX7zVTpjS5SmwS7o=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=KWVfeLG7bYGPJjT7XOLLcIz1A1Z9U9RELywVzKkYUju+lbP9PP6lqg37yCrjfouwN
         KpV64Ska/k1szYU80fT0SwsrcnsS8MkmrNosUAGLEqfjOEwe7X7C/QfUTCdw/yGp6t
         ZGPTgkxpyMxWO2ASmuTEDsY0Y8USiam772jcx/qG5F1GDi+OqKwzaKjmRM35K9k8X0
         YIVx89qPLFLfEElRwrFOdtGWs96BW+fVzNNveptPg/FDK46axvp8BRKwB2i5Bil0gw
         XgktnL9QWzTeTvri4UXnvlepw00Vh0rUiqj2GdApUi0A9h/kmseziJ09ZHsTQqi1cG
         +DOUXwQFiTqkQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id D9930A00CB;
        Fri, 20 Dec 2019 23:52:52 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 20 Dec 2019 15:52:12 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 20 Dec 2019 15:52:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5NNegXlRC6HrQxj9eUGKcV9l/Zx3Dj0IsBRCgxYPqQBD715SN7OzC+RJQs2zZCaGULAWH/LwR1qTqOUCQW33wnzrHSowkzxKyaIMAEtoPSbvzRgyFpCdFZP8NU8/qpede7Lly4yQw111GMCmUg/5ixThM6ZRClvlCvlzLnAs7/jLXCcBVWESYkcUJUKKhhQDski2eWwQ5NhgG/Mf0P8oJu6ucjXdTXh+g+GJZqdLGdL3sICP1Vyq19eTIzQu3TTXavt4I1HTNmnbcuXo0yzPARfze7auwXazomRY7WRF6e87vJ9iy8luVu9xB+HFfBMV9dM7/j71yQvVoEv+NB0mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I85nqu2G6SejCkM4Lnl3Rfg2curiX7zVTpjS5SmwS7o=;
 b=aZnRLU9eM3sQdRH37ny5nRmNAyCn0MdQAE5qB6bvlP6SxrZeYTsVc1uGbXh2akAPFgDR2xzhdgxk3yZokMtHsg2YWsdlazWzF7yQkAW0jWK1kgXDv9lL8ogJYjt7OocJwl8Kzb9qu5RC9NLfsmNwYHkfa1BpLdiEFKw9QKnMSWfkLdYXlAPuBesdRcLfpDeu74C93f2r5hqlI2TfDx63PTgk2cr5WzQFssu0rv3ZQla6tcuUcchY0USCeQFbNYrWPrUlVQyjuvV3sj0glNpsidDsvE53lXeSO/r45/t9jvVpFqVYvFmlpGLtE0iWIFq4QrGPqjADz586eSwpGifiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I85nqu2G6SejCkM4Lnl3Rfg2curiX7zVTpjS5SmwS7o=;
 b=TLxSmadgfrcVwnPGPqH0PojmTDGb2QuIGvoRHHJ5M73NU47m5xPS/O9PpsS0zi/qNhTtZPQX+KK7/HrEQH0Z4F3h8X7fMlViXGtiyAvHhdRcLSDrzP3wZernyZen2r6rgQyxdD4YOUZcqlEmx/g2SOQ9smyBrGmKZ6tkAZdm9T8=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0214.namprd12.prod.outlook.com (10.174.54.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Fri, 20 Dec 2019 23:52:10 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2538.019; Fri, 20 Dec 2019
 23:52:10 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 13/14] usb: devicetree: dwc3: Add property to disable
 mult TRB fetch
Thread-Topic: [RFC PATCH 13/14] usb: devicetree: dwc3: Add property to disable
 mult TRB fetch
Thread-Index: AQHVsJb46NEi1uYe2UuKB8LR+8hjAae2KKoAgADtFgCAAJBPAIAKbNgAgAAJkwCAAYcQAIAAHEOA
Date:   Fri, 20 Dec 2019 23:52:10 +0000
Message-ID: <75877f65-0b2c-fa71-22df-1199a5463814@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <b791f032edb8e6a739c342dbd0d2d5faa66ddfb8.1576118671.git.thinhn@synopsys.com>
 <87mubyvtuh.fsf@kernel.org>
 <6193f738-03ac-51b5-cdf0-d9b252a50146@synopsys.com>
 <87d0cswvs9.fsf@kernel.org> <20191219221704.GA29965@bogus>
 <b48e59f9-5339-b1c9-cc16-604900bd1cc4@synopsys.com>
 <CAL_JsqKrRSk0NhqZ5tcus23rWfBzHcxBs8ZR6qv2qR4z_NrD_A@mail.gmail.com>
In-Reply-To: <CAL_JsqKrRSk0NhqZ5tcus23rWfBzHcxBs8ZR6qv2qR4z_NrD_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c92cfa5-3847-4f13-a80f-08d785a7a0f7
x-ms-traffictypediagnostic: CY4PR1201MB0214:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0214D879F9DCBC9180D7EBF0AA2D0@CY4PR1201MB0214.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 025796F161
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(39860400002)(366004)(396003)(136003)(199004)(54094003)(189003)(81156014)(8936002)(36756003)(71200400001)(31696002)(64756008)(8676002)(66556008)(66446008)(2616005)(186003)(66476007)(6486002)(478600001)(107886003)(31686004)(53546011)(316002)(6506007)(26005)(86362001)(5660300002)(4326008)(76116006)(54906003)(110136005)(6512007)(66946007)(81166006)(966005)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0214;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xGz93+Yol7EiQbQsXe808w5GTGBaTtReONY3qd/iTYI1ONpEKRNb8hXXF6kSI+pWPMa7oMHhqcNJyyma4jh+8thHbNuFH7axzPsW4DqFcW8V9LNx+/75MzzZqHsTOj9DD+cr8SlPE4aDEpch/gk1YqGBLv8bKZK8Adbm94YXfMW4C5ibdnhNIhSQEqWjMsceGter1a1BeYb5z/XIIzFYYPWqAdbo0MetpscHntzkzaU9H/h19ftuYjXsvJhHfPXnlLwYMIykgfh6lNEDzcSh/kcIWSimACt/1iRgdbL2DDbubq5nWnWNwj4s+Uen4lcD9Buw4jwm3fjDnvQhLK1DFP70nTBBOJpBDGq1fmqbdU8GH75ruY3v7PGCPLHdBw+S5HoVL496/hfd4kfpeYa0memz1K6gHkYBYLywQhxWyiYE8jdPPSU5qK62IneFbt+aLZLxVTTLc+1FQzYltfZpLBPZ+5JP2LZtxbXb9r5UWPnM7/AE05xMTqlKGwowm/jGv/kVUUBFfadrHfe900Vv+u9T16U3X4nqxtcUU749oHs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86775EB208986E419129DF0046AC0E70@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c92cfa5-3847-4f13-a80f-08d785a7a0f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2019 23:52:10.1402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AhGqWcdx15LwKeL8QHp5iNDUBvfeSJkg3Uxj4JyGzVQbiuXlr2lyN6E4lYnILXJd85v/I96MMqXPdskMCVggtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0214
X-OriginatorOrg: synopsys.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGksDQoNClJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBUaHUsIERlYyAxOSwgMjAxOSBhdCAzOjUy
IFBNIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+PiBI
aSwNCj4+DQo+PiBSb2IgSGVycmluZyB3cm90ZToNCj4+PiBPbiBGcmksIERlYyAxMywgMjAxOSBh
dCAwOTowNDo1NEFNICswMjAwLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+Pj4+IEhpLA0KPj4+Pg0K
Pj4+PiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4+
Pj4+PiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4+
Pj4+Pj4gRFdDX3VzYjMyIGhhcyBhIGZlYXR1cmUgd2hlcmUgaXQgY2FuIGlzc3VlIG11bHRpcGxl
IFRSQiBmZXRjaCByZXF1ZXN0cy4NCj4+Pj4+Pj4gQWRkIGEgbmV3IHByb3BlcnR5IHRvIGxpbWl0
IGFuZCBvbmx5IGRvIG9ubHkgc2luZ2xlIFRSQiBmZXRjaCByZXF1ZXN0Lg0KPj4+Pj4+Pg0KPj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5vcHN5cy5jb20+DQo+
Pj4+Pj4+IC0tLQ0KPj4+Pj4+PiAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9kd2MzLnR4dCB8IDIgKysNCj4+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykNCj4+Pj4+Pj4NCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2R3YzMudHh0DQo+Pj4+Pj4+IGluZGV4IGZmMzVmYTZkZTJlYi4uMjlkNmY5
YjFmYzcwIDEwMDY0NA0KPj4+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL2R3YzMudHh0DQo+Pj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4+Pj4+Pj4gQEAgLTEwOCw2ICsxMDgsOCBAQCBPcHRp
b25hbCBwcm9wZXJ0aWVzOg0KPj4+Pj4+PiAgICAgIC0gc25wcyxudW0tdHJiLXByZWZldGNoOiBt
YXggdmFsdWUgdG8gZG8gVFJCcyBjYWNoZSBmb3IgRFdDX3VzYjMyLiBUaGUgdmFsdWUNCj4+Pj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgY2FuIGJlIGZyb20gMSB0byBEV0NfVVNCMzJf
Q0FDSEVfVFJCU19QRVJfVFJBTlNGRVIuDQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIERlZmF1bHQgdmFsdWUgaXMgRFdDX1VTQjMyX0NBQ0hFX1RSQlNfUEVSX1RSQU5TRkVSLg0K
Pj4+Pj4+PiArIC0gc25wcyxkaXMtbXVsdC10cmItZmV0Y2g6IHNldCB0byBpc3N1ZSBvbmx5IHNp
bmdsZSBUUkIgZmV0Y2ggcmVxdWVzdCBpbg0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICBEV0Nf
dXNiMzIuDQo+Pj4+Pj4gdHdvIHF1ZXN0aW9uczoNCj4+Pj4+Pg0KPj4+Pj4+IC0gaG93IGlzIHRo
aXMgZGlmZmVyZW50IGZyb20gcGFzc2luZyAxIHRvIHRoZSBwcmV2aW91cyBEVCBiaW5kaW5nDQo+
Pj4+PiBUaGUgcHJldmlvdXMgRFQgYmluZGluZyBpcyByZWxhdGVkIHRvIHRoZSBudW1iZXIgVFJC
cyB0byBjYWNoZSB3aGlsZQ0KPj4+Pj4gdGhpcyBvbmUgaXMgcmVsYXRlZCB0byB3aGV0aGVyIHRo
ZSBjb250cm9sbGVyIHdpbGwgc2VuZCBtdWx0aXBsZQ0KPj4+Pj4gKGludGVybmFsKSBmZXRjaCBj
b21tYW5kcyB0byBmZXRjaCB0aGUgVFJCcy4NCj4+Pj4+DQo+Pj4+Pj4gLSBkbyB3ZSBrbm93IG9m
IGFueWJvZHkgaGF2aW5nIGlzc3VlcyB3aXRoIG11bHRpLXRyYiBwcmVmZXRjaD8NCj4+Pj4+IE5v
LCB3ZSBhZGRlZCB0aGlzIGZvciB2YXJpb3VzIGludGVybmFsIHRlc3RzLg0KPj4+PiBXZSByZWFs
bHkgYSBiZXR0ZXIgd2F5IGZvciB5b3UgZ3V5cyB0byBoYXZlIHlvdXIgdGVzdCBjb3ZlcmFnZSBl
bmFibGVkDQo+Pj4+IHdpdGggdXBzdHJlYW0ga2VybmVsLiBJIHdvbmRlciBpZiBEVCBndXlzIHdv
dWxkIGFjY2VwdCBhIHNldCBvZiBiaW5kaW5ncw0KPj4+PiBtYXJrZWQgYXMgImZvciB0ZXN0aW5n
IHB1cnBvc2VzIi4gSW4gYW55IGNhc2UsIHdlIHJlYWxseSBuZWVkIHRvIGVuYWJsZQ0KPj4+PiBT
aWxpY29uIFZhbGlkYXRpb24gd2l0aCB1cHN0cmVhbSBrZXJuZWwuDQo+Pj4gV2VsbCwgYW55dGhp
bmcgd291bGQgYmUgYmV0dGVyIHRoYW4gdGhlIGVuZGxlc3Mgc3RyZWFtIG9mIG5ldw0KPj4+IHBy
b3BlcnRpZXMuIEluY2x1ZGUgJ3Rlc3QtbW9kZScgaW4gdGhlIHByb3BlcnR5IG5hbWVzIHdvdWxk
IGJlIGZpbmUgSQ0KPj4+IGd1ZXNzLg0KPj4+DQo+PiBHZW5lcmFsbHkgdGhlIHByb3BlcnRpZXMg
YXJlIGZvciBzb21lIHF1aXJrcyBvciBjb25maWd1cmF0aW9ucyB0aGF0IHRoZQ0KPj4gY29udHJv
bGxlciBtdXN0IHVzZSB0byB3b3JrIHByb3Blcmx5IGFuZCBub3QgZm9yIGRlYnVnZ2luZyBwdXJw
b3Nlcy4NCj4+IFVuZm9ydHVuYXRlbHksIHRoaXMgbGlzdCBjYW4gYmUgbG9uZy4uDQo+IHF1aXJr
cyBvciB0ZXN0aW5nPyBOb3cgSSdtIGNvbmZ1c2VkLCB3aGljaCBpcyBpdD8NCg0KSSB3YXMgcmVm
ZXJyaW5nIHRvIHRoZSBleGlzdGluZyBwcm9wZXJ0aWVzLCB0aGV5IGFyZSBuZWNlc3NhcnkgZm9y
IGEgDQp3b3JraW5nIGRldmljZS4gTm90aGluZyAiZXh0cmEiIHNvbGVseSBmb3IgZGVidWdnaW5n
IHB1cnBvc2VzLg0KDQpXaXRoIHRoZSBleGNlcHRpb24gZm9yIHRoZXNlIGNvdXBsZSBwcm9wZXJ0
aWVzIHJlbGF0ZWQgdG8gVFJCIGZldGNoaW5nIA0KaW4gdGhpcyBSRkMgc2VyaWVzLCB0aGV5IGFy
ZSBmb3IgdGVzdGluZyBvbmx5LiBSZWdhcmRsZXNzLCBJIGFncmVlZCB0byANCkZlbGlwZSBwcmV2
aW91c2x5IHRoYXQgd2UgY2FuIHJlbW92ZSB0aGVtLg0KDQoNCj4gSSdtIHN1cmUgSSd2ZSBzYWlk
IHRoaXMgYmVmb3JlIChmb3IgRFdDMyksIGJ1dCBpdCBpcyBiZXR0ZXIgdG8gaGF2ZSBhDQo+IGNv
bXBhdGlibGUgc3RyaW5nIGZvciBlYWNoIGltcGxlbWVudGF0aW9uICh1c3VhbGx5IGFuIFNvQykg
c28geW91IGNhbg0KPiBhZGRyZXNzIG5ldyBxdWlya3Mgd2l0aG91dCBhIGR0YiBjaGFuZ2UgYW5k
IGNvbnRpbnVhbGx5IGFkZGluZyBuZXcNCj4gcHJvcGVydGllcy4NCj4NCj4gUm9iDQoNClllcywg
eW91IG1lbnRpb25lZCBpdCBiZWZvcmUuIEl0IG1heSB3b3JrIG9uIFNvQywgYnV0IGl0IHdvbid0
IHdvcmsgZm9yIA0KUENJIGRldmljZXMuIFdlIGNhbid0IHVzZSBWSUQ6UElEIGVpdGhlciwgYmVj
YXVzZSB0aGUgSEFQUyBkZXZpY2VzIG9ubHkgDQpoYXZlIGEgc2V0IG9mIFZJRDpQSUQuDQoNClBs
ZWFzZSByZWZlciBiYWNrIHRvIGEgY291cGxlIGRpc2N1c3Npb25zIGJhY2s6DQoxKSBodHRwczov
L3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC11c2IvbXNnMTY0NDk0Lmh0bWwNCg0KVGhpcyBv
bmUgaXMgcmVsYXRlZCB0byBjYWRlbmNlJ3MsIGJ1dCBJIHRoaW5rIGl0J3MgcmVsZXZhbnQ6DQoy
KSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC11c2IvbXNnMTc1MTk5Lmh0bWwN
Cg0KVGhlcmUgbWF5YmUgbW9yZSBkaXNjdXNzaW9ucyBwcmV2aW91c2x5LCBidXQgSSBkb24ndCBo
YXZlIHRoZSBoaXN0b3J5IG9mIA0KYWxsIHRoZSBlbWFpbHMuDQoNCkJSLA0KVGhpbmgNCg0KDQo=
