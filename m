From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2] ARM: dts: zynq: Add OCM node
Date: Thu, 12 Feb 2015 16:00:06 +0100
Message-ID: <d03fe504acc343878cd4b8f42aecac09@BL2FFO11FD038.protection.gbl>
References: <6df19b400e314ef8228be475bb8ba83765683016.1423737765.git.michal.simek@xilinx.com>
 <20150212105443.GB1522@leverpostej>
 <c64e7b4bf78649049cea3dceecea453c@BN1AFFO11FD014.protection.gbl>
 <20150212145836.GZ18532@xsjandreislx>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150212145836.GZ18532@xsjandreislx>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>, Michal
 Simek <michal.simek@xilinx.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Josh Cartwright <josh.cartwright@ni.com>, Rob Herring <robh+dt@kernel.org>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Kumar Gala <galak@codeaurora.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMDIvMTIvMjAxNSAwMzo1OCBQTSwgU8O2cmVuIEJyaW5rbWFubiB3cm90ZToKPiBPbiBUaHUs
IDIwMTUtMDItMTIgYXQgMTI6MDFQTSArMDEwMCwgTWljaGFsIFNpbWVrIHdyb3RlOgo+PiBPbiAw
Mi8xMi8yMDE1IDExOjU0IEFNLCBNYXJrIFJ1dGxhbmQgd3JvdGU6Cj4+PiBPbiBUaHUsIEZlYiAx
MiwgMjAxNSBhdCAxMDo0Mjo0N0FNICswMDAwLCBNaWNoYWwgU2ltZWsgd3JvdGU6Cj4+Pj4gQWRk
IE9DTSBub2RlIGZvciBhbGwgenlucSBib2FyZHMuIE9DTSBsb2NhdGlvbgo+Pj4+IGNhbiBjaGFu
Z2VkIGJ1dCBmb3IgYWxsIGN1cnJlbnQgYm9hcmRzIHRoaXMKPj4+PiBpcyB0aGUgbG9jYXRpb24g
d2hlcmUgT0NNIGlzLmAKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBTaW1layA8bWlj
aGFsLnNpbWVrQHhpbGlueC5jb20+Cj4+Pj4gLS0tCj4+Pj4KPj4+PiBDaGFuZ2VzIGluIHYyOgo+
Pj4+IC0gTW92ZSBub2RlIHRvIGJvYXJkIGZpbGUgc3VnZ2VzdGVkIGJ5IE1hcmsKPj4+Pgo+Pj4+
IFRoaXMgcGF0Y2ggaXMgZG9uZSBiYXNlZCBvbiBkaXNjdXNzaW9uIGhlcmUuCj4+Pj4gaHR0cHM6
Ly9sa21sLm9yZy9sa21sLzIwMTQvMTIvMS8zOTYKPj4+Pgo+Pj4+IE1hcms6IEkgZXhwZWN0IHlv
dSB3b24ndCBsaWtlIGFtYmEgYnVzIHJlZmVyZW5jZSBvcgo+Pj4+IGFtIEkgd3Jvbmc/Cj4+Pgo+
Pj4gSSdtIGZpbmUgd2l0aCBkcm9wcGluZyB0aGluZ3Mgb250byBhIGJ1cyBpbiB0aGlzIHdheS4g
SWYgd2UncmUgaGFwcHkgdG8KPj4+IGRvIGl0IGZvciBvdGhlciBub2RlcyBJIGRvbid0IHNlZSB3
aHkgYnVzc2VzIHNob3VsZCBiZSBzcGVjaWFsLgo+Pgo+PiBXb25kZXJmdWwuIEkgd2lsbCBnaXZl
IHBlb3BsZSBzb21lIHRpbWUgdG8gY29tbWVudCB0aGlzIHN0eWxlLgo+IAo+IEdpdmVuIHRoYXQg
dGhlIGxvY2F0aW9uIGlzIGRpc2NvdmVyYWJsZSwgd291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBs
ZXQKPiAncmVnJyBwb2ludCB0byB0aGUgY3RybC9jZmcgcmVnaXN0ZXJzIGluIHRoZSBTTENSIGFu
ZCBsZXQgdGhlIGRyaXZlcgo+IGhhbmRsZSB0aGUgd2hlcmVhYm91dHMgb2YgdGhlIE9DTSBsb2Nh
dGlvbj8gKGJ1dCBJIGd1ZXNzIHRoaXMgaXMgZ29pbmcKPiBpbiBjaXJjbGVzIG5vdywgc3VjaCBh
IHByb3Bvc2FsIHdhcyBvbiB0aGUgdGFibGUgYXQgc29tZSBwb2ludCwgSUlSQykuCj4gQnV0IEkn
ZCBwcmVmZXI6Cj4gCW1lbW9yeS1jb250cm9sbGVyQDB4ZmZmYzAwMDAgeyAvKiB0aGUgYWRkcmVz
cyBoZXJlIHdvdWxkIG9mIGNvdXJzZSBub3QgbWF0Y2ggYWxsIGNvbmZpZ3VyYXRpb25zICovCj4g
CQlpbnRlcnJ1cHRzID0gLi4uOwo+IAkJc3lzY29uID0gJnNsY3I7Cj4gCX07CgpUaGF0IHdhcyBk
aXNjdXNzZWQgd2l0aCBBcm5kIGF0IHRoYXQgbGluayBhYm92ZS4KClRoYW5rcywKTWljaGFsCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
