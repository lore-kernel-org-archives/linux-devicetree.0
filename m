Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3ADC10DCE
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 10:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E212F20674
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 10:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="0Ht9fz8T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCLKWH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 06:22:07 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:58720 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725268AbgCLKWH (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Mar 2020 06:22:07 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02CAFK8W006286;
        Thu, 12 Mar 2020 11:21:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=rOsCtm6xQiY6Dcml/SJj0vQ67L0Bz1KTNnDxNlVUuCo=;
 b=0Ht9fz8TfpB9BGgD8h2kczDR41temJrUywP/XPiVy7QUa2jOeOBewiLDVri07WmHeC7c
 1QiVzC/VVPFCFUnSGya4qbVFE+qm+ff9lj+1gAjsrRUXvwJHO2gfsTr7UpHGP6SN6Qjb
 MJId57Hs7KAS4Cl24ZQfWosRUxAakelxJdueKn5Q7nHE2Fquat6EW/c+v8deTwV88eR9
 MOoFj3H1uQ6fUadhSUwvC+mS0LwcMn4pzU2JqgKkYB9Q3K+2EvlQR0ZqJK+ckI+iAi5v
 OcDdXbEX1b6UxnHaIfSGdnP6NI8bp1QQlLjlSFZ87Ux3jGKwPFd4moWccJqYkkh2vTAg 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ynecdqu3h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Mar 2020 11:21:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0EDF010002A;
        Thu, 12 Mar 2020 11:21:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1FC221F699;
        Thu, 12 Mar 2020 11:21:41 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 12 Mar
 2020 11:21:41 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 12 Mar 2020 11:21:41 +0100
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
Thread-Topic: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
Thread-Index: AQHV9T/Fg4JevMaLjkyYqXDOY+zmoqhEtMYA
Date:   Thu, 12 Mar 2020 10:21:41 +0000
Message-ID: <e584e779-aab3-1a41-f198-a5585d9be2e8@st.com>
References: <20200308115017.18563-1-sam@ravnborg.org>
 <20200308115017.18563-2-sam@ravnborg.org>
In-Reply-To: <20200308115017.18563-2-sam@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E1A8AD3E367074F98E53AF73D1140DE@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-12_01:2020-03-11,2020-03-12 signatures=0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

