From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: media / v4l2-mc: wishlist for complex cameras (was Re: [PATCH
 v4 14/36] [media] v4l2-mc: add a function to inherit controls from a
 pipeline)
Date: Thu, 16 Mar 2017 11:01:56 +0100
Message-ID: <1489658516.2303.11.camel@pengutronix.de>
References: <20170311082549.576531d0@vento.lan>
 <20170313124621.GA10701@valkosipuli.retiisi.org.uk>
 <20170314004533.3b3cd44b@vento.lan>
 <e0a6c60b-1735-de0b-21f4-d8c3f4b3f10f@xs4all.nl>
 <20170314072143.498cde9b@vento.lan> <20170314223254.GA7141@amd>
 <20170314215420.6fc63c67@vento.lan> <20170315105049.GA12099@frolo.macqel>
 <1489604109.4593.4.camel@ndufresne.ca>
 <1489656360.2303.2.camel@pengutronix.de>
 <20170316094729.GA5595@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170316094729.GA5595@frolo.macqel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philippe De Muyter <phdm@macq.eu>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, Pavel Machek <pavel@ucw.cz>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, Nicolas Dufresne <nicolas@ndufresne.ca>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-arm-kernel@lists.infradead.org, nikla
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE3LTAzLTE2IGF0IDEwOjQ3ICswMTAwLCBQaGlsaXBwZSBEZSBNdXl0ZXIgd3Jv
dGU6Cj4gT24gVGh1LCBNYXIgMTYsIDIwMTcgYXQgMTA6MjY6MDBBTSArMDEwMCwgUGhpbGlwcCBa
YWJlbCB3cm90ZToKPiA+IE9uIFdlZCwgMjAxNy0wMy0xNSBhdCAxNDo1NSAtMDQwMCwgTmljb2xh
cyBEdWZyZXNuZSB3cm90ZToKPiA+ID4gTGUgbWVyY3JlZGkgMTUgbWFycyAyMDE3IMOgIDExOjUw
ICswMTAwLCBQaGlsaXBwZSBEZSBNdXl0ZXIgYSDDqWNyaXQgOgo+ID4gPiA+ID4gSSB3b3VsZCBz
YXk6IGNhbW9yYW1hLCB4YXd0djMsIHpiYXIsIGdvb2dsZSB0YWxrLCBza3lwZS4gSWYgaXQgcnVu
cwo+ID4gPiA+ID4gd2l0aCB0aG9zZSwgaXQgd2lsbCBsaWtlbHkgcnVuIHdpdGggYW55IG90aGVy
IGFwcGxpY2F0aW9uLgo+ID4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gSSB3b3VsZCBsaWtlIHRv
IGFkZCB0aGUgJ3Y0bDJzcmMnIHBsdWdpbiBvZiBnc3RyZWFtZXIsIGFuZCBvbiB0aGUKPiA+ID4g
PiBpbXg2IGl0cwo+ID4gPiAKPiA+ID4gV2hpbGUgaXQgd291bGQgYmUgbmljZSBpZiBzb21laG93
IHlvdSB3b3VsZCBnZXQgdjRsMnNyYyB0byB3b3JrIChpbgo+ID4gPiBzb21lIGxlZ2FjeS9lbXVs
YXRpb24gbW9kZSB0aHJvdWdoIGxpYnY0bDIpLAo+ID4gCj4gPiB2NGwyc3JjIHdvcmtzIGp1c3Qg
ZmluZSwgcHJvdmlkZWQgdGhlIHBpcGVsaW5lIGlzIGNvbmZpZ3VyZWQgbWFudWFsbHkgaW4KPiA+
IGFkdmFuY2UgdmlhIG1lZGlhLWN0bC4KPiAKPiBJbmNsdWRpbmcgY2hvb3NpbmcgdGhlIGZyYW1l
cmF0ZSA/ICBTb3JyeSwgSSBoYXZlIG5vIHRpbWUgdGhlc2UgZGF5cwo+IHRvIHRlc3QgaXQgbXlz
ZWxmLgoKTm8sIHRoZSBmcmFtZXJhdGUgaXMgc2V0IHdpdGggbWVkaWEtY3RsIG9uIHRoZSBDU0kg
b3V0cHV0IHBhZC4gVG8gcmVhbGx5CmNob29zZSB0aGUgZnJhbWVyYXRlLCB0aGUgZWxlbWVudCB3
b3VsZCBpbmRlZWQgbmVlZCBhIGRlZXBlcgp1bmRlcnN0YW5kaW5nIG9mIHRoZSBwaXBlbGluZSwg
YXMgdGhlIHJlc3VsdGluZyBmcmFtZXJhdGUgZGVwZW5kcyBvbiBhdApsZWFzdCB0aGUgc291cmNl
IHY0bDJfc3ViZGV2aWNlIChzZW5zb3IpIGZyYW1lcmF0ZSBhbmQgdGhlIENTSSBmcmFtZQpza2lw
cGluZy4KCj4gQW5kIEkgY2l0ZWQgaW14djRsMnZpZGVvc3JjIGZvciBpdHMgYWJpbGl0eSB0byBw
cm92aWRlIHRoZSBwaHlzaWNhbCBhZGRyZXNzCj4gb2YgdGhlIGltYWdlIGJ1ZmZlcnMgZm9yIGZ1
cnRoZXIgcHJvY2Vzc2luZyBieSBvdGhlciAobm90IG5lY2Vzc2FyaWx5IG5leHQKPiBpbiBnc3Ry
ZWFtZXIgcGlwZWxpbmUsIG9yIGZvciBhbGwgZnJhbWVzKSBoYXJkd2FyZS1hY2NlbGVyYXRlZCBw
bHVnaW5zIGxpa2VzCj4gdGhlIGguMjY0IHZpZGVvIGVuY29kZXIuICBBcyBJIGFtIHN0dWNrIHdp
dGggZnNsL254cCBrZXJuZWwgYW5kIGRyaXZlciBvbiB0aGF0Cj4gbWF0dGVyLCBJIGRvbid0IGtu
b3cgaG93IHRoZSBpbnRlcmZhY2VzIGhhdmUgZXZvbHZlZCBpbiBjdXJyZW50IGxpbnV4IGtlcm5l
bHMuCgpUaGUgcGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgaW1hZ2UgYnVmZmVycyBpcyBoaWRkZW4g
ZnJvbSB1c2Vyc3BhY2UgYnkKZG1hLWJ1ZiBvYmplY3RzLCBidXQgdGhvc2UgY2FuIGJlIHBhc3Nl
ZCBhcm91bmQgdG8gdGhlIG5leHQgZHJpdmVyCndpdGhvdXQgY29weWluZyB0aGUgaW1hZ2UgZGF0
YS4KCnJlZ2FyZHMKUGhpbGlwcAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
