Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC9BC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 22:49:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0305B24676
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 22:49:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HwDB3+E2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Uv7GLg1Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfLSWt1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 17:49:27 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:42920 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726818AbfLSWt1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Dec 2019 17:49:27 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6CBB240621;
        Thu, 19 Dec 2019 22:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576795766; bh=LM4sTVV62fj9uK5t1c7oKzk+8eY4fwVK2jKVkpfKZNk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HwDB3+E2C5p8d4EN6o0HtrWbyKlmqfBumG3hbkzFHVfuDAs/mPNsOBds1kS4uABeC
         oosft40cjm6BlTTwkp8/8wXNtYWHHi3Ob1zvDwcXf5DOjVcUlttT2260wF2hJ+cKDG
         mZqCsl7skna8pOUOvgToszHYVxgz68as02mduYhJbE5ynPPsS3vowkRDNVB4X0DA9W
         LhAJiO4692paivM1wBazYmJzY2pVZQ8lXpDttw73+iDMaU85vQfdgM2iwmSi1NGGeW
         oQJ/rRZ6UTUl82KzzZrY6EqvFSKvkKw3d6AWmPt+C+Hp2VosTIpV56BUVy+D7vRkMb
         fYMv0bUSd+WaA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 19EA5A007E;
        Thu, 19 Dec 2019 22:49:26 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 19 Dec 2019 14:49:08 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 19 Dec 2019 14:49:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGboHKTXY+xAiwbTyHyfdI/bCK+2joM3i/FeNYBXbmJ39jNsw7u1MDwl+p030bkfDNsN28jNZD0sbur5WOaN6dd/VyVoIm4b+kpod015+YHOcebIXQbkZYTShZSZSf2MpL6w9RUvNTT4Nu+eazzioOzPwwTZoYih+upve9ZUNuY7ZyqAfeTHyHLqyU6LDIj/EWLH0cHOBvyE54Uob+nu+y5N4YntINSSZ6mui2qGOSZ8KlvhuuuRRZ6ygxdtlmAdyoS8Qrbl1CY3QIUEX1jt83J8tjT7S9lYb/uiRrPveH5uS2N5rb3OxYMSDD6oaEcm9pcaXrfzXiQ2bt5/4oEPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM4sTVV62fj9uK5t1c7oKzk+8eY4fwVK2jKVkpfKZNk=;
 b=nQ7cqelrplMFhK6yewUkAIrsxhaPFo485dOJg/hTfMe4nV78XYmMLGMobScyG/EwHbCZK5cHdJWRNah1jKEzOfbaNtJXt2xTP5D9xQKjYFciew3QYUbNgl4lcmsR5PntV/ibfRpdBe4Ze01lvaD+G8SGsCQjoTyjDtkVs0SrvVMQw+BJxa09vxGuyqXTXF0QlZfDIe1vhcp/oUytwmySNUzg4KGeWeaM6bMAc2be+HOP3b1Wv9Fgfpz4NPGvivTfxpDbUkXqI9Mk7qMkL5I9Yxqf29cFRVmApkZ5MaE2vQC6EmHuJVE54J1r/a9tAcou1nV6NdbbjPldWqDKyHwCBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM4sTVV62fj9uK5t1c7oKzk+8eY4fwVK2jKVkpfKZNk=;
 b=Uv7GLg1ZFWp1YrQoU7J84fjsOLCNhfNZxsYvHbqTyyWjcqhMoUehGO/qhJnix0Z8oyWhFKj136Bej6jKE7oUMnqebT98vugo4WsXajU0bqm9uYgwi91f8BJmPcEHVUraG1ZnLlP/lECj9yhyiVjPSjIGnq0LtL/AbZtgouo374o=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0150.namprd12.prod.outlook.com (10.174.53.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Thu, 19 Dec 2019 22:49:04 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2538.019; Thu, 19 Dec 2019
 22:49:04 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 06/14] usb: devicetree: dwc3: Add max lane and lsm
