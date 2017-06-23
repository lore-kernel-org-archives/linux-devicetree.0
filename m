From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v1 1/6] DT bindings: add bindings for ov965x camera module
Date: Fri, 23 Jun 2017 12:59:24 +0200
Message-ID: <3E7B1344-ECE6-4CCC-9E9D-7521BB566CDE@goldelico.com>
References: <1498143942-12682-1-git-send-email-hugues.fruchet@st.com>
 <1498143942-12682-2-git-send-email-hugues.fruchet@st.com>
 <D5629236-95D8-45B6-9719-E8B9796FEC90@goldelico.com>
 <d14b8c6e-b480-36f0-ed0a-684647617dbe@suse.de>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d14b8c6e-b480-36f0-ed0a-684647617dbe@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Suman Anna <s-anna@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, LKML <linux-kernel@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Hugues Fruchet <hugues.fruchet@st.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Yannick Fertre <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Cj4gQW0gMjMuMDYuMjAxNyB1bSAxMjo0NiBzY2hyaWViIEFuZHJlYXMgRsOkcmJlciA8YWZhZXJi
ZXJAc3VzZS5kZT46Cj4gCj4gSGksCj4gCj4gQW0gMjMuMDYuMjAxNyB1bSAxMjoyNSBzY2hyaWVi
IEguIE5pa29sYXVzIFNjaGFsbGVyOgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Y5NjV4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Y5NjV4LnR4dAo+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4+IGluZGV4IDAwMDAwMDAuLjBlMGRlMWYKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Y5NjV4LnR4
dAo+Pj4gQEAgLTAsMCArMSwzNyBAQAo+Pj4gKyogT21uaXZpc2lvbiBPVjk2NTAvOTY1Mi85NjU1
IENNT1Mgc2Vuc29yCj4+PiArCj4+PiArVGhlIE9tbml2aXNpb24gT1Y5NjV4IHNlbnNvciBzdXBw
b3J0IG11bHRpcGxlIHJlc29sdXRpb25zIG91dHB1dCwgc3VjaCBhcwo+Pj4gK0NJRiwgU1ZHQSwg
VVhHQS4gSXQgYWxzbyBjYW4gc3VwcG9ydCBZVVY0MjIvNDIwLCBSR0I1NjUvNTU1IG9yIHJhdyBS
R0IKPj4+ICtvdXRwdXQgZm9ybWF0Lgo+Pj4gKwo+Pj4gK1JlcXVpcmVkIFByb3BlcnRpZXM6Cj4+
PiArLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgb25lIG9mCj4+PiArCSJvdnRpLG92OTY1MCIKPj4+
ICsJIm92dGksb3Y5NjUyIgo+Pj4gKwkib3Z0aSxvdjk2NTUiCj4+PiArLSBjbG9ja3M6IHJlZmVy
ZW5jZSB0byB0aGUgbWNsayBpbnB1dCBjbG9jay4KPj4gCj4+IEkgd29uZGVyIHdoeSB5b3UgaGF2
ZSByZW1vdmVkIHRoZSBjbG9jay1mcmVxdWVuY3kgcHJvcGVydHk/Cj4+IAo+PiBJbiBzb21lIHNp
dHVhdGlvbnMgdGhlIGNhbWVyYSBkcml2ZXIgbXVzdCBiZSBhYmxlIHRvIHRlbGwgdGhlIGNsb2Nr
IHNvdXJjZQo+PiB3aGljaCBmcmVxdWVuY3kgaXQgd2FudHMgdG8gc2VlLgo+IAo+IFRoYXQncyB3
aGF0IGFzc2lnbmVkLWNsb2NrLXJhdGVzIHByb3BlcnR5IGlzIGZvcjoKPiAKPiBodHRwczovL3d3
dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2sv
Y2xvY2stYmluZGluZ3MudHh0Cj4gCj4gQUZBSVUgY2xvY2stZnJlcXVlbmN5IG9uIGRldmljZXMg
aXMgZGVwcmVjYXRlZCBhbmQgZXF1aXZhbGVudCB0byBoYXZpbmcKPiBhIGNsb2NrcyBwcm9wZXJ0
eSBwb2ludGluZyB0byBhIGZpeGVkLWNsb2NrLCB3aGljaCBpcyBkaWZmZXJlbnQgZnJvbSBhCj4g
Y2xvY2sgd2l0aCB2YXJ5aW5nIHJhdGUuCgpJIGFtIG5vdCBzdXJlIGlmIHRoYXQgaGVscHMgaGVy
ZS4gVGhlIE9NQVAzLUlTUCBkb2VzIG5vdCBoYXZlIGEgZml4ZWQgY2xvY2sgcmF0ZQpzbyB3ZSBj
YW4gb25seSBoYXZlIHRoZSBkcml2ZXIgZGVmaW5lIHdoYXQgaXQgd2FudHMgdG8gc2VlLgoKQW5k
IGNvbW1vbiBwcmFjdGlzZSBmb3IgT01BUDMtSVNQIGJhc2VkIGNhbWVyYSBtb2R1bGVzIChlLmcu
IE45MDAsIE45KSBpcyB0aGF0IHRoZXkgZG8gaXQgaW4gdGhlIGRyaXZlci4KCk1heWJlIElTUCBk
ZXZlbG9wZXJzIGNhbiBjb21tZW50PwoKQlIsCk5pa29sYXVzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
