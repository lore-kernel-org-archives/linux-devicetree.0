From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/2] dt-bindings: drm/bridge: Document Cadence DSI
 bridge bindings
Date: Fri, 13 Apr 2018 08:46:08 -0500
Message-ID: <20180413134608.sh5maxkkvgc424wa@rob-hp-laptop>
References: <20180410130001.1234-1-boris.brezillon@bootlin.com>
 <20180410130001.1234-2-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180410130001.1234-2-boris.brezillon@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: "Menon, Nishanth" <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Alan Douglas <adouglas@cadence.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Richard Sproul <sproul@cadence.com>, devicetree@vger.kernel.org, Rafal Ciepiela <rafalc@cadence.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Simon Hatliff <hatliff@cadence.com>, Jyri Sarha <jsarha@ti.com>, Suresh Punnoose <sureshp@cadence.com>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBBcHIgMTAsIDIwMTggYXQgMDM6MDA6MDFQTSArMDIwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IEZyb206IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxl
Y3Ryb25zLmNvbT4KPiAKPiBEb2N1bWVudCB0aGUgYmluZGluZ3MgdXNlZCBmb3IgdGhlIENhZGVu
Y2UgRFNJIGJyaWRnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBmcmVlLWVsZWN0cm9ucy5jb20+Cj4gLS0tCj4gSGVsbG8gUm9iLAo+IAo+IEkg
ZHJvcHBlZCB5b3VyIEFja2VkLWJ5IGJlY2F1c2UgdGhpcyB2ZXJzaW9uIG5vdyBkb2N1bWVudHMg
dGhlIERQSFkKPiBiaW5kaW5ncy4KPiAKPiBSZWdhcmRzLAo+IAo+IEJvcmlzCj4gCj4gQ2hhbmdl
cyBpbiB2NjoKPiAtIERvY3VtZW50IHRoZSBEUEhZIGJpbmRpbmdzCj4gLSBEcm9wIFJvYidzIGFj
ayBiZWNhdXNlIG9mIHRoZSBhZGRpdGlvbiBEUEhZIGJpbmRpbmdzIGRvYwo+IAo+IENoYW5nZXMg
aW4gdjU6Cj4gLSBBZGQgb3B0aW9uYWwgcmVzZXQgbGluZSBmb3IgdGhlIHBlcmlwaGVyYWwvQVBC
IGxvZ2ljCj4gCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIFJlbmFtZSBEU0kgY2xrcyAoc3VnZ2VzdGVk
IGJ5IFRvbWkpCj4gLSBEcm9wIHRoZSBJUCB2ZXJzaW9uIGluIHRoZSBjb21wYXRpYmxlIHNpbmNl
IGl0IGNhbiBiZSBleHRyYWN0ZWQgZnJvbQo+ICAgYSByZWdpc3RlciAoc3VnZ2VzdGVkIGJ5IEFu
ZHJ6ZWopCj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIEZpeCBjbG9jayBuYW1lcyBpbiB0aGUgZXhh
bXBsZQo+IC0gRG9jdW1lbnQgaG93IHRvIHJlcHJlc2VudCBEU0kgZGV2aWNlcyB0aGF0IGFyZSBj
b250cm9sbGVyIHRocm91Z2gKPiAgIGFuIGV4dGVybmFsIGJ1cyBsaWtlIEkyQyBvciBTUEkKPiAK
PiBDaGFuZ2VzIGluIHYyOgo+IC0gTm9uZQo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvY2Rucyxkc2kudHh0ICAgICAgICAgICB8IDEzMyArKysrKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDEzMyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvY2Rucyxk
c2kudHh0CgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
