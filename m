Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D2DC433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 05:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EDCC2065E
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 05:51:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WpUeIieo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hFeT3hM0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgGOFvk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 01:51:40 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:47956 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725850AbgGOFvj (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Jul 2020 01:51:39 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 27B61401D7;
        Wed, 15 Jul 2020 05:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594792299; bh=tAnb9L1P6RC6zN6ugpHPN8tBv+1398iHoYwEpYIrASk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=WpUeIieoepNXB4UOHHEcCWV33qB1TtrBj2uIZ4xuzFYZ+W7T7HerxT1XqIunhSt3n
         mRWnqbK9y+tGqW301UbvPaSD7WjmH2nufC4CFseq9vjIQ8O+T2M/NAJzzIyXUjrrEb
         Ee1dJ7ovi5rQsTQBAC//k5YPiAJnIi8aICUOLXSeA/XVFIJqgcHP5g5ZT1VjLv4pff
         3K9wmrbdP42wSL8bt6wP00itdvaU5OMjNr8SQtbC11J96jkuPRb3eVeY+UBBRZCiWt
         h4usDnNCJmHNQFtTrQODJC2TBwTybZ2vSm9fiH+9g22jjIkgLToCno1lTSHI3ghXrB
         BcbkTUssPM/4w==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 0FE18A008D;
        Wed, 15 Jul 2020 05:51:37 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0082540109;
        Wed, 15 Jul 2020 05:51:36 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="hFeT3hM0";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LI4zJ3HuoeCC2R4TR7WimWv4trQ/fuL2Z0HAT7zLXVLRaO4eoE1fDiKggA/jslnsNmcy73aVt8ckbalVlNa3Emj8JJ3XsTtJ498gr7uKtmMWATCHxzanIczlJUPwRUH2AEfHRc7ytp57AyeC/jIPDdN496aetJv42EKdoMb3fVJlEJrvVU5/UI+QvODMbc/RWRSOtEF1Ekjr8WQtCWkSaCnP5BuoUkYkLnVfEVlicHOxe85DpwCnq1ugLx8DHh+fG8vAtjHkFe+GwD7BnzXA0E5ZR7lXBM0sWUdofDOZzf6PL5E3h2Mn3fBWKxo88f/gFHXEceJrlzR4PKZOdrgiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAnb9L1P6RC6zN6ugpHPN8tBv+1398iHoYwEpYIrASk=;
 b=lNLalxHcE3sFDEHkY4hoXX5LcD0MDD2XhO+CO/Oe/eE++fpOTRbbtqCCTUGgf/K8wG2SEFafCQ5t0w+791s+RkwTcaKPypnyQYl4TM+g9BxTzWt4+lWhcyF732yilqJPoCEXpebbtQSkDtkW91wMbXSuVSGEz/MGw6qd6OUJJsj7dGpu5I/LBOIAzC0DQIdS637d0yvhxMhxke5II17hC8eh18ZsufJiVI0p0+rFvu03HLwtsS12ynQqMZ3mpIw34cRDezecC2wJjTdaf3JpKX4RNxii2s3wR8A+QHsFT5GcIFSyUXnXPeU/98iGpi4j4ETiIRbeGWdtywtgbsR5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAnb9L1P6RC6zN6ugpHPN8tBv+1398iHoYwEpYIrASk=;
 b=hFeT3hM06fYo0OpyhmQ5QS1+wwSeAcr/eAwpEegst8cOPRJy2kjVSYouaX8GHGIpshE2WKOHA6xzJDgM30oR48U8q4R2NS1oZr1BUjY3AgpZZdE9igMg0Fo6brfL/3JvlBNU6IQXSIhxFgSTRTWsBLcDSRLbOkOFLjymKsLs6zY=
Received: from BYAPR12MB3464.namprd12.prod.outlook.com (2603:10b6:a03:d9::16)
 by BYAPR12MB2727.namprd12.prod.outlook.com (2603:10b6:a03:71::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 15 Jul
 2020 05:51:35 +0000
Received: from BYAPR12MB3464.namprd12.prod.outlook.com
 ([fe80::600d:8274:ced2:a746]) by BYAPR12MB3464.namprd12.prod.outlook.com
 ([fe80::600d:8274:ced2:a746%5]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 05:51:35 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Topic: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Index: AQHWNBPIzVDQozhV20CqjRBnx+8J26j6PmiAgAAa/YCADhZwgA==
Date:   Wed, 15 Jul 2020 05:51:34 +0000
Message-ID: <2f61133b-319d-80dc-f3f3-7e08e0228953@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
 <83eba2e9f0069f20ccc94537e3b99cbaec209441.1590415123.git.joglekar@synopsys.com>
 <5534d9d6-5452-dade-e46e-f4b0910becdb@synopsys.com>
 <877dvhqh2e.fsf@kernel.org>
In-Reply-To: <877dvhqh2e.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.206.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24acf570-52ec-4a1c-09ca-08d82883220e
x-ms-traffictypediagnostic: BYAPR12MB2727:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB272798880AE595DD3D0ABDC7A47E0@BYAPR12MB2727.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yvvf7Owmjh1bIs4V7RrlcNU0ylke8rmOIY5Zt9QvCyEr7WJnnfkqJHOPkzcb4yEoD/WocdwNLUtFDgza7QQmP3cehl/GN6mei8FgAJAM9/Wy/IzgkRl0t/c5bdAt6u6P3nZC9RLysseUyMRWusrXDZsl2ZVGMBDlBbRjvyKih7s8W2Xd2cQY3TSMpaM+mKsiK0o8Ydsf+O7aGiQGjLMFO03k0QFS7/kMQs9OifsWoarE9AFLAoyPOYFEx8YDEFPKO1+gE1DdO7Ia1QxC7r/xCRV2EXx9AnTsVN+Ns4D2KFKTXt2wzg+zHE5Fj+t44NkCbwCwGx1M70IA8qrqtNM9dw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3464.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(6506007)(53546011)(64756008)(66476007)(66556008)(71200400001)(86362001)(66946007)(36756003)(186003)(66446008)(316002)(26005)(110136005)(54906003)(2616005)(4326008)(91956017)(76116006)(8936002)(6486002)(31686004)(55236004)(83380400001)(6512007)(5660300002)(8676002)(31696002)(478600001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: qVNtrtxQ1eDw1Opm13m738PaJKkGUtYvEijbdU4ul0Vwn6mvyzg3mmO3SOHi0KyXpvigZkYQq2zgRDAsZ8DMlQCRmV4RiGmDJDvDtq3fMH8+qBN7GX2VrqkGJSr0l6Aux8aPDhhRD9xa6HnUii1GvPZ7rh/kwJLdvndnfzCfjwojS7Wk92UAhIPHlium73FeZ2OB9dkT/XdE8ZLR8uBM51yfCFyxpJT28KCoepk3WZB+tRo2Lw7MxljgkaVym7erNyh8/ct7XBaAq8scvknh1Bz66mr2d8Oz8MSMp77EXyyfiXSfSpF1HmwR05zu3lg0pmSfSYESXgRtNRb/BSdshP8E/yfZOJLkyMxNM9XhjU/zchrNHxnzyBOKy5IOYK80hFmhUj9hMvwUhJfNtrt7ZqQ+bD+MpSRCXwS4itUivR3cLrf1oBb2WcOy4R3m4MedvGUUuQede/K108umV40/Ml53zR7OXERTjHQH9aMFdbk+Y+JF8bkc+wLPIa84Px9V
Content-Type: text/plain; charset="utf-8"
Content-ID: <D56BB70C5150E54CB25926BCF06854C4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3464.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24acf570-52ec-4a1c-09ca-08d82883220e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 05:51:34.7798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4MMYJiJxXshCEc8QXrAtfI+Vsw2le56mcna9Yhy7sKW6ZZVTnXsRzrrupzyJpvf4oGwDJ2KtxkwZumwXFwRm/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2727
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGkgUm9iLA0KDQpPbiA3LzYvMjAyMCAxMjoxMyBQTSwgRmVsaXBlIEJhbGJpIHdyb3RlOg0KPiAN
Cj4gSGksDQo+IA0KPiBUZWphcyBKb2dsZWthciA8VGVqYXMuSm9nbGVrYXJAc3lub3BzeXMuY29t
PiB3cml0ZXM6DQo+Pj4gQEAgLTk1LDYgKzk1LDEwIEBAIGludCBkd2MzX2hvc3RfaW5pdChzdHJ1
Y3QgZHdjMyAqZHdjKQ0KPj4+ICAJaWYgKGR3Yy0+dXNiMl9scG1fZGlzYWJsZSkNCj4+PiAgCQlw
cm9wc1twcm9wX2lkeCsrXSA9IFBST1BFUlRZX0VOVFJZX0JPT0woInVzYjItbHBtLWRpc2FibGUi
KTsNCj4+PiAgDQo+Pj4gKwlpZiAoZHdjLT5zZ2xfdHJiX2NhY2hlX3NpemVfcXVpcmspDQo+Pj4g
KwkJcHJvcHNbcHJvcF9pZHgrK10gPQ0KPj4+ICsJCQlQUk9QRVJUWV9FTlRSWV9CT09MKCJzZ2wt
dHJiLWNhY2hlLXNpemUtcXVpcmsiKTsNCj4+PiArDQo+Pj4gIAkvKioNCj4+PiAgCSAqIFdPUktB
Uk9VTkQ6IGR3YzMgcmV2aXNpb25zIDw9My4wMGEgaGF2ZSBhIGxpbWl0YXRpb24NCj4+PiAgCSAq
IHdoZXJlIFBvcnQgRGlzYWJsZSBjb21tYW5kIGRvZXNuJ3Qgd29yay4NCj4+Pg0KPj4gRG9lcyB0
aGlzIGltcGxlbWVudGF0aW9uIGxvb2tzIGdvb2QgdG8geW91PyBSb2IgaGFzIHNvbWUgY29uY2Vy
bmVkIG92ZXIgdGhlIERUIGVudHJpZXMsDQo+PiB5b3Ugc3VnZ2VzdGVkIHVzaW5nIGNvbXBhdGli
bGUgc3RyaW5nIHdpdGggdGhpcyBxdWlyayBhZGRpdGlvbi4NCj4+IENhbiB5b3UgcGxlYXNlIGJy
aWVmIGFib3V0IGhvdyB5b3Ugd291bGQgbGlrZSB0byBoYXZlIHRoaXMgcXVpcmsgaW1wbGVtZW50
ZWQ/DQo+PiBJIGNhbiBzZW5kIHRoZSB1cGRhdGVkIHBhdGNoLiBNeSBwYXRjaCBzZXJpZXMgaXMg
cGVuZGluZyBmb3IgbWVyZ2UganVzdCBiZWNhdXNlIG9mIHRoZQ0KPj4gRFQgYW5kIHF1aXJrIGlz
c3VlLiBDYW4geW91IHBsZWFzZSBoZWxwPw0KPiANCj4gWWVhaCwgeW91IG5lZWQgdG8gZ2V0IGlu
dG8gYW4gYWdyZWVtZW50IHdpdGggUm9iIDotKSBJIGRvbid0IG1pbmQgaGF2aW5nDQo+IGV4dHJh
IERUIGZsYWdzIGZvciB0aGluZ3Mgd2hpY2ggY2FuJ3QgYmUgZGV0ZWN0ZWQgaW4gcnVudGltZSwg
Um9iDQo+IGRpc2FncmVlcy4NCj4gDQpUaGUgY29tcGF0aWJsZSBzdHJpbmcgaXMgbm90IHN1aXRh
YmxlIG9wdGlvbiBhcyBpdCBkb2VzIG5vdCB3b3JrIHdpdGggcGxhdGZvcm0gZHJpdmVycw0Kd2l0
aCBQQ0kgYmFzZWQgc3lzdGVtLiBBbHNvIFN5bm9wc3lzIGNvbnRyb2xsZXJzIElQIHZlcnNpb24g
cmVnaXN0ZXIgaXMgbm90IHZpc2libGUgdG8geGhjaQ0KZHJpdmVyIGFuZCBoZW5jZSB3ZSBkb24n
dCBoYXZlIHNlcGFyYXRlIGNvbXBhdGlibGUgc3RyaW5nIGZvciBlYWNoIFN5bm9wc3lzIHZlcnNp
b24gb24gdGhlDQp4aGNpIGRyaXZlciBzaWRlLiANCkR1ZSB0byB3aGljaCBJIGRlcGVuZCBvbiBE
VCBmbGFnIGFkZGl0aW9uIGZvciB0aGUgcXVpcmsuIENhbiB3ZSBhZGQgdGhlc2UgRFQgZmxhZ3Mg
YW5kIHF1aXJrPw0KDQoNClRoYW5rcyAmIFJlZ2FyZHMsDQogVGVqYXMgSm9nbGVrYXINCg==
