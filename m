Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702FEC433E2
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 17:31:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42E03207DD
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 17:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fE59NjKE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gzNROH0C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730870AbgGVRbF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 13:31:05 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45562 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730800AbgGVRbF (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jul 2020 13:31:05 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 157ABC0085;
        Wed, 22 Jul 2020 17:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595439064; bh=N+1dWZ1m43xny5asIQMgR3ozl/jv0Y1LG3X1dh1CVhA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=fE59NjKE5eiBk2rbJZETIH6uEeflvdR/s7ZbSk0nxvYJWtrMr8tTnoCBhmWlDMcYQ
         0rR2p9yI9TifPKQj4ZN7miBXekpWGzGLSb1jAbt15HtXATfvJ9s8/tUoOtEVoiIofA
         VQOzNG4TXy347q2lb3RpLe+d+qBG4VsQQoLfpkFfE4SxXethWKEJsTFBLBkp1g1VZO
         fwL2JkNIsRLPKKlnH9NGxQwpQ7uwVEALRzb6DnLtYiz/uYeb3//HjmQlytISuLXPdD
         5A/ClCyYfsk1M8zwGJckfO/1SslBgvcT3Wf7NOs004kyaNfQZOAHr+HQHiPBeULL5I
         SScQpdyXKDKfg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4A773A0096;
        Wed, 22 Jul 2020 17:31:01 +0000 (UTC)
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2052.outbound.protection.outlook.com [104.47.46.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 26730400AF;
        Wed, 22 Jul 2020 17:31:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="gzNROH0C";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M62eyfFKeUrf2rUGRONIxjLr05kYDCIvy2e36F+0A5m+pyQXrXn4qdH6FgxfdlYNJK6h3qTaJXXs3m1z8BNfRp2xe20y8Lgs3iQLBxMupLcNGYe0Ue5ybf9J6djvuixc9CLYIwdSnsf0QHbZMQPOlavCt4HLlDtvvfoxyI87OduJpdMynaJRRIV74u2DCLmBCcIc7ODJS7bssIScJBhEpbXYj7LHL+OQ4XBHN4qEAOoSHPc9xei+kgWRwQYITuksQ6nGJd2zJ5z1LAI/TPernzCo8yLY0kwZpsaBEgi0Dg2S2GxWLyjnRt78jhehT8eJx9BPdv6LpPsCgUwUCch1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+1dWZ1m43xny5asIQMgR3ozl/jv0Y1LG3X1dh1CVhA=;
 b=epg5YaMgKu7+8Lt4J8bHKyJGzyBkXgPhXV2NI5CnaSIAwhPn+pmNYWTZqU1kHzEKcb/EvUDZD5OuggecT5rQ5wywpSAqKWBvDcQRsdazJZ1cquuKU1RgvbpNU+5VNV3hObyz6KA3d6VUiNfMk6Db6Kk01AjSBE/+2KKRxfCbCA3/CrzQQLdTdRw4aH5pDDtwu80xpZyfvK2MYSCII6ZYda3qTOgvs5+Egfn0T0n2PQAf6eu/W7jdfZi+ptaASplXDJekR/aiRYuXOKEwFLPrqD046952l7RfYhSy3bVKDOwshkub0/joapcPX1J9fHwU1KPsBfk2Z7YcxAj8QU/L4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+1dWZ1m43xny5asIQMgR3ozl/jv0Y1LG3X1dh1CVhA=;
 b=gzNROH0C9vBjn9dZ6oTlW6CqZudQvNHy+Ly0hTISZVwSj0S9EEkQKnamzgln8JNTJOemwUEqoYvr6ehQNchpH4m6YL2cjH8P/XvQMZ/Dwr5ZKHXNeghhNwJyj0/RW32fDdfxbP0R40MCW7poYVGsCyaySqw0mrIRjfuSnvs/UOM=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3576.namprd12.prod.outlook.com (2603:10b6:a03:d8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Wed, 22 Jul
 2020 17:30:57 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 17:30:57 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
Thread-Topic: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
Thread-Index: AQHWW7xVn29tfo9/DkKD4yu8ygVtF6kRaYEAgAAW7YCAAKirAIAAGx8AgAFx4gCAAAgVAIAAJg+A
Date:   Wed, 22 Jul 2020 17:30:57 +0000
Message-ID: <034f2463-becb-4de7-1dc6-d26e4f37957c@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <9684a2b2adb01b6b1a8c513928ea49b4a6436184.1594935978.git.thinhn@synopsys.com>
 <20200721033908.GA3508628@bogus>
 <d7e3d5c6-05c1-f256-7773-2b88f6cd5ca3@synopsys.com>
 <CAL_JsqLSKKT__dJaML4SWCpFpFYV_Cpkor=mNh5-Z7hE4n4fMA@mail.gmail.com>
 <57fffdfb-a4fa-6e50-1156-1ada3765e362@synopsys.com>
 <CAL_JsqKSrs93wLrxy2gaBEhGfgZs7jpjFarQBoHGxMc6ur3WRQ@mail.gmail.com>
 <31d57197-6365-754b-2f1b-56d7cc8e8d89@synopsys.com>
In-Reply-To: <31d57197-6365-754b-2f1b-56d7cc8e8d89@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 00a225c9-aa39-4caf-daba-08d82e64feae
x-ms-traffictypediagnostic: BYAPR12MB3576:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3576E2FE79B5DC1773AE6A06AA790@BYAPR12MB3576.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mCSbyWC1db6lbpErfovi4GQ4XWgiUYI3qBiRbFyBpqGbv65ZTOiryMFZxP6XKbA10sidjtqj2MJ+DPbF63+YEka5VbSkSiy5zQ3Qi5JmPoaGyRHOR5q8A5p8pSRqUaOe+65zSHz7NiGuoNTiSuYJVx8C+rZln5tElhhcywxUeJKYUTJYzp6zZkJ8Ya9Lh7PF/PgX78u9BBzsu2OmJS1u7VCma7CesI7I9PNadhTv4PKO8hbUVQFPPOp50DMkRBhwPIFhPSxXedejgKDkQh9h2vFCprDnmeqgmOk6D2YyQBR4tCPIEIHyYnAxFEBfMDuSXaYUnfM6owQowxMfSZklYfXqJT2G1FyvY5dZegPOTReOlUyF+sIJqOGBHPN0pa1o
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39860400002)(136003)(366004)(346002)(376002)(66476007)(64756008)(66556008)(107886003)(26005)(66446008)(76116006)(66946007)(54906003)(5660300002)(316002)(186003)(6512007)(2616005)(31686004)(8676002)(86362001)(8936002)(36756003)(478600001)(6486002)(53546011)(6916009)(6506007)(4326008)(83380400001)(71200400001)(2906002)(31696002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: R3MbPAaYamVn4on8v6y15ze4cWdZ3VMDtN2NjfdltLYBCUlm2n+z7m13nVW+XUIvcYvvTlYsYp4Oug7n2AhQla0a1lWBc5xtgdTddJs9SbIb9dS5BkIDtbai8ApYpWnZmzLBZjM7TrkiUMExg0K5vUxvYIC9IYPS9gl8O7AKrttENppL1ICSk3l5SnKdxIRaWHR6Cwa4R8ocfactv6gbAhCfD3lGC/Q4O3nrU7y+5UpyAQzoOnLvzH1xVe4w9Ow7/sIZnAbumKiPZY5lwZH24IqZ2blWoz/a6fKNypognWWwBEZTISjF2lL0Mc9j6arC+brZb/x94n2fS0hzzOZrOpHxF5Ua/O/13BhKfWnyQNdCR/vw+tBl1CwFZ+B+30GPs+EQAZxtDo5KgQMZ4ifu7sy3tOdbwkkB08vY2Ta+qPlf25IyU+qbfx9f88/qCimbmzluJCU/qEA2IRnY6UcqGM4RJbiDG3Jg5+6XAm7zqcE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C275FD5F4FED484E9CD4CD0AE2A7C04B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a225c9-aa39-4caf-daba-08d82e64feae
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 17:30:57.5685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s1H8BD1dPhKrrTGrtYJIE+ZhL7CX4HY4V/DKysFC0iE27KBroyWISgumB8UDbHpG/eh0Nww6R8LtuSCjpHq66Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3576
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBSb2IgSGVycmluZyB3cm90ZToNCj4+IE9uIFR1ZSwgSnVs
IDIxLCAyMDIwIGF0IDEwOjQyIEFNIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lz
LmNvbT4gd3JvdGU6DQo+Pj4gUm9iIEhlcnJpbmcgd3JvdGU6DQo+Pj4+IE9uIE1vbiwgSnVsIDIw
LCAyMDIwIGF0IDExOjAxIFBNIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNv
bT4gd3JvdGU6DQo+Pj4+PiBSb2IgSGVycmluZyB3cm90ZToNCj4+Pj4+PiBPbiBUaHUsIEp1bCAx
NiwgMjAyMCBhdCAwMjo1OTowOFBNIC0wNzAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pj4+Pj4+
IEludHJvZHVjZSBudW0tbGFuZXMgYW5kIGxhbmUtc3BlZWQtbWFudGlzc2EtZ2JwcyBmb3IgZGV2
aWNlcyBvcGVyYXRpbmcNCj4+Pj4+Pj4gaW4gc3VwZXItc3BlZWQtcGx1cy4gRFdDX3VzYjMyIElQ
IHN1cHBvcnRzIG11bHRpcGxlIGxhbmVzIGFuZCBjYW4NCj4+Pj4+Pj4gb3BlcmF0ZSBpbiBkaWZm
ZXJlbnQgc3VibGluayBzcGVlZHMuIEN1cnJlbnRseSB0aGUgZGV2aWNlIGNvbnRyb2xsZXINCj4+
Pj4+Pj4gZG9lcyBub3QgaGF2ZSB0aGUgaW5mb3JtYXRpb24gb2YgdGhlIHBoeSdzIG51bWJlciBv
ZiBsYW5lcyBzdXBwb3J0ZWQuIEFzDQo+Pj4+Pj4+IGEgcmVzdWx0LCB0aGUgdXNlciBjYW4gc3Bl
Y2lmeSB0aGVtIHRocm91Z2ggdGhlc2UgcHJvcGVydGllcyBpZiB0aGV5IGFyZQ0KPj4+Pj4+PiBk
aWZmZXJlbnQgdGhhbiB0aGUgZGVmYXVsdCBzZXR0aW5nLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5vcHN5cy5jb20+DQo+Pj4+Pj4+IC0t
LQ0KPj4+Pj4+PiAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdj
My50eHQgfCA5ICsrKysrKysrKw0KPj4+Pj4+PiAgICAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKykNCj4+Pj4+Pj4NCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2R3YzMudHh0DQo+Pj4+Pj4+IGluZGV4IGQwM2VkZjlkMzkzNS4uNGViYTA2
MTU1NjJmIDEwMDY0NA0KPj4+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL2R3YzMudHh0DQo+Pj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy91c2IvZHdjMy50eHQNCj4+Pj4+Pj4gQEAgLTg2LDYgKzg2LDE1IEBAIE9wdGlv
bmFsIHByb3BlcnRpZXM6DQo+Pj4+Pj4+ICAgICAgIC0gc25wcyxxdWlyay1mcmFtZS1sZW5ndGgt
YWRqdXN0bWVudDogVmFsdWUgZm9yIEdGTEFESl8zME1IWiBmaWVsZCBvZiBHRkxBREoNCj4+Pj4+
Pj4gICAgICAgICByZWdpc3RlciBmb3IgcG9zdC1zaWxpY29uIGZyYW1lIGxlbmd0aCBhZGp1c3Rt
ZW50IHdoZW4gdGhlDQo+Pj4+Pj4+ICAgICAgICAgZmxhZGpfMzBtaHpfc2RibmQgc2lnbmFsIGlz
IGludmFsaWQgb3IgaW5jb3JyZWN0Lg0KPj4+Pj4+PiArIC0gc25wcyxudW0tbGFuZXM6IHNldCB0
byBzcGVjaWZ5IHRoZSBudW1iZXIgb2YgbGFuZXMgdG8gdXNlLiBWYWxpZCBpbnB1dHMgYXJlDQo+
Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgIDEgb3IgMi4gQXBwbHkgaWYgdGhlIG1heGltdW0t
c3BlZWQgaXMgc3VwZXItc3BlZWQtcGx1cw0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICBv
bmx5LiBEZWZhdWx0IHZhbHVlIGlzIDIgZm9yIERXQ191c2IzMi4gRm9yIERXQ191c2IzMSwNCj4+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgaXQgaXMgYWx3YXlzIDEgYXQgc3VwZXItc3BlZWQt
cGx1cy4NCj4+Pj4+Pj4gKyAtIHNucHMsbGFuZS1zcGVlZC1tYW50aXNzYS1nYnBzOiBzZXQgdG8g
c3BlY2lmeSB0aGUgc3ltbWV0cmljIGxhbmUgc3BlZWQNCj4+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgbWFudGlzc2EgaW4gR2Jwcy4gVmFsaWQgaW5wdXRzIGFyZSA1IG9yIDEwLiBBcHBseSBp
Zg0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICB0aGUgbWF4aW11bS1zcGVlZCBpcyBzdXBl
ci1zcGVlZC1wbHVzIG9ubHkuIERlZmF1bHQNCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
dmFsdWUgaXMgMTAuIEZvciBEV0NfdXNiMzEsIGl0J3MgYWx3YXlzIDEwIGF0DQo+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgIHN1cGVyLXNwZWVkLXBsdXMuDQo+Pj4+Pj4gVGhpcyBpcyBhbGwg
Y29tbW9uIFVTQiB0aGluZ3MgYW5kIHNob3VsZCBiZSBjb21tb24gcHJvcGVydGllcyAod2hpY2gg
d2UNCj4+Pj4+PiBtYXkgYWxyZWFkeSBoYXZlKS4NCj4+Pj4+IFN1cmUuIEZvciAibnVtLWxhbmVz
IiBpcyBzaW1wbGUsIGFueSBvYmplY3Rpb24gaWYgd2UgdXNlDQo+Pj4+PiAibGFuZS1zcGVlZC1t
YW50aXNzYS1nYnBzIj8gT3Igc2hvdWxkIHdlIGFkZCAibGFuZS1zcGVlZC1leHBvbmVudCI/DQo+
Pj4+ICdudW0tbGFuZXMnIGlzIGdvb2QgYXMgdGhhdCdzIHdoYXQgUENJZSB1c2VzLiBEb2N1bWVu
dCB0aGF0IHdpdGgNCj4+Pj4gJ21heGltdW0tc3BlZWQnLg0KPj4+Pg0KPj4+PiBJIHRoaW5rICdz
dXBlci1zcGVlZC1wbHVzJyBzaG91bGQgbWVhbiBnZW4gMiAxMEcgcGVyIGxhbmUuIFRoZW4NCj4+
Pj4gYmV0d2VlbiBudW0tbGFuZXMgYW5kIG1heGltdW0tc3BlZWQgeW91IGNhbiBkZWZpbmUgYWxs
IDQgcG9zc2libGUNCj4+Pj4gcmF0ZXMuDQo+Pj4gVGhhdCBtYXkgY29uZnVzZSB0aGUgdXNlciBi
ZWNhdXNlIG5vdyB3ZSdkIHVzZSAnc3VwZXItc3BlZWQtcGx1cycgdG8NCj4+PiBkZWZpbmUgdGhl
IHNwZWVkIG9mIHRoZSBsYW5lIHJhdGhlciB0aGFuIHRoZSBkZXZpY2UgaXRzZWxmLg0KPj4+DQo+
Pj4gQWNjb3JkaW5nIHRvIHRoZSBVU0IgMy4yIHNwZWMsIHN1cGVyLXNwZWVkLXBsdXMgY2FuIG1l
YW4gZ2VuMngxLCBnZW4xeDIsDQo+Pj4gb3IgZ2VuMngyLg0KPj4gVGhlbiBhZGQgbmV3IHN0cmlu
Z3MgYXMgbmVlZGVkIHRvIG1ha2UgaXQgY2xlYXI6IHN1cGVyLXNwZWVkLXBsdXMtZ2VuMXgyDQo+
Pg0KPj4gSXQncyBvYnZpb3VzIHRoYXQgd2hhdCAnc3VwZXItc3BlZWQtcGx1cycgbWVhbnMgaXMg
bm90IGNsZWFyIHNpbmNlDQo+PiBVU0ItSUYgZXh0ZW5kZWQgaXRzIG1lYW5pbmcuDQo+Pg0KPj4g
Um9iDQo+IElmIHdlIGludHJvZHVjZSBhIG5ldyBlbnVtIGZvciBnZW4xeDIsIG5vdyB3ZSdkIGhh
dmUgdG8gZ28gYmFjayBhbmQNCj4gaW5zcGVjdCBhbGwgdGhlIGNoZWNrcyBmb3IgYWxsIHRoZSBk
cml2ZXJzIHdoZXJlIGZvciBleGFtcGxlIHNwZWVkID09DQo+IFVTQl9TUEVFRF9TVVBFUl9QTFVT
LiBJdCBzZWVtcyB0byBiZSBtb3JlIGNsdW5reSBhbmQgbWF5IGludHJvZHVjZSBtb3JlDQo+IGJ1
Z3MuDQo+DQoNCkluIG15IG9waW5pb24sIHRoZSBiZXR0ZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGlu
dHJvZHVjZSBhIG5ldyBwcm9wZXJ0eSANCmZvciBsYW5lIHNwZWVkIHN1Y2ggYXMgImxhbmUtc3Bl
ZWQtbWFudGlzc2EtZ2JwcyIgYmVjYXVzZToNCg0KMSkgSXQgc3RpbGwgZm9sbG93cyB0aGUgc3Bl
YywgZWFzaWVyIGZvciB0aGUgdXNlciB0byB1bmRlcnN0YW5kDQoyKSBXZSBvbmx5IG5lZWQgdG8g
dXBkYXRlIHRoZSBkcml2ZXJzIHdoZXJlIHRoZSBudW1iZXIgb2YgbGFuZXMgYW5kIGxhbmUgDQpz
cGVlZCBtYXR0ZXINCjMpIEVhc2llciBzcGVlZCBjb21wYXJpc29uIGJldHdlZW4gdXNiX2Rldmlj
ZV9zcGVlZCBlbnVtDQo0KSBFYXNpZXIgdG8gYmFja3BvcnQgbmV3IGNvZGUgd2hlcmUgdGhlcmUn
cyBzcGVlZCBjb21wYXJpc29uDQo1KSBFYXNpbHkgZXh0ZW5kYWJsZSB0byBuZXcvZGlmZmVyZW50
IGxhbmUgc3BlZWRzDQoNCkJSLA0KVGhpbmgNCg==
