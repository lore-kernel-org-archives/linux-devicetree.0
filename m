Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB35EC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 02:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA73E2065E
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 02:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kvSH9MYg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vUo+0fEY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgGXCjF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 22:39:05 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:42406 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726454AbgGXCjE (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 23 Jul 2020 22:39:04 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 346DC4047D;
        Fri, 24 Jul 2020 02:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595558344; bh=bWKSJ3KvWNd4nMAPIEt1/nYNhvAlHUbKs7kACOZ2j1g=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=kvSH9MYgcYZxQCdjsgZtz+B1RYAFZnsnk5gLsVtwhaWFsKCutvocrIyK7TXHctL1a
         MEaflAP9sqjmrHrQuE0x8H3DSUCrEBu4lCyvzW7A4UhmB6oce4C+KSBZ5lidub3b9X
         7W58RhPCRL5BZcCQ2nxQDd6zPtB3ra2eBQti8qG+Se8ZtMJboF49PwCseq42T1Y4c1
         7H5skBfMPz38DCWpTRkuOFf6mgEAagA3DtD2JGHxueYVBpRxANX8bLiMBiMUJWEy3H
         UWCXz5lTVfMsMCB8vbC5rkYJJkVfTW20kk6gipFNKDZX6sFWKGh9BUIJAJddLuGWM9
         6SPkhbIajhbAQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id BE7EEA0255;
        Fri, 24 Jul 2020 02:39:03 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6773940032;
        Fri, 24 Jul 2020 02:39:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vUo+0fEY";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlgPcuCKNwYkORMGRRe0QV21/AaLjM7hOPLsxLy5blasvGHVwyc2nJUdfSTq2owoV7tAq3fG9Csga1pkj28d02j9v79rlJzgFtvN25xBb7/q8De9/lXwEvkbKYeycAC3f9CneDi5f6helKBbFDvcy2OFgZFepnv2cvJbZxXBvbW4QCqoi7NEOqW1uCjevRuadcTnsB2YKT0rUaALyidD55wdKUjYShnDFz3AfXAZHr1iWiWf01gsGZbF40wD+IZzwW5eavp6jRLCkPcTPnyPGWH7Lrm6z+dOQ2V4xc5ax97q5pKydO3TSImR680Byq1QB7ep88XbjN4+yOOnk4VA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWKSJ3KvWNd4nMAPIEt1/nYNhvAlHUbKs7kACOZ2j1g=;
 b=Pd80Mcd7PwQpM0+ijKgvjkdTa/RRVzQXURDTuufwenxinhe4KAI8M0h0nZgAYjDthzWJmS0pj14+CotvfOA6fFJMgm1xcD9ETbSA38afezRQGVQgvjFMECZ345lV2tBuhoa9FhuTrt9Y1v222cIWVtKyQSobQmMLUZDSw7WGz6eP9DUZFoz7MsKsdq0VJ8f+2bKjCulA+mlG4y4k4G0LCN/N2i9u4wiJNCT83OZS+mBvnVE1moI/C7sreInm/4oeNcuZHKXPCoZSdt4dmorFBv+1PZ9dpICYSBEx2c0PtxEy8zdnvpSf/8z6x9UhkrfPw1v/9syl7hbDCg09sqjVdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWKSJ3KvWNd4nMAPIEt1/nYNhvAlHUbKs7kACOZ2j1g=;
 b=vUo+0fEYKtTrb5Pm1KcyqxIHJz/DZ4314w6RIcwWGwcVSzT+UF9y/eV8iF6U+RoRlhxXQxwfgIfnL7gNbsBcIUpZM0mP+WM/gyg8/vi4AI8RG1XWORDkAhm4mweWsrwVSjaEitHuAdMl3p2PY5u+c+Gr+51WwPme/WJy2DVvwLI=
Received: from DM6PR12MB2924.namprd12.prod.outlook.com (2603:10b6:5:183::23)
 by DM6PR12MB3611.namprd12.prod.outlook.com (2603:10b6:5:3c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Fri, 24 Jul
 2020 02:39:01 +0000
Received: from DM6PR12MB2924.namprd12.prod.outlook.com
 ([fe80::7dd0:907f:6b8e:290]) by DM6PR12MB2924.namprd12.prod.outlook.com
 ([fe80::7dd0:907f:6b8e:290%7]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 02:39:01 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 06/12] usb: devicetree: Introduce num-lanes and lsm
Thread-Topic: [PATCH v2 06/12] usb: devicetree: Introduce num-lanes and lsm
Thread-Index: AQHWYJa/etQUOHuFFUKzKVSbSUTrK6kVnsgAgABnNgA=
Date:   Fri, 24 Jul 2020 02:39:01 +0000
Message-ID: <0818e876-ea5b-9ebc-7427-8e26b627e6b4@synopsys.com>
References: <cover.1595468673.git.thinhn@synopsys.com>
 <d605a437f0a4bc837a05269caaa3875c2e0b29d8.1595468673.git.thinhn@synopsys.com>
 <20200723202936.GA801155@bogus>
In-Reply-To: <20200723202936.GA801155@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc6174ee-37d0-4e22-9fb1-08d82f7ab97e
x-ms-traffictypediagnostic: DM6PR12MB3611:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3611F6DCC2090DFB70AC608EAA770@DM6PR12MB3611.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EgnoOC5CQ43MYdHq3toxHA89n2sYLDl6m+OlwkTSl8U5Mwl1QZe5Ud1PgaQaxD8BSmjd7OwgOt9pCVT5wqaUYB+ZyhA4Vt7MTH3+REtPDRezviA5ygbWiM6oxo2AjkRwT/1kT/reQsAbPpRCptEhV92MexdUCYWQJPBX4g4nJoz5h63sFTpwd5pPFp8iEbhHSpDZHb+13RRnYzNZV875j+dDXAB0mqGJdwq2K6d63w7xyQwq+kyCax3xecFvV8KVxsMjsRFrxsnnoRsCPwRZ+uloMapXHNOgSSofT1lhFlUmxruwD1Gdnbs94BknCU9uzJKBcax/KppC9MCK65C+N5AjtIRbEBbRTdnz3HIvlKrWXanj9NYn0LcN9nhh7WpU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2924.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(366004)(39860400002)(376002)(346002)(5660300002)(316002)(54906003)(6506007)(6512007)(26005)(2616005)(86362001)(31696002)(4326008)(36756003)(110136005)(478600001)(186003)(107886003)(31686004)(71200400001)(8676002)(8936002)(76116006)(66476007)(66946007)(6486002)(66446008)(2906002)(64756008)(66556008)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: A30yWz4/X8ct0BfrmzcTca7XE1Mun0n67Wc+Cxz97Ma/cdXrOy+Wn1IoS0KsOK84olaPPZVt6YXV71krkf/5bNZbN1MME44YEYznJ/hrYmEWNrv9hofq1Uvj2qnyyf6+BbuHwFtH/xDt8kbtUF7L7b4RkwMclipDhj7zWfZ+imowRTRL5U6EJ0/VtX/tnCyPpp5xex9Obe3cct5ccJHELdUHcyolSK2DlpInYwO+UzIy+8m313RL7kLZdukE/HGo0+CiUX/CqJI8b8OjukBFJrP8mXI6TmQFWfkCafF27u7hMiJvjWQbhtHVnwiYW1jD8WSPHPgAGfk50DRIX9AjNrEuMXfgQTJyOYk/vSjMTHwJWuowuiEM+0LqnDyGEhZT/sZ4mWEdSftajcuaDcttx45fQ+Ng6wbsVqJilph/JDNOYs8e2dx/vSn/EgkG67gI5cnyr3MPJzaNK3SKAUeCEhlHBn9pTAKxKb28bxsdkYQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F8B54EDFE6100458E903FEA95008520@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2924.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6174ee-37d0-4e22-9fb1-08d82f7ab97e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2020 02:39:01.7084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: izneGj1cjzFANq02OYtoyvqBzV9wmaF2Sw0iW9g0aGUIl3E+opKMn3gFhxj3JMzwQL9zsyz6mAeLsLCmHlTIrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3611
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Um9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFdlZCwgSnVsIDIyLCAyMDIwIGF0IDA3OjEyOjM5UE0g
LTA3MDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IEFjY29yZGluZyB0byBVU0IgMy4yIHNwZWMs
IGEgc3VwZXItc3BlZWQtcGx1cyBkZXZpY2UgY2FuIG9wZXJhdGUgYXQNCj4+IGdlbjJ4MiwgZ2Vu
MngxLCBvciBnZW4xeDIuIEludHJvZHVjZSAibnVtLWxhbmVzIiBhbmQNCj4+ICJsYW5lLXNwZWVk
LW1hbnRpc3NhLWdicHMiIHByb3BlcnRpZXMgZm9yIGRldmljZXMgb3BlcmF0aW5nIGluDQo+PiBz
dXBlci1zcGVlZC1wbHVzLiBJZiB0aGUgVVNCIGNvbnRyb2xsZXIgZGV2aWNlIHN1cHBvcnRzIG11
bHRpcGxlIGxhbmVzDQo+PiBhdCBkaWZmZXJlbnQgdHJhbnNmZXIgcmF0ZSwgdGhlIHVzZXIgY2Fu
IHNwZWNpZnkgdGhlIEhXIGNhcGFiaWxpdHkgdmlhDQo+PiB0aGVzZSBwcm9wZXJ0aWVzLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4NCj4+
IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2MjoNCj4+IC0gTWFrZSAibnVtLWxhbmVzIiBhbmQgImxhbmUt
c3BlZWQtbWFudGlzc2EtZ2JwcyIgY29tbW9uIFVTQiBwcm9wZXJ0aWVzDQo+Pg0KPj4gICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVyaWMudHh0IHwgMTEgKysrKysr
KysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lcmljLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXJpYy50eHQNCj4+
IGluZGV4IGJhNDcyZTdhZWZjOS4uYTgyNTNkYTY4NGFmIDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lcmljLnR4dA0KPj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lcmljLnR4dA0KPj4gQEAgLTcs
NiArNywxNyBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPj4gICAJCQkibG93LXNwZWVkIi4gSW4g
Y2FzZSB0aGlzIGlzbid0IHBhc3NlZCB2aWEgRFQsIFVTQg0KPj4gICAJCQljb250cm9sbGVycyBz
aG91bGQgZGVmYXVsdCB0byB0aGVpciBtYXhpbXVtIEhXDQo+PiAgIAkJCWNhcGFiaWxpdHkuDQo+
PiArIC0gbnVtLWxhbmVzOiB0ZWxscyBVU0IgY29udHJvbGxlcnMgdGhhdCB3ZSB3YW50IHRvIHdv
cmsgdXAgdG8gYSBjZXJ0YWluIG51bWJlcg0KPj4gKwkJCW9mIGxhbmVzLiBWYWxpZCBhcmd1bWVu
dHMgYXJlIDEgb3IgMi4gQXBwbHkgaWYgdGhlDQo+PiArCQkJbWF4aW11bS1zcGVlZCBpcyBzdXBl
ci1zcGVlZC1wbHVzLiBJbiBjYXNlIHRoaXMgaXNuJ3QNCj4+ICsJCQlwYXNzZWQgdmlhIERULCB0
aGUgVVNCIGNvbnRyb2xsZXJzIHNob3VsZCBkZWZhdWx0IHRvDQo+PiArCQkJdGhlaXIgbWF4aW11
bSBIVyBjYXBhYmlsaXR5Lg0KPj4gKyAtIGxhbmUtc3BlZWQtbWFudGlzc2EtZ2JwczogdGVsbHMg
VVNCIGNvbnRyb2xsZXJzIHRoYXQgd2Ugd2FudCB0aGUgc3ltbWV0cmljDQo+PiArCQkJbGFuZXMg
dG8gb3BlcmF0ZSB1cCB0byBhIGNlcnRhaW4gcmF0ZSBpbiBHYnBzLiBWYWxpZA0KPj4gKwkJCWlu
cHV0cyBhcmUgNSBvciAxMCAoaS5lLiBHZW4gMS9HZW4gMiB0cmFuc2ZlciByYXRlKS4NCj4+ICsJ
CQlBcHBseSBpZiB0aGUgbWF4aW11bS1zcGVlZCBpcyBzdXBlci1zcGVlZC1wbHVzLiBJbiBjYXNl
DQo+PiArCQkJdGhpcyBpc24ndCBwYXNzZWQgdmlhIERULCB0aGUgVVNCIGNvbnRyb2xsZXJzIHNo
b3VsZA0KPj4gKwkJCWRlZmF1bHQgdG8gdGhlaXIgbWF4aW11bSBIVyBjYXBhYmlsaXR5Lg0KPiBU
aGlzIHN0aWxsIGxlYXZlcyAnbWF4aW11bS1zcGVlZCA9ICJzdXBlci1zcGVlZC1wbHVzIicgYW1i
aWd1b3VzLiBGaXgNCj4gdGhhdCBwbGVhc2UuDQo+DQo+IFRvIHB1dCBpdCBhbm90aGVyIHdheSwg
d2UgYWxyZWFkeSBoYXZlIG9uZSB3YXkgdG8gZGVmaW5lIFVTQiBzcGVlZHMuDQo+IERvbid0IGRl
ZmluZSBhIG5ldyBhbmQgZGlmZmVyZW50IHdheSB0aGF0IG9ubHkgY292ZXJzIGEgZnJhY3Rpb24g
b2YgdGhlDQo+IHBvc3NpYmlsaXRpZXMuDQo+DQoNClRoZW4sIHdlIGNhbiBqdXN0IGRvIGF3YXkg
d2l0aCB0aGUgIm51bS1sYW5lcyIgcHJvcGVydHksIGFuZCBjaGFuZ2UgaXQgDQp0byBzb21ldGhp
bmcgbGlrZSB0aGlzIGFzIHlvdSBzdWdnZXN0ZWQ/DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVyaWMudHh0IA0KYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVyaWMudHh0DQppbmRleCBiYTQ3MmU3YWVmYzku
Ljg1NDFiOTU3MWYyZiAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy91c2IvZ2VuZXJpYy50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy91c2IvZ2VuZXJpYy50eHQNCkBAIC0zLDEwICszLDEzIEBAIEdlbmVyaWMgVVNCIFByb3Bl
cnRpZXMNCiDCoE9wdGlvbmFsIHByb3BlcnRpZXM6DQogwqAgLSBtYXhpbXVtLXNwZWVkOiB0ZWxs
cyBVU0IgY29udHJvbGxlcnMgd2Ugd2FudCB0byB3b3JrIHVwIHRvIGEgY2VydGFpbg0KIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3BlZWQuIFZhbGlkIGFy
Z3VtZW50cyBhcmUgInN1cGVyLXNwZWVkLXBsdXMiLA0KLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJzdXBlci1zcGVlZCIsICJoaWdoLXNwZWVkIiwgImZ1bGwt
c3BlZWQiIGFuZA0KLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJsb3ctc3BlZWQiLiBJbiBjYXNlIHRoaXMgaXNuJ3QgcGFzc2VkIHZpYSBEVCwgVVNCDQotwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udHJvbGxlcnMgc2hv
dWxkIGRlZmF1bHQgdG8gdGhlaXIgbWF4aW11bSBIVw0KLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhcGFiaWxpdHkuDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInN1cGVyLXNwZWVkLXBsdXMtZ2VuMngyIiwgDQoic3Vw
ZXItc3BlZWQtcGx1cy1nZW4yeDEiLA0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICJzdXBlci1zcGVlZC1wbHVzLWdlbjF4MiIsICJzdXBlci1zcGVlZCIsIA0K
ImhpZ2gtc3BlZWQiLA0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICJmdWxsLXNwZWVkIiBhbmQgImxvdy1zcGVlZCIuIEluIGNhc2UgdGhpcyBpc24ndCANCnBh
c3NlZA0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZpYSBE
VCwgVVNCIGNvbnRyb2xsZXJzIHNob3VsZCBkZWZhdWx0IHRvIHRoZWlyIA0KbWF4aW11bQ0KK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEhXIGNhcGFiaWxpdHku
IFNpbWlsYXJseSwgaWYgdGhlIGFyZ3VtZW50IGlzDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgInN1cGVyLXNwZWVkLXBsdXMiLCBVU0IgY29udHJvbGxlcnMg
c2hvdWxkIA0KZGVmYXVsdCB0bw0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHRoZWlyIG1heGltdW0gdHJhbnNmZXIgcmF0ZSBhbmQgbnVtYmVyIG9mIGxhbmVz
Lg0KIMKgIC0gZHJfbW9kZTogdGVsbHMgRHVhbC1Sb2xlIFVTQiBjb250cm9sbGVycyB0aGF0IHdl
IHdhbnQgdG8gd29yayBvbiBhDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwYXJ0aWN1bGFyIG1vZGUuIFZhbGlkIGFyZ3VtZW50cyBhcmUgImhvc3QiLA0K
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInBlcmlwaGVy
YWwiIGFuZCAib3RnIi4gSW4gY2FzZSB0aGlzIGF0dHJpYnV0ZSANCmlzbid0DQoNCg0KSXMgdGhh
dCBvaz8NCg0KQlIsDQpUaGluaA0K
