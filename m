Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2C9CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 08:07:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17D3720684
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 08:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="SGzdafnw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388166AbfJVIHR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 04:07:17 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:27478 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388134AbfJVIHR (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 22 Oct 2019 04:07:17 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9M837J1007109;
        Tue, 22 Oct 2019 04:05:54 -0400
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2052.outbound.protection.outlook.com [104.47.46.52])
        by mx0a-00128a01.pphosted.com with ESMTP id 2vqvb9nep0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 22 Oct 2019 04:05:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXqbBOzmW8weAzSqwim94OqrsP67TKtY7fdIwGODSGqxiwNUEcPLoQiBLQYCLoXqQzwVnjGyGaOzh19xhYkx9Xqf9xNQo/R3A3g7bzxdSwEZL+a4urPgCbx4e62i1XZBIse1B+ErVy5AQI4yjBhNtzm8biXyh3R+VKSQlHFpZfMNNneYSVd3AS/WLSwpM6TAMlH9GcV0LWld2a0BaUfp+sOgpD0aBVdPlsUCV2vtqi6jBIKwlJ2iTLB4JlIMKKl0DNrXVjNy8lW/JcXRGCY5YJ2iw/9w30ckW7fyecu8COe7E+AwERkfUmWIEkrmQfQymMOugKBvaRQkaZ0udj9GXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vb8pejP5k0LU15asFwQJeb6f7kUA6bCOfzbAPOaCar4=;
 b=BOJuAI8bhDs6s2kYGs0ZhA7ZfvnF3ziB4zv0sCN4wacH3HDHWacklMC+GMXEFMoLsLQuSVrtyTdFGp73RnnFcUPcL1hM4G4V4a3DIEHfAhxUsNXOIX2FrKzDEeJjgtj+4QPtrzZ4dxWbO4e/bqFt9Ddno3x4JC16hHbV+xz/Wxw2eLTydMN/bhxeboJts9jREQlw3YzmhOD1xL4F7TRyD1mpOSz01kI8+kPL+wT+cXVE2fzuiWWOqEINieSfHEklhcIDoXZy6gQu6n3HCw2NUtlKEdHuGrupibEPQ6QnXsYnOjWaBv0F0goqhksdAzy75vnqpEZ2OUvqLvqQcH6xxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vb8pejP5k0LU15asFwQJeb6f7kUA6bCOfzbAPOaCar4=;
 b=SGzdafnwtZE1b32Nhk8EQJ5Y24rhVKNC93ljGkAnLVowgX4cnwXLsThUgyUfhYrQm3s026AzEA140TsrRn6BnZCPcH3kSq3rv5diI0mc1HqpPatp3SdK8+SS8QXGoYmyuxaGBMU4f7c0NzOfpDwAWZzuHp3WnSRXEYrvEsxlGx4=
