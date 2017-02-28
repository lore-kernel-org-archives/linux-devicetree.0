From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: bcm5301x: Add TWD WD Support to DT
Date: Tue, 28 Feb 2017 21:48:50 +0100
Message-ID: <CACna6rzX=6MpcuQ8iPa_bLCf6f0UGO0hsHyD1X2pn=s6p=SA7Q@mail.gmail.com>
References: <1488313886-17155-1-git-send-email-jon.mason@broadcom.com>
 <1488313886-17155-2-git-send-email-jon.mason@broadcom.com>
 <CACna6rw1oeUn=QuD-c+X8uokypSEqXUP3yqmiMEK2wgMD-ENeQ@mail.gmail.com>
 <CAC3K-4rCp3K8FDRQOoL5fG+pwM_H6UpKvQWqrNpysgAss--Xcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAC3K-4rCp3K8FDRQOoL5fG+pwM_H6UpKvQWqrNpysgAss--Xcg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Mason <jon.mason@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMjggRmVicnVhcnkgMjAxNyBhdCAyMTo0NiwgSm9uIE1hc29uIDxqb24ubWFzb25AYnJvYWRj
b20uY29tPiB3cm90ZToKPiBPbiBUdWUsIEZlYiAyOCwgMjAxNyBhdCAzOjQzIFBNLCBSYWZhxYIg
TWnFgmVja2kgPHphamVjNUBnbWFpbC5jb20+IHdyb3RlOgo+PiBPbiAyOCBGZWJydWFyeSAyMDE3
IGF0IDIxOjMxLCBKb24gTWFzb24gPGpvbi5tYXNvbkBicm9hZGNvbS5jb20+IHdyb3RlOgo+Pj4g
QEAgLTcwLDEwICs3MCwxOSBAQAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0g
PCZwZXJpcGhfY2xrPjsKPj4+ICAgICAgICAgICAgICAgICB9Owo+Pj4KPj4+IC0gICAgICAgICAg
ICAgICBsb2NhbC10aW1lckAyMDYwMCB7Cj4+PiArICAgICAgICAgICAgICAgdGltZXJAMjA2MDAg
ewo+Pgo+PiBJcyB0aGVyZSBhIHJlYXNvbiBmb3IgdGhpcyByZW5hbWU/IEkgZG9uJ3QgcmVhbGx5
IGhhdmUgcHJlZmVyZW5jZSBmb3IKPj4gYW55IG5hbWUsIGl0J3MganVzdCB3ZSBzaG91bGRuJ3Qg
a2VlcCByZW5hbWluZyB0aGlzIGRlcGVuZGluZyBvZgo+PiBwZXJzb25hbCBwcmVmZXJlbmNlcy4K
Pj4KPj4gSXQgYWxzbyBkb2Vzbid0IHNlZW0gbGlrZSBhZGp1c3RpbmcgdG8gYW55IHNjaGVtYToK
Pj4gYmNtNjMxMzguZHRzaSB1c2VzIGxvY2FsLXRpbWVyQDFlNjAwCj4+IGJjbS1uc3AuZHRzaSB1
c2VzIHR3ZC10aW1lckAyMDYwMAo+PiBiZXJsaW4yY2QuZHRzaSB1c2VzIGxvY2FsLXRpbWVyQGFk
MDYwMAo+PiBiZXJsaW4yLmR0c2kgdXNlcyBsb2NhbC10aW1lckBhZDA2MDAKPj4gYmVybGluMnEu
ZHRzaSB1c2VzIGxvY2FsLXRpbWVyQGFkMDYwMAo+Cj4gVGhpcyB3YXMgYSBzdWdnZXN0aW9uIGZy
b20gU2VyZ2VpIFNodHlseW92Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWls
L2xpbnV4LWFybS1rZXJuZWwvMjAxNS1EZWNlbWJlci8zOTUxNjAuaHRtbAoKR29vZCB0byBrbm93
LCB0aGFua3MhCgotLSAKUmFmYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
