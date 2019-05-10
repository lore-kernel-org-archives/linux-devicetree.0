Return-Path: <SRS0=wvnl=TK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:45031
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727249AbfEJNzc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 10 May 2019 09:55:32 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 05/15] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
Date: Fri, 10 May 2019 13:55:25 +0000
Message-ID: <TY1PR01MB15628A94DA371A7636984A708A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-6-chris.brandt@renesas.com>
 <e987df36-eca6-f05f-d1bf-7dc43fc9d4b4@cogentembedded.com>
In-Reply-To: <e987df36-eca6-f05f-d1bf-7dc43fc9d4b4@cogentembedded.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

T24gRnJpLCBNYXkgMTAsIDIwMTksIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToNCj4gPiArCX0gZWxz
ZSB7DQo+ID4gKwkJLyogTm90IE9URywgc28gZHJfbW9kZSBzaG91bGQgYmUgc2V0IGluIFBIWSBu
b2RlICovDQo+ID4gKwkJbW9kZSA9IHVzYl9nZXRfZHJfbW9kZShjaGFubmVsLT5kZXYpOw0KPiA+
ICsJCWlmIChtb2RlID09IFVTQl9EUl9NT0RFX0hPU1QpDQo+ID4gKwkJCXdyaXRlbCgweDAwMDAw
MDAwLCB1c2IyX2Jhc2UgKyBVU0IyX0NPTU1DVFJMKTsNCj4gPiArCQllbHNlIGlmIChtb2RlID09
IFVTQl9EUl9NT0RFX1BFUklQSEVSQUwpDQo+ID4gKwkJCXdyaXRlbCgweDgwMDAwMDAwLCB1c2Iy
X2Jhc2UgKyBVU0IyX0NPTU1DVFJMKTsNCj4gDQo+ICAgICBNYXliZSBhICpzd2l0Y2gqIGluc3Rl
YWQ/DQoNCkkgbGlrZSB0aGF0IGlkZWEgYmVjYXVzZSBJIGNhbiBnZXQgcmlkIG9mIHRoZSBkcl9t
b2RlIHZhcmlhYmxlLg0KDQpIb3dldmVyLi4uDQpJIGp1c3QgdHJpZWQgaXQsIGJ1dCBpZiBJIG9u
bHkgaGF2ZSBhIGNhc2UgZm9yIEhPU1QgYW5kIFBFUklQSEVSQUwsIEkgDQpnZXQgdGhpcyBnY2Mg
d2FybmluZzoNCg0KICB3YXJuaW5nOiBlbnVtZXJhdGlvbiB2YWx1ZSDigJhVU0JfRFJfTU9ERV9V
TktOT1dO4oCZIG5vdCBoYW5kbGVkIGluIHN3aXRjaCBbLVdzd2l0Y2hdDQogIHdhcm5pbmc6IGVu
dW1lcmF0aW9uIHZhbHVlIOKAmFVTQl9EUl9NT0RFX09UR+KAmSBub3QgaGFuZGxlZCBpbiBzd2l0
Y2ggWy1Xc3dpdGNoXQ0KDQoNClNvLCBteSBjb2RlIHdvdWxkIGhhdmUgdG8gYmU6DQoNCgl9IGVs
c2Ugew0KCQkvKiBOb3QgT1RHLCBzbyBkcl9tb2RlIHNob3VsZCBiZSBzZXQgaW4gUEhZIG5vZGUg
Ki8NCgkJc3dpdGNoICh1c2JfZ2V0X2RyX21vZGUoY2hhbm5lbC0+ZGV2KSkgew0KCQljYXNlIFVT
Ql9EUl9NT0RFX0hPU1Q6DQoJCQl3cml0ZWwoMHgwMDAwMDAwMCwgdXNiMl9iYXNlICsgVVNCMl9D
T01NQ1RSTCk7DQoJCQlicmVhazsNCgkJY2FzZSBVU0JfRFJfTU9ERV9QRVJJUEhFUkFMOg0KCQkJ
d3JpdGVsKDB4ODAwMDAwMDAsIHVzYjJfYmFzZSArIFVTQjJfQ09NTUNUUkwpOw0KCQkJYnJlYWs7
DQoJCWNhc2UgVVNCX0RSX01PREVfVU5LTk9XTjoNCgkJY2FzZSBVU0JfRFJfTU9ERV9PVEc6DQoJ
CQlicmVhazsNCgkJfQ0KCX0NCg0KSSBndWVzcyB0aGF0IGlzIHN0aWxsIE9LLg0KDQpDaHJpcw0K
DQo=
