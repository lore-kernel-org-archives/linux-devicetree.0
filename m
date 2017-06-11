From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: Add Synopsys DW MIPI DSI DRM
 bridge driver
Date: Sun, 11 Jun 2017 11:28:47 +0530
Message-ID: <68968927-13a7-2e93-113d-2c0a166c6422@codeaurora.org>
References: <1496414235-20098-1-git-send-email-philippe.cornu@st.com>
 <1496414235-20098-3-git-send-email-philippe.cornu@st.com>
 <20170608154028.6ck3dos6de2dogrk@rob-hp-laptop>
 <7502cbc2-9feb-4dd3-3d95-b5f33b8a8872@codeaurora.org>
 <7dd31d6d-1d5d-2432-07aa-96349f50c924@synopsys.com>
 <20170609130117.m5eyqrmv3gsokmuj@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170609130117.m5eyqrmv3gsokmuj@rob-hp-laptop>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>, Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, Chen Feng <puck.chen@hisilicon.com>, Philippe CORNU <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, Yannick Fertre <yannick.fertre@st.com>, zourongrong@gmail.com, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Thierry Reding <thierry.reding@gmail.com>, Fabien Dessenne <fabien.dessenne@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chris Zhong <zyw@rock-chips.com>, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

CgpPbiA2LzkvMjAxNyA2OjMxIFBNLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBGcmksIEp1biAw
OSwgMjAxNyBhdCAxMDo0MzowN0FNICswMTAwLCBKb3NlIEFicmV1IHdyb3RlOgo+PiBIZWxsbywK
Pj4KPj4KPj4gT24gMDktMDYtMjAxNyAwNToxMSwgQXJjaGl0IFRhbmVqYSB3cm90ZToKPj4+IEhp
IFBoaWxpcHBlLCBSb2IsCj4+Pgo+Pj4gT24gMDYvMDgvMjAxNyAwOToxMCBQTSwgUm9iIEhlcnJp
bmcgd3JvdGU6Cj4+Pj4gU2VlbXMgc3RyYW5nZSB0aGVyZSdzIG5vdCBhbHNvIGEgcGl4ZWwgb3Ig
Yml0IGNsb2NrPyBPciB0aGlzCj4+Pj4gZ2V0cyBkcml2ZW4KPj4+PiBmcm9tIHRoZSBwaHk/Cj4+
Pgo+Pj4gU2luY2UgeW91IG1lbnRpb24gcGh5IGhlcmUsIEkgd2FudGVkIHRvIHNoYXJlIGEgY29u
Y2VybiB3aXRoCj4+PiB0aGUgYmluZGluZ3MuCj4+PiBUaGVzZSBiaW5kaW5ncyBkb24ndCBoYXZl
IGEgc2VwYXJhdGUgUEhZIERUIG5vZGUuIFRoZSBQSFkgaXMKPj4+IGFzc3VtZWQgYXMgYQo+Pj4g
cGFydCBvZiB0aGUgSVAgd2hlbiBpbnRlZ3JhdGVkIGJ5IGEgU29DLiBUaGVyZSBhcmUgYWxyZWFk
eQo+Pj4gcm9ja2NoaXAgYW5kCj4+PiBoaXNpbCBEU0kgYmluZGluZ3MgdGhhdCB1c2UgdGhpcyBJ
UCBidXQgZG9uJ3QgZGVmaW5lIGEgUEhZIG5vZGUuCj4+Pgo+Pj4gSXQncyBhIHNpbWlsYXIgc2l0
dWF0aW9uIHdpdGggdGhlIERXLUhETUkgYmluZGluZ3MuCj4+Pgo+Pj4gRm9yIGV4YW1wbGUsIHdo
ZW4gdGhlIERXIEhETUkgaXMgaW50ZWdyYXRlZCBpbiByb2NrY2hpcCBvcgo+Pj4gcmVuZXNhcyBT
b0MsIHRoZQo+Pj4gYmluZGluZ3MgInJvY2tjaGlwLHJrMzI4OC1kdy1oZG1pIiBvciAicmVuZXNh
cyxyOGE3Nzk1LWR3LWhkbWkiCj4+PiBhcmUgdXNlZCwKPj4+IGFuZCB0aGV5IGRvbid0IGhhdmUg
YSBzZXBhcmF0ZSBQSFkgRFQgbm9kZS4KPj4+Cj4+PiBJIHdhc24ndCBzdXJlIHdoZXRoZXIgdGhp
cyBpcyB0aGUgcmlnaHQgd2F5IHRvIHByb2NlZWQgb3Igbm90Cj4+PiBmb3Igc3VjaCBJUHMuCj4+
PiBTb21lIGFkdmljZSB3b3VsZCBoZWxwIHVzIGhlcmUuCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gQXJj
aGl0Cj4+Pgo+Pgo+PiBJIGp1c3Qgd2FudCB0byBhZGQgdGhhdCByZWFkL3dyaXRlcyBmcm9tL3Rv
IHBoeSBhcmUgZG9uZSB1c2luZwo+PiB0aGUgY29udHJvbGxlciAoaW4gSERNSSBhbmQgaW4gTUlQ
SSBEU0kgSG9zdCksIHNvIHRoZSBvbmx5IHdheSB0bwo+PiBoYXZlIGEgcGh5IGRyaXZlciBpcyB0
aGF0IGlmIHNvbWUgY3VzdG9tIGNhbGxiYWNrcyBhcmUgcHJvdmlkZWQKPj4gb3IgaWYgdGhlIG1l
bW9yeSByZWdpb24gaXMgc2hhcmVkLgo+Pgo+PiBBbnl3YXksIEkgYWdyZWUgd2l0aCBBcmNoaXQg
aW4gdGhlIHNlbnNlIHRoYXQgcGh5ICsgY29udHJvbGxlcgo+PiBhcmUgaGlnaGx5IHRpZWQuIEFs
c28sIHRoZXNlIHR3byAicGllY2VzIiBhcmUgU29DIHNwZWNpZmljIGFuZAo+PiBzb21ldGltZXMg
dmVyeSBkaWZmZXJlbnQgYmV0d2VlbiBTb0MncyBiZWNhdXNlIHRoZXkgY2FuIGJlCj4+IGN1c3Rv
bWl6ZWQgc28gSSB0aGluayBhIGRpZmZlcmVudCBjb21wYXRpYmxlIHN0cmluZyBzdWl0cyB3ZWxs
IGhlcmUuCj4gCj4gV2hlbiB0aGUgcGh5IGlzIGludGVncmF0ZWQgbGlrZSB0aGlzLCBJIGFncmVl
IHRoYXQgaXQgZG9lc24ndCBtYWtlIHNlbnNlCj4gdG8gaGF2ZSBhIHNlcGFyYXRlIHBoeSBub2Rl
Lgo+CgpHcmVhdC4gVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbiBKb3NlIGFuZCBSb2IuCgpB
cmNoaXQKCi0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1i
ZXIgb2YgdGhlIENvZGUgQXVyb3JhIEZvcnVtLApob3N0ZWQgYnkgVGhlIExpbnV4IEZvdW5kYXRp
b24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
