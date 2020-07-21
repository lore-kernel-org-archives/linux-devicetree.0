Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA49C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 16:44:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D037207BB
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 16:44:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gDBwOZBm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="l1zA9fPA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730564AbgGUQov (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 12:44:51 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:45354 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730384AbgGUQmB (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jul 2020 12:42:01 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0DF78401B2;
        Tue, 21 Jul 2020 16:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595349720; bh=Y/cNWbPPLTTA9KzUUoLsUQAEVJPW7XIcVlxRQ+xG3VI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gDBwOZBmOVhoRwgsPDrMiLbJFJv0hi1n/9sbM15JEwDuSBCGK6XBNt25qRxxNE7Mg
         0FsUtQ8Y40gL1l0n5nrVRS7Xw4c8/FlIUWXo94gUZT/QbzpLwvXLS6I41MN0QPigf9
         aVYbHVtiQatQaJ2g2K8udLeF8x23MN5j5mBre+cMEXPie8VD5KnvZRT7cCc6Lqiboy
         Y+fRlkMXbSTb6+7AQO4/FNF359NILZCuI1iz5v/QO7kgCfFVHQSbhSJgRfyQa/pDb0
         ZnuPAQa1GPZ5PBqnUhc3t5a2+zQ0b8EmyxE+5zCwnXcgEJ6qstEcmmX3J9TckV6mxh
         Hz/Xyrr0ummuw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 90411A0230;
        Tue, 21 Jul 2020 16:41:59 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5926F4014A;
        Tue, 21 Jul 2020 16:41:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="l1zA9fPA";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wanhq58Zh2yjjwH6BbtKB+qJ8ONmPxJYK7SD+frbzw4grfaJVZ2zNS+WByPfZWitMvB64eV3Q6sPSeO5cYkO9s1AJ+0nT2lLOcnSEk26y9+7ma/oFVvZeL/FJe31mOs0mGmEMUVCL8wdtjh1UaPmoLABzBbFEFJXzAb0Uc3wmWK4ZHufVETGCaw2wgwlCZrOMQIqDDA6bA6II6eW87260vANQFZJ0NbnlRnLEsXG01fAALpARHsBnnN0QYicN0iXOkEKFFs69mBly5dmoGuGbpeGGC8HeRF8sT9kijaRPIX5qpphwMgFiIuz//QDlOI3DNaOvnFvi4iV82ExaqMIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/cNWbPPLTTA9KzUUoLsUQAEVJPW7XIcVlxRQ+xG3VI=;
 b=SPjOeStHdCXCreJzQ7DoReQNjLSni+UJ3EOrwDJ1A7y4uaMqCu2vGmdcJ42AUeE88SIoiH9IIQJWDTLTG8k9cx5P0gNKS5D9GaqiAkYvKMLNYk7+3fdO5FYX/+oVYzPAQhOd6/SesWObjS+GWV8u3KoWGGlihpLUV4+l8/IK35dZfNGYbv+5kcGxooQPyu+fNP2fy+o5BJVqwHIiOwIZHuArn3s76UaGXnEeIxu+MYrWg3OljXxql6qRE6Qv1m0o2n9dDamWZZLK7t4XF54yH4+995TjO+3f4kHKwS5Sa54fJ1Tcq8+URnFyPq9QAlxmznRQ3pGUfBDQso2A0OsqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/cNWbPPLTTA9KzUUoLsUQAEVJPW7XIcVlxRQ+xG3VI=;
 b=l1zA9fPA65W0vVjtIVWTIgoGGSUhxRCKDT4ypurS3+ahNDv9BgHFy9Al7C68TwahoNPj7B+x7hV3Xp0UauhN384hdYesWKRfAr4xnyrUwMCQQcaxGln2RDNCiGN0t4vFp+3dhtFsGW6az/s3CejBreTfszipM610BSLDo5FWtKY=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Tue, 21 Jul
 2020 16:41:56 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 16:41:56 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
Thread-Topic: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
Thread-Index: AQHWW7xVn29tfo9/DkKD4yu8ygVtF6kRaYEAgAAW7YCAAKirAIAAGx8A
Date:   Tue, 21 Jul 2020 16:41:56 +0000
Message-ID: <57fffdfb-a4fa-6e50-1156-1ada3765e362@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <9684a2b2adb01b6b1a8c513928ea49b4a6436184.1594935978.git.thinhn@synopsys.com>
 <20200721033908.GA3508628@bogus>
 <d7e3d5c6-05c1-f256-7773-2b88f6cd5ca3@synopsys.com>
 <CAL_JsqLSKKT__dJaML4SWCpFpFYV_Cpkor=mNh5-Z7hE4n4fMA@mail.gmail.com>
