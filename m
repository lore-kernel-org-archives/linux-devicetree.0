From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC v2 1/4] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
Date: Thu, 01 Oct 2015 10:59:17 +0200
Message-ID: <1443689957.3272.18.camel@pengutronix.de>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de>
 <1442592722-29004-2-git-send-email-p.zabel@pengutronix.de>
 <CAL_JsqLZQXMoKxGZ6c56e6d1UuLiJKzVB=sH15ihTvwpOgSU8Q@mail.gmail.com>
 <1442823067.3277.35.camel@pengutronix.de>
 <CAL_JsqLcraiS+Yq48-m-xTksohU5wPSPrjtjV2GLzDTSDcUCUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_JsqLcraiS+Yq48-m-xTksohU5wPSPrjtjV2GLzDTSDcUCUA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>, YT Shen <yt.shen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-mediatek@lists.infradead.org, "kernel@pengutronix.de" <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

QW0gTWl0dHdvY2gsIGRlbiAzMC4wOS4yMDE1LCAxMjoxMyAtMDUwMCBzY2hyaWViIFJvYiBIZXJy
aW5nOgo+IE9uIE1vbiwgU2VwIDIxLCAyMDE1IGF0IDM6MTEgQU0sIFBoaWxpcHAgWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4gTm90ZSBob3cgdGhlIGRpc3BsYXktc3Vi
c3lzdGVtIG5vZGUgb3ZlcmxhcHMgdGhlIGxhcmIgbm9kZS4gSXMgdGhhdAo+ID4gYWNjZXB0YWJs
ZT8KPiAKPiBHaXZlbiB3aGF0IHRoZSBncmFwaCBsb29rcyBsaWtlLCBwZXJoYXBzLiBIb3dldmVy
LCBkbyB5b3UgcmVhbGx5IG5lZWQKPiBhIGNvbnRhaW5lciBub2RlPyBJdCBvbmx5IHNlcnZlcyB0
byBwcm92aWRlIGEgbGlzdCBvZiBub2RlcyAoZS5nLiBhbGwKPiB0aGUgY2hpbGRyZW4pIHRvIGlu
Y2x1ZGUgYXMgY29tcG9uZW50cy4gVGhlcmUgYXJlIG90aGVyIHdheXMgdG8KPiBkZXRlcm1pbmUg
dGhpcyBsaXN0LiBZb3UgY291bGQgZmluZCBhbGwgbm9kZXMganVzdCBzZWFyY2hpbmcKPiBjb21w
YXRpYmxlIHN0cmluZ3MgZm9yIGVhY2ggY29tcG9uZW50LiBZb3UganVzdCBuZWVkIHRvIGJpbmQg
dGhlIGRybQo+IGRyaXZlciB0byBzb21lIG90aGVyIERUIG5vZGUuIElzIHRoZXJlIG5vIG5vZGUg
eW91IGNhbiBwaWNrIGFzIHRoZQo+IG1hc3RlciBjb21wb25lbnQ/CgpUaGVyZSBpcyB0aGUgbW1z
eXMgY2xvY2stY29udHJvbGxlciBub2RlIGF0IHRoZSB0b3Agb2YgdGhlIE1NU1lTIGFkZHJlc3MK
c3BhY2UgKDB4MTQwMDAwMDAtMHgxNGZmZmZmZik6CgoJbW1zeXM6IGNsb2NrLWNvbnRyb2xsZXJA
MTQwMDAwMDAgewoJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLW1tc3lzIiwgInN5c2Nv
biI7CgkJcmVnID0gPDAgMHgxNDAwMDAwMCAwIDB4MTAwMD47CgkJI2Nsb2NrLWNlbGxzID0gPDE+
OwoJfTsKCkl0cyByZWdpc3RlciBzcGFjZSBhbHNvIGNvbnRhaW5zIHRoZSBNTVNZU19DT05GSUcg
cmVnaW9uIHRoYXQgY29udHJvbHMKdGhlIG11bHRpcGxleGVycyBiZXR3ZWVuIHRoZSBkaXNwbGF5
IGZ1bmN0aW9uIGJsb2Nrcywgc28gdGhhdCB3b3VsZCBiZSBhCmdvb2QgY2FuZGlkYXRlLgpObyBk
cml2ZXIgYmluZHMgdG8gdGhpcyBub2RlIHlldCwgdGhlIGNsb2NrcyBhcmUgcmVnaXN0ZXJlZCB3
aXRoCkNMS19PRl9ERUNMQVJFLgoKSSdsbCB0cnkgdG8gYmluZCB0byB0aGlzIG5vZGUgYW5kIGhh
dmUgdGhlIGRyaXZlciBmaW5kIHNpYmxpbmcgbm9kZXMKdXNpbmcgdGhlaXIgY29tcGF0aWJsZSBz
dHJpbmdzLgoKdGhhbmtzClBoaWxpcHAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
