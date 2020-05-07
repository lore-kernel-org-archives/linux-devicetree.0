Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5E7C47257
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 16:07:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D818D20659
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 16:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PKi+F84X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NIHfFaLG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgEGQHN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 12:07:13 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:40340 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726618AbgEGQHM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 12:07:12 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F394C0099;
        Thu,  7 May 2020 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588867631; bh=lA6/aN1WTjCZB4QhP6LOp+ShIDQoUT1fhEZhNKPiux4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=PKi+F84XvZHfERr0ggk3mSO4z8y4pJZHJu0yWrbswZXXXoJxrthR9jfSihYS3Jo7A
         RELtg9CF28C1V3A9x91bGVV9L98YTWFWtmnaNfSdH/UldbtWD342iHb2xgvfSHGWjJ
         6HxPuK2Fyda+KxuQZ6WLSoAw+ay4hr3Zs3Sbk0K0s0YqZ4K908RvJ4MY4sqD/uQsLD
         txoAVQVw/ZUAKxptn83grPbHa9UoSiZjevCyHsVFBpISAsscHMoOX+PywlZQvqotBr
         oB9QRRoiZA02wbxvvejdRHuS9iIJweMd1935FLvkexNpsEbulHGIktP409B4iFmbUR
         4PavUF5g+qSdg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 37767A0070;
        Thu,  7 May 2020 16:07:11 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 7 May 2020 09:07:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 7 May 2020 09:07:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b28KajE/TMrdVZ5iq4Kix3sG7PEIVhh9aom561VgxGmGuawrXz7m8hR8TI46aJ8xJJ21/J9EdKh1BpL22RyRtzxjfJ3h2YLsdejLHo+/VcimYPlTL+iR6Q8/elEdp/bYtyT9mv0X+lob9rBnY69iKS6RgNMp5K52p2L5ivGu5fzq7ywiGxIijHpUDSY/UOxNmjwS9DZqCix0kf43I9NKbSWEHTnDrR2jI2GfWUNx+IJmU1w5yY0d6gYDUUC68nm97qBlK1pimWM74TALT9WX1zuXZfPACZ0btt64vsMi9P22kzqM1lgylnkwWdewFbFEui5/z6QQDAN/lQCULymdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA6/aN1WTjCZB4QhP6LOp+ShIDQoUT1fhEZhNKPiux4=;
 b=UiYAZmYyhOfBwX74xvjAGSBW4ux2QiSQ+iCX0hdD31j+otUq6OJSP8hQYulPC9zcbtnDzHgkcNJttH715DOrXbTvwtA1/u0dhcnhoiI3fAelxQLBHnuCwHEd/rkT66v8n07PHi793+Ror7r6T+kbpjc7XYZ4KWQUBEcDqlroL/wjmd6zry08lh1nBwGikmC9EBWfei2sEl9ExuypljlvjWr/kLjVDOhbI5AJhVvi7NXyYDv67bw54s0eMetGRS+OeKMlJW3Czir+7OytkOE+Gp3tdgDxvdg7g+AM/F73AxRGPsJ6506VjJ1ufHBtlaMOx+5gwjSvK8+++Mo+TzCzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA6/aN1WTjCZB4QhP6LOp+ShIDQoUT1fhEZhNKPiux4=;
 b=NIHfFaLG5NItbLBkdkGAXcXs3WGGcF7EpFncTEulU0oyuIY+kpcwBo9STPm2QyFmfZqftL+7WqbTxXYGgGBlMVN+kjJg4I99kvHzY7+vzFTzzP1cFexTQd+w4CCUDHqpA552iyYCuYT07oqX8ytCcv0PcAzdNElUX66/3qjPuMY=
Received: from CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 by CH2PR12MB3973.namprd12.prod.outlook.com (2603:10b6:610:2c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 7 May
 2020 16:07:10 +0000
Received: from CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467]) by CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467%5]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 16:07:09 +0000
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Rob Herring <robh@kernel.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: usb: Add documentation for SG trb
 cache size quirk
Thread-Topic: [RFC PATCH v2 1/4] dt-bindings: usb: Add documentation for SG
 trb cache size quirk
