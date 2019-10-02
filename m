From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V3 7/8] ARM: dts: Add minimal Raspberry Pi 4 support
Date: Wed, 2 Oct 2019 09:43:04 -0700
Message-ID: <e9e6491e-c53e-7255-98cc-dabdfa7ba753@gmail.com>
References: <1569672435-19823-1-git-send-email-wahrenst@gmx.net>
 <1569672435-19823-8-git-send-email-wahrenst@gmx.net>
 <77b0a773-912a-aa5b-6eb5-5423c2c07e58@gmail.com>
 <7d0414bb-fea8-e3e5-8b85-c18615a56c94@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7d0414bb-fea8-e3e5-8b85-c18615a56c94@gmx.net>
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
To: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

T24gMTAvMi8xOSA5OjI0IEFNLCBTdGVmYW4gV2FocmVuIHdyb3RlOgo+IEhpIEZsb3JpYW4sCj4g
Cj4gQW0gMjguMDkuMTkgdW0gMjE6NTggc2NocmllYiBGbG9yaWFuIEZhaW5lbGxpOgo+Pgo+PiBP
biA5LzI4LzIwMTkgNTowNyBBTSwgU3RlZmFuIFdhaHJlbiB3cm90ZToKPj4KPj4+ICsJbWVtb3J5
QDAgewo+Pj4gKwkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPj4+ICsJCXJlZyA9IDwwIDAgMHgw
MDAwMDAwMD47Cj4+PiArCX07Cj4+PiArCj4+IFtzbmlwXQo+Pgo+Pj4gKyNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+Cj4+PiArI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL3NvYy9iY20yODM1LXBtLmg+Cj4+PiArCj4+PiArLyB7Cj4+PiArCWNvbXBhdGli
bGUgPSAiYnJjbSxiY20yNzExIjsKPj4+ICsKPj4+ICsJI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+
PiArCSNzaXplLWNlbGxzID0gPDE+Owo+PiBUcnlpbmcgdG8gc2VlIGlmIHdlIG1heSBuZWVkIGEg
I3NpemUtY2VsbHMgcHJvcGVydHkgdmFsdWUgb2YgMiBoZXJlLCBmb3IKPj4gdGhlIDRHQiBtb2Rl
bCwgSSB3b3VsZCBhc3N1bWUgdGhhdCB3ZSB3b3VsZCBoYXZlIHRvLCB1bmxlc3Mgd2UgYXJlIGZp
bmUKPj4gd2l0aCBzdXBwb3J0aW5nIDRHQiAtIDFieXRlIG9mIERSQU0/Cj4gSSB3aWxsIHRyeSB1
bmxlc3MgdGhpcyByZXF1aXJlcyBhIGxvdCBvZiBhZGp1c3RtZW50cyBvciBicmVhayB0aGUKPiBi
b290bG9hZGVyLgoKT0suCgo+Pgo+Pj4gKwo+Pj4gKwlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWN2
Mj47Cj4+PiArCj4+PiArCXNvYyB7Cj4+PiArCQlyYW5nZXMgPSA8MHg3ZTAwMDAwMCAgMHgwIDB4
ZmUwMDAwMDAgIDB4MDE4MDAwMDA+LAo+Pj4gKwkJCSA8MHg3YzAwMDAwMCAgMHgwIDB4ZmMwMDAw
MDAgIDB4MDIwMDAwMDA+LAo+Pj4gKwkJCSA8MHg0MDAwMDAwMCAgMHgwIDB4ZmY4MDAwMDAgIDB4
MDA4MDAwMDA+Owo+PiBNaWdodCBiZSBuaWNlIHRvIGdldCBzb21lIGNvbW1lbnRzIGFib3V0Cj4g
cmFuZ2VzID0gPDB4N2UwMDAwMDDCoCAweDAgMHhmZTAwMDAwMMKgIDB4MDE4MDAwMDA+LMKgIC8v
IENvbW1vbiBCQ00yODN4Cj4gcGVyaXBoZXJhbHMKPiDCoMKgwqAgwqA8MHg3YzAwMDAwMMKgIDB4
MCAweGZjMDAwMDAwwqAgMHgwMjAwMDAwMD4swqAgLy8gQkNNMjcxMS1zcGVjaWZpYwo+IHBlcmlw
aGVyYWxzCj4gCj4gwqDCoMKgIMKgPDB4NDAwMDAwMDDCoCAweDAgMHhmZjgwMDAwMMKgIDB4MDA4
MDAwMDA+O8KgIC8vIEFSTS1sb2NhbCBwZXJpcGhlcmFscwo+IAo+IEkgd2lsbCBzaW1wbHkgZm9y
d2FyZCB0aGUgYW5zd2VyIGZyb20gdGhlIFJQaSBndXlzLgo+IAo+IElzIGl0IHdoYXQgeW91IGhh
ZCBpbiBtaW5kPyBPdGhlcndpc2UgcGxlYXNlIGJlIG1vcmUgc3BlY2lmaWMuCgpZZXMsIHRoYXQg
aXMgd2hhdCBJIHdhbnRlZCB0byBzZWUgYmVpbmcgYWRkZWQsIHRoYW5rcy4KLS0gCkZsb3JpYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
