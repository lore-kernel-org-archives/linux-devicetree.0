Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28787C433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 02:11:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0210207E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 02:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="B/bqTrUx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KWl4PUd+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387731AbgGWCLS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 22:11:18 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54204 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387507AbgGWCLR (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jul 2020 22:11:17 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EF2824017D;
        Thu, 23 Jul 2020 02:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595470277; bh=9kDhN05XwnGyHEDz7F2AfXkzTKAbyt7ZAB88KoCN/as=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=B/bqTrUxpn7MJtY6yNPig/C8QaVSsQhPiWoieXrYDOPM55raoIwDmBr4jaE9tE9Th
         JUxAuB72UrMJL7ekPjdPRwz5NKLegwH4uyOgIUIrjNCmoIcaKIj5+2W/6ZqKKVQJ0v
         /Rl2BV3WrtfmWrvQnUKoZwdtFbEqlFyrHDWdOlukDIPjRJTpLc/Oyp1E3HCQjIf7se
         uekKTeH0M+4IdMTMECZLY80Q8huC3jZRwTaxm43cSUI45GHb4coLrJjESDYSXN0qIT
         dhvm1kLBbIMlt0cPCebNvU+Ui+TVEyk3vwybcZSnveu7eg4oRT1wtyp6l+HnC3UnHn
         jLlLvWYpcqM5Q==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8600EA009C;
        Thu, 23 Jul 2020 02:11:16 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 337134017D;
        Thu, 23 Jul 2020 02:11:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="KWl4PUd+";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdratVeFNhGaiaDVH13vdB0KXC3PQ2y1DlTqNLlCATJzapJ/XrD7SdiKXb1slr/1dPDuY3hABfBiwwtxA8HFlXeU8QN5qoZfxUdxkxi9RIhpWR4+bkQFwVuA5h9/hPwMkKUXIGcwVNZwpscO50oS3oMMNkyajyQLm+LBr29dzcE8Bf6iEr9D0pb+NsAriC33oUgImNuivsIYfB8pAQTflUgtNC0uK8PAymlmrvB+nxUfTWdyu6GCH5sXdJs49q7VkSQpyxImAWdSsk+JAuGw0SeEiyMkaMOpxjxtrjlyR1vRMMNE/X7SZcKlGekKzQSWCxd6+xz/seMU8/16tjQqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kDhN05XwnGyHEDz7F2AfXkzTKAbyt7ZAB88KoCN/as=;
 b=WZaGW1yMWIUAMjuvm5qNmpxwWrnyxG/MV5+LxO6F0IUz/gZQ/rPFp1R8wI2JB63F5bvPOP/8eLMGJmIwoqgy+06ZuUGJccyJtllwOEZeFv58Wv8MxzYiKhRrw8NeGRqDzorE5+CuZQe1/0aTE3Bi2+g35zx4YC/m8CWJu9iwOyEGiUlPxenZLuw/xeMsW6M6N9RG5oaq9SvrLQiPsfXaGnie/fdVgykfakEmtWfs9IxKoDdQWzJ5qFcsjlPeK7UNvBx261uJVXUdN6paPfwwzC8Ik4J+DPh59lyZDU6KuKOMnxH1sfpOGLiW5BBv7jSrvxraTkdxlBVL+CiiMsRckA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kDhN05XwnGyHEDz7F2AfXkzTKAbyt7ZAB88KoCN/as=;
 b=KWl4PUd+19mii1dGv/XD2iGJ1eT8pPNS8k3OMRMiI0FNx716786kaqW4UxDmsMW4YYIzZlnIV73ibd7+UTXche9oVv0sUHIUP4E60FJZ4pzpNGsGeGM71qdhhb79PKt70szWfsZNM28qBl3exCMOc8BNNdcPgzF3zgwxCNP6Ozw=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Thu, 23 Jul
 2020 02:11:13 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3195.026; Thu, 23 Jul 2020
 02:11:13 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
