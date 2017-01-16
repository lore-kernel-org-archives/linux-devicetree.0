From: Ding Tianhong <dingtianhong@huawei.com>
Subject: Re: [PATCH v7 0/4] arm64: arch_timer: Add workaround for
 hisilicon-161601 erratum
Date: Mon, 16 Jan 2017 21:04:23 +0800
Message-ID: <21e5386a-b7d0-8c8e-3d7c-22b6be9c02f9@huawei.com>
References: <1483772858-10380-1-git-send-email-dingtianhong@huawei.com>
 <6c33e4e9-6472-4738-aea2-55dcaab3a94f@huawei.com>
 <ff9c81c2-90ef-a5c2-6f0b-c6cf5d0d11a9@arm.com>
 <06fd3327-f451-bc0d-b80c-4200bc9fadaa@huawei.com>
 <e0aa52a6-8dc7-65d6-6a3a-c753b6c9538e@huawei.com>
 <63e1f4de-f5e8-6a19-2f8f-61b198f6369f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <63e1f4de-f5e8-6a19-2f8f-61b198f6369f@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, oss@buserror.net, devicetree@vger.kernel.org, shawnguo@kernel.org, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
List-Id: devicetree@vger.kernel.org

CgpPbiAyMDE3LzEvMTYgMTk6MjksIE1hcmMgWnluZ2llciB3cm90ZToKPiBPbiAxNi8wMS8xNyAx
MDozNywgRGluZyBUaWFuaG9uZyB3cm90ZToKPj4KPj4KPj4gT24gMjAxNy8xLzEyIDIxOjI0LCBE
aW5nIFRpYW5ob25nIHdyb3RlOgo+Pj4KPj4+IE9uIDIwMTcvMS8xMiAxNzoxMSwgTWFyYyBaeW5n
aWVyIHdyb3RlOgo+Pj4+IE9uIDEyLzAxLzE3IDA0OjIzLCBEaW5nIFRpYW5ob25nIHdyb3RlOgo+
Pj4+PiBIaSBNYXJjOgo+Pj4+Pgo+Pj4+PiBIb3cgYWJvdXQgdGhpcyB2NywgaWYgYW55IHN1Z2dl
c3Rpb25zIHZlcnkgZ3JhdGVmdWwuCj4+Pj4KPj4+PiBJdCdzIGJlZW4gbGVzcyB0aGFuIDUgZGF5
cyBzaW5jZSB5b3UgcG9zdGVkIHRoaXMuIEknbGwgZ2V0IHRvIGl0IG9uY2UgSQo+Pj4+IGZpbmlz
aCByZXZpZXdpbmcgYWxsIHRoZSBvdGhlciBwYXRjaGVzIHRoYXQgYXJlIHNpdHRpbmcgaW4gdGhl
IHF1ZXVlCj4+Pj4gcmlnaHQgYmVmb3JlIHlvdXJzLgo+Pj4+Cj4+Pgo+Pj4gT2sgYW5kIHNvcnJ5
IGZvciB0aGUgbm9pc3kuCj4+Pgo+Pgo+PiBIaSBNYXJj77yaCj4+Cj4+IEFmdGVyIGRpc2N1c3Np
b24gd2l0aCB0aGUgY2hpcCBkZXZlbG9wZXIsIHdlIGRlY2lkZSB0byB1cGRhdGUgdGhlIGVycmF0
dW0gaWQgZm9yIHRoaXMgYnVnLCBzbyBJIHdpbGwgcmVzZW5kIGEgbmV3IHZlcnNpb24KPj4gYWJv
dXQgdGhpcywgaWYgeW91IGhhcyBzdGFydCB0byByZXZpZXcgdGhpcyB2NyBwYXRjaCBzZXQsIEkg
dGhpbmsgSSBjb3VsZCB3YWl0IHVudGlsIHlvdSBoYXZlIGZpbmlzaGVkIHlldC4gOikKPiAKPiBU
aGlzIGhhcyB0byBiZSBhIHN0YWJsZSBlcnJhdHVtIElELCBhbmQgaXQgd29uJ3QgYmUgY2hhbmdl
ZCBvbmNlIHRoZQo+IHdvcmthcm91bmQgaXMgbWVyZ2VkIChhbGwgeW91J2xsIGJlIGFibGUgdG8g
ZG8gaXMgdG8gYWRkIG5ldyBJRHMgd2hlcmUKPiB0aGUgc2FtZSBmaXggaXMgYXBwbGljYWJsZSku
IFNvIHBsZWFzZSBwb3N0IHRoZSByZXZpc2VkIHNlcmllcywgYW5kIG1ha2UKPiBzdXJlIHRoYXQg
dGhpcyBpcyB0aGUgKmZpbmFsKiBJRCB1cGRhdGUuCj4gCgpZZXPvvIx0aGUgKmZpbmFsKiBJRCB3
aWxsIGJlIHRoZSBzdGFibGUgSUQgYW5kIGNvdWxkIGJlIHJlY29yZCBpbiBDUFUgZXJyYXR1bSBk
b2Mgd2hpY2ggY291bGQgYmUgZ2V0IGZyb20gSGlzaWxpY29uIHdlYnBhZ2UuClRoZSBmaW5hbCBm
b3JtYXQgZm9yIGVycmF0dW0gSUQgaXMganVzdCBsaWtlOgo8RXJyYXRhLVByZWZpeD48U2VyaWVz
RmxhZz48TW9kdWxlSUQ+PFNlcmlhbE51bT4KRXJyYXRhLVByZWZpeD0xNjEwLCBTZXJpZXNGbGFn
PTEsIE1vZHVsZUlEPTB4LCBTZXJpYWxOdW09MDEuCgpUaGFua3MKRGluZwoKPiBUaGFua3MsCj4g
Cj4gCU0uCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXJtLWtlcm5lbAo=
