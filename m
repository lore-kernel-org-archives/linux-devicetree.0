Return-Path: <SRS0=skvR=3Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFECFC2D0B1
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 10:21:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6B3921582
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 10:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="piIIQ3mn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgBDKVL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Feb 2020 05:21:11 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:41288 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726506AbgBDKVL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Feb 2020 05:21:11 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 014AHStW010010;
        Tue, 4 Feb 2020 11:20:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ASDNEVwwDTvwYFZK6EDluzNZiX+m1GXIQNqyDbJAOR0=;
 b=piIIQ3mnDc5dRQSmClGEoshBFHuDjKoxKrSr0VVGsJsl9HDrzNI3X/4m7jAQ7rcGWcwG
 Gm/wZnvzYPli6HES5tcoDHK+MNYPuUSuY3qAvVX+u4CeWUJbhvTE85NbDGFznoDpN+uv
 re/sqvB3AzSKfND33agqTU3mzr88KrEdYb2eOiYt8+tPh0TGTSAhxUGBlrPiaVhqaO0w
 rOm31nAJtmU9SrEhL3xJLo6EFb7LIyMx6Ul5kyuD0i4GFZLGu6jMn8uPiyXk9KgwxeKv
 hWxIIKbuXaRjyxPwQNqCC6Mp3NrJgHK++hVCjOk+8xAm1q4eTR182ImH5sGTxGf7PcMM BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xw13nr95y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Feb 2020 11:20:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A35F100038;
        Tue,  4 Feb 2020 11:20:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 258A12B0502;
        Tue,  4 Feb 2020 11:20:51 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 4 Feb
 2020 11:20:50 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 4 Feb 2020 11:20:50 +0100
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Olof Johansson <olof@lixom.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH][resend] ARM: stihxxx-b2120.dtsi: fixup sound
 frame-inversion
Thread-Topic: [PATCH][resend] ARM: stihxxx-b2120.dtsi: fixup sound
 frame-inversion
Thread-Index: AQHVzA13QbnFzd5BbUe+uxppwLJ+rKgK4KoA
Date:   Tue, 4 Feb 2020 10:20:50 +0000
Message-ID: <ddab976b-7f7a-f807-53f6-16e27851a37c@st.com>
References: <87muao18sk.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87muao18sk.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9F4B739D5E096449EE176D07A9155CD@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-04_02:2020-02-04,2020-02-04 signatures=0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGkgS3VuaW5vcmkNCg0KT24gMS8xNi8yMCAyOjM2IEFNLCBLdW5pbm9yaSBNb3JpbW90byB3cm90
ZToNCj4gRnJvbTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVz
YXMuY29tPg0KPg0KPiBmcmFtZS1pbnZlcnNpb24gaXMgZmxhZyBub3QgdWludDMyLg0KPiBUaGlz
IHBhdGNoIGZpeHVwIGl0Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBLdW5pbm9yaSBNb3JpbW90byA8
a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+DQo+IFJldmlld2VkLWJ5OiBQYXRyaWNl
IENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+DQo+IC0tLQ0KPiAxIG1vbnRoIHBhc3Nl
ZCwgYnV0IG5vdGhpbmcgaGFwcGVuLi4uDQo+IEkgcmVwb3N0IHRoaXMgcGF0Y2gsIGFnYWluDQo+
DQo+ICBhcmNoL2FybS9ib290L2R0cy9zdGloeHh4LWIyMTIwLmR0c2kgfCAyICstDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0aWh4eHgtYjIxMjAuZHRzaSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0aWh4eHgtYjIxMjAuZHRzaQ0KPiBpbmRleCA2MGUxMTA0Li5kMDUxZjA4IDEwMDY0NA0K
PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdGloeHh4LWIyMTIwLmR0c2kNCj4gKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvc3RpaHh4eC1iMjEyMC5kdHNpDQo+IEBAIC00Niw3ICs0Niw3IEBADQo+
ICAJCQkvKiBEQUMgKi8NCj4gIAkJCWZvcm1hdCA9ICJpMnMiOw0KPiAgCQkJbWNsay1mcyA9IDwy
NTY+Ow0KPiAtCQkJZnJhbWUtaW52ZXJzaW9uID0gPDE+Ow0KPiArCQkJZnJhbWUtaW52ZXJzaW9u
Ow0KPiAgCQkJY3B1IHsNCj4gIAkJCQlzb3VuZC1kYWkgPSA8JnN0aV91bmlfcGxheWVyMj47DQo+
ICAJCQl9Ow0KDQoNCkFwcGxpZWQgb24gc3RpLWR0LWZvci01LjYtcm91bmQxDQoNClRoYW5rcw0K
