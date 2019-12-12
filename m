Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D2AC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 22:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 912A521556
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 22:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bbQoruq+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="WFfnIHHe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731092AbfLLW2i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 17:28:38 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:60110 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731072AbfLLW2i (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Dec 2019 17:28:38 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1311A4231F;
        Thu, 12 Dec 2019 22:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576189717; bh=/6iZ3+O9b5lzKsvg1LXSJXuRIbDXwA9hJN2sUu7S3Z0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=bbQoruq+FYsHi9JLQv7MU8aVWDsK55qr+SbMfYcKnJUusSKqY9VrcaxiQ9t4H0+UU
         kTVtKr0pLqvF+0wwkOcFrAAzxGeQBsocfyp0kaoYp/RcFrzfVepba1lpVHdwWxuQoM
         Jrb0EPKof+O+xH29+wo3yJqhZGF7pW4qMnQzjbY4O8j4IykZdvZGVxRLxjfOkDBGZZ
         KFivyK4RNmYbxdMefALVu3wTeovVz9TczJzO8itnGRLrx9WriH+eAw009Nrf2PurK/
         EHFC9fU4McQXT2JhkXO5EVjgop4ntk6sr7cAh1o/5OyMrGetQT6YB5h2j2J+kr51sy
         aFmJTWJp75H0w==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8F6CEA0089;
        Thu, 12 Dec 2019 22:28:28 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 12 Dec 2019 14:28:27 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 12 Dec 2019 14:28:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drOUq9bO/08NLFOJweULM9yW9hB8ninhp2KzcdHDl77cKArgwztiZIlO8Wm9c5XvV87Q7qx8T2FSxKVJ2xbdmFAv7N7RujhnxgY8Q3ubossdko320E2W1nahDJt6kEKjNzPUrpMIAkQP/MZ3ywUeHNsz3To5eP24SdSV2Laa4SSx6EhTL60E69iWt86HarCqpx6Kc2Vcuu8mPyJ6GZ9BNcUhmBzGat9i5S5wGYn+i7QDxNvEOSNBGZqKjM/EG4dksUb3aH3kSkxnPOX3E/MU+6SWnPXNAShKkyzAP9RPfXRpucGJeuWGWuznAFsivhVLrpc0KlMlaIgBLAQB0UpmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6iZ3+O9b5lzKsvg1LXSJXuRIbDXwA9hJN2sUu7S3Z0=;
 b=OTwXI4EWE+Cd87MHaWzBHMYdvNhHloceMZJQx4DWzcbgGP7GA/6r9cATmtj8Q6dF0T9nw/+AljR0tW2NC349WWp9XfrCiZUW8k5PAqaZT4be0BZ4ijUFa1hBzDbEyGYg14WEmv4A2g+1J0IUj+7YIv2lFlkPwXyvd/hWHxTONdYJ9Hj7/jRoY1Bb9EA35olVORCJwWXra/s8WziIEMsNThVVmTEQbiyQgjt5969tNe2Y1c404l1EhDimKBk0E+LhFseR/93PGGimqj17FWgzKxJa+aISjb76jAD5V5HNfN9MGvarj9Xp6/FljejtfCGYJPDsRtVIUcc136RbDnMbwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6iZ3+O9b5lzKsvg1LXSJXuRIbDXwA9hJN2sUu7S3Z0=;
 b=WFfnIHHec9HqvWjtfA4PVdfz3M1/bJnr2k0v0qwgkR1hZAUNrOm4OlXSfLD2baKw0AJ8LR+Uv8EsPJlmEzzuG00kzr2Md1LW0CEvrc/RKIJgVdf8e9wISFw+hmywFSsvu+NgAFgv9iPuvzlBY2JU7Dp+bQ2ESjt/oElINVdhk/g=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0184.namprd12.prod.outlook.com (10.172.78.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 22:28:25 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 22:28:25 +0000
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
Thread-Index: AQHVsJb46NEi1uYe2UuKB8LR+8hjAae2KKoAgADtFgA=
Date:   Thu, 12 Dec 2019 22:28:25 +0000
Message-ID: <6193f738-03ac-51b5-cdf0-d9b252a50146@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <b791f032edb8e6a739c342dbd0d2d5faa66ddfb8.1576118671.git.thinhn@synopsys.com>
 <87mubyvtuh.fsf@kernel.org>
In-Reply-To: <87mubyvtuh.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6255f92f-d6f8-4dbe-9016-08d77f529ab9
x-ms-traffictypediagnostic: CY4PR1201MB0184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01849A7789D7E2DE1A49F4C4AA550@CY4PR1201MB0184.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39860400002)(346002)(136003)(396003)(366004)(199004)(189003)(64756008)(6512007)(478600001)(2906002)(66476007)(6506007)(86362001)(66556008)(316002)(110136005)(6486002)(31686004)(107886003)(66946007)(186003)(4326008)(8936002)(76116006)(81156014)(31696002)(8676002)(2616005)(71200400001)(81166006)(66446008)(5660300002)(26005)(36756003);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0184;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1ShioNQCTLsbHwqXHX/u6E+0LihVlBjq9lOOeXHr0uW/UZT4J3kR0khGsuEElQKUXVzqN2vJwmjoF9fZPCN5g7GhVlRqV8x8Xjfr03nTYc8OLrhxmVQi5B4MPxwP6zLyDlpI5Z/UtJmIA99UvqxmqbwBtsaJ7QnVwqvZ/MRAo5vycR1GjsAPrRMZW/6RPaaVcybM1Yx3BkNMdM4f2ZXzYXSmaMrD5WJ0MmntJ8/5pm/Ec48tlES8sBQSUqM0WXxnM5jOWWtfRLxYoviWe2WVQQjV4+KwM8v6G8L2tK2B6qI3DVbGGgweEPRr7R9syw4AeOJD6HPx9Kv6lJMoAWqhoh3U64b3xtKmmZMXr1TWZ6UwzNxAu2c7daT12ZQW2U5X8k7kuxtjCanolS6EqooJkyAqDdwKPDQ2uHYvyLAebRN8ZPBRjJE57TBfFqNb5Ofe
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A4BCAB2AE099049935A9A4C803EE412@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6255f92f-d6f8-4dbe-9016-08d77f529ab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 22:28:25.3333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qep5yCPBVCvgWa5TwcW7N+dj5GpeQV3jszmoVloh3E8wiJUfTCT7NHPHQPbq7HFl40l3ASInQV7xvnsVGt/TEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0184
X-OriginatorOrg: synopsys.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4gRFdDX3VzYjMyIGhhcyBhIGZlYXR1
cmUgd2hlcmUgaXQgY2FuIGlzc3VlIG11bHRpcGxlIFRSQiBmZXRjaCByZXF1ZXN0cy4NCj4+IEFk
ZCBhIG5ldyBwcm9wZXJ0eSB0byBsaW1pdCBhbmQgb25seSBkbyBvbmx5IHNpbmdsZSBUUkIgZmV0
Y2ggcmVxdWVzdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBz
eW5vcHN5cy5jb20+DQo+PiAtLS0NCj4+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9kd2MzLnR4dCB8IDIgKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL2R3YzMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9k
d2MzLnR4dA0KPj4gaW5kZXggZmYzNWZhNmRlMmViLi4yOWQ2ZjliMWZjNzAgMTAwNjQ0DQo+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0DQo+PiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0DQo+PiBA
QCAtMTA4LDYgKzEwOCw4IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+PiAgICAtIHNucHMsbnVt
LXRyYi1wcmVmZXRjaDogbWF4IHZhbHVlIHRvIGRvIFRSQnMgY2FjaGUgZm9yIERXQ191c2IzMi4g
VGhlIHZhbHVlDQo+PiAgIAkJCWNhbiBiZSBmcm9tIDEgdG8gRFdDX1VTQjMyX0NBQ0hFX1RSQlNf
UEVSX1RSQU5TRkVSLg0KPj4gICAJCQlEZWZhdWx0IHZhbHVlIGlzIERXQ19VU0IzMl9DQUNIRV9U
UkJTX1BFUl9UUkFOU0ZFUi4NCj4+ICsgLSBzbnBzLGRpcy1tdWx0LXRyYi1mZXRjaDogc2V0IHRv
IGlzc3VlIG9ubHkgc2luZ2xlIFRSQiBmZXRjaCByZXF1ZXN0IGluDQo+PiArCQkJRFdDX3VzYjMy
Lg0KPiB0d28gcXVlc3Rpb25zOg0KPg0KPiAtIGhvdyBpcyB0aGlzIGRpZmZlcmVudCBmcm9tIHBh
c3NpbmcgMSB0byB0aGUgcHJldmlvdXMgRFQgYmluZGluZw0KDQpUaGUgcHJldmlvdXMgRFQgYmlu
ZGluZyBpcyByZWxhdGVkIHRvIHRoZSBudW1iZXIgVFJCcyB0byBjYWNoZSB3aGlsZSANCnRoaXMg
b25lIGlzIHJlbGF0ZWQgdG8gd2hldGhlciB0aGUgY29udHJvbGxlciB3aWxsIHNlbmQgbXVsdGlw
bGUgDQooaW50ZXJuYWwpIGZldGNoIGNvbW1hbmRzIHRvIGZldGNoIHRoZSBUUkJzLg0KDQo+IC0g
ZG8gd2Uga25vdyBvZiBhbnlib2R5IGhhdmluZyBpc3N1ZXMgd2l0aCBtdWx0aS10cmIgcHJlZmV0
Y2g/DQoNCk5vLCB3ZSBhZGRlZCB0aGlzIGZvciB2YXJpb3VzIGludGVybmFsIHRlc3RzLg0KDQpC
UiwNClRoaW5oDQo=
