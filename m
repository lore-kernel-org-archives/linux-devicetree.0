Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CACC4D2E7
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:41:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60DB224822
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:41:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y0aZgO/a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="pRvIjbw4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbfLMUKL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 15:10:11 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:49024 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728997AbfLMUKK (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Dec 2019 15:10:10 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BE2D740587;
        Fri, 13 Dec 2019 20:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576267809; bh=EKOs3I3YGu7T1u2LS1nio6XYuqLar1avStji4lKwbsA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Y0aZgO/aAWI4kCGfuYO1xhYqGpOGg5KZMJksyG49wLuO3SFcmjhussRXWCo92BvlU
         yCl15/0IVSnsi3FI2VNzO1oB2h95DFWhVX5AaAAUGoOMRGGoERFib9D3OQ83xjSCQc
         UCdMtS7+Evl5TUWCT7j9Ey7p/4GlwfRUft3QcXASw0nmxnx9w9ZlM7e4UueCks21Gn
         ZuR6bNEHE8SEFx0q7Nma7hWzWR7YCbJ/ECuwFsJlbJh8ATe/nBn6XuwJVCkk8U8/cJ
         hnwK4rwBYegajHQoYqGQ5+aY/8Dmfa6IX3d59z0UHxXvR/NNObIIFUAwZOs9kUY29n
         ILybHgiB2NTpQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 747A4A0067;
        Fri, 13 Dec 2019 20:10:09 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 13 Dec 2019 12:10:09 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 13 Dec 2019 12:10:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grcdUHPtM67Fm0PpggOR819Cqik5cUntaMhQ4hiOazeDhY01s96vlaTlJVZHEfXiyNqxD6Y4/OWyphz7XSbdh3EWTjIO8lYkqrnVEWoiOtlXaHi2DXMiL3j0KwVZpqPKf/KrgAHLMyocwmSTjzlXIxu3kbqad9ZNwEQ9nQ+gXnoi1QV1HcItduM/lQwkM3SQMSwNryamYN4gRzGxiuGh/npMXfCnDV2Eu8EzLk2N5cqCRM3muj54XXgC6rv4708Ipx0SLNJIrgaUgCEobAGDZW7JkVg5WfS51fJXYHOhDGQcRW7Ep49ZUZP8jnTIOG5+zQpSOR5Mzim+3gEC6+P29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKOs3I3YGu7T1u2LS1nio6XYuqLar1avStji4lKwbsA=;
 b=PTtpAer78+UxIaMHu9HmrYeO+PN5Ob+OH2qYlCwkVYSuiLrpEC7pMNsywR4gURCrKrv/U+AdQOfYOJDIiCeZai2VEWotdZJpI3VJCGdMSflql7hYmKzNi5W2/H8O2dKEX8VFvbDkZ/mNijnn/Jqi5WwoFZmU/Wg9wO4Nc/1mIiZdf+2+c1HN/nmMdsaMqHBjIfa4034wU1/lzhYMOVB9o8WenRT/r1RWih5Alp8LzgLl9L90t9Ock5N/S/yq5mFYvoO8+IdUU4UA0NfBmvhxRbYGnEJwAxYfm6H+W2dRFNM24Ixdiwo3OQ6hBasUkMs2iGWM0lyPZeOViL+DYu9q3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKOs3I3YGu7T1u2LS1nio6XYuqLar1avStji4lKwbsA=;
 b=pRvIjbw4RzDFNRKEBrfUGykOwuqtrX1hMSUR6DH6amLvMpuTkOqDp9HUXBmApTx+MrxG7n0xw+nOOX3U+rLz10Bqk51FazyFn3hkkndkaMxuFt4B8DTThiD6LLzkm8zuYuc/JsES0BfrROhc9t7523tLWcuigsMVk+OTR91tGac=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0024.namprd12.prod.outlook.com (10.172.77.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Fri, 13 Dec 2019 20:10:08 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2516.018; Fri, 13 Dec 2019
 20:10:08 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 13/14] usb: devicetree: dwc3: Add property to disable
 mult TRB fetch
