Return-Path: <SRS0=zwrU=BO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160A0C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 00:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E4E32076C
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 00:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TzlZe9l5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TjVruQLu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgHDAor (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Aug 2020 20:44:47 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:38886 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726130AbgHDAor (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Aug 2020 20:44:47 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 941BDC007E;
        Tue,  4 Aug 2020 00:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1596501886; bh=H6SEa/+AdY40j8HjKgG2lSs7r5oeb4FTJ3jYkgV5+dk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=TzlZe9l5VWzi04VfNnqO4pe6mFrr7diTaaWDc7XbdICyRoLYsi8/U1D8f1IfCgeot
         SJT3txSOq07GbZfyqHj09f0fnVBWmWnji57+/Q/YfDSA0CKoG/Llvi5lvSexGX/aMh
         EnwxfjxapACttnq3JglFb0lACpdcq26sANJjEQNqNhHCQx7XnL/4d64lQw2oWSavF1
         hL1G6aupec2nAqSn5lK1eNgrqjkqI7hU1cNp/5tOcFROva4eP7tVk0/Fd6SQs2yhT0
         T5bUDaYifVcfx/rsfJnrNDI39lkxz80TdahZBzj30xjb9lIkEKAxJ96PNbXDTU5H3/
         VjZP3aEAgDEcw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 105DBA006E;
        Tue,  4 Aug 2020 00:44:44 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0F22E80FB6;
        Tue,  4 Aug 2020 00:44:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="TjVruQLu";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMTSKPZXRCPzs2QLYVcZaTTHphUW80ZXK2TOsm0kcl+KGEbPbqwQEaFEmNy4AxIsl2fLh+fO45AFLv6TTT2Is1L5xjvr2KUfHIfzvx4nwHN4a4Z6gXEhIfsMUQCGE3ck7JskvQrhfpLeCZPFYwtC0AI4V1EZdlmZQEl41EByRwUu+01+It82Yvs8WWFosILsag4ac2PuU00arpGSg83Riwtd9yvT2HEWRSQj91Kk5ytftvzdy006BcGaiK6y+giY+NbgDcq/ffontcdk3xiqRCfiWtr4pHgT5tWghVkkyGys2/NnFUsoph+cRCdI1rWvTT3QaLjgA6ArpwhTr56l7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6SEa/+AdY40j8HjKgG2lSs7r5oeb4FTJ3jYkgV5+dk=;
 b=EuKEHUIsSEnl2AuqkiS7aLWJl6knJ1iFMFHPLjgyJbK4pLkXC9nzHbkbQwr4u1F5Ux7m2+DnBpcd1/KIhmOSjj319DxiB1ZIOwVVCynQuSQmtvsVYw7WhMKXCkQeYIDVLJElwI7iFTS+p0RQY4BI5+RJr3J8njOb11wtR4xYSbu813AH4QX7PiEGmdv51xNhGylaqdBpGs91s7M/YecvEyFh+V75+53cmjBAnA7tSEDGXxaRpN1fdXI1lQH74PXQASe2NTP7AC/98ieWf9Uy+v2MjwQO/z2AfBFf959Ee92PaK+khw8uBg0xHruEz6qMZr4Nq6iONo85I2UBmFHJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6SEa/+AdY40j8HjKgG2lSs7r5oeb4FTJ3jYkgV5+dk=;
 b=TjVruQLuZb50fQFd+ENFVsxvc+KpDSz4lh+ljMdqQOOx1muDgXzKCMcG9o738C73bNDYAyePWqOoUU7oKO1NO2Yj9uuOWvGa1gTxuf1f/Y/Dkpf21+u4qo/Urkg+D6u/JR8BPGyXE7Ys58YS+9MnqHf1XmgYBdGCu99QPkx8mxU=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB3873.namprd12.prod.outlook.com (2603:10b6:a03:1a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 00:44:41 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3239.021; Tue, 4 Aug 2020
 00:44:41 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
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
Thread-Index: AQHWNBPK0i2jeeruvUO1Pxx8yuSXuqj6PmkAgAAa/ICADhZxAIAJsAuAgAB4IgCAD0ZNAIAFqmcA
Date:   Tue, 4 Aug 2020 00:44:41 +0000
Message-ID: <d4f895da-38c7-d553-cb3a-835da00ae687@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
 <83eba2e9f0069f20ccc94537e3b99cbaec209441.1590415123.git.joglekar@synopsys.com>
 <5534d9d6-5452-dade-e46e-f4b0910becdb@synopsys.com>
 <877dvhqh2e.fsf@kernel.org>
 <2f61133b-319d-80dc-f3f3-7e08e0228953@synopsys.com>
 <878sfdp5bk.fsf@kernel.org>
 <48f1764e-4383-a149-b93b-3851095394e7@synopsys.com>
 <7ae08b3d-3b5e-73cf-d196-325501a44e44@synopsys.com>
In-Reply-To: <7ae08b3d-3b5e-73cf-d196-325501a44e44@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9339321-0f2a-4ab7-610d-08d8380f92f4
x-ms-traffictypediagnostic: BY5PR12MB3873:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB38731AD96520C2505904259EAA4A0@BY5PR12MB3873.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WIgSyqqHUzaFSyGoTUIS5p5I/8U80noPbuKZgqv2M03J3G0BUXXa6cXeMHGwL5jM1SlvWM0QDaq3E5wY8bTHWI95yzTidAhlwwWUFeKeVetMlBw4u4Wia3IFFysiRmcxyImKHXYzHQbCRDhFNCgSs/b3OQS+our0Y5i3GGYGLJLxDKbqA63GZ+fTokWirFc1CFGchMCjz0pfIKM8nUNfV7s1ecSV18or/2uYMSohIeuUOMt1wz3E+IvGYE/iLXYqaex9XRmO8Ykf4Bmfr4e0LuFp4gpJyoPMWHQ0Rpl8LvnVshvr33Cnl0hSro8DucMOfOJIM/zQoBW0EsOoxxB9cmHy2naK/BMcev5PyT2yLCNx46LNX5LTyeheCreNwBNR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(136003)(366004)(39860400002)(186003)(26005)(36756003)(6506007)(53546011)(2616005)(6486002)(66476007)(66446008)(76116006)(66946007)(64756008)(71200400001)(66556008)(5660300002)(83380400001)(31686004)(54906003)(110136005)(316002)(31696002)(4326008)(86362001)(2906002)(8936002)(8676002)(6512007)(478600001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: F3TjQZDGPSoBKIpuv3NW6uulbDRLDZkbK0jDHp5+VzBOFjgc58p2P1bCnFDNbTF2VDbFeiMi4bjTPY4Qr06R+uokXTkZElU5hGP2BNRY/L1vCmjq0CBvq+PkeXmd/0IBaq4fJWlI5bXzdw1SkvfzOThRAfV+B5kQ/gGdEGpPkojqo3D8KGUv2BvRmH/uLr8HSRkLDVM+iktz91TJUZYvPedoYNxizjorsOjil69PImcg1cfz5bDI48LR1Asni5jDWSwnIF1WBTB144abM4oQ7Nw+0CFh0mndvaXdOrt2qJ5NCpctDuRtKNlXlfPt6A3SqAKBA9M0IQa8lE1+8wvjCWPezhcJUzvtEg8hJe8R2/xbW4BfKZOJXTISHyD4lOaarjLy8/N7dY+Wbq6n0+3fJkvnOZvwEQL1HFYPu6f9ugz+UwIGuLBKRcuetnqO7P6TotFjJO91Xy6qKDTR1/2nnDwaurdSd3Wb9W/T2JSSnO0RtSBSYalOFFmWnayBx6M8QwQDFqNEcHV4lObfpl7Cst3CuBDk2B0kxauvzdssUsGzw/KbV4WZ3cUApxK1dq1fRyq2PWYbp93An9OMskDQnAuKrK/7Mpg/qK50pHAfzbONdXvZziBRXvID84mXUgMcwMQ+8f7Vtq3vsV1DFzd6bQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D0A2E0677F2BA41991B9CB60A9423A9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9339321-0f2a-4ab7-610d-08d8380f92f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 00:44:41.2520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZAJeS1XX+i70Gnc8ny1QLjTeUL88FPzVXWOTkJlgcvEJx7yw6RZxkfJFtD1uf48kjgBNpM9bbHm1fsaNbYBeXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3873
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGkgUm9iLA0KDQpUZWphcyBKb2dsZWthciB3cm90ZToNCj4gSGVsbG8gUm9iLA0KPiBPbiA3LzIx
LzIwMjAgMTA6MjcgUE0sIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0KPj4gSGVsbG8sDQo+Pg0KPj4g
T24gNy8yMS8yMDIwIDM6MTcgUE0sIEZlbGlwZSBCYWxiaSB3cm90ZToNCj4+PiBUZWphcyBKb2ds
ZWthciA8VGVqYXMuSm9nbGVrYXJAc3lub3BzeXMuY29tPiB3cml0ZXM6DQo+Pj4NCj4+Pj4gSGkg
Um9iLA0KPj4+Pg0KPj4+PiBPbiA3LzYvMjAyMCAxMjoxMyBQTSwgRmVsaXBlIEJhbGJpIHdyb3Rl
Og0KPj4+Pj4gSGksDQo+Pj4+Pg0KPj4+Pj4gVGVqYXMgSm9nbGVrYXIgPFRlamFzLkpvZ2xla2Fy
QHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+Pj4+PiBAQCAtOTUsNiArOTUsMTAgQEAgaW50IGR3
YzNfaG9zdF9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQo+Pj4+Pj4+ICAJaWYgKGR3Yy0+dXNiMl9s
cG1fZGlzYWJsZSkNCj4+Pj4+Pj4gIAkJcHJvcHNbcHJvcF9pZHgrK10gPSBQUk9QRVJUWV9FTlRS
WV9CT09MKCJ1c2IyLWxwbS1kaXNhYmxlIik7DQo+Pj4+Pj4+ICANCj4+Pj4+Pj4gKwlpZiAoZHdj
LT5zZ2xfdHJiX2NhY2hlX3NpemVfcXVpcmspDQo+Pj4+Pj4+ICsJCXByb3BzW3Byb3BfaWR4Kytd
ID0NCj4+Pj4+Pj4gKwkJCVBST1BFUlRZX0VOVFJZX0JPT0woInNnbC10cmItY2FjaGUtc2l6ZS1x
dWlyayIpOw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICAJLyoqDQo+Pj4+Pj4+ICAJICogV09SS0FST1VO
RDogZHdjMyByZXZpc2lvbnMgPD0zLjAwYSBoYXZlIGEgbGltaXRhdGlvbg0KPj4+Pj4+PiAgCSAq
IHdoZXJlIFBvcnQgRGlzYWJsZSBjb21tYW5kIGRvZXNuJ3Qgd29yay4NCj4+Pj4+Pj4NCj4+Pj4+
PiBEb2VzIHRoaXMgaW1wbGVtZW50YXRpb24gbG9va3MgZ29vZCB0byB5b3U/IFJvYiBoYXMgc29t
ZSBjb25jZXJuZWQgb3ZlciB0aGUgRFQgZW50cmllcywNCj4+Pj4+PiB5b3Ugc3VnZ2VzdGVkIHVz
aW5nIGNvbXBhdGlibGUgc3RyaW5nIHdpdGggdGhpcyBxdWlyayBhZGRpdGlvbi4NCj4+Pj4+PiBD
YW4geW91IHBsZWFzZSBicmllZiBhYm91dCBob3cgeW91IHdvdWxkIGxpa2UgdG8gaGF2ZSB0aGlz
IHF1aXJrIGltcGxlbWVudGVkPw0KPj4+Pj4+IEkgY2FuIHNlbmQgdGhlIHVwZGF0ZWQgcGF0Y2gu
IE15IHBhdGNoIHNlcmllcyBpcyBwZW5kaW5nIGZvciBtZXJnZSBqdXN0IGJlY2F1c2Ugb2YgdGhl
DQo+Pj4+Pj4gRFQgYW5kIHF1aXJrIGlzc3VlLiBDYW4geW91IHBsZWFzZSBoZWxwPw0KPj4+Pj4g
WWVhaCwgeW91IG5lZWQgdG8gZ2V0IGludG8gYW4gYWdyZWVtZW50IHdpdGggUm9iIDotKSBJIGRv
bid0IG1pbmQgaGF2aW5nDQo+Pj4+PiBleHRyYSBEVCBmbGFncyBmb3IgdGhpbmdzIHdoaWNoIGNh
bid0IGJlIGRldGVjdGVkIGluIHJ1bnRpbWUsIFJvYg0KPj4+Pj4gZGlzYWdyZWVzLg0KPj4+Pj4N
Cj4+Pj4gVGhlIGNvbXBhdGlibGUgc3RyaW5nIGlzIG5vdCBzdWl0YWJsZSBvcHRpb24gYXMgaXQg
ZG9lcyBub3Qgd29yayB3aXRoIHBsYXRmb3JtIGRyaXZlcnMNCj4+Pj4gd2l0aCBQQ0kgYmFzZWQg
c3lzdGVtLiBBbHNvIFN5bm9wc3lzIGNvbnRyb2xsZXJzIElQIHZlcnNpb24gcmVnaXN0ZXIgaXMg
bm90IHZpc2libGUgdG8geGhjaQ0KPj4+PiBkcml2ZXIgYW5kIGhlbmNlIHdlIGRvbid0IGhhdmUg
c2VwYXJhdGUgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGVhY2ggU3lub3BzeXMgdmVyc2lvbiBvbiB0
aGUNCj4+Pj4geGhjaSBkcml2ZXIgc2lkZS4gDQo+Pj4+IER1ZSB0byB3aGljaCBJIGRlcGVuZCBv
biBEVCBmbGFnIGFkZGl0aW9uIGZvciB0aGUgcXVpcmsuIENhbiB3ZSBhZGQgdGhlc2UgRFQgZmxh
Z3MgYW5kIHF1aXJrPw0KPj4+IEFzIEkgc2FpZCwgSSdtIHdlbGwgYXdhcmUgb2YgdGhlIHNpdHVh
dGlvbiByZWdhcmRpbmcgdXNhZ2Ugb2YgY29tcGF0aWJsZQ0KPj4+IHN0cmluZ3MgYW5kIHRoZSBm
YWN0IHRoYXQgZHdjMyBtdXN0IHdvcmsgb24gUENJIGFuZCBub24tUENJIHN5c3RlbXMgKEkNCj4+
PiB3cm90ZSB0aGUgdGhpbmcgYXMgaXQgaXMgYWZ0ZXIgYWxsKS4gVGhlIHBlcnNvbiBibG9ja2lu
ZyBuZXcgcXVpcmsgZmxhZ3MNCj4+PiBpcyBSb2IsIG5vdCBtZS4gWW91IG5lZWQgdG8gY29udmlu
Y2UgUm9iIHRoYXQgdGhpcyBpcyB0aGUgd2F5IHRvIGdvLg0KPj4+DQo+PiBARmVsaXBlOiBTb3Jy
eSBmb3IgY29uZnVzaW9uIGlmIGFueSwgcHJldmlvdXMgbWFpbCB3YXMgaW50ZW5kZWQgZm9yIFJv
YiBhc2tpbmcgYWJvdXQgaGlzIGFwcHJvdmFsLg0KPj4NCj4+PiBSb2IsIGJhbGwncyBpbiB5b3Vy
IGNvdXJ0LiBTb3JyeS4+IA0KPj4gQFJvYjogQXMgSSBhbmQgRmVsaXBlIGhhdmUgbWVudGlvbmVk
IGJlZm9yZSwgaXQgaXMgdmVyeSBtdWNoIG5lY2Vzc2FyeSB0byBoYXZlIHF1aXJrIGZsYWdzDQo+
PiBmb3IgdGhlIGN1cnJlbnQgY2hhbmdlcyBhcyBjb21wYXRpYmxlIHN0cmluZyB3b3VsZCBub3Qg
YmUgYSBzb2x1dGlvbiBmb3IgUENJIGFuZCBub24tUENJDQo+PiBzeXN0ZW1zLiBDYW4geW91IHBs
ZWFzZSBhcHByb3ZlIHRoaXMgY2hhbmdlID8gSWYgeW91IGhhdmUgYW55IGNvbmNlcm4gYWJvdXQg
bmFtaW5nIG9yIGFueQ0KPj4gb3RoZXIgdGhpbmcsIHBsZWFzZSBsZXQgdXMga25vdy4NCj4+DQo+
IENhbiB5b3UgcGxlYXNlIGNvbW1lbnQ/DQo+DQo+IFRoYW5rcyAmIFJlZ2FyZHMsDQo+IFRlamFz
IEpvZ2xla2FyDQo+ICANCj4NCg0KQ2FuIHlvdSBoZWxwIHByb3ZpZGUgcG9pbnRlcnMgYW5kIGNo
YW5nZXMgdGhhdCBUZWphcyBjYW4gbWFrZSB0byBoZWxwDQpicmluZyB0aGlzIGlzc3VlIHRvIGNv
bmNsdXNpb24/DQoNClRoYW5rcywNClRoaW5oDQo=