Thread-Topic: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
Thread-Index: AQHWW7xVn29tfo9/DkKD4yu8ygVtF6kRaYEAgAAW7YCAAKirAIAAGx8AgAFx4gCAAAgVAIAAJg+AgACRXYA=
Date:   Thu, 23 Jul 2020 02:11:13 +0000
Message-ID: <f68f395c-0821-9e34-f6cf-75fa60c9a35b@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <9684a2b2adb01b6b1a8c513928ea49b4a6436184.1594935978.git.thinhn@synopsys.com>
 <20200721033908.GA3508628@bogus>
 <d7e3d5c6-05c1-f256-7773-2b88f6cd5ca3@synopsys.com>
 <CAL_JsqLSKKT__dJaML4SWCpFpFYV_Cpkor=mNh5-Z7hE4n4fMA@mail.gmail.com>
 <57fffdfb-a4fa-6e50-1156-1ada3765e362@synopsys.com>
 <CAL_JsqKSrs93wLrxy2gaBEhGfgZs7jpjFarQBoHGxMc6ur3WRQ@mail.gmail.com>
 <31d57197-6365-754b-2f1b-56d7cc8e8d89@synopsys.com>
 <034f2463-becb-4de7-1dc6-d26e4f37957c@synopsys.com>
In-Reply-To: <034f2463-becb-4de7-1dc6-d26e4f37957c@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a78e361-a40a-4ef0-bbc8-08d82eadacf6
x-ms-traffictypediagnostic: BY5PR12MB4291:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4291C67B60FB4BB9E96B1334AA760@BY5PR12MB4291.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LPNnhDtMuH24zyn91yWf1vmJYzBWpa9u/FxC1dYxd2qRfOwX9lWY9uikOtmH7SGU6BxziUVdD3DGjclBv8FKwHbLsqYSbBJ5T2CJyZMaEwuYT+kxYfTeuE09ph711q73q5iakOFKi+3tbp5wM3UxoDkYJbn2KFahs2iXGoIpuXd5/XfCeW8eE7FbZhy+7JV/fep2GP1LfkftVORQQhsmP4ZqvHsT8/Uf+ZQewkN00QKcXaUNeSLVlXMeRDGsnj1yLNHdQ2+XDQcb3mzJasb1rkzKZZ2nQ5UtD2Mp3nNXRNEqBDo4jKlDHTjSPBQYdUqFDOJ17/7OLGFbUXp5iJyzEJdqWbWIczM1EuLCjStIwKw14KBY4u1fIg92JOraT4dz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(376002)(136003)(39860400002)(396003)(6486002)(71200400001)(83380400001)(6916009)(8936002)(2616005)(4326008)(107886003)(8676002)(478600001)(5660300002)(6512007)(31686004)(66476007)(66946007)(66446008)(64756008)(66556008)(54906003)(2906002)(31696002)(86362001)(36756003)(316002)(26005)(53546011)(76116006)(6506007)(186003)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: mM3VmGroyHgDAfN03aN4FRGjqMQs0TezURf4x9Bg51PYU33OXw8Eu8kvtFByBUmmSfvyNTogdzeiEb1Rqpu47zDL2zPcTPjUrTaReTZlC20wAWCF+5/LbwS23qwEctKpkhcW+292Bwt4IZZ/d450eOTcauqCpE06FeSArXje8g2OmpF1tjLXFYCE80RRaZzr4D0vhPC8+LGpUdmW/U/G5UzhwTb0EUnNeTVz2euB9h5YGhcqj9qP/uFt5T540FvgISyM5PwxZ0PvNIYgdxpcTmcoiQi/rP/dIStDytMTgUpNQerCcx1TebZ+1P7Q1SxBGDNebp+hzkr7RopLI0EF9RJZNSI6AjxBhXcGWnsBwB/iLIFz5or6GgRSQWehsqNXz768KtaOJ3GyApACGmuNC1zuy68bClPVRMe3p+/d7BAs+JkXNBtaOUoQ1JwjgoMKDdTjvVkVZXqMk25JiRwzJYM935JwFW5CPwO9cnrcC2E=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6992744C91AC94CBD6696979DC53A8C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a78e361-a40a-4ef0-bbc8-08d82eadacf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2020 02:11:13.7846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUr1zDpwp60LpMJ57Fq0Tsosk/H00Q1APTGnfzKtcVnq33h8985CIt6yxEWsXz3/SzB6mPQJ2dngDfs0DBLktw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBSb2IgSGVycmlu
ZyB3cm90ZToNCj4+PiBPbiBUdWUsIEp1bCAyMSwgMjAyMCBhdCAxMDo0MiBBTSBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPj4+PiBSb2IgSGVycmluZyB3
cm90ZToNCj4+Pj4+IE9uIE1vbiwgSnVsIDIwLCAyMDIwIGF0IDExOjAxIFBNIFRoaW5oIE5ndXll
biA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+Pj4+Pj4gUm9iIEhlcnJpbmcg
d3JvdGU6DQo+Pj4+Pj4+IE9uIFRodSwgSnVsIDE2LCAyMDIwIGF0IDAyOjU5OjA4UE0gLTA3MDAs
IFRoaW5oIE5ndXllbiB3cm90ZToNCj4+Pj4+Pj4+IEludHJvZHVjZSBudW0tbGFuZXMgYW5kIGxh
bmUtc3BlZWQtbWFudGlzc2EtZ2JwcyBmb3IgZGV2aWNlcyBvcGVyYXRpbmcNCj4+Pj4+Pj4+IGlu
IHN1cGVyLXNwZWVkLXBsdXMuIERXQ191c2IzMiBJUCBzdXBwb3J0cyBtdWx0aXBsZSBsYW5lcyBh
bmQgY2FuDQo+Pj4+Pj4+PiBvcGVyYXRlIGluIGRpZmZlcmVudCBzdWJsaW5rIHNwZWVkcy4gQ3Vy
cmVudGx5IHRoZSBkZXZpY2UgY29udHJvbGxlcg0KPj4+Pj4+Pj4gZG9lcyBub3QgaGF2ZSB0aGUg
aW5mb3JtYXRpb24gb2YgdGhlIHBoeSdzIG51bWJlciBvZiBsYW5lcyBzdXBwb3J0ZWQuIEFzDQo+
Pj4+Pj4+PiBhIHJlc3VsdCwgdGhlIHVzZXIgY2FuIHNwZWNpZnkgdGhlbSB0aHJvdWdoIHRoZXNl
IHByb3BlcnRpZXMgaWYgdGhleSBhcmUNCj4+Pj4+Pj4+IGRpZmZlcmVudCB0aGFuIHRoZSBkZWZh
dWx0IHNldHRpbmcuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1
eWVuIDx0aGluaG5Ac3lub3BzeXMuY29tPg0KPj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+PiAgICAgICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0IHwgOSArKysrKysr
KysNCj4+Pj4+Pj4+ICAgICAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4+Pj4+
Pj4+DQo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9kd2MzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
ZHdjMy50eHQNCj4+Pj4+Pj4+IGluZGV4IGQwM2VkZjlkMzkzNS4uNGViYTA2MTU1NjJmIDEwMDY0
NA0KPj4+Pj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9k
d2MzLnR4dA0KPj4+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9kd2MzLnR4dA0KPj4+Pj4+Pj4gQEAgLTg2LDYgKzg2LDE1IEBAIE9wdGlvbmFsIHByb3Bl
cnRpZXM6DQo+Pj4+Pj4+PiAgICAgICAgLSBzbnBzLHF1aXJrLWZyYW1lLWxlbmd0aC1hZGp1c3Rt
ZW50OiBWYWx1ZSBmb3IgR0ZMQURKXzMwTUhaIGZpZWxkIG9mIEdGTEFESg0KPj4+Pj4+Pj4gICAg
ICAgICAgcmVnaXN0ZXIgZm9yIHBvc3Qtc2lsaWNvbiBmcmFtZSBsZW5ndGggYWRqdXN0bWVudCB3
aGVuIHRoZQ0KPj4+Pj4+Pj4gICAgICAgICAgZmxhZGpfMzBtaHpfc2RibmQgc2lnbmFsIGlzIGlu
dmFsaWQgb3IgaW5jb3JyZWN0Lg0KPj4+Pj4+Pj4gKyAtIHNucHMsbnVtLWxhbmVzOiBzZXQgdG8g
c3BlY2lmeSB0aGUgbnVtYmVyIG9mIGxhbmVzIHRvIHVzZS4gVmFsaWQgaW5wdXRzIGFyZQ0KPj4+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgMSBvciAyLiBBcHBseSBpZiB0aGUgbWF4aW11bS1z
cGVlZCBpcyBzdXBlci1zcGVlZC1wbHVzDQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICBv
bmx5LiBEZWZhdWx0IHZhbHVlIGlzIDIgZm9yIERXQ191c2IzMi4gRm9yIERXQ191c2IzMSwNCj4+
Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgIGl0IGlzIGFsd2F5cyAxIGF0IHN1cGVyLXNwZWVk
LXBsdXMuDQo+Pj4+Pj4+PiArIC0gc25wcyxsYW5lLXNwZWVkLW1hbnRpc3NhLWdicHM6IHNldCB0
byBzcGVjaWZ5IHRoZSBzeW1tZXRyaWMgbGFuZSBzcGVlZA0KPj4+Pj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgbWFudGlzc2EgaW4gR2Jwcy4gVmFsaWQgaW5wdXRzIGFyZSA1IG9yIDEwLiBBcHBs
eSBpZg0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgdGhlIG1heGltdW0tc3BlZWQgaXMg
c3VwZXItc3BlZWQtcGx1cyBvbmx5LiBEZWZhdWx0DQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAg
ICAgICB2YWx1ZSBpcyAxMC4gRm9yIERXQ191c2IzMSwgaXQncyBhbHdheXMgMTAgYXQNCj4+Pj4+
Pj4+ICsgICAgICAgICAgICAgICAgICAgIHN1cGVyLXNwZWVkLXBsdXMuDQo+Pj4+Pj4+IFRoaXMg
aXMgYWxsIGNvbW1vbiBVU0IgdGhpbmdzIGFuZCBzaG91bGQgYmUgY29tbW9uIHByb3BlcnRpZXMg
KHdoaWNoIHdlDQo+Pj4+Pj4+IG1heSBhbHJlYWR5IGhhdmUpLg0KPj4+Pj4+IFN1cmUuIEZvciAi
bnVtLWxhbmVzIiBpcyBzaW1wbGUsIGFueSBvYmplY3Rpb24gaWYgd2UgdXNlDQo+Pj4+Pj4gImxh
bmUtc3BlZWQtbWFudGlzc2EtZ2JwcyI/IE9yIHNob3VsZCB3ZSBhZGQgImxhbmUtc3BlZWQtZXhw
b25lbnQiPw0KPj4+Pj4gJ251bS1sYW5lcycgaXMgZ29vZCBhcyB0aGF0J3Mgd2hhdCBQQ0llIHVz
ZXMuIERvY3VtZW50IHRoYXQgd2l0aA0KPj4+Pj4gJ21heGltdW0tc3BlZWQnLg0KPj4+Pj4NCj4+
Pj4+IEkgdGhpbmsgJ3N1cGVyLXNwZWVkLXBsdXMnIHNob3VsZCBtZWFuIGdlbiAyIDEwRyBwZXIg
bGFuZS4gVGhlbg0KPj4+Pj4gYmV0d2VlbiBudW0tbGFuZXMgYW5kIG1heGltdW0tc3BlZWQgeW91
IGNhbiBkZWZpbmUgYWxsIDQgcG9zc2libGUNCj4+Pj4+IHJhdGVzLg0KPj4+PiBUaGF0IG1heSBj
b25mdXNlIHRoZSB1c2VyIGJlY2F1c2Ugbm93IHdlJ2QgdXNlICdzdXBlci1zcGVlZC1wbHVzJyB0
bw0KPj4+PiBkZWZpbmUgdGhlIHNwZWVkIG9mIHRoZSBsYW5lIHJhdGhlciB0aGFuIHRoZSBkZXZp
Y2UgaXRzZWxmLg0KPj4+Pg0KPj4+PiBBY2NvcmRpbmcgdG8gdGhlIFVTQiAzLjIgc3BlYywgc3Vw
ZXItc3BlZWQtcGx1cyBjYW4gbWVhbiBnZW4yeDEsIGdlbjF4MiwNCj4+Pj4gb3IgZ2VuMngyLg0K
Pj4+IFRoZW4gYWRkIG5ldyBzdHJpbmdzIGFzIG5lZWRlZCB0byBtYWtlIGl0IGNsZWFyOiBzdXBl
ci1zcGVlZC1wbHVzLWdlbjF4Mg0KPj4+DQo+Pj4gSXQncyBvYnZpb3VzIHRoYXQgd2hhdCAnc3Vw
ZXItc3BlZWQtcGx1cycgbWVhbnMgaXMgbm90IGNsZWFyIHNpbmNlDQo+Pj4gVVNCLUlGIGV4dGVu
ZGVkIGl0cyBtZWFuaW5nLg0KPj4+DQo+Pj4gUm9iDQo+PiBJZiB3ZSBpbnRyb2R1Y2UgYSBuZXcg
ZW51bSBmb3IgZ2VuMXgyLCBub3cgd2UnZCBoYXZlIHRvIGdvIGJhY2sgYW5kDQo+PiBpbnNwZWN0
IGFsbCB0aGUgY2hlY2tzIGZvciBhbGwgdGhlIGRyaXZlcnMgd2hlcmUgZm9yIGV4YW1wbGUgc3Bl
ZWQgPT0NCj4+IFVTQl9TUEVFRF9TVVBFUl9QTFVTLiBJdCBzZWVtcyB0byBiZSBtb3JlIGNsdW5r
eSBhbmQgbWF5IGludHJvZHVjZSBtb3JlDQo+PiBidWdzLg0KPj4NCj4gSW4gbXkgb3Bpbmlvbiwg
dGhlIGJldHRlciBvcHRpb24gd291bGQgYmUgdG8gaW50cm9kdWNlIGEgbmV3IHByb3BlcnR5DQo+
IGZvciBsYW5lIHNwZWVkIHN1Y2ggYXMgImxhbmUtc3BlZWQtbWFudGlzc2EtZ2JwcyIgYmVjYXVz
ZToNCj4NCj4gMSkgSXQgc3RpbGwgZm9sbG93cyB0aGUgc3BlYywgZWFzaWVyIGZvciB0aGUgdXNl
ciB0byB1bmRlcnN0YW5kDQo+IDIpIFdlIG9ubHkgbmVlZCB0byB1cGRhdGUgdGhlIGRyaXZlcnMg
d2hlcmUgdGhlIG51bWJlciBvZiBsYW5lcyBhbmQgbGFuZQ0KPiBzcGVlZCBtYXR0ZXINCj4gMykg
RWFzaWVyIHNwZWVkIGNvbXBhcmlzb24gYmV0d2VlbiB1c2JfZGV2aWNlX3NwZWVkIGVudW0NCj4g
NCkgRWFzaWVyIHRvIGJhY2twb3J0IG5ldyBjb2RlIHdoZXJlIHRoZXJlJ3Mgc3BlZWQgY29tcGFy
aXNvbg0KPiA1KSBFYXNpbHkgZXh0ZW5kYWJsZSB0byBuZXcvZGlmZmVyZW50IGxhbmUgc3BlZWRz
DQo+DQoNCkxldCBtZSBzZW5kIG91dCB2MiBvZiB0aGlzIHNlcmllcyBzbyB0aGF0IG90aGVycyBj
YW4gYWxzbyBwcm92aWRlIG1vcmUgDQpmZWVkYmFjayBvbiBvdGhlciBwYXRjaGVzLiBXZSBjYW4g
Y29udGludWUgd2l0aCB0aGlzIGRpc2N1c3Npb24gYXMgDQpuZWVkZWQgaW4gdGhlIG1lYW53aGls
ZS4NCg0KQlIsDQpUaGluaA0K
