Return-Path: <SRS0=sfbb=BL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7345C433E0
	for <linux-devicetree@archiver.kernel.org>; Sat,  1 Aug 2020 02:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A52F220836
	for <linux-devicetree@archiver.kernel.org>; Sat,  1 Aug 2020 02:37:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dzKzzy2E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iv6s47CK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgHAChA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 22:37:00 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51102 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727824AbgHACg7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 31 Jul 2020 22:36:59 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1D187C0107;
        Sat,  1 Aug 2020 02:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1596249418; bh=0QQQErXYg0trXwc1XAzuuJH6r+rfS9fZHtFCe+CWztw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=dzKzzy2E47dRxGxehfM6D/aKTkVpv2h/Dn2jRB7XQlQh2gi4Qkusg1yczUsAFZjY4
         SOVQb7MR+EkBtLmHSvje+MTcvvzDrW+10dc+JajDaLcCiFvfoTfRC3CcE+ofdINrBJ
         tmNUB9oTJSNM0R1nruakwILvtvIWzi5roXbchiTL86y3oAdQhvULqaaaOrNRCKO/cd
         64nzeLrb/FOXO2SHD7n6MQAWwIAlkT88LVOwch7DYeWYy7+Wd2nOLuF4NMmLXBJJDz
         QxkNE8Kd1d3vnBEajaCpLQjt6He3Q5gyn4ZNTLKX8gPoWzZq+A4YMrpqZTW4I0//Qr
         3zOlVcsnTUK5w==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 39B13A006E;
        Sat,  1 Aug 2020 02:36:57 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7AC84400ED;
        Sat,  1 Aug 2020 02:36:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iv6s47CK";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+4QJvbz+V1I4TbOGr2EMQ5OBsUt987whyhL4RYaRNltObpIzymYKklpjt+4QZ4W7FM8p0S92GeZZ0DWJEMuICe3Zz9A0fwWR4H2aZcxak1Of6Hi/dYFXEGcxBo7exgs0AOocAqfOAaKXhfC+TM0i8YsAK+cYj0YAGeWERtp6fI7c54fgevUC/9h+QouI71Yw/0C45F84MV4d+R+E/Jp5r/cxorT93QxN6pk1wZLxTrba67ylkEhI63VlNc6IAeq1am6FAkpeK2M1xbcw9T+JqGKZqTPb8VJAdqSh2kOg1k9st3JmDEGyOpYZJ9OVkdAoyMLF/4VfY/FkH3RISNJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QQQErXYg0trXwc1XAzuuJH6r+rfS9fZHtFCe+CWztw=;
 b=CLPkCzxSfng5pdBU0WKJWFaTLjchQnNNXCC44B5gstTUW/YUWTOJCDA0R0NWcm7Be1C0e4ENBCZw8Anm+wTP+DqMWI7thQLxh88rdt4gZhc6qUP5nmUX5OkW4TB5lJwnBTdJOX1X++ZNS/rxZrD9K36Yxse+qGzlSQg70MM6bNPhGuohHBIz9sqaVfVJcZVpVYHzzfbm7xSUgCqjhQJgfxGMYp4mhEeBWfUw7WKlW3rnpm01COOpMwlCAV5iOJcxZYAAWQZSOpsDDwK3kyt9vT67nFJoxAEUNaUefzeb+6bPrXCdvVV4Ama0hMXbgyQR0yuh/PHcEHe5iVqfQifGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QQQErXYg0trXwc1XAzuuJH6r+rfS9fZHtFCe+CWztw=;
 b=iv6s47CKwT9apoM4FXe0BUPjo0XTrbDjsQkGMjjTB2wP4uA4t+eFVxA643FojUZcFSz5HW6gAVOk0hNepBJXMlnUvk1EhviOTONH5YVOaFMKdm02xWr89Sw7RvDFlDkqOl4tMR76roBq8B627kqUCyQzS61hL1hgVxM6abOUr7g=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3127.namprd12.prod.outlook.com (2603:10b6:a03:d8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Sat, 1 Aug
 2020 02:36:53 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3239.020; Sat, 1 Aug 2020
 02:36:53 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     John Youn <John.Youn@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 06/12] usb: devicetree: Include USB SSP Gen X x Y
Thread-Topic: [PATCH v4 06/12] usb: devicetree: Include USB SSP Gen X x Y
Thread-Index: AQHWYu0y2P0CtiycEk+DOVugpVVUP6kiKo6AgABo0QA=
Date:   Sat, 1 Aug 2020 02:36:53 +0000
Message-ID: <7e11473d-de81-dc3d-db97-722be51c507f@synopsys.com>
References: <cover.1595727196.git.thinhn@synopsys.com>
 <3cf8c20044d15dfa5e5113b3a532054b4f96c13f.1595727196.git.thinhn@synopsys.com>
 <20200731202143.GA715967@bogus>
