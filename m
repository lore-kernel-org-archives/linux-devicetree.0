Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0CBC352A4
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:03:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 805602080C
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="D5V7BBkv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgBJJDI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 04:03:08 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:4050 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726796AbgBJJDI (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Feb 2020 04:03:08 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01A8mLPn001938;
        Mon, 10 Feb 2020 10:02:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=H3rjV2A7fROz9cnfk/NtpzzXf8VAhOt6rYAt5Ftt45U=;
 b=D5V7BBkvCc0kUybXL+upTzZgl75lCiYEW+mg1iyuSGZCPHhDqvHoOLqEIwWAHpsvx3JT
 lvYZvivPSRavo5I9BBLtWVpiBqbpSFtNLa5TUve6Sr8ggCN5Hcu6D7PowvHqmhZ9lZ9G
 vDepXpzaLOSvrHOH/kYlLUCn8WG1xVCKPykOH0L3Ry0LCAQuGllUluzwr9X0RWoA44rs
 aEhtdrV6O2OgcpZ2A3Sa0gKshHV458DIZuhKJqmGcCM1HKSo7z9m8vsTEc8PoCjFFGst
 Cyb1vC6w20bsewVzwgofcOqKYauilVE+Ms51/8SvoIYyPnd6sbaOSkqgAreHz5+QKCaa kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1urgr6gv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Feb 2020 10:02:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EAD0010002A;
        Mon, 10 Feb 2020 10:02:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D059F2B793A;
        Mon, 10 Feb 2020 10:02:36 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 10:02:36 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Mon, 10 Feb 2020 10:02:36 +0100
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: Re: [PATCH v3 0/2] clockevent: add low power STM32 timer
Thread-Topic: [PATCH v3 0/2] clockevent: add low power STM32 timer
Thread-Index: AQHV1dN0ASRe/0fvOUqwQX9rlF1+nagUJUGA
Date:   Mon, 10 Feb 2020 09:02:36 +0000
Message-ID: <7d062f5b-9272-c7db-7a9e-b908870dd8b4@st.com>
References: <20200128120702.26166-1-benjamin.gaignard@st.com>
In-Reply-To: <20200128120702.26166-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AF5E50E0266274A90729B9F125EDBE9@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-10_02:2020-02-07,2020-02-10 signatures=0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

DQpPbiAxLzI4LzIwIDE6MDcgUE0sIEJlbmphbWluIEdhaWduYXJkIHdyb3RlOg0KPiBUaGlzIHNl
cmllcyBhZGQgbG93IHBvd2VyIHRpbWVyIGFzIGJvYWRjYXN0IGNsb2NrZXZlbnQgZGV2aWNlLg0K
PiBMb3cgcG93ZXIgdGltZXIgY291bGQgcnVucyBldmVuIHdoZW4gQ1BVcyBhcmUgaW4gaWRsZSBt
b2RlIGFuZA0KPiBjb3VsZCB3YWtldXAgdGhlbS4NCg0KR2VudGxlIHBpbmcgdG8gcmV2aWV3ZXJz
Lg0KDQpUaGFua3MsDQoNCkJlbmphbWluDQoNCj4NCj4gdmVyc2lvbiAzOg0KPiAtIGZpeCB0aW1l
ciBzZXQgc2VxdWVuY2UNCj4gLSBkb24ndCBmb3JnZXQgdG8gZnJlZSBpcnEgb24gcmVtb3ZlIGZ1
bmN0aW9uDQo+IC0gdXNlIGRldm1fa3phbGxvYyB0byBzaW1wbGlmeSBlcnJvcnMgaGFuZGxpbmcg
aW4gcHJvYmUgZnVuY3Rpb24NCj4NCj4gdmVyc2lvbiAyOg0KPiAtIHN0bTMyIGNsa2V2ZW50IGRy
aXZlciBpcyBub3cgYSBjaGlsZCBvZiB0aGUgc3RtMzIgbHAgdGltZXIgbm9kZQ0KPiAtIGFkZCBh
IHByb2JlIGZ1bmN0aW9uIGFuZCBhZHBhdCB0aGUgZHJpdmVyIHRvIHVzZSByZWdtYXAgcHJvdmlk
ZQ0KPiAgICBieSBpdCBwYXJlbnQNCj4gLSBzdG9wIHVzaW5nIHRpbWVyX29mIGhlbHBlcnMNCj4g
LSBkb2N1bWVudCB0aGUgYmluZGluZ3MgaW5zaWRlIHN0bTMyIGxwdGltZXIgeWFtbA0KPg0KPiBC
ZW5qYW1pbiBHYWlnbmFyZCAoMik6DQo+ICAgIGR0LWJpbmRpbmdzOiBtZmQ6IERvY3VtZW50IFNU
TTMyIGxvdyBwb3dlciBjbGtldmVudCBiaW5kaW5ncw0KPiAgICBjbG9ja3NvdXJjZTogQWRkIExv
dyBQb3dlciBTVE0zMiB0aW1lcnMgZHJpdmVyDQo+DQo+ICAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL3N0LHN0bTMyLWxwdGltZXIueWFtbCAgfCAgMTQgKysNCj4gICBkcml2ZXJzL2Nsb2Nr
c291cmNlL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArDQo+ICAgZHJpdmVy
cy9jbG9ja3NvdXJjZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAg
IGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYyAgICAgICAgICAgICAgIHwgMjQ4
ICsrKysrKysrKysrKysrKysrKysrKw0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMjY3IGluc2VydGlv
bnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1z
dG0zMi1scC5jDQo+
