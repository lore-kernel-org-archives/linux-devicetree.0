Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F29C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 15:14:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCE3920709
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 15:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="b8W3z7TX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Fi783ybp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbgGVPOs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 11:14:48 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:59964 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726717AbgGVPOr (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jul 2020 11:14:47 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0D8AA400E6;
        Wed, 22 Jul 2020 15:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595430887; bh=+Nm3eYsZsd4n1L9TbUy0CZ9+3sSt/urDK43aHG3j30M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=b8W3z7TX45At1Aopq2Frg7rmpHKfakIwgOEulXioSI+4Z++Z8r+0QRACVSnSTzyJz
         tc540MdxKYdlI9uWaAao0hPZ8GwbSXYV115UaiytAW+ZAcJGlGo5hpTpSoq/mM01CR
         BVi11Dgy4+Ts6P/z/PgRV5VH10HFXGEo3z7+rxQI6N5xuRKqmDMi/wxZAGh0sdQTS+
         TLgQMrWuY3X79WUM3LrSNzMUpLkBO6dk95f41vhYdszrCEIhmLMB7gLsDMrE+1ZgEa
         PetOVYvA9FRH0/PR7RcDhKhzkyJwhwYF0CrfOnuTG9vtJZE/3N57311BdemQ4Fu3SO
         yLE1OmUU9xZYg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id D9F13A0063;
        Wed, 22 Jul 2020 15:14:46 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4BB1640151;
        Wed, 22 Jul 2020 15:14:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Fi783ybp";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqqolK7+zSCE27bvMEPyM307PQfrrkge7+FM//GX8l6gjkyw2UlWkAOnKwamKWMoAaEpbeu7Ss4SrO5r7nzJ3kyxa0vyx8CJoyreT185CdMcgdRgkM+GQsblbYW7s5vFgauMM8HGzrAHrXMRPbZrIitCgl9duIvSfOQjhRoRibYn44cPwIRaYANyLjJx2CmOY4DHiVQRKByJZqzLdguNxWGXhHhWyZi7O0PA2kAUO7lNWUH4uZZqiuzS7KyRxundVotFq6r2FH+D7RB1Ebu6dcq8OmzlYOnune1CP3HTUtCn2Hmwbv/H/sgCRrukCL6/OWG6NsSXF2eOJ1C//9BrUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Nm3eYsZsd4n1L9TbUy0CZ9+3sSt/urDK43aHG3j30M=;
 b=Yoh01oTPCBFeK7kVxKL6nO67AwdsqEF27j04p8fv69ThM5D/iY/aNZsdUAZh/vZAGfK5+3s05xadmwSe16wU8NZCA1hgvkLmOcuiZruEdh0nDUoYq5y4TXFtA9VhjQ2EVCaatYZF2b1jG+FB7bmHeg16pByTXJL8TEbDKZJ5DquuoME6AcCianz463s7bpz2o0htH19K1f3ajfvmuWzdaK3rc81AzJCt/hArcORCtl2RrSDzT3Wf19/yE3apcBa0TTYgZqXmKPVpifdBdhuBhbgvijzaBCdzeJWnHUQxSkYQIPdC56Px8cHhVTjbuuEBqI6FR2WW1rDGypy+lf9Mrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Nm3eYsZsd4n1L9TbUy0CZ9+3sSt/urDK43aHG3j30M=;
 b=Fi783ybpuKbELNsFWbNL+gCM530tJQD+jbbd5OA6aUP7qOHlLPfmmj46hh9T1NZYpH7+nBSuQaVWZPrfpDgj9OzrkiLZU0WnI2BmoEE9FO9Jg3EEk+XJZhNU4SbvJlWIM7WNEMyezzDw5g7RwKykNtZTcJxsDD00nughTfPONVI=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4305.namprd12.prod.outlook.com (2603:10b6:a03:213::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Wed, 22 Jul
 2020 15:14:45 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 15:14:45 +0000
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
Thread-Index: AQHWW7xVn29tfo9/DkKD4yu8ygVtF6kRaYEAgAAW7YCAAKirAIAAGx8AgAFx4gCAAAgVAA==
Date:   Wed, 22 Jul 2020 15:14:44 +0000
Message-ID: <31d57197-6365-754b-2f1b-56d7cc8e8d89@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <9684a2b2adb01b6b1a8c513928ea49b4a6436184.1594935978.git.thinhn@synopsys.com>
 <20200721033908.GA3508628@bogus>
 <d7e3d5c6-05c1-f256-7773-2b88f6cd5ca3@synopsys.com>
 <CAL_JsqLSKKT__dJaML4SWCpFpFYV_Cpkor=mNh5-Z7hE4n4fMA@mail.gmail.com>
 <57fffdfb-a4fa-6e50-1156-1ada3765e362@synopsys.com>
 <CAL_JsqKSrs93wLrxy2gaBEhGfgZs7jpjFarQBoHGxMc6ur3WRQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKSrs93wLrxy2gaBEhGfgZs7jpjFarQBoHGxMc6ur3WRQ@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 666a3fff-e37f-4d42-5d35-08d82e51f766
x-ms-traffictypediagnostic: BY5PR12MB4305:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4305AA1B1C53C52484D79424AA790@BY5PR12MB4305.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A2ZFGI4rY/dXU+E2lTLUVQuGR6bB/AvvvG/5g8H2kAL9TaO+ESYwLEG/2iueDgdTvByUQjcw10gWJ97gYk0r3A/HfGpwb333QdHkhJhvcj1tdB+KTa8yRriVgyiKqmyP4qPsyBST3qJkecX//OjnpoyRmfzMMoV2PnsKZuyh2p52ZR7Cj52KYdU0ndrayrWkZRaJ18u6EspKK/gwNzPxzvcTK0TFc77JaO1vtRdlQefQuUe4eGPlJNBgWdpD4/LLyHTtLKAOlemOcK2vNXYQxUr7jgMeP8jhqb+aeE5aesqFDp3xeElwiOwQY0hxn6AI27yAj6fwQbyBYVH3pctgf2CNOIybngXdBIbZYgN2Yzz94ES2kHDHuX/K61xf2R6/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39860400002)(136003)(346002)(376002)(186003)(64756008)(66946007)(86362001)(76116006)(66556008)(66476007)(36756003)(31696002)(26005)(478600001)(66446008)(2906002)(5660300002)(110136005)(8936002)(54906003)(4326008)(8676002)(71200400001)(6486002)(53546011)(6506007)(2616005)(6512007)(31686004)(107886003)(316002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: rkuLy6T8VUearzzU3YyqqxAiXXq8iMYB8i0xteqkrB3CV6eYG94sYHnNUu3OwoZZPnTP6tb9+wMchYQ495dDBcLWtHpPmHU8dbPx65GFNxdMQ9uEIwFMbs+OJOGrqImxCsD9/i66oWBl9FkMXjevnMERaD23hWDppzzfdlNxqbdEj9MIUbwsinBV6yAXpqAXBuHEoY0whfUzUlly/++E0f1bEWSVpA+xIkOapjnQrmHYFxLVV2FrDh4gDox/GRPHb9cvCkDd220a9rDfPrbtraLBjpIMWFsPJkNu9VDQkF66NhgSCzf4ahaW5fUUS0y83IFdA1AWTJTG02xsdbQsTNZ7YoLNPhLjRVOPf5ToUrSEJtExOTOOVF7xii2/QAuta0zxYSnaqgi/WaY5v3E3hL23ByJCxDIfCNjboFty6v++5YE1elYwhrG+SiUtaDpI6Svcy9Jq6phb1D9gO4KvxOBsSkGZSDmk/fXF+eM/jvc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <244B6BBB22790943963F23802237284F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666a3fff-e37f-4d42-5d35-08d82e51f766
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 15:14:44.8945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GfmyiJfMdKr30XRglDRH0ndbKY73Ji6jOcViT6nn/MKn49jFG5wjpXH4AU1alpdtf3CrCwmWveo3gdEyIMc0WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4305
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Um9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFR1ZSwgSnVsIDIxLCAyMDIwIGF0IDEwOjQyIEFNIFRo
aW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+PiBSb2IgSGVy
cmluZyB3cm90ZToNCj4+PiBPbiBNb24sIEp1bCAyMCwgMjAyMCBhdCAxMTowMSBQTSBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPj4+PiBSb2IgSGVycmlu
ZyB3cm90ZToNCj4+Pj4+IE9uIFRodSwgSnVsIDE2LCAyMDIwIGF0IDAyOjU5OjA4UE0gLTA3MDAs
IFRoaW5oIE5ndXllbiB3cm90ZToNCj4+Pj4+PiBJbnRyb2R1Y2UgbnVtLWxhbmVzIGFuZCBsYW5l
LXNwZWVkLW1hbnRpc3NhLWdicHMgZm9yIGRldmljZXMgb3BlcmF0aW5nDQo+Pj4+Pj4gaW4gc3Vw
ZXItc3BlZWQtcGx1cy4gRFdDX3VzYjMyIElQIHN1cHBvcnRzIG11bHRpcGxlIGxhbmVzIGFuZCBj
YW4NCj4+Pj4+PiBvcGVyYXRlIGluIGRpZmZlcmVudCBzdWJsaW5rIHNwZWVkcy4gQ3VycmVudGx5
IHRoZSBkZXZpY2UgY29udHJvbGxlcg0KPj4+Pj4+IGRvZXMgbm90IGhhdmUgdGhlIGluZm9ybWF0
aW9uIG9mIHRoZSBwaHkncyBudW1iZXIgb2YgbGFuZXMgc3VwcG9ydGVkLiBBcw0KPj4+Pj4+IGEg
cmVzdWx0LCB0aGUgdXNlciBjYW4gc3BlY2lmeSB0aGVtIHRocm91Z2ggdGhlc2UgcHJvcGVydGll
cyBpZiB0aGV5IGFyZQ0KPj4+Pj4+IGRpZmZlcmVudCB0aGFuIHRoZSBkZWZhdWx0IHNldHRpbmcu
DQo+Pj4+Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5v
cHN5cy5jb20+DQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4gICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy91c2IvZHdjMy50eHQgfCA5ICsrKysrKysrKw0KPj4+Pj4+ICAgICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4+Pj4+PiBpbmRleCBkMDNlZGY5
ZDM5MzUuLjRlYmEwNjE1NTYyZiAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0DQo+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MzLnR4dA0KPj4+Pj4+IEBAIC04Niw2ICs4Niwx
NSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPj4+Pj4+ICAgICAgLSBzbnBzLHF1aXJrLWZyYW1l
LWxlbmd0aC1hZGp1c3RtZW50OiBWYWx1ZSBmb3IgR0ZMQURKXzMwTUhaIGZpZWxkIG9mIEdGTEFE
Sg0KPj4+Pj4+ICAgICAgICByZWdpc3RlciBmb3IgcG9zdC1zaWxpY29uIGZyYW1lIGxlbmd0aCBh
ZGp1c3RtZW50IHdoZW4gdGhlDQo+Pj4+Pj4gICAgICAgIGZsYWRqXzMwbWh6X3NkYm5kIHNpZ25h
bCBpcyBpbnZhbGlkIG9yIGluY29ycmVjdC4NCj4+Pj4+PiArIC0gc25wcyxudW0tbGFuZXM6IHNl
dCB0byBzcGVjaWZ5IHRoZSBudW1iZXIgb2YgbGFuZXMgdG8gdXNlLiBWYWxpZCBpbnB1dHMgYXJl
DQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgMSBvciAyLiBBcHBseSBpZiB0aGUgbWF4aW11
bS1zcGVlZCBpcyBzdXBlci1zcGVlZC1wbHVzDQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
b25seS4gRGVmYXVsdCB2YWx1ZSBpcyAyIGZvciBEV0NfdXNiMzIuIEZvciBEV0NfdXNiMzEsDQo+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgaXQgaXMgYWx3YXlzIDEgYXQgc3VwZXItc3BlZWQt
cGx1cy4NCj4+Pj4+PiArIC0gc25wcyxsYW5lLXNwZWVkLW1hbnRpc3NhLWdicHM6IHNldCB0byBz
cGVjaWZ5IHRoZSBzeW1tZXRyaWMgbGFuZSBzcGVlZA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgIG1hbnRpc3NhIGluIEdicHMuIFZhbGlkIGlucHV0cyBhcmUgNSBvciAxMC4gQXBwbHkgaWYN
Cj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICB0aGUgbWF4aW11bS1zcGVlZCBpcyBzdXBlci1z
cGVlZC1wbHVzIG9ubHkuIERlZmF1bHQNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICB2YWx1
ZSBpcyAxMC4gRm9yIERXQ191c2IzMSwgaXQncyBhbHdheXMgMTAgYXQNCj4+Pj4+PiArICAgICAg
ICAgICAgICAgICAgICBzdXBlci1zcGVlZC1wbHVzLg0KPj4+Pj4gVGhpcyBpcyBhbGwgY29tbW9u
IFVTQiB0aGluZ3MgYW5kIHNob3VsZCBiZSBjb21tb24gcHJvcGVydGllcyAod2hpY2ggd2UNCj4+
Pj4+IG1heSBhbHJlYWR5IGhhdmUpLg0KPj4+PiBTdXJlLiBGb3IgIm51bS1sYW5lcyIgaXMgc2lt
cGxlLCBhbnkgb2JqZWN0aW9uIGlmIHdlIHVzZQ0KPj4+PiAibGFuZS1zcGVlZC1tYW50aXNzYS1n
YnBzIj8gT3Igc2hvdWxkIHdlIGFkZCAibGFuZS1zcGVlZC1leHBvbmVudCI/DQo+Pj4gJ251bS1s
YW5lcycgaXMgZ29vZCBhcyB0aGF0J3Mgd2hhdCBQQ0llIHVzZXMuIERvY3VtZW50IHRoYXQgd2l0
aA0KPj4+ICdtYXhpbXVtLXNwZWVkJy4NCj4+Pg0KPj4+IEkgdGhpbmsgJ3N1cGVyLXNwZWVkLXBs
dXMnIHNob3VsZCBtZWFuIGdlbiAyIDEwRyBwZXIgbGFuZS4gVGhlbg0KPj4+IGJldHdlZW4gbnVt
LWxhbmVzIGFuZCBtYXhpbXVtLXNwZWVkIHlvdSBjYW4gZGVmaW5lIGFsbCA0IHBvc3NpYmxlDQo+
Pj4gcmF0ZXMuDQo+PiBUaGF0IG1heSBjb25mdXNlIHRoZSB1c2VyIGJlY2F1c2Ugbm93IHdlJ2Qg
dXNlICdzdXBlci1zcGVlZC1wbHVzJyB0bw0KPj4gZGVmaW5lIHRoZSBzcGVlZCBvZiB0aGUgbGFu
ZSByYXRoZXIgdGhhbiB0aGUgZGV2aWNlIGl0c2VsZi4NCj4+DQo+PiBBY2NvcmRpbmcgdG8gdGhl
IFVTQiAzLjIgc3BlYywgc3VwZXItc3BlZWQtcGx1cyBjYW4gbWVhbiBnZW4yeDEsIGdlbjF4MiwN
Cj4+IG9yIGdlbjJ4Mi4NCj4gVGhlbiBhZGQgbmV3IHN0cmluZ3MgYXMgbmVlZGVkIHRvIG1ha2Ug
aXQgY2xlYXI6IHN1cGVyLXNwZWVkLXBsdXMtZ2VuMXgyDQo+DQo+IEl0J3Mgb2J2aW91cyB0aGF0
IHdoYXQgJ3N1cGVyLXNwZWVkLXBsdXMnIG1lYW5zIGlzIG5vdCBjbGVhciBzaW5jZQ0KPiBVU0It
SUYgZXh0ZW5kZWQgaXRzIG1lYW5pbmcuDQo+DQo+IFJvYg0KDQpJZiB3ZSBpbnRyb2R1Y2UgYSBu
ZXcgZW51bSBmb3IgZ2VuMXgyLCBub3cgd2UnZCBoYXZlIHRvIGdvIGJhY2sgYW5kIA0KaW5zcGVj
dCBhbGwgdGhlIGNoZWNrcyBmb3IgYWxsIHRoZSBkcml2ZXJzIHdoZXJlIGZvciBleGFtcGxlIHNw
ZWVkID09IA0KVVNCX1NQRUVEX1NVUEVSX1BMVVMuIEl0IHNlZW1zIHRvIGJlIG1vcmUgY2x1bmt5
IGFuZCBtYXkgaW50cm9kdWNlIG1vcmUgDQpidWdzLg0KDQpCUiwNClRoaW5oDQo=
