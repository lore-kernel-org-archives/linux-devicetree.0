From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Subject: Re: [PATCH v3 2/5] dmaengine: Add STM32 DMAMUX driver
Date: Wed, 2 Aug 2017 16:28:40 +0200
Message-ID: <0e16a519-3d60-f683-5517-12a520e0e521@st.com>
References: <1499343623-5964-1-git-send-email-pierre-yves.mordret@st.com>
 <1499343623-5964-3-git-send-email-pierre-yves.mordret@st.com>
 <20170722065133.GT3053@localhost>
 <2b916330-9b65-f4d5-817f-79b66cc236b3@st.com>
 <20170726052930.GF3053@localhost>
 <f2908e38-dc4d-3886-4058-52a7ad845415@st.com>
 <20170731123157.GJ3053@localhost>
 <e3a76a50-4160-d111-cce9-132b46b66c33@st.com>
 <20170802045522.GU3053@localhost>
 <7d2091fe-a2e5-78bb-b63d-9cb66bdb7e84@ti.com>
 <7bcad698-fa1a-3dc2-e918-4400639ca6d7@st.com>
 <47ceba83-1097-072e-bed6-d1964bce7a25@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <47ceba83-1097-072e-bed6-d1964bce7a25@ti.com>
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
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, Vinod Koul <vinod.koul@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Amelie DELAUNAY <amelie.delaunay@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>
List-Id: devicetree@vger.kernel.org

CgpPbiAwOC8wMi8yMDE3IDA0OjA5IFBNLCBQZXRlciBVamZhbHVzaSB3cm90ZToKPiAKPiBUZXhh
cyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5r
aS4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTog
SGVsc2lua2kKPiAKPiBPbiAyMDE3LTA4LTAyIDE2OjExLCBQaWVycmUgWXZlcyBNT1JEUkVUIHdy
b3RlOgo+PiBPdXIgU29DIHdvcmtzIHdpdGggb3Igd2l0aG91dCBETUFNVVguIEJvdGggYmluZGlu
ZyBpcyBhbGxvd2VkLiBVc2luZyBvbmx5IERNQSBhCj4+IENoYW5uZWxJZCBhbmQgcmVxdWVzdCBs
aW5lIGlzIHBhcnQgb2YgdGhlIGJpbmRpbmcuCj4gCj4gSW4gb3VyIGNhc2UgdGhlIGFtMzM1eCdz
IGVETUEgY2FuIHdvcmsgd2l0aCBvciB3aXRob3V0IHRoZSByb3V0ZXIsIHdlIAo+IG9ubHkgdXNl
IHRoZSByb3V0ZXIgbm9kZSBpZiB3ZSBuZWVkIG5vbmUgZGVmYXVsdCBldmVudCBmb3IgYSBnaXZl
biBETUEgCj4gcmVxdWVzdCBsaW5lLgo+IAo+PiBVc2luZyBETUFNVXggbm93IHRoZSByZXF1ZXN0
Cj4+IGxpbmUgaXMgY29taW5nIGZyb20gZG1hX3NwZWMgZm9yd2FyZHMgdG8gZG1hLW1hc3RlciBh
cyB3ZWxsIGV4cGxhaW5lZCBieSBQZXRlci4KPj4gSG93ZXZlciBDaGFubmVsSUQgaXMgbm93IGdp
dmVuIGJ5IGRtYV9nZXRfYW55X3NsYXZlX2NoYW5uZWwgaW5zdGVhZCBvZiBiaW5kaW5ncy4KPj4g
RE1BTVVYIGRyaXZlciBoYXMgdG8gYmUgYXdhcmUgb2YgdGhpcyBJRCB0byByb3V0ZSByZXF1ZXN0
IGxpbmUgdG8gb3V0IERNQQo+PiBjaGFubmVsLiBUaGlzIGNoYW5uZWwgaWQgaW5mb3JtYXRpb24g
aXMgY2FycmllZCBvbiB1bnRpbCBETUFNVVggdGhyb3VnaAo+PiBkbWFlbmdpbmVfc2xhdmVfY29u
ZmlnIHdpdGggYSBjdXN0b20gQVBJLgo+PiBIb3BlIGl0IGNsYXJpZmllcyB0aGUgbmVlZC4KPiAK
PiBJIHNlZSwgdGhpcyBpcyBub3QgbXVjaCBkaWZmZXJlbnQgdGhlbiB3aGF0IHdlIGZhY2Ugd2l0
aCBvdXIgZHJhNyAKPiBkZXZpY2VzLiBJbiB0aGVvcnkgd2UgY291bGQgdXNlIGRpcmVjdCBETUEg
YmluZGluZyB0byB0aGUgRE1BIGNvbnRyb2xsZXIgCj4gaXRzZWxmLCBidXQgc29tZSByZXF1ZXN0
cyB3b3VsZCBub3QgYmUgcmVhY2hhYmxlLCBzbyB3ZSBhbHdheXMgdXNlIHRoZSAKPiByb3V0ZXIn
cyBub2RlIGZvciBETUEgb24gZHJhNyBmYW1pbHkuCj4gCj4gQmFzaWNhbGx5IHRoZSByb3V0ZXIg
d291bGQgbWFuYWdlIHRoZSBDaGFubmVsSUQgYW5kIGNyZWF0ZSAKPiAnc3Qsc3RtMzItZG1hJyBj
b21wYXRpYmxlIGRtYV9zcGVjICh0aGUgZm91ciBwYXJhbWV0ZXJzKS4KPiBBZmFpayB5b3UgY291
bGQgaGF2ZSAzIHBhcmFtZXRlcnMgZm9yIHRoZSByb3V0ZXIgYW5kIGNyZWF0ZSBhIGZvdXIgCj4g
cGFyYW1ldGVyIGRtYV9zcGVjLCB3aGVyZSB0aGUgQ2hhbm5lbElEIGlzIGR5bmFtaWNhbGx5IGFs
bG9jYXRlZC4KCkNvcnJlY3Qgcm91dGVyIG5lZWRzIDMgcGFyYW1ldGVycyBhbmQgYW1vbmcgdGhv
c2UgMiBhcmUgZm9yd2FyZGVkIHRob3VnaCBvdXQKZG1hX3NwZWMuIEJ1dCB3aGVuIHlvdSBzYXkg
IkNoYW5uZWxJRCBpcyBkeW5hbWljYWxseSBhbGxvY2F0ZWQiIHlvdSBtZWFuCmRtYV9nZXRfYW55
X3NsYXZlX2NoYW5uZWwgPyBJZiB5ZXMgSSBjYW4gdXNlIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGJp
bmRpbmdzIHRvCmNhcnJ5IHRoZSBjaGFubmVsSUQgdG8gRE1BLiBObyBjaGFuZ2VzIG5lZWQgdG8g
cGVyaXBoZXJhbC4uLgoKPiBCdXQgeW91IG5lZWQgdG8gY29udmVydCBhbGwgcGVyaXBoZXJhbHMg
dG8gdXNlIHRoZSByb3V0ZXIncyBub2RlIGZvciB0aGUgCj4gRE1BLgo+IAo+IC0gUMOpdGVyCj4g
CgpQeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbAo=
