Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC16C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 18:07:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92A84206DC
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 18:07:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RUGQSXPS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iaiWHOSl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgFKSHl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 14:07:41 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:58992 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725869AbgFKSHl (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 11 Jun 2020 14:07:41 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 139BDC0BAE;
        Thu, 11 Jun 2020 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1591898860; bh=xLYj2IfWHMSrOOYOjAuqJt6aoIGREyMmTutvxBF+jgA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RUGQSXPS9u8dHZtd7HAiDiWF1RC5bSvxnBO2zu0B1r6tRYQxjoLcgXyIVigxn7xkV
         8FVAbAekZlbL2LLcOfr5joTUEY7ZQUBr1ELGzQa9VIuJgdEDM4GKJMgdtpCmMaSosm
         s5eJfNl7ijj2FSQJbYMKVL1zmsD9B4WuE2g+ohAevNPE5HvtaxqlwqMlXiXN8aLvUo
         klIs1CzMbrrLrd+i2OgeMLAIG5cFKf5IP81HanferzJPe3/FuyjywUsabHj7meHk69
         P9JTFAXYLhLWnbd2FgWs+O+05OtNc3pP97YqC7U6/cdfAP9u1iomym4uVb1A5ApJIA
         ZNWuVzMgwX03g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 929B0A0096;
        Thu, 11 Jun 2020 18:07:38 +0000 (UTC)
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2056.outbound.protection.outlook.com [104.47.46.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4B1A1400C5;
        Thu, 11 Jun 2020 18:07:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iaiWHOSl";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyGDVqyfP/owGypKiN+tyxrIy8uFJ02y/SZ5SuPWL/AvqAkraLY83cVWLJxw7A6JBmG8mCQg+M/lnKXgyNBuAaeCqZwHtjOSq5JQfUMgcoSHvvtvGzH+MljnoBmJd9JcvexpBKK8j+yGtCDDqXsqqJVDIDnGx2bMwTA2ns00/fRkEmdqa9R1N4AuM+1LoxaePGaYX14KquJQVuO/brb+kcXIwecYzn2pNscdmNZPQcS9Hs1omRS6Dt4VhYEnE/X+j7/tM5iUome0FaOUFVzDR+8cnk6+K6bXSFbD4K2gEqkiq8UoxUdUz3/9zRREA22AFGa010UbjoshTDGpg6fgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLYj2IfWHMSrOOYOjAuqJt6aoIGREyMmTutvxBF+jgA=;
 b=SKjDnIX1BTAIjEYCbcQNKr31s9HMjtA+a21gLUpcVuC7CwG2ksSoeeAzkijlVXOvX/5TI8eFqQpUXIAVvD540iyvBMFRUQeuegX0DzTsEm5ruqErMw7gnwXwJc4pR4MSCz7X/aMCsTUsmdgOQEFM6twfX/kXnwk7QQ6Ql7VkddgqPfkgh221CoI5b1sYVv4NQVN0ZMZwd3wp1CXGi64zl90Bau24aWAlP/j3R/k3GWtp8RXdK3U1YIQJAYFyk5OcBT7B1rzTCEo1ESvswGChguWkKO740I6GJskavW8VvzDLZO1j+C2yvTHLyBDeyxGSwC5KR350La8oNacDtb0M/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLYj2IfWHMSrOOYOjAuqJt6aoIGREyMmTutvxBF+jgA=;
 b=iaiWHOSltmtZ3LGeksvXD1IOFebRR4zPp3c5owPB69GFSsksnMmAtiF+Pve+nlB0tIeHSfRNMJXxXIfj97ThfBY0d4Tpl/zamOUjKiQuyBIPWH4IXd+vCl+FaMIl3v5CMkYENsbzZPQVPksSxzSpg+zNpCtTrdgXrN6iNldfyNg=
Received: from CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 by CH2PR12MB3973.namprd12.prod.outlook.com (2603:10b6:610:2c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Thu, 11 Jun
 2020 18:07:35 +0000
Received: from CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467]) by CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467%4]) with mapi id 15.20.3088.022; Thu, 11 Jun 2020
 18:07:35 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 0/4] Add logic to consolidate TRBs for Synopsys xHC
Thread-Topic: [PATCH v3 0/4] Add logic to consolidate TRBs for Synopsys xHC
Thread-Index: AQHWNBOcKSGY3EC5WEe37t+laBwpCKjOM4yAgAHcZoCAA75DAA==
Date:   Thu, 11 Jun 2020 18:07:35 +0000
Message-ID: <c5a28e78-eaa0-92f7-f865-09b37974f101@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
 <ba1eb639-7c58-c2b2-1bd9-dacec5d1092b@synopsys.com>
 <0083681d-6f68-918a-8109-75e511ef8bf5@linux.intel.com>