Thread-Topic: [RFC PATCH 06/14] usb: devicetree: dwc3: Add max lane and lsm
Thread-Index: AQHVsJbhGo8acFo1SkmmZ4GTjpkj26fCEN0AgAAK+oA=
Date:   Thu, 19 Dec 2019 22:49:04 +0000
Message-ID: <3c7f3546-2b8f-b322-d168-735ee044f744@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <aa9816c1efcdd492d698b421a94f0771961f414e.1576118671.git.thinhn@synopsys.com>
 <20191219220946.GA24304@bogus>
In-Reply-To: <20191219220946.GA24304@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5844047-0281-4beb-5cc1-08d784d5a5fb
x-ms-traffictypediagnostic: CY4PR1201MB0150:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB015094FD513BA17C45A3761BAA520@CY4PR1201MB0150.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(376002)(39860400002)(346002)(136003)(189003)(199004)(107886003)(2616005)(31686004)(6506007)(186003)(26005)(71200400001)(4326008)(6512007)(478600001)(8676002)(81166006)(66476007)(76116006)(66946007)(66446008)(81156014)(66556008)(64756008)(86362001)(8936002)(316002)(31696002)(5660300002)(36756003)(6486002)(2906002)(110136005)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0150;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: orVueRBQjRTdFTIkzt1/tnTFEsDUj0u2JsKuEgzGBiYXaAOQr9x0k7YuQ4HCQxVgdHRcNV0HEW/7cz4VoGRdicEw7tzKdRNVBfwu/3RncUmiQzzYX5GQoqI9t2FO3Z/CeUKL2aZWthAynkBte8d7damXspv4iTqiaAMvxdKHb1/WOpFWf6I9ABzyElPHCzhEvBJYDcGI+ujUOoXrfi45XXBEcQxU1zKuRqQbD6KASwgu57yyEJfb4VUe3bbKTNAxKuTFz9Uzjbpjv7lQ+05UnOHZczLygEJcmGdjXdSReYUf62YQ+1upQud4PKbVk4lwkrlW2JpxpibKAVU3mtjzviRKYFXkQzJUlaL0MZSbdtGCSVEjxoZntep57jTBOllI46Yi95CnN1ooQpzh6GGatU+1RqGT49/HowgRQvaqfZiK/DAC9VvK/oMGqEetzO2I
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C64DBC913498547B366FBF91CE97EFD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f5844047-0281-4beb-5cc1-08d784d5a5fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 22:49:04.2539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i0Gpv04Bijj8XJ5+Mie0aJ3g+i0A/6mfzKtldZ6vVGjEqnA+h0rd0RJp0Pu8F4+pmAtolHjI+IVhybKRQVPMig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0150
X-OriginatorOrg: synopsys.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGksDQoNClJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBXZWQsIERlYyAxMSwgMjAxOSBhdCAwNjo0
OTozN1BNIC0wODAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBBZGQgYSBuZXcgcHJvcGVydHkg
dG8gc2V0IG1heGltdW0gbnVtYmVyIG9mIGxhbmVzIGFuZCB0cmFuc2ZlciByYXRlZA0KPj4gc3Vw
cG9ydGVkIGZvciBEV0NfdXNiMzIuIEJ5IGRlZmF1bHQsIHRoZSBkcml2ZXIgd2lsbCBjb25maWd1
cmUgdGhlDQo+PiBjb250cm9sbGVyIHRvIHVzZSBkdWFsLWxhbmUgYXQgMTBHYnBzLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4NCj4+IC0t
LQ0KPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0IHwg
NCArKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4+IGluZGV4
IDY2NzgwYTQ3YWQ4NS4uN2RhMWM0ZTdkMzgwIDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4gQEAgLTg1LDYgKzg1LDEwIEBA
IE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+PiAgICAtIHNucHMscXVpcmstZnJhbWUtbGVuZ3RoLWFk
anVzdG1lbnQ6IFZhbHVlIGZvciBHRkxBREpfMzBNSFogZmllbGQgb2YgR0ZMQURKDQo+PiAgIAly
ZWdpc3RlciBmb3IgcG9zdC1zaWxpY29uIGZyYW1lIGxlbmd0aCBhZGp1c3RtZW50IHdoZW4gdGhl
DQo+PiAgIAlmbGFkal8zMG1oel9zZGJuZCBzaWduYWwgaXMgaW52YWxpZCBvciBpbmNvcnJlY3Qu
DQo+PiArIC0gc25wcyxtYXhpbXVtLWxhbmUtY291bnQ6IHNldCB0byBzcGVjaWZ5IHRoZSBudW1i
ZXIgb2YgbGFuZXMgdG8gdXNlIGZvcg0KPj4gKwkJCURXQ191c2IzMiBhbmQgbGF0ZXIuIERlZmF1
bHQgaXMgZHVhbC1sYW5lcy4NCj4gV2h5IGRvIHlvdSBuZWVkIHRoaXM/IFdoZW4gaXMgaXQgbm90
IHRoZSBudW1iZXIgb2YgbGFuZXMgdGhlIHBoeSBoYXM/DQoNClRoZSBpc3N1ZSBpcyB0aGUgY29u
dHJvbGxlciBkb2Vzbid0IGtub3cgdGhlIG51bWJlciBvZiBsYW5lcyB0aGUgcGh5IA0Kc3VwcG9y
dHMuIFRoZXJlJ3Mgbm8gSFcgcGFyYW1ldGVyIGZvciB0aGlzLiBUaGUgdXNlciBuZWVkcyB0byBp
bmZvcm0gDQp0aGlzIHRvIHRoZSBjb250cm9sbGVyLg0KDQo+DQo+IFJldXNlICdudW0tbGFuZXMn
IGZyb20gUENJIGJpbmRpbmc/DQoNCk9rLg0KDQo+DQo+PiArIC0gc25wcyxtYXhpbXVtLWxzbTog
c2V0IHRvIHNwZWNpZnkgdGhlIGxhbmUgc3BlZWQgbWFudGlzc2EgdG8gdXNlIGluIEdicHMuDQo+
PiArIAkJCURlZmF1bHQgaXMgMTBHYnBzIGZvciBTdXBlclNwZWVkIFBsdXMuDQo+IFNvIHRoZSB2
YWx1ZSBpcyAnMTAnIG9yICcxMEdicHMnLiBPdGhlciB2YWxpZCB2YWx1ZXM/DQoNCkknbSBtaXNz
aW5nIHRoaXMgaW4gdGhlIGRlc2NyaXB0aW9uLiBJdCBjYW4gYmUgZWl0aGVyIDEwIG9yIDUuIElm
IG5vdCANCnNldCwgdGhlbiBkZWZhdWx0IHRvIDEwR2JwcyBmb3IgU1NQLiBJJ2xsIHVwZGF0ZSB0
aGlzLg0KDQo+DQo+PiAgICAtIHNucHMscngtdGhyLW51bS1wa3QtcHJkOiBwZXJpb2RpYyBFU1Mg
UlggcGFja2V0IHRocmVzaG9sZCBjb3VudCAtIGhvc3QgbW9kZQ0KPj4gICAJCQlvbmx5LiBTZXQg
dGhpcyBhbmQgcngtbWF4LWJ1cnN0LXByZCB0byBhIHZhbGlkLA0KPj4gICAJCQlub24temVybyB2
YWx1ZSAxLTE2IChEV0NfdXNiMzEgcHJvZ3JhbW1pbmcgZ3VpZGUNCj4+IC0tIA0KPj4gMi4xMS4w
DQo+Pg0KDQpUaGFua3MsDQpUaGluaA0K
