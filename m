From: Jon Mason <jon.mason@broadcom.com>
Subject: Re: [PATCH 1/2] ARM: dts: bcm5301x: Add TWD WD Support to DT
Date: Tue, 28 Feb 2017 15:46:50 -0500
Message-ID: <CAC3K-4rCp3K8FDRQOoL5fG+pwM_H6UpKvQWqrNpysgAss--Xcg@mail.gmail.com>
References: <1488313886-17155-1-git-send-email-jon.mason@broadcom.com>
 <1488313886-17155-2-git-send-email-jon.mason@broadcom.com>
 <CACna6rw1oeUn=QuD-c+X8uokypSEqXUP3yqmiMEK2wgMD-ENeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACna6rw1oeUn=QuD-c+X8uokypSEqXUP3yqmiMEK2wgMD-ENeQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBGZWIgMjgsIDIwMTcgYXQgMzo0MyBQTSwgUmFmYcWCIE1pxYJlY2tpIDx6YWplYzVA
Z21haWwuY29tPiB3cm90ZToKPiBPbiAyOCBGZWJydWFyeSAyMDE3IGF0IDIxOjMxLCBKb24gTWFz
b24gPGpvbi5tYXNvbkBicm9hZGNvbS5jb20+IHdyb3RlOgo+PiBAQCAtNzAsMTAgKzcwLDE5IEBA
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmcGVyaXBoX2Nsaz47Cj4+ICAg
ICAgICAgICAgICAgICB9Owo+Pgo+PiAtICAgICAgICAgICAgICAgbG9jYWwtdGltZXJAMjA2MDAg
ewo+PiArICAgICAgICAgICAgICAgdGltZXJAMjA2MDAgewo+Cj4gSXMgdGhlcmUgYSByZWFzb24g
Zm9yIHRoaXMgcmVuYW1lPyBJIGRvbid0IHJlYWxseSBoYXZlIHByZWZlcmVuY2UgZm9yCj4gYW55
IG5hbWUsIGl0J3MganVzdCB3ZSBzaG91bGRuJ3Qga2VlcCByZW5hbWluZyB0aGlzIGRlcGVuZGlu
ZyBvZgo+IHBlcnNvbmFsIHByZWZlcmVuY2VzLgo+Cj4gSXQgYWxzbyBkb2Vzbid0IHNlZW0gbGlr
ZSBhZGp1c3RpbmcgdG8gYW55IHNjaGVtYToKPiBiY202MzEzOC5kdHNpIHVzZXMgbG9jYWwtdGlt
ZXJAMWU2MDAKPiBiY20tbnNwLmR0c2kgdXNlcyB0d2QtdGltZXJAMjA2MDAKPiBiZXJsaW4yY2Qu
ZHRzaSB1c2VzIGxvY2FsLXRpbWVyQGFkMDYwMAo+IGJlcmxpbjIuZHRzaSB1c2VzIGxvY2FsLXRp
bWVyQGFkMDYwMAo+IGJlcmxpbjJxLmR0c2kgdXNlcyBsb2NhbC10aW1lckBhZDA2MDAKClRoaXMg
d2FzIGEgc3VnZ2VzdGlvbiBmcm9tIFNlcmdlaSBTaHR5bHlvdgpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9waXBlcm1haWwvbGludXgtYXJtLWtlcm5lbC8yMDE1LURlY2VtYmVyLzM5NTE2MC5o
dG1sCgoKPgo+PiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFybSxjb3J0
ZXgtYTktdHdkLXRpbWVyIjsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MjA2
MDAgMHgxMDA+Owo+PiAtICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19Q
UEkgMTMgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwweDIwNjAwIDB4MjA+Owo+PiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRz
ID0gPEdJQ19QUEkgMTMgKEdJQ19DUFVfTUFTS19TSU1QTEUoMikgfAo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElSUV9UWVBFX0xFVkVMX0hJR0gp
PjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZwZXJpcGhfY2xrPjsKPj4g
KyAgICAgICAgICAgICAgIH07Cj4KPiBUaGUgcmVzdCBsb29rcyBPSywgdGhhbmtzISA6KQo+Cj4g
LS0KPiBSYWZhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFybS1rZXJuZWwK
