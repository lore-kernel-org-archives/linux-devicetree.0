Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D34C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 10:13:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09561208E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 10:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="US3rakBD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hSdju+ux"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgGaKNe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 06:13:34 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:52922 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725903AbgGaKNe (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 31 Jul 2020 06:13:34 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 27D0E42E85;
        Fri, 31 Jul 2020 10:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1596190413; bh=19NRyueLVjNx3ajnCZpRqDEsb5lAE2HXTBR97s0UPBc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=US3rakBDH7pmDKYW9OCvT19jv5pwkWbWFo7qVohkSzVCkEOSZdTU8b6OFvKxCWE9C
         fb+YNPv/BITBeaM/Ai4w0oGlVZFAhWzWabRpmkIjjUitlWgZFGQnb2B93rsia1SGyb
         BcO0v5AKMQawdE9SUDNCbDwJP14q3UHdihWl4LYWsSpN5Uga+W1qxtvF0slDakHTzA
         3BdxryTJdHYSp8M8Zq1xBZBKGL1uFXbQg8CD2cjGiuouAe9v68JyQUZs2Db4MOOikf
         XN1h1zyLmDvLqEzjbrEX9VS4s40+I70P7kzhSf98BWoXzq5yagsF+HI0O4XaA5CrRv
         5+1xGSJiuts9g==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id C5D6DA0063;
        Fri, 31 Jul 2020 10:13:32 +0000 (UTC)
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2057.outbound.protection.outlook.com [104.47.44.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B116A801BF;
        Fri, 31 Jul 2020 10:13:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="hSdju+ux";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cu8jbkeC9CWcEzCxPHYA+LcXlYoQAAUs2oXfVrz5Ws8eGjAtLEigr+ucJModyk/VCagO8uoW86SdG/96DcU6dYKXikHJHYGIS6h9p/tKSlUG8zGoMd85Q4UFY+pNjmg6VwTuXmZddO5TlWm3jHFUMhzgeAFxoUKXr9xTy2sV+Zg4urAfpU8ibV873ZuLooWOqfkAHorsXk73blNbDWdlr99BlWe9k4kN+tYZh+IttnvT6uiQSqew6fwwC+Sg5lG8CYRZI3fpIezXMgg6WanHnTRJ3VJb8+WwtpPcAxJXr88Ht9kpsE/4tsLogwiUT1+u93B8bTPBT4O4v/WmENJ6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19NRyueLVjNx3ajnCZpRqDEsb5lAE2HXTBR97s0UPBc=;
 b=dibJ9LSw/6of+6Od7MSGliCS2BvJttafdenfGU+0N4jS5TsmtbP2dha5TvGgVYjqUzoAS03yXQkkGK9hTGqUktr6+cDb2YbhK3dM5SfQfUdSu6/GkV/fBYZqC9hdQYH2O541JobrdW2xZQqVARhXYnARjKAI3xjfdLLg5RKzAlv1B7YaukKr8uU5zOOClx5qXa1d2vHezT0Ju94T43d54iBpQfOLLIoYZ4CDOuzkdwGPPxfX88i4h7oeVnxYTfEowo6dEjkA6rDOZPNmauDfsu419gGgovn6Z/rEA86gMH2urVViYkE/DiEf4lqYtdINNaJlC8f1DMEIALE4OQWmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19NRyueLVjNx3ajnCZpRqDEsb5lAE2HXTBR97s0UPBc=;
 b=hSdju+uxvk6otdRp40d/QEVibvcKkKTyIc17ERyGioiQs4OjFzpb9XBWNLGDGXLuOApHZi2ynHzpSwZIRsipjQvVOSoozB+kTGLFIIkrdb13ZabntWz+7gnVtx6nSoeANczA6AvB3JO6kV0lAXhWL5+5yg3i5/FTrxYpoCRv62s=
Received: from BN8PR12MB3458.namprd12.prod.outlook.com (2603:10b6:408:44::32)
 by BN6PR12MB1682.namprd12.prod.outlook.com (2603:10b6:405:4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 10:13:28 +0000
Received: from BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6]) by BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6%2]) with mapi id 15.20.3239.019; Fri, 31 Jul 2020
 10:13:28 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Topic: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Index: AQHWNBPIzVDQozhV20CqjRBnx+8J26j6PmiAgAAa/YCADhZwgIAJsAyAgAB4IACAD0ZNgA==
