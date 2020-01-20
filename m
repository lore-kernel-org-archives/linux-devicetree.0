Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C14C32771
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:48:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09B8622525
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="pwpXB7Ty"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgATUsU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 15:48:20 -0500
Received: from mail-eopbgr80127.outbound.protection.outlook.com ([40.107.8.127]:5954
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726586AbgATUsU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Jan 2020 15:48:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GW8NlLc34kKBIbDD8W2opagYcKsQnXlBbwMDeN2K8zZVXbxT4X37oDkzbvB2I+pz66JlipCuPPW3zBV/LIetfUDjf9C6amk2kuexrcSsWRPb77HfZLor/sCl44/ttb1YFaFAz92lgYPY8PpwGD0wlYWyZChgmB3mUTcz/0vwSyfxhryBcoX9tuGnXJm1fMccdeQsFO331mZCf9IG8YHnBCVqb8E546qJTBDv447goxeMAVcRJ+bsu34LsjqfeDVnTkJu8onQfI+WWF99XYGG0kZpsVOqNAwJU62SFdDBiF5CZpnpA0MuPKClv0qEg98XsOPEzEfvA256Iy12VY9Zog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10kvrjA6WNGE5CxJ20pHpOyXgNuB4nv+Iy55f98qdSc=;
 b=kVNT6t16vpASTTfIIjVj+sjFWdlRkk+PVanFkd3OKyVZcSJ9PY/UeMuGciZF0y0rms8LDscocTkRoXh4uIkx4txDMgUkOYwrmxJaG8WWUJXuKhvWO8KBVlUDuMrERuBAeEXPC9PcLhAg4wgg6ZfSJhZyRJwcYxCxgVGPO1JoEXcRmVk8aApBqmaeACWbSQJ65PEpJhVJ9t8Wb+2xrnb4++1UoWk21RdQc+1lpzBJJnC0tJksxYdmQ1HER2ZJNdjme/0BDmojXspNy4gTAt66IGzCNOlxPpt1IzSiBhqLMJfUgKWhy4UT7mmtLK2zZ0QjoiXQMh5MZmyqiWf8jwO/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10kvrjA6WNGE5CxJ20pHpOyXgNuB4nv+Iy55f98qdSc=;
 b=pwpXB7Ty+u+lfw8Y1z4WdYByoxjhQEZn24n4Bwo50tviQ/OUeCvGvV26E7Q9TTqPgSSugKXuXTWGqf/kiJtmUCOMWnAzSQWVnf8CgsrzLva5hG+ZNbymftKBFJus32A21k8lAoDcLsDJTb0QPd1LI3ZvqsieQ4RlZ4mhyUWEesQ=
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB4447.eurprd05.prod.outlook.com (10.171.182.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Mon, 20 Jan 2020 20:48:14 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 20:48:14 +0000
Received: from mail-qk1-f177.google.com (209.85.222.177) by BL0PR03CA0013.namprd03.prod.outlook.com (2603:10b6:208:2d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.19 via Frontend Transport; Mon, 20 Jan 2020 20:48:13 +0000
Received: by mail-qk1-f177.google.com with SMTP id r14so521121qke.13        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 12:48:13 -0800 (PST)
From:   Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To:     Sam Ravnborg <sam@ravnborg.org>
CC:     Rob Herring <robh@kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: add panel-timing.yaml
Thread-Topic: [PATCH v1 1/3] dt-bindings: display: add panel-timing.yaml
Thread-Index: AQHVz80w4HhwlRHTykqlZw21DVxxdqf0BjKA
Date:   Mon, 20 Jan 2020 20:48:14 +0000
Message-ID: <CAGgjyvGh8idpvijVcV0vA8R_iaB0mQMTk_=wWDSSKWX7hwdYPw@mail.gmail.com>
References: <20200120200641.15047-1-sam@ravnborg.org>
 <20200120200641.15047-2-sam@ravnborg.org>
In-Reply-To: <20200120200641.15047-2-sam@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:208:2d::26) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAUoK/SXlUawt0SiwePy0sb8jnlnkATmKybuiswCgHx2lcBjlRNX
        Nhik1zKtc9kGYFkxCr/Kk+D5fSFe9rIi62nMfo4=
x-google-smtp-source: APXvYqxRsY6PBm7SFmk9FKkztBRkbGWlFRVKW63cegNsfwHASEVVYLUzYdjZFtlKXLvkvibN89sFGw+hG+ooIUd7q00=
x-received: by 2002:a05:620a:21d4:: with SMTP id
 h20mr1361174qka.468.1579553289927; Mon, 20 Jan 2020 12:48:09 -0800 (PST)
x-gmail-original-message-id: <CAGgjyvGh8idpvijVcV0vA8R_iaB0mQMTk_=wWDSSKWX7hwdYPw@mail.gmail.com>
x-originating-ip: [209.85.222.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a0b1518-02a4-43ec-adf1-08d79dea118c
x-ms-traffictypediagnostic: VI1PR05MB4447:
x-microsoft-antispam-prvs: <VI1PR05MB4447D1337852D617C0935E62F9320@VI1PR05MB4447.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(189003)(199004)(81166006)(8936002)(26005)(186003)(8676002)(107886003)(966005)(53546011)(478600001)(2906002)(81156014)(55446002)(9686003)(6862004)(42186006)(86362001)(54906003)(44832011)(4326008)(71200400001)(52116002)(316002)(5660300002)(66556008)(66946007)(66476007)(64756008)(66446008);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR05MB4447;H:VI1PR05MB3279.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vJ6K2hBHkQZuVeRburr45xJOivNY0+pxP6LAgMqicpbpY8aXOqIVRlvt+yA5tFMRNkdPLPde3iM1w50yulKUQg1HfYrwVBZe4FSjfg+2Z+VtXKsQqD6ILjhg58iIbkEdCH6mnPOPwsXGNIvsILsGY3maOru5L0QoeiilTk8xq1OnBW+Z8CNRl97xC/d5QqrTZFhVWFDnRM/XI5/VeuCDvvksG+hrMj2wi1o3WeinD0UPPiRkE2zy5OJtNO5p4WWj/u9RbaE7zgd5hLLvEQ6V4cGvWdLT2OPYhB+C1QHkxaiTNWE/NAx5Q+txamyWp72h92g7qQ/g4um2BlHW11YAqCWfg8hC8GODyLgSfShMxSdAwysR1mo39PiAi38NcnVtApHmIJ5yJflsTts/S/9d1z1suCgRuwaAsmLpcmaPBCSp/cv0sRm9DiB682+r7hzN3rBVatbK81e7i5Be1kyk1j0E0FURE+y8kJhth0Nt2PE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <399E13C439696D408A3FC7D556BC5B6B@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0b1518-02a4-43ec-adf1-08d79dea118c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 20:48:14.1293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYraSLWFmGT54PsbAguAHsIR7ogQa3zvADDesww8MH5KxKDlgNF8NDnMZFcR4+F4hu+pGqZwUU2CE1hKnwRnjVSxByn/mBO5Tzr3eWfIoY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4447
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMTA6MDcgUE0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPiB3cm90ZToNCj4NCj4gQWRkIG1ldGEtc2NoZW1hIHZhcmlhbnQgb2YgcGFuZWwtdGlt
aW5nIGFuZA0KPiByZWZlcmVuY2UgaXQgZnJvbSBwYW5lbC1jb21tb24ueWFtbC4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPiAtLS0NCj4NCg0K
VGhlcmUgc29tZSB0eXBvczoNCg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtdGltaW5nLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC10aW1pbmcueWFtbA0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU5ODkxYzdhNThl
ZQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXRpbWluZy55YW1sDQo+IEBAIC0wLDAgKzEsMjUzIEBA
DQouLi4NCj4gK2Rlc2NyaXB0aW9uOiB8DQo+ICsgIFRoZXJlIGFyZSBkaWZmZXJlbnQgd2F5cyBv
ZiBkZXNjcmliaW5nIHRoZSB0aW1pbmcgZGF0YSBkYXRhIG9mIGEgcGFuZWwuIFRoZQ0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eXl5eXl5eXl4NCnMvZGF0YSBkYXRhL2RhdGEvDQoNCi4uLg0KPiArICB2YWN0aXZl
Og0KPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0K
PiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ICsgICAgICBWZXJpY2FsIHBhbmVsIHJlc29sdXRpb24g
aW4gcGl4ZWxzDQotLS0tLS0tLS1eXl5eXl4NClZlcnRpY2FsDQoNCkFueXdheSwgdGhvc2UgYXJl
IG1pbm9yIGlzc3Vlcywgc28NCg0KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBTdXZvcm92IDxvbGVr
c2FuZHIuc3V2b3JvdkB0b3JhZGV4LmNvbT4NCg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCg0KLS0NCkJlc3QgcmVnYXJkcw0KT2xla3Nh
bmRyIFN1dm9yb3YNCg0KVG9yYWRleCBBRw0KQWx0c2FnZW5zdHJhc3NlIDUgfCA2MDQ4IEhvcncv
THV6ZXJuIHwgU3dpdHplcmxhbmQgfCBUOiArNDEgNDEgNTAwDQo0ODAwIChtYWluIGxpbmUpDQo=