In-Reply-To: <20200731202143.GA715967@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 918f815b-acbc-43b1-4a62-08d835c3c05c
x-ms-traffictypediagnostic: BYAPR12MB3127:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB31270B84EB74AC637967D5C1AA4F0@BYAPR12MB3127.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G7qz7M4nY5IeRP4vMTzzjYaVO0W4d1JOI9qdr7C2jOqqkwz3Mt6GCJEAvon679kuutbg7SXjR4JjLpve171f+i1tCjjHLN+pCYsb5Q4GdbwdxpYGDBSnhB4hR5hEwBmJhnmzG4UCIhbKgax75crwQh90A/STCrQzMPpudxnGhpJjwUj8jix19vFhIyD28jlZuM3RrQcHrjRHFxwV7ZFkvd4WHcV3LbQCwHuBdc7ddbnQRF9xlXOVrL5M3VHTGzQ9VBupPnZeLNzA09qemZf7qIEvFozZAvSCti5Twg1+tG4CcEcIK7e09k1njLKegSj91g97duqiqRbf2/mHACsc3jzRYl/Y6RoLEuNhlN705FaXHVFBwfiZXwKeL5tNxojI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(346002)(376002)(366004)(396003)(136003)(478600001)(2616005)(76116006)(66946007)(83380400001)(2906002)(66476007)(66446008)(66556008)(36756003)(86362001)(31696002)(26005)(186003)(6506007)(31686004)(6512007)(54906003)(64756008)(8676002)(8936002)(71200400001)(110136005)(5660300002)(4326008)(316002)(6486002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: NISUr+4fF49NtxqPzxPpdUsQTKXkdZ7ZD5P+4AqHoCrdZ0NQUmECKZI4krRZ1hYjYMt1U7tqodbSwm5LNCPqYtxQNirEu/63oxPLmhB9b5vb5710mvFzjTDvRF/PB6bq83Iq7b/F8Y1EuZUKknSA9W92Q/tnPM0ZwcPJ8b6BGEaIJE1fnfuqwq8GjX4GMBBybPSK5SDPC8E6TMq5zFGzr6hxDFSFXFlD71UtvMWZzzTtEOVZsRheoYUTvyjSWK/JZfWxmO9/Vi0PXurPAxkVzpqQmGw+Bu8i4kCe5OAaihTw7HOyxDpBy37B1+AnSU3Rk1qmYEQy1BAXn2pGrECqV9KZPyDRnQEjMvZB8THHzpW376emdNbQquwi+Sy4umkPcy1l0INO6PFQzWytiL0L0vuI2MB8d7VR/biiuFvls9tdNyUngqtEGzeDtHxKlwPpWcbRXUaXNb1LM75AoMwxQo8/ZiU74Ae5EUpFW4Tk6065NPIBA1YEpZMBT19BS1sHGb7pl8w3PEYoYyvNc9eIH7QXC2vxhSLGW9yf1xi1rxl/bxFhuBH3a/X1U5JEpbB+m5v+rEJrt/7TX3WMQXjCBbSzx1omZwOPzGiqq6NCZQ4nEtKSZq9uVDzs1Djzt9CwP5X7mstQ1+TwA+xsZenkGw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <09FC86F393CC1840BAF1E17C7DEEA6CE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 918f815b-acbc-43b1-4a62-08d835c3c05c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2020 02:36:53.4284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IDT9v7QKVF5r/+pOWyrd5/yvsqQlnBugJVKOmQfHrDR/iZrHYe69NkXcB6KunGy7Abt7ypRpl59z/TxgmTjVeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3127
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Um9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFNhdCwgMjUgSnVsIDIwMjAgMTg6MzY6MzIgLTA3MDAs
IFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IEFjY29yZGluZyB0byB0aGUgVVNCIDMuMiBzcGVjLCBh
IHN1cGVyLXNwZWVkLXBsdXMgZGV2aWNlIGNhbiBvcGVyYXRlIGF0DQo+PiBnZW4yeDIsIGdlbjJ4
MSwgb3IgZ2VuMXgyLiBJZiB0aGUgVVNCIGNvbnRyb2xsZXIgZGV2aWNlIHN1cHBvcnRzDQo+PiBt
dWx0aXBsZSBsYW5lcyBhdCBkaWZmZXJlbnQgdHJhbnNmZXIgcmF0ZXMsIHRoZSB1c2VyIGNhbiBz
cGVjaWZ5IHRoZSBIVw0KPj4gY2FwYWJpbGl0eSB2aWEgdGhlc2UgbmV3IHNwZWVkIHN0cmluZ3M6
DQo+Pg0KPj4gInN1cGVyLXNwZWVkLXBsdXMtZ2VuMngyIg0KPj4gInN1cGVyLXNwZWVkLXBsdXMt
Z2VuMngxIg0KPj4gInN1cGVyLXNwZWVkLXBsdXMtZ2VuMXgyIg0KPj4NCj4+IElmIHRoZSBhcmd1
bWVudCBpcyBzaW1wbHkgInN1cGVyLXNwZWVkLXBsdXMiLCBVU0IgY29udHJvbGxlcnMgc2hvdWxk
DQo+PiBkZWZhdWx0IHRvIHRoZWlyIG1heGltdW0gdHJhbnNmZXIgcmF0ZSBhbmQgbnVtYmVyIG9m
IGxhbmVzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5bm9w
c3lzLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2NDoNCj4+IC0gTm9uZQ0KPj4gQ2hhbmdl
cyBpbiB2MzoNCj4+IC0gVXNlICJtYXhpbXVtLXNwZWVkIiB0byBpbmNsdWRlIGJvdGggdGhlIG51
bS1sYW5lIGFuZCB0cmFuc2ZlciByYXRlIGZvciBTU1ANCj4+IC0gUmVtb3ZlICJudW0tbGFuZXMi
IGFuZCAibGFuZS1zcGVlZC1tYW50aXNzYS1nYnBzIiBwcm9wZXJ0aWVzDQo+PiBDaGFuZ2VzIGlu
IHYyOg0KPj4gLSBNYWtlICJudW0tbGFuZXMiIGFuZCAibGFuZS1zcGVlZC1tYW50aXNzYS1nYnBz
IiBjb21tb24gVVNCIHByb3BlcnRpZXMNCj4+DQo+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3VzYi9nZW5lcmljLnR4dCB8IDExICsrKysrKystLS0tDQo+PiAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+IFJldmlld2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KDQpUaGFua3MhDQpUaGluaA0K