Received: from BY5PR03MB5110.namprd03.prod.outlook.com (52.133.251.202) by
 BY5PR03MB5064.namprd03.prod.outlook.com (52.133.248.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 08:05:52 +0000
Received: from BY5PR03MB5110.namprd03.prod.outlook.com
 ([fe80::3131:7c25:b35:ea7a]) by BY5PR03MB5110.namprd03.prod.outlook.com
 ([fe80::3131:7c25:b35:ea7a%7]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 08:05:52 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: asoc: adau7118: Cleanup
Thread-Topic: [PATCH 1/2] dt-bindings: asoc: adau7118: Cleanup
Thread-Index: AQHViB85Kv/fY/pWtEGtY4UhSPgV06dmTu+A
Date:   Tue, 22 Oct 2019 08:05:52 +0000
Message-ID: <2004e5958c838148dcc4a6fd085870f0dc2de6d9.camel@analog.com>
References: <20191021140816.262401-1-nuno.sa@analog.com>
         <20191021140816.262401-2-nuno.sa@analog.com>
         <20191021145225.GG4691@sirena.co.uk>
In-Reply-To: <20191021145225.GG4691@sirena.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8b081748-70fc-4a1a-63ea-08d756c6a83d
x-ms-traffictypediagnostic: BY5PR03MB5064:
x-microsoft-antispam-prvs: <BY5PR03MB5064D08CB7B09222EFF0738699680@BY5PR03MB5064.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(366004)(39860400002)(376002)(136003)(199004)(189003)(3846002)(66946007)(99286004)(25786009)(64756008)(26005)(102836004)(66556008)(66476007)(5660300002)(7736002)(6436002)(305945005)(478600001)(66066001)(6512007)(66446008)(14454004)(6486002)(76176011)(6506007)(66574012)(229853002)(5640700003)(4001150100001)(6116002)(54906003)(476003)(11346002)(446003)(2616005)(2351001)(8936002)(71190400001)(6916009)(71200400001)(6246003)(4326008)(91956017)(81156014)(81166006)(1730700003)(8676002)(76116006)(2501003)(256004)(14444005)(486006)(118296001)(2906002)(86362001)(36756003)(186003)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR03MB5064;H:BY5PR03MB5110.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Wc0HhNRsAnEo3HuDUnrGFRM3MrjGVk3+YNUA0HDgeWGd1FQgEjq2Fqu9/F2RgdXHrNo3B5xKZDMjbJmfkBgXx2bna2tCsfMVRL3saEZfERoY8aN2bkoqGRO9XGctE2brSIZOQEjt1o0wamyqJ2aWVhVRlqLFbf/9x7IXsP1C8cJoOl0d+5YxPqc6G/MxMBIijcP3/Rhz2+BO+WGagrm/lGsq9QfEQnlacD5PI7DcYB4rXJrikcKkF9qqhj92HzHVw84cjJGk13Bzx6OVL/gkOtgyBTJaeCj4khTlTo1SuTHBsZJbhuFGyhPXywxRsY1AymqU9HJIZwgziP1gXxBBU6hEVQf6Ki/pkAIf54WhMgUhgsEKzk37+xV9cjhee6h4CTM892Z3ZCFCR69GTldIwnvoeh2p+YJK0gKUvsKC/hagGL6DKE2W6MaAbLdWBum
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AC6BB68479CE5418C25A5D1146EFE35@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b081748-70fc-4a1a-63ea-08d756c6a83d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 08:05:52.1895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cG3NgiVJFTfRJsDYeX5S+ydNb+xQBlnqsAIvuuTkPPlA3be4pRM0CU1aZocoaS+41IfZOYBD9lCebJtOGBu6gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5064
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-22_03:2019-10-21,2019-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910220077
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGkgTWFyaywNCg0KT24gTW9uLCAyMDE5LTEwLTIxIGF0IDE1OjUyICswMTAwLCBNYXJrIEJyb3du
IHdyb3RlOl0NCj4gDQo+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDA0OjA4OjE1UE0gKzAyMDAs
IE51bm8gU8OhIHdyb3RlOg0KPiA+IFRoaXMgY2hhbmdlcyBhcmUgaW4gYWNjb3JkYW5jZSB3aXRo
IHRoZSByZXZpZXcgZG9uZSB0byB0aGlzDQo+ID4gYmluZGluZ3MuDQo+ID4gVGhpcyBpcyBhIGZv
bGxvdy11cCBwYXRjaCB0byA5NjlkNDliMmNkYzguDQo+IA0KPiBQbGVhc2UgaW5jbHVkZSBodW1h
biByZWFkYWJsZSBkZXNjcmlwdGlvbnMgb2YgdGhpbmdzIGxpa2UgY29tbWl0cyBhbmQNCj4gaXNz
dWVzIGJlaW5nIGRpc2N1c3NlZCBpbiBlLW1haWwgaW4geW91ciBtYWlscywgdGhpcyBtYWtlcyB0
aGVtIG11Y2gNCj4gZWFzaWVyIGZvciBodW1hbnMgdG8gcmVhZCBlc3BlY2lhbGx5IHdoZW4gdGhl
eSBoYXZlIG5vIGludGVybmV0DQo+IGFjY2Vzcy4NCj4gSSBkbyBmcmVxdWVudGx5IGNhdGNoIHVw
IG9uIG15IG1haWwgb24gZmxpZ2h0cyBvciB3aGlsZSBvdGhlcndpc2UNCj4gdHJhdmVsbGluZyBz
byB0aGlzIGlzIGV2ZW4gbW9yZSBwcmVzc2luZyBmb3IgbWUgdGhhbiBqdXN0IGJlaW5nIGFib3V0
DQo+IG1ha2luZyB0aGluZ3MgYSBiaXQgZWFzaWVyIHRvIHJlYWQuDQoNCk5vdGVkLCBJIHdvbid0
IHVzZSBjb21taXQgaGFzaGVzIGxpa2UgdGhpcyBhbnltb3JlLiBBbHNvLCBJIHNhdyB0aGF0IHlv
dQ0KYXBwbGllZCB0aGUgcGF0Y2ggYWxyZWFkeSBhbmQganVzdCBGWUksIHRoZSBwYXRjaDoNCg0K
YjJkNmVlNzUzMTI2IChvcmlnaW4vZm9yLTUuNSkgQVNPQzogYWRhdTcxMTg6IENoYW5nZSByZWd1
bGF0b3JzIGlkDQoNCmlzIHBvaW50aW5nIHRvIGI2NzBlNDRmYzNiZCBpbiBpdCdzIGRlc2NyaXB0
aW9uIHdoaWNoIGRvZXMgbm90IGV4aXN0Lg0KDQpJIHNlZSB0aGF0IGRlc2NyaXB0aW9ucyBsaWtl
IHRoaXMgY2FuIGxlYWQgdG8gdGhpcyBzaXR1YXRpb25zLiBTb3JyeSBhYm91dA0KdGhpcy4uLg0K
DQpSZWdhcmRzLA0KTnVubyBTw6ENCg==