DQoNCk9uIDMvOC8yMCAxMjo1MCBQTSwgU2FtIFJhdm5ib3JnIHdyb3RlOg0KPiBGaXggZm9sbG93
aW5nIHR5cGUgYWYgd2FybmluZ3MgaW4gdGhlIHBhbmVsIGJpbmRpbmdzOg0KPg0KPiBXYXJuaW5n
ICh1bml0X2FkZHJlc3NfdnNfcmVnKTogL2V4YW1wbGUtMC9kc2kvcGFuZWw6IG5vZGUgaGFzIGEg
cmVnIG9yIHJhbmdlcyBwcm9wZXJ0eSwgYnV0IG5vIHVuaXQgbmFtZQ0KPiBXYXJuaW5nICh1bml0
X2FkZHJlc3NfdnNfcmVnKTogL2V4YW1wbGUtMC9kc2lAZmY0NTAwMDA6IG5vZGUgaGFzIGEgdW5p
dCBuYW1lLCBidXQgbm8gcmVnIHByb3BlcnR5DQo+DQo+IFJlbW92aW5nIHRoZSAiQHh4eCIgZnJv
bSB0aGUgbm9kZSBuYW1lIGZpeGVkIGZpcnN0IHdhcm5pbmcuDQo+IEFkZGluZyBhIG1pc3Npbmcg
cmVnIHByb3BlcnR5IGZpeGVkIHRoZSBzZWNvbmQgd2FybmluZw0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+DQo+IENjOiBUaGllcnJ5IFJlZGluZyA8
dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPg0KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4g
Q2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB0aGVvYnJvbWEtc3lzdGVtcy5jb20+
DQo+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+IENjOiBCZW5qYW1p
biBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPg0KPiBDYzogTGF1cmVudCBQaW5j
aGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KDQpJIHdpbGwgYWRkIFc9
MSBpbiBteSBjb21tYW5kIGxpbmUgd2hlbiBjaGVjayB0aGUgeWFtbCBmaWxlcyB0byBub3QgDQpy
ZXByb2R1Y2UgdGhpcyBsYXRlci4NCg0KUmV2aWV3ZWQtYnk6IEJlbmphbWluIEdhaWduYXJkIDxi
ZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+DQoNClRoYW5rcywNCkJlbmphbWluDQoNCj4gLS0tDQo+
ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9lbGlkYSxrZDM1dDEzMy55
YW1sICAgICB8IDIgKy0NCj4gICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sZWFkdGVrLGx0
azUwMGhkMTgyOS55YW1sICAgICAgICAgIHwgMiArLQ0KPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvbm92YXRlayxudDM1NTEwLnlhbWwgICAgfCA0ICsrLS0NCj4gICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS55
YW1sIHwgMiArLQ0KPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFu
ZWwtZHBpLnlhbWwgICAgICAgICAgfCAyICstDQo+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUtZHNpLnlhbWwgICB8IDIgKy0NCj4gICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02ODIwMC55YW1sICAgIHwg
MiArLQ0KPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwveGlucGVuZyx4
cHAwNTVjMjcyLnlhbWwgfCAyICstDQo+ICAgOCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9lbGlkYSxrZDM1dDEzMy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZWxpZGEsa2QzNXQxMzMu
eWFtbA0KPiBpbmRleCA0YmQ3NGVhYTYxYmUuLmFhNzYxZjY5N2I3YSAxMDA2NDQNCj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZWxpZGEsa2Qz
NXQxMzMueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9lbGlkYSxrZDM1dDEzMy55YW1sDQo+IEBAIC0zNCw3ICszNCw3IEBAIGFkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiAgIA0KPiAgIGV4YW1wbGVzOg0KPiAgICAgLSB8DQo+
IC0gICAgZHNpQGZmNDUwMDAwIHsNCj4gKyAgICBkc2kgew0KPiAgICAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQo+ICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gICAgICAgICAg
IHBhbmVsQDAgew0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvbGVhZHRlayxsdGs1MDBoZDE4MjkueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xlYWR0ZWssbHRrNTAwaGQxODI5
LnlhbWwNCj4gaW5kZXggNGViY2VhN2QwYzYzLi4yYzliOGFhMzQ4MTUgMTAwNjQ0DQo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xlYWR0ZWss
bHRrNTAwaGQxODI5LnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvbGVhZHRlayxsdGs1MDBoZDE4MjkueWFtbA0KPiBAQCAtMzQsNyAr
MzQsNyBAQCBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gICANCj4gICBleGFtcGxlczoN
Cj4gICAgIC0gfA0KPiAtICAgIGRzaUBmZjQ1MDAwMCB7DQo+ICsgICAgZHNpIHsNCj4gICAgICAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
DQo+ICAgICAgICAgICBwYW5lbEAwIHsNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL25vdmF0ZWssbnQzNTUxMC55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbm92YXRlayxudDM1
NTEwLnlhbWwNCj4gaW5kZXggNzkxZmM5ZGFhNjhiLi43M2QyZmYzYmFhZmYgMTAwNjQ0DQo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL25vdmF0
ZWssbnQzNTUxMC55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL25vdmF0ZWssbnQzNTUxMC55YW1sDQo+IEBAIC00MCwxMCArNDAsMTAg
QEAgZXhhbXBsZXM6DQo+ICAgICAtIHwNCj4gICAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dw
aW8vZ3Bpby5oPg0KPiAgIA0KPiAtICAgIGRzaUBhMDM1MTAwMCB7DQo+ICsgICAgZHNpIHsNCj4g
ICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiAgICAgICAgICAgI3NpemUtY2VsbHMg
PSA8MD47DQo+IC0gICAgICAgIHBhbmVsIHsNCj4gKyAgICAgICAgcGFuZWxAMCB7DQo+ICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJoeWRpcyxodmE0MHd2MSIsICJub3ZhdGVrLG50MzU1MTAi
Ow0KPiAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gICAgICAgICAgICAgICB2ZGQtc3VwcGx5
ID0gPCZhYjg1MDBfbGRvX2F1eDRfcmVnPjsNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3Jpc2V0
ZWNoLG90bTgwMDlhLnlhbWwNCj4gaW5kZXggNmU2YWM5OTVjMjdiLi40YjZkZGE2ZGJjMGYgMTAw
NjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL29yaXNldGVjaCxvdG04MDA5YS55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS55YW1sDQo+IEBA
IC0zOSw3ICszOSw3IEBAIHJlcXVpcmVkOg0KPiAgIA0KPiAgIGV4YW1wbGVzOg0KPiAgICAgLSB8
DQo+IC0gICAgZHNpQDAgew0KPiArICAgIGRzaSB7DQo+ICAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQo+ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ICAgICAgICAgcGFuZWxAMCB7
DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9wYW5lbC1kcGkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3BhbmVsLWRwaS55YW1sDQo+IGluZGV4IDUyNzVkMzUwZjhjYi4uZjYz
ODcwMzg0YzAwIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9wYW5lbC1kcGkueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1kcGkueWFtbA0KPiBAQCAtNDgs
NyArNDgsNyBAQCBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gICANCj4gICBleGFtcGxl
czoNCj4gICAgIC0gfA0KPiAtICAgIHBhbmVsQDAgew0KPiArICAgIHBhbmVsIHsNCj4gICAgICAg
ICAgIGNvbXBhdGlibGUgPSAib3NkZGlzcGxheXMsb3NkMDU3VDA1NTktMzR0cyIsICJwYW5lbC1k
cGkiOw0KPiAgICAgICAgICAgbGFiZWwgPSAib3NkZGlzcGxheSI7DQo+ICAgICAgICAgICBwb3dl
ci1zdXBwbHkgPSA8JnZjY19zdXBwbHk+Ow0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2lt
cGxlLWRzaS55YW1sDQo+IGluZGV4IDhiNjAzNjhhMjQyNS4uY2VmZTE5YjZiZjQ0IDEwMDY0NA0K
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9w
YW5lbC1zaW1wbGUtZHNpLnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sDQo+IEBAIC01MCw3ICs1
MCw3IEBAIHJlcXVpcmVkOg0KPiAgIA0KPiAgIGV4YW1wbGVzOg0KPiAgICAgLSB8DQo+IC0gICAg
bWRzc19kc2lAZmQ5MjI4MDAgew0KPiArICAgIG1kc3NfZHNpIHsNCj4gICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwxPjsNCj4gICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gICAgICAgICBw
YW5lbEAwIHsNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02ODIwMC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY4MjAwLnlhbWwNCj4gaW5k
ZXggMDkxNDlmMTQwZDVmLi5hMzViYTE2ZmMwMDAgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02ODIwMC55YW1s
DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L3JheWRpdW0scm02ODIwMC55YW1sDQo+IEBAIC00Miw3ICs0Miw3IEBAIHJlcXVpcmVkOg0KPiAg
IA0KPiAgIGV4YW1wbGVzOg0KPiAgICAgLSB8DQo+IC0gICAgZHNpQDAgew0KPiArICAgIGRzaSB7
DQo+ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ICAgICAgICAgI3NpemUtY2VsbHMg
PSA8MD47DQo+ICAgICAgICAgcGFuZWxAMCB7DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC94aW5wZW5nLHhwcDA1NWMyNzIueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3hpbnBl
bmcseHBwMDU1YzI3Mi55YW1sDQo+IGluZGV4IDE4NmU1ZTFjOGZhMy4uMzllYzdhZTUyNWFkIDEw
MDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC94aW5wZW5nLHhwcDA1NWMyNzIueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC94aW5wZW5nLHhwcDA1NWMyNzIueWFtbA0KPiBA
QCAtMzQsNyArMzQsNyBAQCBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gICANCj4gICBl
eGFtcGxlczoNCj4gICAgIC0gfA0KPiAtICAgIGRzaUBmZjQ1MDAwMCB7DQo+ICsgICAgZHNpIHsN
Cj4gICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiAgICAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MD47DQo+ICAgICAgICAgICBwYW5lbEAwIHsNCg==
