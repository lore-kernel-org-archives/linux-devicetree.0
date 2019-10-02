From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH V3 7/8] ARM: dts: Add minimal Raspberry Pi 4 support
Date: Wed, 2 Oct 2019 18:24:13 +0200
Message-ID: <7d0414bb-fea8-e3e5-8b85-c18615a56c94@gmx.net>
References: <1569672435-19823-1-git-send-email-wahrenst@gmx.net>
 <1569672435-19823-8-git-send-email-wahrenst@gmx.net>
 <77b0a773-912a-aa5b-6eb5-5423c2c07e58@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <77b0a773-912a-aa5b-6eb5-5423c2c07e58@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

SGkgRmxvcmlhbiwKCkFtIDI4LjA5LjE5IHVtIDIxOjU4IHNjaHJpZWIgRmxvcmlhbiBGYWluZWxs
aToKPgo+IE9uIDkvMjgvMjAxOSA1OjA3IEFNLCBTdGVmYW4gV2FocmVuIHdyb3RlOgo+Cj4+ICsJ
bWVtb3J5QDAgewo+PiArCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+PiArCQlyZWcgPSA8MCAw
IDB4MDAwMDAwMDA+Owo+PiArCX07Cj4+ICsKPiBbc25pcF0KPgo+PiArI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPj4gKyNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9zb2MvYmNtMjgzNS1wbS5oPgo+PiArCj4+ICsvIHsKPj4gKwljb21wYXRpYmxlID0g
ImJyY20sYmNtMjcxMSI7Cj4+ICsKPj4gKwkjYWRkcmVzcy1jZWxscyA9IDwyPjsKPj4gKwkjc2l6
ZS1jZWxscyA9IDwxPjsKPiBUcnlpbmcgdG8gc2VlIGlmIHdlIG1heSBuZWVkIGEgI3NpemUtY2Vs
bHMgcHJvcGVydHkgdmFsdWUgb2YgMiBoZXJlLCBmb3IKPiB0aGUgNEdCIG1vZGVsLCBJIHdvdWxk
IGFzc3VtZSB0aGF0IHdlIHdvdWxkIGhhdmUgdG8sIHVubGVzcyB3ZSBhcmUgZmluZQo+IHdpdGgg
c3VwcG9ydGluZyA0R0IgLSAxYnl0ZSBvZiBEUkFNPwpJIHdpbGwgdHJ5IHVubGVzcyB0aGlzIHJl
cXVpcmVzIGEgbG90IG9mIGFkanVzdG1lbnRzIG9yIGJyZWFrIHRoZQpib290bG9hZGVyLgo+Cj4+
ICsKPj4gKwlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWN2Mj47Cj4+ICsKPj4gKwlzb2Mgewo+PiAr
CQlyYW5nZXMgPSA8MHg3ZTAwMDAwMCAgMHgwIDB4ZmUwMDAwMDAgIDB4MDE4MDAwMDA+LAo+PiAr
CQkJIDwweDdjMDAwMDAwICAweDAgMHhmYzAwMDAwMCAgMHgwMjAwMDAwMD4sCj4+ICsJCQkgPDB4
NDAwMDAwMDAgIDB4MCAweGZmODAwMDAwICAweDAwODAwMDAwPjsKPiBNaWdodCBiZSBuaWNlIHRv
IGdldCBzb21lIGNvbW1lbnRzIGFib3V0CnJhbmdlcyA9IDwweDdlMDAwMDAwwqAgMHgwIDB4ZmUw
MDAwMDDCoCAweDAxODAwMDAwPizCoCAvLyBDb21tb24gQkNNMjgzeApwZXJpcGhlcmFscwrCoMKg
wqAgwqA8MHg3YzAwMDAwMMKgIDB4MCAweGZjMDAwMDAwwqAgMHgwMjAwMDAwMD4swqAgLy8gQkNN
MjcxMS1zcGVjaWZpYwpwZXJpcGhlcmFscwoKwqDCoMKgIMKgPDB4NDAwMDAwMDDCoCAweDAgMHhm
ZjgwMDAwMMKgIDB4MDA4MDAwMDA+O8KgIC8vIEFSTS1sb2NhbCBwZXJpcGhlcmFscwoKSSB3aWxs
IHNpbXBseSBmb3J3YXJkIHRoZSBhbnN3ZXIgZnJvbSB0aGUgUlBpIGd1eXMuCgpJcyBpdCB3aGF0
IHlvdSBoYWQgaW4gbWluZD8gT3RoZXJ3aXNlIHBsZWFzZSBiZSBtb3JlIHNwZWNpZmljLgoKUmVn
YXJkcwpTdGVmYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
