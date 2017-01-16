From: Ding Tianhong <dingtianhong@huawei.com>
Subject: Re: [PATCH v7 0/4] arm64: arch_timer: Add workaround for
 hisilicon-161601 erratum
Date: Mon, 16 Jan 2017 18:37:24 +0800
Message-ID: <e0aa52a6-8dc7-65d6-6a3a-c753b6c9538e@huawei.com>
References: <1483772858-10380-1-git-send-email-dingtianhong@huawei.com>
 <6c33e4e9-6472-4738-aea2-55dcaab3a94f@huawei.com>
 <ff9c81c2-90ef-a5c2-6f0b-c6cf5d0d11a9@arm.com>
 <06fd3327-f451-bc0d-b80c-4200bc9fadaa@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <06fd3327-f451-bc0d-b80c-4200bc9fadaa@huawei.com>
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

CgpPbiAyMDE3LzEvMTIgMjE6MjQsIERpbmcgVGlhbmhvbmcgd3JvdGU6Cj4gCj4gT24gMjAxNy8x
LzEyIDE3OjExLCBNYXJjIFp5bmdpZXIgd3JvdGU6Cj4+IE9uIDEyLzAxLzE3IDA0OjIzLCBEaW5n
IFRpYW5ob25nIHdyb3RlOgo+Pj4gSGkgTWFyYzoKPj4+Cj4+PiBIb3cgYWJvdXQgdGhpcyB2Nywg
aWYgYW55IHN1Z2dlc3Rpb25zIHZlcnkgZ3JhdGVmdWwuCj4+Cj4+IEl0J3MgYmVlbiBsZXNzIHRo
YW4gNSBkYXlzIHNpbmNlIHlvdSBwb3N0ZWQgdGhpcy4gSSdsbCBnZXQgdG8gaXQgb25jZSBJCj4+
IGZpbmlzaCByZXZpZXdpbmcgYWxsIHRoZSBvdGhlciBwYXRjaGVzIHRoYXQgYXJlIHNpdHRpbmcg
aW4gdGhlIHF1ZXVlCj4+IHJpZ2h0IGJlZm9yZSB5b3Vycy4KPj4KPiAKPiBPayBhbmQgc29ycnkg
Zm9yIHRoZSBub2lzeS4KPiAKCkhpIE1hcmPvvJoKCkFmdGVyIGRpc2N1c3Npb24gd2l0aCB0aGUg
Y2hpcCBkZXZlbG9wZXIsIHdlIGRlY2lkZSB0byB1cGRhdGUgdGhlIGVycmF0dW0gaWQgZm9yIHRo
aXMgYnVnLCBzbyBJIHdpbGwgcmVzZW5kIGEgbmV3IHZlcnNpb24KYWJvdXQgdGhpcywgaWYgeW91
IGhhcyBzdGFydCB0byByZXZpZXcgdGhpcyB2NyBwYXRjaCBzZXQsIEkgdGhpbmsgSSBjb3VsZCB3
YWl0IHVudGlsIHlvdSBoYXZlIGZpbmlzaGVkIHlldC4gOikKClRoYW5rcwpEaW5nCgo+IFRoYW5r
cwo+IERpbmcKPiAKPj4gVGhhbmtzLAo+Pgo+PiAJTS4KPj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