Thread-Topic: [RFC PATCH 13/14] usb: devicetree: dwc3: Add property to disable
 mult TRB fetch
Thread-Index: AQHVsJb46NEi1uYe2UuKB8LR+8hjAae2KKoAgADtFgCAAJBPAIAA22OA
Date:   Fri, 13 Dec 2019 20:10:07 +0000
Message-ID: <df526e74-12eb-b873-e093-760d1a11ea5a@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <b791f032edb8e6a739c342dbd0d2d5faa66ddfb8.1576118671.git.thinhn@synopsys.com>
 <87mubyvtuh.fsf@kernel.org>
 <6193f738-03ac-51b5-cdf0-d9b252a50146@synopsys.com>
 <87d0cswvs9.fsf@kernel.org>
In-Reply-To: <87d0cswvs9.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28ed5dae-8711-4668-e5e0-08d780087364
x-ms-traffictypediagnostic: CY4PR1201MB0024:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0024D23107031DA377DE1763AA540@CY4PR1201MB0024.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(376002)(396003)(136003)(366004)(54094003)(199004)(189003)(4326008)(71200400001)(186003)(2906002)(81156014)(2616005)(81166006)(8676002)(107886003)(31696002)(6512007)(36756003)(110136005)(86362001)(8936002)(316002)(64756008)(6506007)(6486002)(76116006)(5660300002)(26005)(66476007)(478600001)(66946007)(66446008)(31686004)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0024;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aP3St5uckRKKr4vB2EJao5wqq0p796/aWZMwp+6VoJ8l/ARGzBf+6yYrzQtAZx5XRYbYaa9AQ8Heu+Sbh2kaxU1QaUOSt47R81HI15T4oJjVtIkAuMEFO9aWIbWubex1NUhsxyj+/0DgqO6z85DBOZ0Rq2zgb+yM0EYvuJSCYwJsyVRCOovkAHFlZKaWA3OosoRmVqs5eErwz/t4sfw+V+7AjXAE8SHIVXvSWXlCaOcakM3gh70SFAIfqBetzkdcGokE/GlW5RHwbhDBmzLk5adScTS7i67HrOFQVLmqKF3kkCBY+g+BiXhrAD/V0vr+TRVhymKWnd1jDp3gFj5iMA/2ENuz5+yKwx7Td4tmtP8LV5pkyBljZWlhdladzTgYPKysuT9y52FF849pVoglgL4JNxz6NYi7E+p8dsu4QIpDPr0L+dpIAywPCJ4jWeMjQTWJfY33kjBL23kHtX9IGA0uyYHEUVL53PjgsxECJvDa/AssTnF3xzOJ1VetftKa
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEAEE5AF12BDCC46AB13698E5FC959F4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ed5dae-8711-4668-e5e0-08d780087364
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 20:10:07.8451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bb3e0ZAK8FFoLY2fKliRC7qMyQHgQHZ8JQNEmTsdb8MeAiV6R2KYa4JzJIyv0vcM0DqfVCkDwRlRi1CZtMmsfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0024
X-OriginatorOrg: synopsys.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

