Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CADC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 22:16:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07216206DA
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 22:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ikLKulMJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="pQ5nhjvI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730950AbfLLWQm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 17:16:42 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:56772 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730811AbfLLWQm (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Dec 2019 17:16:42 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 61706C00E9;
        Thu, 12 Dec 2019 22:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576189001; bh=TGZXQ7avHNp2zLo1PTncIS57XtSUpmtfWs9jaj7wl1c=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ikLKulMJudHkf34gNNAVi//BM1s2wF0z65djWf/WPAco+WhbqGBE+wsmWLr8k2Ic7
         lfzejU0+h0cmzqwLRIncgG3An5yOPUmzAGcLbSA+lYL30G2z8oayyN8fjCu9FRT0GC
         chkTo/7lRIAfYyrZPp2YgufcS/jQnrF2uBIsHBL4bo5ll4r3JCmNrvDIOfsjF+n3gt
         BnXyBSGT/hvbz1gRlFqaJdZXnEuTtdvpsRl3FzsxzRhQDvqh8Mze3VLmR1YAL0It5z
         QKMvNo4jIKfd10z6M8Sm3Jrx+5OgrWDH/ABOfhVBy/S6dB8ZvpzCyXib9tc1oUFdb4
         CpnKdOqMAi+kg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 0F682A034E;
        Thu, 12 Dec 2019 22:16:41 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 12 Dec 2019 14:16:29 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 12 Dec 2019 14:16:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEDo9G5skIQeSVYH5sPj+HvEBhX8ZkpFimxgv4E2zpDJL4Wtr/Z/gjOvndWHhSrpJLtGpSDw/cr9fhP+KDOX1uuixL8B8+mBOEqgQetPdTTgTwgjAvYPQ114tvUq4EbRGR0fXRCEhcM2Hfic7vdd2qnIe8Ug2RS/4xLm6Y7jrhvfJwPkW3lX5EyqAA/O7Oapr1VjQODX9RgkEUsere2/r/OflYXc8VCJnKkif2yBGvvnTUzHAiyEcRqlE6KvAEZBgt7VEPZ3Tu6WkU08DFrPHyjD5krsQATvJuQnHGKZAAMF8hiUooF8b22I+7jH30CvdHP0K0nH82Bqs24QgMIvnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGZXQ7avHNp2zLo1PTncIS57XtSUpmtfWs9jaj7wl1c=;
 b=kB2NMfVm9RfBmauPdR6LxEWFlguVsA/ezrDtpIQNuZ5yTflVSI9nMCOL/FOmrnwGZSs1WdAdleJ5rcVvhUhv7PViBXaC99n5bbjIM78pLJ3JDZ7B4duNd16nOZtYc27orEoWtsfoeKrIvAI1c+9whw/ARsx3UXo0CBT+GUOfVmVIDi5V2R9gtD25oqAu9ZEBNzLcInEOcELkl+Emw0v8dH8ZBXFXmYNQGmE60E6QoDDsVmr3gkjLt9DPw0QqB1KWABFUtSoD3xe7hmLmnnX1GJkS0kssmdo+gwbO++Bt1WVt+jtcV16LpFGk6O4VodGJgX30m240JJhGMEy6wWw5Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGZXQ7avHNp2zLo1PTncIS57XtSUpmtfWs9jaj7wl1c=;
 b=pQ5nhjvIjEwM8TYEuiiH2cD9OC4NbdxdXOgK8MeJYy7XhIBJI91yCHK9VuWSoVxgAo48uJ3z5ogTlpgC/UVAxkDG+5AiODBmcm0Ltp2fkqKqVnnJQT8dZ5NgL7YswsCHeIamnjm7rce1wxcyvkS5XaECS9IsK+sdX1eDH+CD5iQ=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0165.namprd12.prod.outlook.com (10.172.78.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Thu, 12 Dec 2019 22:16:28 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 22:16:28 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 11/14] usb: devicetree: dwc3: Add TRB prefetch count
Thread-Topic: [RFC PATCH 11/14] usb: devicetree: dwc3: Add TRB prefetch count
Thread-Index: AQHVsJbw5HczSN86HE+c7VscVD6xT6e2KFsAgADqDoA=
Date:   Thu, 12 Dec 2019 22:16:28 +0000
Message-ID: <fccd885d-57fc-76c6-1537-ff14f9c4b409@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <7098386bb19ebfee02027555d86fc47822b617d4.1576118671.git.thinhn@synopsys.com>
 <87pnguvtwb.fsf@kernel.org>