In-Reply-To: <0083681d-6f68-918a-8109-75e511ef8bf5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [198.182.52.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49b58812-bccd-4915-489e-08d80e3251e6
x-ms-traffictypediagnostic: CH2PR12MB3973:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3973C3F05F8D0F21C490FF39A4800@CH2PR12MB3973.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0431F981D8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TR/VMEGglsBrRq6EaQuXKkBEuS31hNVIqMz5MMRfKMunmrnyEdmwsI4iwbm1XuL2bqZo0UWPtjst+o/JytdnQjh0rlxT/YhpQiEFJpwgGYW4eRJj8AzlBaTP7Ap3mWyqF/CqSe3PTphj+iCNztivtAIisY4Vtkfi3jPCP56xQO5aOuxf5wh6b8xFBSW2GoiG87i6kfDVkt9sumLoFcwXL8fMOFgJa1A2fM8MFyYlL2xRjCm/u9y7JUWf1V2cqb5pVNDKnVVbojcRcHqFC7TagzGnfVHqOLV+MvZWBOPxItiep75JYAgL3luRyTNxtKyj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4311.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(346002)(39860400002)(366004)(396003)(8676002)(2906002)(8936002)(5660300002)(4744005)(31696002)(86362001)(36756003)(71200400001)(2616005)(107886003)(91956017)(316002)(4326008)(110136005)(66556008)(64756008)(66446008)(66946007)(66476007)(478600001)(26005)(53546011)(6512007)(76116006)(186003)(31686004)(6486002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 0CAztL4Qv8EaGgTl3wIDkQcBmQVzxCMsoJ1m1jCtjSedb5xZFt0WwEyXkGJVKpOGptqRCEUrSGdDeOKfTw0nZnoMyLOX+yqpyqdFuvtWOaVNG//xr3tgVuXlQ5P2ah7HRKBF7fjrOJCpky8X0Ywk8NhyV5QeGcRMAvagISWjGcGXIJihMJVH57FqgtFn5CemjBUr80IVNOywFaNJ7EM4N4BDM6gPHqO6GEUOGzlQCNmsAKvTLDvU+dKMGOoYr2aRQFUDMFa1oL2L96C/uRqvAfg3yc1lmZ+WyNnXFh90PNO7vVSLZJuiogkG3bFH7e4e/HrZeW/gU2O5JAVofb5QPeDdwQy6r3AlynQ52x/uY/XUeK6XXHjd2fFjzMhL8azTur4mv83KjUpjNG2LiqWw8LLlznS+/145bhXONbWGBgCBO/r0PI9WaZ2E9Dp9Xp4HfDH7i15CyuMJex35g3mJGSrlAd9upNF7tky3AS4g9Xc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1A01F4A04038E4CA2A521A48DB810DB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b58812-bccd-4915-489e-08d80e3251e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 18:07:35.6492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3V6Tv/mY/77eIR/AojvHPD1nIHSIeYVSwixkByTt/hJ0yIJLghVUVRf1fz6NQkghXv3qaQBG9lkmBxHf5ZgMOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3973
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGksDQpPbiA2LzkvMjAyMCAyOjI3IFBNLCBNYXRoaWFzIE55bWFuIHdyb3RlOg0KPiBPbiA4LjYu
MjAyMCA3LjMyLCBUZWphcyBKb2dsZWthciB3cm90ZToNCj4+IEhpIE1hdGhpYXMsDQo+PiAgICBX
aWxsIHRoaXMgYmUgYWRkZWQgdG8geW91ciBuZXh0IGJyYW5jaCA/DQo+IA0KPiBUaGVyZSBhcmUg
c3RpbGwgc29tZSBvcGVucyBSb2IgSGVycmluZyBwb2ludGVkIG91dCByZWdhcmRpbmcgZGV2aWNl
dHJlZS4NCj4gQWRkaW5nIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBzeW5vcHN5cyB4aGNp
IGFuZCBzZXR0aW5nIHF1aXJrIGJhc2VkDQo+IG9uIHRoYXQgc291bmRzIGdvb2QgdG8gbWUuDQo+
IA0KPiBOb3Qgc3VyZSBob3cgdGhhdCB3b3JrcyBpbiBjYXNlcyB3aGVyZSB0aGUgeGhjaSBkZXZp
Y2UgaXMgY3JlYXRlZCBieSB0aGUgRFdDMyBkcml2ZXIuDQo+IE9uY2Ugd2UgaGF2ZSBhIHNvbHV0
aW9uIHRoYXQgRmVsaXBlIGFuZCBSb2IgYWdyZWVzIHdpdGggSSBjYW4gdGFrZSB0aGUgd2hvbGUN
Cj4gc2VyaWVzLiAgDQo+IA0KQEZlbGlwZTogQ2FuIHlvdSBwbGVhc2UgaGF2ZSBhIGxvb2sgYW5k
IHNlZSBpZiB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBpcyBvayBvciBhbnl0aGluZyB0byBi
ZSBjaGFuZ2VkPw0KDQo+IFRoZSB4aGNpIHBhcnRzIGFuZCBQQ0kgY2FzZSBsb29rcyBnb29kIHRv
IG1lLg0KPiANCj4gLU1hdGhpYXMNCj4gDQo+IA0KVGhhbmtzICYgUmVnYXJkcywNCiBUZWphcyBK
b2dsZWthcg0K