DQpIaSwNCg0KRmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBIaSwNCj4NCj4gVGhpbmggTmd1eWVuIDxU
aGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3cml0ZXM6DQo+Pj4gVGhpbmggTmd1eWVuIDxUaGlu
aC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3cml0ZXM6DQo+Pj4+IERXQ191c2IzMiBoYXMgYSBmZWF0
dXJlIHdoZXJlIGl0IGNhbiBpc3N1ZSBtdWx0aXBsZSBUUkIgZmV0Y2ggcmVxdWVzdHMuDQo+Pj4+
IEFkZCBhIG5ldyBwcm9wZXJ0eSB0byBsaW1pdCBhbmQgb25seSBkbyBvbmx5IHNpbmdsZSBUUkIg
ZmV0Y2ggcmVxdWVzdC4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDx0
aGluaG5Ac3lub3BzeXMuY29tPg0KPj4+PiAtLS0NCj4+Pj4gICAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dCB8IDIgKysNCj4+Pj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4+Pj4gaW5kZXggZmYzNWZhNmRlMmViLi4yOWQ2
ZjliMWZjNzAgMTAwNjQ0DQo+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy91c2IvZHdjMy50eHQNCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4+PiBAQCAtMTA4LDYgKzEwOCw4IEBAIE9wdGlvbmFsIHBy
b3BlcnRpZXM6DQo+Pj4+ICAgICAtIHNucHMsbnVtLXRyYi1wcmVmZXRjaDogbWF4IHZhbHVlIHRv
IGRvIFRSQnMgY2FjaGUgZm9yIERXQ191c2IzMi4gVGhlIHZhbHVlDQo+Pj4+ICAgIAkJCWNhbiBi
ZSBmcm9tIDEgdG8gRFdDX1VTQjMyX0NBQ0hFX1RSQlNfUEVSX1RSQU5TRkVSLg0KPj4+PiAgICAJ
CQlEZWZhdWx0IHZhbHVlIGlzIERXQ19VU0IzMl9DQUNIRV9UUkJTX1BFUl9UUkFOU0ZFUi4NCj4+
Pj4gKyAtIHNucHMsZGlzLW11bHQtdHJiLWZldGNoOiBzZXQgdG8gaXNzdWUgb25seSBzaW5nbGUg
VFJCIGZldGNoIHJlcXVlc3QgaW4NCj4+Pj4gKwkJCURXQ191c2IzMi4NCj4+PiB0d28gcXVlc3Rp
b25zOg0KPj4+DQo+Pj4gLSBob3cgaXMgdGhpcyBkaWZmZXJlbnQgZnJvbSBwYXNzaW5nIDEgdG8g
dGhlIHByZXZpb3VzIERUIGJpbmRpbmcNCj4+IFRoZSBwcmV2aW91cyBEVCBiaW5kaW5nIGlzIHJl
bGF0ZWQgdG8gdGhlIG51bWJlciBUUkJzIHRvIGNhY2hlIHdoaWxlDQo+PiB0aGlzIG9uZSBpcyBy
ZWxhdGVkIHRvIHdoZXRoZXIgdGhlIGNvbnRyb2xsZXIgd2lsbCBzZW5kIG11bHRpcGxlDQo+PiAo
aW50ZXJuYWwpIGZldGNoIGNvbW1hbmRzIHRvIGZldGNoIHRoZSBUUkJzLg0KPj4NCj4+PiAtIGRv
IHdlIGtub3cgb2YgYW55Ym9keSBoYXZpbmcgaXNzdWVzIHdpdGggbXVsdGktdHJiIHByZWZldGNo
Pw0KPj4gTm8sIHdlIGFkZGVkIHRoaXMgZm9yIHZhcmlvdXMgaW50ZXJuYWwgdGVzdHMuDQo+IFdl
IHJlYWxseSBhIGJldHRlciB3YXkgZm9yIHlvdSBndXlzIHRvIGhhdmUgeW91ciB0ZXN0IGNvdmVy
YWdlIGVuYWJsZWQNCj4gd2l0aCB1cHN0cmVhbSBrZXJuZWwuIEkgd29uZGVyIGlmIERUIGd1eXMg
d291bGQgYWNjZXB0IGEgc2V0IG9mIGJpbmRpbmdzDQo+IG1hcmtlZCBhcyAiZm9yIHRlc3Rpbmcg
cHVycG9zZXMiLiBJbiBhbnkgY2FzZSwgd2UgcmVhbGx5IG5lZWQgdG8gZW5hYmxlDQo+IFNpbGlj
b24gVmFsaWRhdGlvbiB3aXRoIHVwc3RyZWFtIGtlcm5lbC4NCj4NCg0KVGhhdCB3b3VsZCBiZSBn
cmVhdCEgSWYgdGhlcmUncyBhIHNlbnNpYmxlIHdheSB0byBkbyBzbywgd2UncmUgb3BlbiB0byAN
CnN1Z2dlc3Rpb25zLg0KDQpUaGFua3MsDQpUaGluaA0K
