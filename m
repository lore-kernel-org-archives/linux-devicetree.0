From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/7] sunxi: Add DT representation for the MBUS controller
Date: Tue, 3 Apr 2018 11:03:30 -0500
Message-ID: <CAL_Jsq+cURC780ivftY1v3P59g5UKAHwb48raXXB6huQ2KBvuQ@mail.gmail.com>
References: <cover.54a07919b9d7fe8d7c90e9f4929648013e641cff.1522761929.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.54a07919b9d7fe8d7c90e9f4929648013e641cff.1522761929.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Yong Deng <yong.deng@magewell.com>, Frank Rowand <frowand.list@gmail.com>, Dave Martin <dave.martin@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBBcHIgMywgMjAxOCBhdCA4OjI5IEFNLCBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPiBIaSwKPgo+IFdlJ3ZlIGhhZCBmb3IgcXVpdGUgc29t
ZSB0aW1lIHRvIGhhY2sgYXJvdW5kIGluIG91ciBkcml2ZXJzIHRvIHRha2UgaW50bwo+IGFjY291
bnQgdGhlIGZhY3QgdGhhdCBvdXIgRE1BIGFjY2Vzc2VzIGFyZSBub3QgZG9uZSB0aHJvdWdoIHRo
ZSBwYXJlbnQKPiBub2RlLCBidXQgdGhyb3VnaCBhbm90aGVyIGJ1cyB3aXRoIGEgZGlmZmVyZW50
IG1hcHBpbmcgdGhhbiB0aGUgQ1BVIGZvciB0aGUKPiBSQU0gKDAgaW5zdGVhZCBvZiAweDQwMDAw
MDAwIGZvciBtb3N0IFNvQ3MpLgo+Cj4gQWZ0ZXIgc29tZSBkaXNjdXNzaW9uIGFmdGVyIHRoZSBz
dWJtaXNzaW9uIG9mIGEgY2FtZXJhIGRldmljZSBzdWZmZXJpbmcgb2YKPiB0aGUgc2FtZSBoYWNr
cywgSSd2ZSBkZWNpZGVkIHRvIHB1dCB0b2dldGhlciBhIHNlcmllIHRoYXQgaW50cm9kdWNlIGEK
PiBwcm9wZXJ0eSBjYWxsZWQgZG1hLXBhcmVudCB0aGF0IGFsbG93cyB0byBleHByZXNzIHRoZSBE
TUEgcmVsYXRpb25zaGlwCj4gYmV0d2VlbiBhIG1hc3RlciBhbmQgaXRzIGJ1cywgZXZlbiBpZiB0
aGV5IGFyZSBub3QgZGlyZWN0IHBhcmVudHMgaW4gdGhlIERULgoKUmVhZGluZyB0aHJ1IHY2IG9m
IHRoZSBjYW1lcmEgZHJpdmVyLCBpdCBzZWVtcyBsaWtlIGhhdmluZwppbnRlcm1lZGlhdGUgYnVz
ZXMgd291bGQgc29sdmUgdGhlIHByb2JsZW0gaW4geW91ciBjYXNlPwoKQXMgQXJuZCBtZW50aW9u
ZWQgaW4gdGhhdCB0aHJlYWQsIHNvbWV0aGluZyBuZXcgbmVlZHMgdG8gYWRkcmVzcyBhbGwKdGhl
IGRlZmljaWVuY2llcyB3aXRoIGRtYS1yYW5nZXMgYW5kIGRlc2NyaWJpbmcgRE1BIGJ1cyB0b3Bv
bG9naWVzLgpUaGlzIGRvZXNuJ3QgYWRkcmVzcyB0aGUgbmVlZHMgb2YgZGVzY3JpYmluZyBidXMg
aW50ZXJjb25uZWN0cy4KVGhlcmUncyBiZWVuIHNvbWUgZWZmb3J0cyBieSB0aGUgUUNvbSBmb2xr
cyB3aXRoIGFuIGludGVyY29ubmVjdApiaW5kaW5nLiBUaGV5J3ZlIG1vc3RseSBwdW50ZWQgKGZv
ciBub3cgYXQgbGVhc3QpIHRvIG5vdCBkZXNjcmliaW5nCnRoZSB3aG9sZSBpbnRlcmNvbm5lY3Qg
aW4gRFQgYW5kIGtlZXBpbmcgdGhlIGRldGFpbHMgaW4gYSBkcml2ZXIuCgpPbiB0aGUgZmxpcCBz
aWRlLCB0aGlzIGRvZXMgbWlycm9yIHRoZSBlc3RhYmxpc2hlZCBwYXR0ZXJuIHVzZWQgYnkKaW50
ZXJydXB0cywgc28gbWF5YmUgaXQncyBva2F5IG9uIGl0J3Mgb3duLiBJJ2xsIHdhaXQgZm9yIG90
aGVycyB0bwpjb21tZW50LgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
