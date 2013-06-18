From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 05/12] ARM: mvebu: Remove the harcoded BootROM window
 allocation
Date: Tue, 18 Jun 2013 17:39:38 -0300
Message-ID: <20130618203937.GA2516@localhost>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1371554737-25319-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130618173906.GC2204@obsidianresearch.com>
 <20130618194330.GA2394@localhost>
 <20130618195111.GC6578@obsidianresearch.com>
 <20130618200240.GB2470@localhost>
 <20130618201021.GA11688@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130618201021.GA11688-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
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
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBKdW4gMTgsIDIwMTMgYXQgMDI6MTA6MjFQTSAtMDYwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDE4LCAyMDEzIGF0IDA1OjAyOjQyUE0gLTAzMDAsIEV6ZXF1
aWVsIEdhcmNpYSB3cm90ZToKPiA+ID4gSGF2aW5nIHRoZSBrZXJuZWwgZW5mb3JjZSB0aGF0IHRo
ZSBEVCBub2RlIGlzIHByZXNlbnQgYW5kIGF0IHRoZSByaWdodAo+ID4gPiBsb2NhdGlvbiwgSSB0
aGluaywgaXMgaGVscGZ1bCBmb3IgdGhlIGJvb3Rsb2FkZXIgZm9sa3MgdG8gZW5zdXJlIHRoZXkK
PiA+ID4gd3JpdGUgY29ycmVjdCBEVHMuCj4gCj4gPiBHcmFudGVkLiBCdXQgdGhlbiBJIHdvbmRl
ci4uLiB3aHkgZG8gd2UgYm90aGVyIHRvIHB1dCB0aGUgQm9vdFJPTSBpbiB0aGUKPiA+IERUIHdp
bmRvdyBpZiB3ZSdyZSBnb2luZyB0byBjaGVjayBmb3IgYSBmaXhlZCBhZGRyZXNzIGl0IGluIGFu
eSBjYXNlPwo+IAo+IENvZGUgcmUtdXNlIGluIHRoZSBtYnVzIGRyaXZlcj8KPiAKPiBNYXliZSBm
dXR1cmUgU09DcyBpbiB0aGlzIGZhbWlseSB3aWxsIGhhdmUgcHJvZ3JhbW1hYmxlIFNNUCBzdGFy
dHVwCj4gYWRkcmVzc2VzPwo+IAo+IE5vbi1TTVAgc3lzdGVtcyBkb24ndCBuZWVkIHRvIG1hcCB0
aGUgYm9vdCByb20gYXQgYWxsPwo+IAoKVGhyZWUgZ3JlYXQgYW5zd2VycyA6KQoKLS0gCkV6ZXF1
aWVsIEdhcmPDrWEsIEZyZWUgRWxlY3Ryb25zCkVtYmVkZGVkIExpbnV4LCBLZXJuZWwgYW5kIEFu
ZHJvaWQgRW5naW5lZXJpbmcKaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkZXZpY2V0cmVlLWRpc2N1c3MgbWFp
bGluZyBsaXN0CmRldmljZXRyZWUtZGlzY3Vzc0BsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlz
dHMub3psYWJzLm9yZy9saXN0aW5mby9kZXZpY2V0cmVlLWRpc2N1c3MK
