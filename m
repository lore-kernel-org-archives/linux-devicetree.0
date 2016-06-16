From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v5 2/3] drm/arm: Add support for Mali Display Processors
Date: Thu, 16 Jun 2016 08:57:27 +0100
Message-ID: <20160616075727.GK9711@e106497-lin.cambridge.arm.com>
References: <1466002295-24813-1-git-send-email-Liviu.Dudau@arm.com>
 <1466002295-24813-3-git-send-email-Liviu.Dudau@arm.com>
 <20160615152309.GI1338@phenom.ffwll.local>
 <20160615161758.GF9711@e106497-lin.cambridge.arm.com>
 <CAKMK7uENW3cU8LccHcqffX3cbzax2-5mzY0101yLfR7vtD4CoA@mail.gmail.com>
 <20160615172104.GI9711@e106497-lin.cambridge.arm.com>
 <20160615201116.GI1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20160615201116.GI1041@n2100.armlinux.org.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: devicetree <devicetree@vger.kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, DRI devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgUnVzc2VsbCwKCk9uIFdlZCwgSnVuIDE1LCAyMDE2IGF0IDA5OjExOjE2UE0gKzAxMDAsIFJ1
c3NlbGwgS2luZyAtIEFSTSBMaW51eCB3cm90ZToKPiBPbiBXZWQsIEp1biAxNSwgMjAxNiBhdCAw
NjoyMTowNFBNICswMTAwLCBMaXZpdSBEdWRhdSB3cm90ZToKPiA+IENvdWxkIGJlIHRoZSB0ZGE5
OTh4X2RydiBmYXVsdCwgYnV0IEknbSBnZXR0aW5nIHRoaXMgc3BsYXQ6Cj4gPiAKPiA+IFsgICAg
MS4zNDc2ODddIGtvYmplY3RfYWRkX2ludGVybmFsIGZhaWxlZCBmb3IgY2FyZDAtSERNSS1BLTEg
KGVycm9yOiAtMiBwYXJlbnQ6IGNhcmQwKQo+IAo+IFJpZ2h0LCBzbyB0aGlzIGlzIC1FTk9FTlQg
LSBJIGV4cGVjdCB0aGF0IGl0J3MgY29tcGxhaW5pbmcgdGhhdCB0aGUKPiBwYXJlbnQgZG9lcyBu
b3QgZXhpc3QgYmVmb3JlIGEgY2hpbGQgaXMgYXR0ZW1wdGVkIHRvIGJlIGFkZGVkLgo+IAo+IEhv
cGVmdWxseSwgdGhpcyBpc24ndCB3aXRoIC1yYyBrZXJuZWxzLCBidXQgaXMgd2l0aCAtbmV4dC4g
IEkgdGhpbmsKPiBzb21lIGZvbGsgbmVlZCB0byBDYyBtZSB3aXRoIHBhdGNoZXMgdG8gdGRhOTk4
eCwgb3IgYXQgbGVhc3QgdGFsayB0bwo+IG1lIGFib3V0IHdoYXQncyBjaGFuZ2VkIGluIERSTSBz
byB0aGF0IHRkYTk5OHggY2FuIGdldCBmaXhlZC4KClRoaXMgaXMgd2l0aCBhIG5ldyBkcml2ZXIg
dGhhdCBqdXN0IHdlbnQgaW50byAtbmV4dCBhbmQgSSB3YXMgdHJ5aW5nIGEgc3VnZ2VzdGlvbgpm
cm9tIERhbmllbCB0byByZS1vcmRlciB0aGUgaW5pdGlhbGlzYXRpb24gc3RlcHMgaW4gcHJlcGFy
YXRpb24gb2YgdGhlCnNlcmllcyB0aGF0IENocmlzIFdpbHNvbiBpcyB3b3JraW5nIG9uIHRvIG1h
a2UgaW5pdCB0aW1lIGxlc3MgcmFjeS4KSXQgaXMgbm90IGEgbm9ybWFsIHJ1biBzcGxhdCBhbmQg
SSB3aWxsIG1ha2Ugc3VyZSB0aGF0IHdlIHdvcmsgd2l0aAp5b3UgdG8gZ2V0IHRkYTk5OHggY2hh
bmdlZCB3aGVuIHdlIGdldCB0aGVyZS4KCk90aGVyIHRoYW4gdGhlIHRpY2xjZCBkcml2ZXIgdGhh
dCBpcyAoSSB0aGluaykgYmVpbmcgY29udmVydGVkIHRvIGF0b21pYywgZG8geW91CnVzZSBhbnkg
b3RoZXIgRFJNIGRyaXZlciB3aXRoIHRkYTk5OHg/CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IAo+
IC0tIAo+IFJNSydzIFBhdGNoIHN5c3RlbTogaHR0cDovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2
ZWxvcGVyL3BhdGNoZXMvCj4gRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZTogY3VycmVu
dGx5IGF0IDkuNk1icHMgZG93biA0MDBrYnBzIHVwCj4gYWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5u
ZXQuCj4gCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZp
eCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAog
XCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