Date:   Fri, 31 Jul 2020 10:13:28 +0000
Message-ID: <7ae08b3d-3b5e-73cf-d196-325501a44e44@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
 <83eba2e9f0069f20ccc94537e3b99cbaec209441.1590415123.git.joglekar@synopsys.com>
 <5534d9d6-5452-dade-e46e-f4b0910becdb@synopsys.com>
 <877dvhqh2e.fsf@kernel.org>
 <2f61133b-319d-80dc-f3f3-7e08e0228953@synopsys.com>
 <878sfdp5bk.fsf@kernel.org>
 <48f1764e-4383-a149-b93b-3851095394e7@synopsys.com>
In-Reply-To: <48f1764e-4383-a149-b93b-3851095394e7@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.199.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf308b63-5e5f-45cb-4d74-08d8353a5e9f
x-ms-traffictypediagnostic: BN6PR12MB1682:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB168278D64C67856FC51E4B90A44E0@BN6PR12MB1682.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rbCAruLHmt20fQM7p17HGEXPXa5A5GrAhtMXIrHQcmlHqpB+cAEA8VBmzhCMZS1o1h/niBUSnMe0EuRtmX/De0BN8OYGVqb2SsWDh7KUGZbPGrEks3LqG2hfm0r1kgcgFrv5KBaob/Oz69igbDK2h9pyp2vOVlbNZU+bPz9CX65Bt0DQIZ8bLywNH415seR57MEa00yzFXESFSwzWJLbCDKiaCnILwY9JyVDVkiH1Ht2IzAkDy4yCto69udKj7AFmb2iQ6Z2VAF6jNTvRXyhgCtDFgy3ZqHURYQuQviQ01d4Fa/7cL9MAsPSebI1sE1vSsfarlB0IZD7B2J0q68DXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3458.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(136003)(376002)(366004)(346002)(396003)(66946007)(91956017)(76116006)(66446008)(66556008)(31696002)(64756008)(66476007)(186003)(86362001)(26005)(5660300002)(6486002)(31686004)(2616005)(71200400001)(316002)(110136005)(54906003)(478600001)(2906002)(6512007)(36756003)(55236004)(6506007)(53546011)(8936002)(8676002)(4326008)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: CNswdPyAjrFV2sASj4VqL5qbOF3qtzRW+CLHSYRexUODoh9n0vPYNeyh1LfBnQ1CcXVzQmT92zKAEfRWR3PhUjJ0QanasSQdISxJ1/co4YFh6eB1L1oE6EO8oWcOUa31GQq367Boz2LRl0FMvBSthOCvZ5ZURVudynzjgWCOGMIeboS1nhx4M5XkEzX+HCknH49QJveYBiL9for66ifPrIisO1xr5H+Z0QSbnh7FiT18J6nwUA5ssoUSwDBI6RA+/G+L13lXwuYhsH/QUuT2rLyRi92O42ZFQuepUrbMJq5W0W860p7HuxtKLBStK24qInBWdRJ/Qq5QhWcR/cpmZsm41Ut7EGhvGTTVyLVQgT281Hw9lCJJotpjjsm8u2L2HqnbANMyPBFfKFhBAWWUN8k2C54oaqCIpBfdBsLErB42xojAJUMkYnM7tWS5j+aLwGesKN1cN/5v6+t1SLg34bMk4jqi85m904KxKXopzzq+WXWJsxydSCYUgGNIKLiEoUxnRNb07EdALFFxCXRhMHJm9RW1jXiLSZZQeeaQ1lLFyuWET6MenpXCvXv9xZ4ZMo+G3+alMfgJCq7jCFWrQ1wwg1945TU/robtiHJaJ0VQSHdFbDilaRgDEZ/kuYLMO9qIxCG9t+OkwtUIh4qsiw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0E7FA17E60BE7489B6086C5797B08A5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3458.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf308b63-5e5f-45cb-4d74-08d8353a5e9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 10:13:28.2779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d3rnzI+rONkMQREtlJ0syf2I2hEoVqtpGig3g+QujufGaaQ46RLL6bI/mFEe9l9wr1PjqAv9jXMkqAtDbD2iEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1682
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGVsbG8gUm9iLA0KT24gNy8yMS8yMDIwIDEwOjI3IFBNLCBUZWphcyBKb2dsZWthciB3cm90ZToN
Cj4gSGVsbG8sDQo+IA0KPiBPbiA3LzIxLzIwMjAgMzoxNyBQTSwgRmVsaXBlIEJhbGJpIHdyb3Rl
Og0KPj4gVGVqYXMgSm9nbGVrYXIgPFRlamFzLkpvZ2xla2FyQHN5bm9wc3lzLmNvbT4gd3JpdGVz
Og0KPj4NCj4+PiBIaSBSb2IsDQo+Pj4NCj4+PiBPbiA3LzYvMjAyMCAxMjoxMyBQTSwgRmVsaXBl
IEJhbGJpIHdyb3RlOg0KPj4+Pg0KPj4+PiBIaSwNCj4+Pj4NCj4+Pj4gVGVqYXMgSm9nbGVrYXIg
PFRlamFzLkpvZ2xla2FyQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+Pj4+IEBAIC05NSw2ICs5
NSwxMCBAQCBpbnQgZHdjM19ob3N0X2luaXQoc3RydWN0IGR3YzMgKmR3YykNCj4+Pj4+PiAgCWlm
IChkd2MtPnVzYjJfbHBtX2Rpc2FibGUpDQo+Pj4+Pj4gIAkJcHJvcHNbcHJvcF9pZHgrK10gPSBQ
Uk9QRVJUWV9FTlRSWV9CT09MKCJ1c2IyLWxwbS1kaXNhYmxlIik7DQo+Pj4+Pj4gIA0KPj4+Pj4+
ICsJaWYgKGR3Yy0+c2dsX3RyYl9jYWNoZV9zaXplX3F1aXJrKQ0KPj4+Pj4+ICsJCXByb3BzW3By
b3BfaWR4KytdID0NCj4+Pj4+PiArCQkJUFJPUEVSVFlfRU5UUllfQk9PTCgic2dsLXRyYi1jYWNo
ZS1zaXplLXF1aXJrIik7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICAJLyoqDQo+Pj4+Pj4gIAkgKiBXT1JL
QVJPVU5EOiBkd2MzIHJldmlzaW9ucyA8PTMuMDBhIGhhdmUgYSBsaW1pdGF0aW9uDQo+Pj4+Pj4g
IAkgKiB3aGVyZSBQb3J0IERpc2FibGUgY29tbWFuZCBkb2Vzbid0IHdvcmsuDQo+Pj4+Pj4NCj4+
Pj4+IERvZXMgdGhpcyBpbXBsZW1lbnRhdGlvbiBsb29rcyBnb29kIHRvIHlvdT8gUm9iIGhhcyBz
b21lIGNvbmNlcm5lZCBvdmVyIHRoZSBEVCBlbnRyaWVzLA0KPj4+Pj4geW91IHN1Z2dlc3RlZCB1
c2luZyBjb21wYXRpYmxlIHN0cmluZyB3aXRoIHRoaXMgcXVpcmsgYWRkaXRpb24uDQo+Pj4+PiBD
YW4geW91IHBsZWFzZSBicmllZiBhYm91dCBob3cgeW91IHdvdWxkIGxpa2UgdG8gaGF2ZSB0aGlz
IHF1aXJrIGltcGxlbWVudGVkPw0KPj4+Pj4gSSBjYW4gc2VuZCB0aGUgdXBkYXRlZCBwYXRjaC4g
TXkgcGF0Y2ggc2VyaWVzIGlzIHBlbmRpbmcgZm9yIG1lcmdlIGp1c3QgYmVjYXVzZSBvZiB0aGUN
Cj4+Pj4+IERUIGFuZCBxdWlyayBpc3N1ZS4gQ2FuIHlvdSBwbGVhc2UgaGVscD8NCj4+Pj4NCj4+
Pj4gWWVhaCwgeW91IG5lZWQgdG8gZ2V0IGludG8gYW4gYWdyZWVtZW50IHdpdGggUm9iIDotKSBJ
IGRvbid0IG1pbmQgaGF2aW5nDQo+Pj4+IGV4dHJhIERUIGZsYWdzIGZvciB0aGluZ3Mgd2hpY2gg
Y2FuJ3QgYmUgZGV0ZWN0ZWQgaW4gcnVudGltZSwgUm9iDQo+Pj4+IGRpc2FncmVlcy4NCj4+Pj4N
Cj4+PiBUaGUgY29tcGF0aWJsZSBzdHJpbmcgaXMgbm90IHN1aXRhYmxlIG9wdGlvbiBhcyBpdCBk
b2VzIG5vdCB3b3JrIHdpdGggcGxhdGZvcm0gZHJpdmVycw0KPj4+IHdpdGggUENJIGJhc2VkIHN5
c3RlbS4gQWxzbyBTeW5vcHN5cyBjb250cm9sbGVycyBJUCB2ZXJzaW9uIHJlZ2lzdGVyIGlzIG5v
dCB2aXNpYmxlIHRvIHhoY2kNCj4+PiBkcml2ZXIgYW5kIGhlbmNlIHdlIGRvbid0IGhhdmUgc2Vw
YXJhdGUgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGVhY2ggU3lub3BzeXMgdmVyc2lvbiBvbiB0aGUN
Cj4+PiB4aGNpIGRyaXZlciBzaWRlLiANCj4+PiBEdWUgdG8gd2hpY2ggSSBkZXBlbmQgb24gRFQg
ZmxhZyBhZGRpdGlvbiBmb3IgdGhlIHF1aXJrLiBDYW4gd2UgYWRkIHRoZXNlIERUIGZsYWdzIGFu
ZCBxdWlyaz8NCj4+DQo+PiBBcyBJIHNhaWQsIEknbSB3ZWxsIGF3YXJlIG9mIHRoZSBzaXR1YXRp
b24gcmVnYXJkaW5nIHVzYWdlIG9mIGNvbXBhdGlibGUNCj4+IHN0cmluZ3MgYW5kIHRoZSBmYWN0
IHRoYXQgZHdjMyBtdXN0IHdvcmsgb24gUENJIGFuZCBub24tUENJIHN5c3RlbXMgKEkNCj4+IHdy
b3RlIHRoZSB0aGluZyBhcyBpdCBpcyBhZnRlciBhbGwpLiBUaGUgcGVyc29uIGJsb2NraW5nIG5l
dyBxdWlyayBmbGFncw0KPj4gaXMgUm9iLCBub3QgbWUuIFlvdSBuZWVkIHRvIGNvbnZpbmNlIFJv
YiB0aGF0IHRoaXMgaXMgdGhlIHdheSB0byBnby4NCj4+DQo+IEBGZWxpcGU6IFNvcnJ5IGZvciBj
b25mdXNpb24gaWYgYW55LCBwcmV2aW91cyBtYWlsIHdhcyBpbnRlbmRlZCBmb3IgUm9iIGFza2lu
ZyBhYm91dCBoaXMgYXBwcm92YWwuDQo+IA0KPj4gUm9iLCBiYWxsJ3MgaW4geW91ciBjb3VydC4g
U29ycnkuPiANCj4gQFJvYjogQXMgSSBhbmQgRmVsaXBlIGhhdmUgbWVudGlvbmVkIGJlZm9yZSwg
aXQgaXMgdmVyeSBtdWNoIG5lY2Vzc2FyeSB0byBoYXZlIHF1aXJrIGZsYWdzDQo+IGZvciB0aGUg
Y3VycmVudCBjaGFuZ2VzIGFzIGNvbXBhdGlibGUgc3RyaW5nIHdvdWxkIG5vdCBiZSBhIHNvbHV0
aW9uIGZvciBQQ0kgYW5kIG5vbi1QQ0kNCj4gc3lzdGVtcy4gQ2FuIHlvdSBwbGVhc2UgYXBwcm92
ZSB0aGlzIGNoYW5nZSA/IElmIHlvdSBoYXZlIGFueSBjb25jZXJuIGFib3V0IG5hbWluZyBvciBh
bnkNCj4gb3RoZXIgdGhpbmcsIHBsZWFzZSBsZXQgdXMga25vdy4NCj4gDQpDYW4geW91IHBsZWFz
ZSBjb21tZW50Pw0KDQpUaGFua3MgJiBSZWdhcmRzLA0KVGVqYXMgSm9nbGVrYXINCiANCg0K
