From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH 02/12] drm/etnaviv: add devicetree bindings
Date: Tue, 8 Dec 2015 18:12:44 +0900
Message-ID: <56669F0C.5030804@daenzer.net>
References: <1449237604-19064-3-git-send-email-l.stach@pengutronix.de>
 <20151204162956.GA14978@rob-hp-laptop>
 <1449247305.8275.104.camel@pengutronix.de>
 <CAL_JsqLcwk=h10zNvt1o=EKJZ58QvMyWnsTCNfkht-055X8Taw@mail.gmail.com>
 <1449251760.8275.116.camel@pengutronix.de>
 <CAL_Jsq+oaJxD3vbDWzn_4ghpqi=RZ1o+8nOcepWYjzcu5Hwpjg@mail.gmail.com>
 <20151204203101.GD8644@n2100.arm.linux.org.uk>
 <CAKb7UviPhoiY-YP2aBHm0BHbeEjSF2wTguQScVXMBve-kZc16Q@mail.gmail.com>
 <20151204220533.GE8644@n2100.arm.linux.org.uk>
 <CAKb7UvgzYMxPxtt8iPars13n4sAJ5Z4Hva1KHO+k4yNumDb+DQ@mail.gmail.com>
 <20151205101208.GP10243@phenom.ffwll.local> <56654620.1040208@daenzer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <56654620.1040208@daenzer.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>, Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, dri-devel <dri-devel@lists.freedesktop.org>, patchwork-lst@pengutronix.de, "kernel@pengutronix.de" <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

T24gMDcuMTIuMjAxNSAxNzo0MSwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4gT24gMDUuMTIuMjAx
NSAxOToxMiwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4gT24gRnJpLCBEZWMgMDQsIDIwMTUgYXQg
MDU6NDM6MzNQTSAtMDUwMCwgSWxpYSBNaXJraW4gd3JvdGU6Cj4+PiBPbiBGcmksIERlYyA0LCAy
MDE1IGF0IDU6MDUgUE0sIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eAo+Pj4gPGxpbnV4QGFybS5s
aW51eC5vcmcudWs+IHdyb3RlOgo+Pj4+IE9uIEZyaSwgRGVjIDA0LCAyMDE1IGF0IDAzOjQyOjQ3
UE0gLTA1MDAsIElsaWEgTWlya2luIHdyb3RlOgo+Pj4+PiBPbiBGcmksIERlYyA0LCAyMDE1IGF0
IDM6MzEgUE0sIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eAo+Pj4+PiA8bGludXhAYXJtLmxpbnV4
Lm9yZy51az4gd3JvdGU6Cj4+Pj4+PiBNb3Jlb3ZlciwgRFJJMyBpcyBub3QgeWV0IGF2YWlsYWJs
ZSBmb3IgR2FsbGl1bSwgc28gaWYgd2UncmUgdGFsa2luZwo+Pj4+Pj4gYWJvdXQgWG9yZywgdGhl
biBmdW5jdGlvbmFsIERSSTIgaXMgYSByZXF1aXJlbWVudCwgYW5kIHRoYXQgX25lZWRzXwo+Pj4+
Pj4gdG8gaGF2ZSBhIHNpbmdsZSBkZXZpY2UgZm9yIHRoZSByZW5kZXJpbmcgaW5zdGFuY2VzLiAg
WG9yZyBoYXMgbm8gd2F5Cj4+Pj4+PiB0byBwYXNzIG11bHRpcGxlIHJlbmRlciBub2RlcyB0byBj
bGllbnQgb3ZlciBEUkkyLgo+Pj4+Pgo+Pj4+PiBKdXN0IHRvIGNvcnJlY3QuLi4gRFJJMyBoYXMg
YmVlbiBhdmFpbGFibGUgb24gZ2FsbGl1bSBbYXQgbGVhc3QgaW4gdGhlCj4+Pj4+IGNvbnRleHQg
b2Ygc3QvbWVzYV0gYmFzaWNhbGx5IHNpbmNlIERSSTMgd2FzIGludHJvZHVjZWQuIE5vdCBzdXJl
IHdoYXQKPj4+Pj4gaXNzdWUgeW91J3JlIGZpZ2h0aW5nIHdpdGgsIGJ1dCBpdCdzIGRlZmluaXRl
bHkgbm90IGEgZ2FsbGl1bQo+Pj4+PiBsaW1pdGF0aW9uLi4uIGNvdWxkIGJlIHNvbWV0aGluZyBy
ZWxhdGVkIHRvIHBsYXRmb3JtIGRldmljZXMuCj4+Pj4KPj4+PiBXZWxsLCBteSBzdGF0ZW1lbnQg
aXMgYmFzZWQgb24gdGhlIGZhY3QgdGhhdCB0aGVyZSdzIG5vdGhpbmcgaW4KPj4+PiBzcmMvZ2Fs
bGl1bS9zdGF0ZS10cmFja2VyL2RyaSB3aGljaCBoaW50cyBhdCBiZWluZyBEUkkzLiAgTWF5YmUg
aXQncwo+Pj4+IGltcGxlbWVudGVkIGRpZmZlcmVudGx5LCBJIGRvbid0IGtub3cuCj4gCj4gVGhl
IERSSSBzdGF0ZSB0cmFja2VyIGNvZGUgaW4gc3JjL2dhbGxpdW0vc3RhdGVfdHJhY2tlcnMvZHJp
LyBzdXBwb3J0cwo+IERSSTEtMy4gVGhlcmUncyBhbG1vc3Qgbm8gZXhwbGljaXQgbWVudGlvbiBv
ZiBEUkkzIGluIGl0IGJlY2F1c2UgRFJJMwo+IGFuZCBEUkkyIHdvcmsgbW9zdGx5IHRoZSBzYW1l
IGFzIGZhciBhcyB0aGlzIGNvZGUgaXMgY29uY2VybmVkLgoKQWxzbyBub3RlIHRoYXQgdGhlcmUn
cyBubyByZXF1aXJlbWVudCBmb3IgdGhlIHJlbmRlcmVyIGRldmljZSBub2RlIHRvIGJlCm9wZW5l
ZCB2aWEgdGhlIERSSTMgcHJvdG9jb2wuIEUuZy4gdGhlIERSSV9QUklNRSBpbXBsZW1lbnRhdGlv
biBmb3IgRFJJMwppbiBNZXNhIG9wZW5zIHRoZSByZW5kZXJlciBkZXZpY2UgaXRzZWxmLCBjcmVh
dGVzIGEgc2hhcmVkIHNjYW5vdXQgaW1hZ2UKZnJvbSBpdCwgZ2V0cyBhIGRtYS1idWYgZmlsZSBk
ZXNjcmlwdG9yIGZvciB0aGF0LCBjcmVhdGVzIGEgcGl4bWFwIGZyb20KdGhhdCB2aWEgRFJJMyBh
bmQgcHJlc2VudHMgdGhhdCBwaXhtYXAgdmlhIFByZXNlbnQuCgoKLS0gCkVhcnRobGluZyBNaWNo
ZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwOi8vd3d3LmFtZC5j
b20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1l
c2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