Thread-Index: AQHWF8IOTUVfYLHIw0a2UHIrWHIpCaiblucAgAFMsAA=
Date:   Thu, 7 May 2020 16:07:09 +0000
Message-ID: <d0dabbe4-7a0a-d6a9-6592-1303ff1e8ceb@synopsys.com>
References: <cover.1587461220.git.joglekar@synopsys.com>
 <5f5fdfbd323159133fced5b1340f5eb5fd11a17a.1587461220.git.joglekar@synopsys.com>
 <20200506201622.GA23227@bogus>
In-Reply-To: <20200506201622.GA23227@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.49.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fec9aec-f0ea-4de8-6353-08d7f2a0b21d
x-ms-traffictypediagnostic: CH2PR12MB3973:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB397341F53F048DA6B8FC39C8A4A50@CH2PR12MB3973.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 03965EFC76
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9m0qw+XGBMiu9kDwcK2d36Pvt+VgRYMlyQCmefWC7Xol5t+qy1TJ9xymZY+LArNvvswRwUXulLKnru4XZKi8jN4EAmBKrmMHzetTgGzoaczIbHzYpRYctwBfPMNfGE7oQnFTl4irX/z72O+0VvHB6FFx5GpeQVNgQeYqd514XPNDR0Lz/mCEEWHHE7S1lfoAmFbR+W1A7DTUAoGTR4uqDMg4K/2fyfhTOn8VRPijcGOwMvRvrkue0d3nZsx8w4BGbfKjmmbOWshZeshuFCaJ/dGf/2HscsC9YtCIspL2VhXiazTn8tM823F+CvZsZspErKQu9CgetDvC/B7W+ivu/NEPhcFdjlKIh9t19MESwRPghfgHbJNBfbHIq69UcruAsqExCbJs4KvWP+wzkyC2dZnNHfZn4b6727G0z+cxw2iPCpz10O1iis8BdUD/fEqagYFGAfSG6KmBP0MRaO2OwVFrHAsrMlPc802FrrXzuUuqxq01kToSo7iFHnkYNvXZ9kcmLENqjkWAO7dddR7Nqw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4311.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(376002)(39860400002)(366004)(396003)(33430700001)(71200400001)(110136005)(54906003)(2906002)(5660300002)(316002)(66556008)(478600001)(66946007)(66476007)(76116006)(91956017)(64756008)(6506007)(8676002)(2616005)(55236004)(186003)(53546011)(26005)(6512007)(66446008)(107886003)(4326008)(83280400001)(83320400001)(83290400001)(6486002)(83310400001)(31696002)(86362001)(31686004)(8936002)(83300400001)(33440700001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: vPhpr5oGr8KLtQVQT+Ub1k5Zn8wA4GYKF1isiC7gXEQNRS30XISqhctb09j+kXJBlbzB/bqErBmXs5Y6qxLzA8WPIDPR076FNNV+pA76DgWpVY+nDVniivzObRco4gEgJjoc0ZJMtBETfgw6doANuXFvz1lymQImYTAnPhvgmhad1jdP4pF/SwFnjzN4/DjFVNtzOzwXYGH3PRMSoblmSp7Xunkc4uX0Rz6epgiV23dzlTqCC8OenTQRjPNFHnG2+pSRm1GAFOlUHgPwsQcyfTgLuemHPOOYdm+BdcDpXU4l7xpJXoHF6vkXRlw2NOKdpLHcINVbTpTkxNNOZdNMDigDnltxeS+pzZX26XxM1XD6Wazm2QnuOqu6+q8QJNhppMFFna9l5gmkcgRD+UDOc10xrX4ySzC/3nMuKHeD2sxXYcuXuGVLWYlVcB8kj84xnUgSpqXAcuHUDakWiyktilCcI4cFAZiiYvnSOJKZ8aHSMOw7XtzJKn/kmoVMmFrYFpSVIoWFRQBGSEjkKfbg4hIcZlQR/GyWRO53UAwoB/oWOI0gnQh868cFxxhA2wVCoQRHWMHJPAWc3jU/5kWPPF9D1H1tpFDpYp2l8nuzugyWqDpG5wozqx2v8i5cAWnxeX9wCr9+L0jeKVlEnxtc/AJJhEUEoUyWToMrvBrvqo79xAQnUm8bpxU4Aub3vALzW4DbZNkmC7l9BV1Vdg8Obf4mrDj3wlMH6YqCc3BGyZH1BQ/yo0QKz34mvWFEZ6sCaTufrra6jESJMZHavFn4SLoR4FhK2htwg7TSaVEAgaw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB38B642F76DFF45AA28DD0E774FC848@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fec9aec-f0ea-4de8-6353-08d7f2a0b21d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2020 16:07:09.1829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V9J7TBOMNZxNYzue3bieTKscsdMG/ZQd70Y4tEX+5L8E9262DzWPUytWrMiU2peA0p/228RqCzYYrziY+cyVVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3973
X-OriginatorOrg: synopsys.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGksDQpPbiA1LzcvMjAyMCAxOjQ2IEFNLCBSb2IgSGVycmluZyB3cm90ZToNCj4gT24gVHVlLCBB
cHIgMjEsIDIwMjAgYXQgMDM6MTg6MDlQTSArMDUzMCwgVGVqYXMgSm9nbGVrYXIgd3JvdGU6DQo+
PiBUaGlzIGNvbW1pdCBhZGRzIHRoZSBkb2N1bWVudGF0aW9uIGZvciBzZ2wtdHJiLWNhY2hlLXNp
emUtcXVpcmssIGFuZA0KPj4gc25wcyxzZ2wtdHJiLWNhY2hlLXNpemUtcXVpcmsgcHJvcGVydHku
IFRoZXNlIHdoZW4gc2V0IGVuYWJsZXMgdGhlDQo+PiBxdWlyayBmb3IgWEhDSSBkcml2ZXIgZm9y
IGNvbnNvbGlkYXRpb24gb2Ygc2cgbGlzdCBpbnRvIGEgdGVtcG9yYXJ5DQo+PiBidWZmZXIgd2hl
biBzbWFsbCBidWZmZXIgc2l6ZXMgYXJlIHNjYXR0ZXJlZCBvdmVyIHRoZSBzZyBsaXN0IG5vdA0K
Pj4gbWFraW5nIHVwIHRvIE1QUyBvciB0b3RhbCB0cmFuc2ZlciBzaXplIHdpdGhpbiBUUkIgY2Fj
aGUgc2l6ZSB3aXRoDQo+PiBTeW5vcHN5cyB4SEMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGVq
YXMgSm9nbGVrYXIgPGpvZ2xla2FyQHN5bm9wc3lzLmNvbT4NCj4gDQo+IFRoZSBhdXRob3IgYW5k
IFMtby1iIGVtYWlscyBkb24ndCBtYXRjaC4NCj4gDQpJIGludGVuZCB0byB1c2Ugc2hvcnQgZW1h
aWwsIGJ1dCB0aGUgc2VydmVyIG1hbmdsZXMgdGhlIGZ1bGwgZW1haWwgZXZlbiBpZiB3ZQ0Kc2V0
IGl0IG1hbnVhbGx5IHRvIHNob3J0IGVtYWlsLiBJIGhhdmUgYmVlbiB1c2luZyB0aGUgc2FtZSBp
biB0aGUgcGFzdCB0byBzZW5kDQp0aGUgcGF0Y2hlcyB0byBjb21tdW5pdHkuIERvIHlvdSB3YW50
IG1lIHRvIGNoYW5nZSB0aGUgc2lnbi1vZmYgdG8gc2VuZGVyIGVtYWlsIGFkZHJlc3M/IA0KDQo+
PiAtLS0NCj4+ICBDaGFuZ2VzIGluIHYyOg0KPj4gIC0gUmVuYW1lZCB0aGUgcHJvcGVydHkNCj4+
DQo+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dCAgICAg
fCA0ICsrKysNCj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi14
aGNpLnR4dCB8IDMgKysrDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9k
d2MzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQN
Cj4+IGluZGV4IDk5NDZmZjliYTczNS4uNmQwNDE4ZWU0ZGJkIDEwMDY0NA0KPj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4gQEAgLTEwNCw2
ICsxMDQsMTAgQEAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4+ICAJCQl0aGlzIGFuZCB0eC10aHIt
bnVtLXBrdC1wcmQgdG8gYSB2YWxpZCwgbm9uLXplcm8gdmFsdWUNCj4+ICAJCQkxLTE2IChEV0Nf
dXNiMzEgcHJvZ3JhbW1pbmcgZ3VpZGUgc2VjdGlvbiAxLjIuMykgdG8NCj4+ICAJCQllbmFibGUg
cGVyaW9kaWMgRVNTIFRYIHRocmVzaG9sZC4NCj4+ICsgLSBzbnBzLHNnbC10cmItY2FjaGUtc2l6
ZS1xdWlyazogZW5hYmxlIHNnIGxpc3QgY29uc29saWRhdGlvbiAtIGhvc3QgbW9kZQ0KPj4gKwkJ
CW9ubHkuIFNldCB0byB1c2UgU0cgYnVmZmVycyBvZiBhdCBsZWFzdCBNUFMgc2l6ZQ0KPj4gKwkJ
CWJ5IGNvbnNvbGlkYXRpbmcgc21hbGxlciBTRyBidWZmZXJzIGxpc3QgaW50byBhDQo+PiArCQkJ
c2luZ2xlIGJ1ZmZlci4NCj4+ICANCj4+ICAgLSA8REVQUkVDQVRFRD4gdHgtZmlmby1yZXNpemU6
IGRldGVybWluZXMgaWYgdGhlIEZJRk8gKmhhcyogdG8gYmUgcmVhbGxvY2F0ZWQuDQo+PiAgIC0g
c25wcyxpbmNyLWJ1cnN0LXR5cGUtYWRqdXN0bWVudDogVmFsdWUgZm9yIElOQ1IgYnVyc3QgdHlw
ZSBvZiBHU0JVU0NGRzANCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL3VzYi14aGNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy91c2IvdXNiLXhoY2kudHh0DQo+PiBpbmRleCAzZjM3ODk1MWQ2MjQuLjE0ZDkwMDQ3NDg5
NCAxMDA2NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
dXNiLXhoY2kudHh0DQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dXNiL3VzYi14aGNpLnR4dA0KPj4gQEAgLTQzLDYgKzQzLDkgQEAgT3B0aW9uYWwgcHJvcGVydGll
czoNCj4+ICAgIC0gcXVpcmstYnJva2VuLXBvcnQtcGVkOiBzZXQgaWYgdGhlIGNvbnRyb2xsZXIg
aGFzIGJyb2tlbiBwb3J0IGRpc2FibGUgbWVjaGFuaXNtDQo+PiAgICAtIGltb2QtaW50ZXJ2YWwt
bnM6IGRlZmF1bHQgaW50ZXJydXB0IG1vZGVyYXRpb24gaW50ZXJ2YWwgaXMgNTAwMG5zDQo+PiAg
ICAtIHBoeXMgOiBzZWUgdXNiLWhjZC55YW1sIGluIHRoZSBjdXJyZW50IGRpcmVjdG9yeQ0KPj4g
KyAgLSBzZ2wtdHJiLWNhY2hlLXNpemUtcXVpcms6IHNldCBpZiB5b3UgbmVlZCB0byBjb25zb2xp
ZGF0ZSBzZyBsaXN0IGludG8gYQ0KPj4gKyAgICB0ZW1wb3JhcnkgYnVmZmVyIHdoZW4gc21hbGwg
U0cgYnVmZmVyIHNpemVzIGRvZXMgbm90IG1ha2UgdXB0byBNUFMNCj4+ICsgICAgc2l6ZSBvciB0
b3RhbCB0cmFuc2ZlciBzaXplIGFjcm9zcyB0aGUgVFJCIGNhY2hlIHNpemUuDQo+PiAgDQo+PiAg
YWRkaXRpb25hbGx5IHRoZSBwcm9wZXJ0aWVzIGZyb20gdXNiLWhjZC55YW1sIChpbiB0aGUgY3Vy
cmVudCBkaXJlY3RvcnkpIGFyZQ0KPj4gIHN1cHBvcnRlZC4NCj4+IC0tIA0KPj4gMi4xMS4wDQo+
Pg0KVGhhbmtzICYgUmVnYXJkcywNCiAgVGVqYXMgSm9nbGVrYXINCg==