In-Reply-To: <CAL_JsqLSKKT__dJaML4SWCpFpFYV_Cpkor=mNh5-Z7hE4n4fMA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a82122b5-1538-4c39-d229-08d82d94fb5d
x-ms-traffictypediagnostic: BY5PR12MB4115:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4115FD2B684C942053FF27DBAA780@BY5PR12MB4115.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xvHqU/spB3pZ0GFl/gjcAi8rW8CbUj48s1acGY1OA80yEybK6tqStg9vYCG9+PVtuA3pYpuHNObnDAuJx6o14+g93KRGxvGif6+wnCY8FDEUNgm3yjBoWgtFNZvxXJLp4UVgreCroS7xQ/qj0ho9JdunzPdufFnTN7vznwShWhG8dnKe+ge1D04xRLFAk10JCDtHsOCLWAMiksvdtIeck2jQtUSRGGc9VtBgyASDCphqGSRuB6luYsXITuwNjvyGtdTUqJ+LZzD4gyuDR7g/IQ6eRWAUC6dh8BSdyvu8BGaSE2PiFtM/+Ifi207iSZnjTSqyce7qASGAqQxDuqwMe03mJzrOKngwVyLQwn1A74quKVV1dr77waHf238+O+xJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(396003)(376002)(366004)(346002)(136003)(107886003)(8676002)(8936002)(4326008)(31696002)(86362001)(6512007)(6486002)(31686004)(36756003)(110136005)(54906003)(316002)(2906002)(26005)(5660300002)(66946007)(76116006)(71200400001)(6506007)(53546011)(478600001)(66446008)(186003)(66556008)(64756008)(66476007)(2616005)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: B8Gn4AyQ5BBnip3wgH0AobamNyrh4tzqzbWEFcQIDmXgVBN/q8QGXbRCId/xz3HkNeCHUqs1biL2oSvhNpxv9h/Q/m1hpEqpmzkBSPIc+DZqk+wSfL7zuspbtVQlN3BP+FoDX3mRKxwSH798apFR/zphGyO34Hni43tZ+5IkSUtrbQ2nP94rUd2eBTYAuEWdSRrO1HsmkibCDgg8cW/jHeIv5PbAQOSerKhwMv4PhC2wiGkVA/Q/NfCbaVonjOGZAyCcnhgqfOeH+ZeAWr7AwVAS0Qkq5WZGfgQ+j5zc8lyKU2qguX5ckZLTcoAmwMkJCcrWnnhe4SyK1gedvUaKiFnKvJShhH4Oa9yAq3J0EI4nMbwYPYFXggynB50zkj5pXa2TYkIVu/Ee4dgdkuynBOG1APrYkQW3lEfuMWArVdNx0lbcW8btEADnojRomZoJgm8HF02GXwaFK/D3veIhHCMlv3dnCdaS+JdGum839SA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <878919AC3D5C5A4EA89A04A861AE2535@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82122b5-1538-4c39-d229-08d82d94fb5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 16:41:56.8055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p8gTX5huh8jwCmVdBSwfqHMqxvxhzNr+wqQm77zgz9pUl88I3V0CkHdFQsiuyNXTt/RQaf2UnUqzvsNzjrjexQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Um9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIE1vbiwgSnVsIDIwLCAyMDIwIGF0IDExOjAxIFBNIFRo
aW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+PiBSb2IgSGVy
cmluZyB3cm90ZToNCj4+PiBPbiBUaHUsIEp1bCAxNiwgMjAyMCBhdCAwMjo1OTowOFBNIC0wNzAw
LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pj4+IEludHJvZHVjZSBudW0tbGFuZXMgYW5kIGxhbmUt
c3BlZWQtbWFudGlzc2EtZ2JwcyBmb3IgZGV2aWNlcyBvcGVyYXRpbmcNCj4+Pj4gaW4gc3VwZXIt
c3BlZWQtcGx1cy4gRFdDX3VzYjMyIElQIHN1cHBvcnRzIG11bHRpcGxlIGxhbmVzIGFuZCBjYW4N
Cj4+Pj4gb3BlcmF0ZSBpbiBkaWZmZXJlbnQgc3VibGluayBzcGVlZHMuIEN1cnJlbnRseSB0aGUg
ZGV2aWNlIGNvbnRyb2xsZXINCj4+Pj4gZG9lcyBub3QgaGF2ZSB0aGUgaW5mb3JtYXRpb24gb2Yg
dGhlIHBoeSdzIG51bWJlciBvZiBsYW5lcyBzdXBwb3J0ZWQuIEFzDQo+Pj4+IGEgcmVzdWx0LCB0
aGUgdXNlciBjYW4gc3BlY2lmeSB0aGVtIHRocm91Z2ggdGhlc2UgcHJvcGVydGllcyBpZiB0aGV5
IGFyZQ0KPj4+PiBkaWZmZXJlbnQgdGhhbiB0aGUgZGVmYXVsdCBzZXR0aW5nLg0KPj4+Pg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5vcHN5cy5jb20+DQo+Pj4+
IC0tLQ0KPj4+PiAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMu
dHh0IHwgOSArKysrKysrKysNCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9kd2MzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
ZHdjMy50eHQNCj4+Pj4gaW5kZXggZDAzZWRmOWQzOTM1Li40ZWJhMDYxNTU2MmYgMTAwNjQ0DQo+
Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQN
Cj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4
dA0KPj4+PiBAQCAtODYsNiArODYsMTUgQEAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4+Pj4gICAg
IC0gc25wcyxxdWlyay1mcmFtZS1sZW5ndGgtYWRqdXN0bWVudDogVmFsdWUgZm9yIEdGTEFESl8z
ME1IWiBmaWVsZCBvZiBHRkxBREoNCj4+Pj4gICAgICAgcmVnaXN0ZXIgZm9yIHBvc3Qtc2lsaWNv
biBmcmFtZSBsZW5ndGggYWRqdXN0bWVudCB3aGVuIHRoZQ0KPj4+PiAgICAgICBmbGFkal8zMG1o
el9zZGJuZCBzaWduYWwgaXMgaW52YWxpZCBvciBpbmNvcnJlY3QuDQo+Pj4+ICsgLSBzbnBzLG51
bS1sYW5lczogc2V0IHRvIHNwZWNpZnkgdGhlIG51bWJlciBvZiBsYW5lcyB0byB1c2UuIFZhbGlk
IGlucHV0cyBhcmUNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgMSBvciAyLiBBcHBseSBpZiB0
aGUgbWF4aW11bS1zcGVlZCBpcyBzdXBlci1zcGVlZC1wbHVzDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgIG9ubHkuIERlZmF1bHQgdmFsdWUgaXMgMiBmb3IgRFdDX3VzYjMyLiBGb3IgRFdDX3Vz
YjMxLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICBpdCBpcyBhbHdheXMgMSBhdCBzdXBlci1z
cGVlZC1wbHVzLg0KPj4+PiArIC0gc25wcyxsYW5lLXNwZWVkLW1hbnRpc3NhLWdicHM6IHNldCB0
byBzcGVjaWZ5IHRoZSBzeW1tZXRyaWMgbGFuZSBzcGVlZA0KPj4+PiArICAgICAgICAgICAgICAg
ICAgICBtYW50aXNzYSBpbiBHYnBzLiBWYWxpZCBpbnB1dHMgYXJlIDUgb3IgMTAuIEFwcGx5IGlm
DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgIHRoZSBtYXhpbXVtLXNwZWVkIGlzIHN1cGVyLXNw
ZWVkLXBsdXMgb25seS4gRGVmYXVsdA0KPj4+PiArICAgICAgICAgICAgICAgICAgICB2YWx1ZSBp
cyAxMC4gRm9yIERXQ191c2IzMSwgaXQncyBhbHdheXMgMTAgYXQNCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgc3VwZXItc3BlZWQtcGx1cy4NCj4+PiBUaGlzIGlzIGFsbCBjb21tb24gVVNCIHRo
aW5ncyBhbmQgc2hvdWxkIGJlIGNvbW1vbiBwcm9wZXJ0aWVzICh3aGljaCB3ZQ0KPj4+IG1heSBh
bHJlYWR5IGhhdmUpLg0KPj4gU3VyZS4gRm9yICJudW0tbGFuZXMiIGlzIHNpbXBsZSwgYW55IG9i
amVjdGlvbiBpZiB3ZSB1c2UNCj4+ICJsYW5lLXNwZWVkLW1hbnRpc3NhLWdicHMiPyBPciBzaG91
bGQgd2UgYWRkICJsYW5lLXNwZWVkLWV4cG9uZW50Ij8NCj4gJ251bS1sYW5lcycgaXMgZ29vZCBh
cyB0aGF0J3Mgd2hhdCBQQ0llIHVzZXMuIERvY3VtZW50IHRoYXQgd2l0aA0KPiAnbWF4aW11bS1z
cGVlZCcuDQo+DQo+IEkgdGhpbmsgJ3N1cGVyLXNwZWVkLXBsdXMnIHNob3VsZCBtZWFuIGdlbiAy
IDEwRyBwZXIgbGFuZS4gVGhlbg0KPiBiZXR3ZWVuIG51bS1sYW5lcyBhbmQgbWF4aW11bS1zcGVl
ZCB5b3UgY2FuIGRlZmluZSBhbGwgNCBwb3NzaWJsZQ0KPiByYXRlcy4NCg0KVGhhdCBtYXkgY29u
ZnVzZSB0aGUgdXNlciBiZWNhdXNlIG5vdyB3ZSdkIHVzZSAnc3VwZXItc3BlZWQtcGx1cycgdG8g
DQpkZWZpbmUgdGhlIHNwZWVkIG9mIHRoZSBsYW5lIHJhdGhlciB0aGFuIHRoZSBkZXZpY2UgaXRz
ZWxmLg0KDQpBY2NvcmRpbmcgdG8gdGhlIFVTQiAzLjIgc3BlYywgc3VwZXItc3BlZWQtcGx1cyBj
YW4gbWVhbiBnZW4yeDEsIGdlbjF4MiwgDQpvciBnZW4yeDIuDQoNCkJSLA0KVGhpbmgNCg==
