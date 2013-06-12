From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 04/14] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Wed, 12 Jun 2013 18:36:21 -0300
Message-ID: <20130612213620.GC23012@localhost>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <4160363.LWJuHATm2F@wuerfel> <20130612111441.E6D603E0A56@localhost>
 <201306122245.55960.arnd@arndb.de>
 <20130612211221.GB23012@localhost>
 <20130612212641.GB8625@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130612212641.GB8625-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBKdW4gMTIsIDIwMTMgYXQgMDM6MjY6NDJQTSAtMDYwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDEyLCAyMDEzIGF0IDA2OjEyOjIyUE0gLTAzMDAsIEV6ZXF1
aWVsIEdhcmNpYSB3cm90ZToKPiAKWy4uLl0KPiA+IAo+ID4gVGhpcyBkZXBhcnRzIGNvbnNpZGVy
YWJseSBmcm9tIHdoYXQgSSdtIGFpbWluZyByaWdodCBub3cuCj4gPiAKPiA+IEFyZSB5b3Ugc3Vn
Z2VzdGluZyB0byBub3QgcHV0ICphbnkqIG1hcHBpbmcgaW4gdGhlIG1idXMgJ3Jhbmdlcycgbm9k
ZSBpbgo+ID4gdGhlIERUIChvdGhlciB0aGFuIGludGVybmFsLXJlZ3MpPwo+IAo+IE15IHZpZXcg
aXMgdGhhdCB0aGUgcmFuZ2VzIHNob3VsZCBiZSByZXNwZWN0ZWQuIElmIGFuIGFkZHJlc3MgaXMK
PiBwcmVzZW50LCBpdCBzaG91bGQgYmUgdXNlZCwgdW5sZXNzIHRoZXJlIGlzIGEgY29uZmxpY3Qu
Cj4gCj4gSWYgbm8gYWRkcmVzcyBpcyBwcmVzZW50ICh1bmNsZWFyIHdoeSBhbnlvbmUgd291bGQg
ZG8gdGhpcywgYnV0IE9LKQo+IHRoZW4gZGVtYW5kIGFsbG9jYXRlIHZpYSB0aGUgbGludXggcmVz
b3VyY2UgYWxsb2NhdG9yIHRocm91Z2ggdGhlCj4gb2ZfYnVzIHN0dWZmIHNlZW1zIHJlYXNvbmFi
bGUgdG8gbWUuLgo+IAo+IEp1c3QgdG8gcmUtaXRlcmF0ZSBBcm5kJ3MgZWFybGllciBjb21tZW50
OiBUaGUgRFQgcmVwcmVzZW50YXRpb24KPiBtdXN0IGhhbmRsZSBkeW5hbWljIGFsbG9jYXRpb24s
IGJ1dCB3ZSBjYW4gZGVmZXIgaW1wbGVtZW50aW5nIHRoZQo+IGtlcm5lbCBzaWRlIHVudGlsIHRo
ZXJlIGlzIGEgbmVlZC4KPiAKPiBJdCBpc24ndCBjbGVhciB0byBtZSB0aGVyZSBpcyBhIG5lZWQu
Li4uLgo+IAoKUmlnaHQuIEFuZCBqdXN0IHRvIGNvbmZpcm06IHRoaXMga2VybmVsIHNpZGUgZHlu
YW1pYyBpbXBsZW1lbnRhdGlvbgp3aWxsIGJlIGNvbXBsZXRlbHkgaW5kZXBlbmRlbnQgb2YgdGhl
IE1CdXMgRFQgbGF5b3V0IHByb3Bvc2FsLgpTbyBJIHRoaW5rIGl0J3MgYmVzdCB0byBhZ3JlZSBv
biB0aGlzIGJpbmRpbmcgZmlyc3QuCgpJJ2xsIHBvc3QgYSB2MiB3aXRoIHRoZSBwcm9ncmVzcyBJ
J3ZlIG1hZGUgdXNpbmcgdGhlIHByZXByb2Nlc3Nvci4KLS0gCkV6ZXF1aWVsIEdhcmPDrWEsIEZy
ZWUgRWxlY3Ryb25zCkVtYmVkZGVkIExpbnV4LCBLZXJuZWwgYW5kIEFuZHJvaWQgRW5naW5lZXJp
bmcKaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkZXZpY2V0cmVlLWRpc2N1c3MgbWFpbGluZyBsaXN0CmRldmlj
ZXRyZWUtZGlzY3Vzc0BsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9kZXZpY2V0cmVlLWRpc2N1c3MK