In-Reply-To: <87pnguvtwb.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a311604-dda1-4b9c-f5e8-08d77f50ef1d
x-ms-traffictypediagnostic: CY4PR1201MB0165:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01656FF955D0C6F261EB9316AA550@CY4PR1201MB0165.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(189003)(199004)(6506007)(6486002)(8936002)(2616005)(81156014)(81166006)(8676002)(31686004)(66946007)(64756008)(71200400001)(66476007)(76116006)(66446008)(66556008)(4326008)(31696002)(107886003)(110136005)(86362001)(498600001)(26005)(36756003)(2906002)(186003)(5660300002)(6512007);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0165;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dokr/oxLkW1UWQLGAh5np0XZ0ggDmgP3S60CF/xubwAdS/CFRLcUnRq3dSsZHRRx6mHa6u4t1V4F/QMeE5tb5iymOfn026qH+IP1bXamShKqyZZOKjaV4HdRS8aflgWn7Mnqx9C9xkuoALMyEaZ1Bwq66tKnXV6l1OFJa1erbO/TcX5r/T+EgcVOZfgn6jEuOgOOo8RLspf+Mc9YUQc9ti9LD0D/gS/Qjtwj6L0sLYV7eu5zEflWtEo8fubN6WepKX1Cj6LGocxbibdetvb1jzQJEd7IhYErEvol05bvB9kyy+B6PhSeJzfkMYk3u8R3QmIqhKPVR3I6/nI3pulpwtIdhH4WEKbMBz/J4j+YzhjvUkJsBc4PaqAHhnV5mMyqVcJDFYMYgAk7LzOhVZebiWWV0vvmO/QY479squ//pXjzaSDTijFvpHalkIJq3BBJ
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A8B2DE72CCCA74BB32C7574F85BE240@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a311604-dda1-4b9c-f5e8-08d77f50ef1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 22:16:28.0554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PiI+2zp+M51nqgWg2gpeL8djmrH+zxN/2aA2S6Q3EccOYKB64BHeA5no9S+ZTD3I1RUBTUDiDDn+1l10ulUADA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0165
X-OriginatorOrg: synopsys.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4gRFdDX3VzYjMyIGhhcyBhbiBlbmhh
bmNlbWVudCB0aGF0IGFsbG93cyB0aGUgY29udHJvbGxlciB0byBjYWNoZQ0KPj4gbXVsdGlwbGUg
VFJCcyBmb3Igbm9uLWNvbnRyb2wgZW5kcG9pbnRzLiBJbnRyb2R1Y2UgYSBuZXcgcHJvcGVydHkg
dG8NCj4+IERXQzMgdG8gc2V0IHRoZSBtYXhpbXVtIG51bWJlciBvZiBUUkJzIHRvIGNhY2hlIGlu
IGFkdmFuY2UuIFRoZSBwcm9wZXJ0eQ0KPj4gY2FuIGJlIHNldCBmcm9tIDEgdG8gRFdDX1VTQjMy
X0NBQ0hFX1RSQlNfUEVSX1RSQU5TRkVSIChDb3JlQ29uc3VsdGFudA0KPj4gdmFsdWUpLiBCeSBk
ZWZhdWx0LCB0aGUgbnVtYmVyIG9mIGNhY2hlIFRSQiBpcw0KPj4gRFdDX1VTQjMyX0NBQ0hFX1RS
QlNfUEVSX1RSQU5TRkVSLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8dGhp
bmhuQHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2R3YzMudHh0IHwgMyArKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2R3YzMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9kd2MzLnR4dA0KPj4gaW5kZXggN2RhMWM0ZTdkMzgwLi5mZjM1ZmE2ZGUyZWIgMTAwNjQ0
DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0
DQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0
DQo+PiBAQCAtMTA1LDYgKzEwNSw5IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+PiAgIAkJCXRo
aXMgYW5kIHR4LXRoci1udW0tcGt0LXByZCB0byBhIHZhbGlkLCBub24temVybyB2YWx1ZQ0KPj4g
ICAJCQkxLTE2IChEV0NfdXNiMzEgcHJvZ3JhbW1pbmcgZ3VpZGUgc2VjdGlvbiAxLjIuMykgdG8N
Cj4+ICAgCQkJZW5hYmxlIHBlcmlvZGljIEVTUyBUWCB0aHJlc2hvbGQuDQo+PiArIC0gc25wcyxu
dW0tdHJiLXByZWZldGNoOiBtYXggdmFsdWUgdG8gZG8gVFJCcyBjYWNoZSBmb3IgRFdDX3VzYjMy
LiBUaGUgdmFsdWUNCj4+ICsJCQljYW4gYmUgZnJvbSAxIHRvIERXQ19VU0IzMl9DQUNIRV9UUkJT
X1BFUl9UUkFOU0ZFUi4NCj4+ICsJCQlEZWZhdWx0IHZhbHVlIGlzIERXQ19VU0IzMl9DQUNIRV9U
UkJTX1BFUl9UUkFOU0ZFUi4NCj4gaG93IGFib3V0IHdlIGp1c3QgbGVhdmUgaXQgYXQgdGhlIG1h
eGltdW0gYW5kIGluIGNhc2Ugc29tZW9uZSBub3RpY2VzDQo+IHByb2JsZW1zLCB0aGVuIHdlIGNv
bnNpZGVyIGFkZGluZyBtb3JlIERUIGJpbmRpbmdzPw0KPg0KDQpTdXJlLiBXZSBjYW4gZG8gdGhh
dC4gSSdsbCByZW1vdmUgdGhpcy4NCg0KVGhpbmgNCg==
