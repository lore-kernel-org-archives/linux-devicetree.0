From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 04/14] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Sun, 9 Jun 2013 11:34:24 -0300
Message-ID: <20130609143422.GA2353@localhost>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130607200054.GA9010@obsidianresearch.com>
 <20130608183851.GB2354@localhost> <1695243.lt6nZouziV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1695243.lt6nZouziV@wuerfel>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gU3VuLCBKdW4gMDksIDIwMTMgYXQgMDM6NDI6MjRQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBTYXR1cmRheSAwOCBKdW5lIDIwMTMgMTU6Mzg6NTIgRXplcXVpZWwgR2FyY2lh
IHdyb3RlOgo+ID4gT24gRnJpLCBKdW4gMDcsIDIwMTMgYXQgMDI6MDA6NTRQTSAtMDYwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+IAo+ID4gUmlnaHQuIEkgdGhpbmsgd2UgaGF2ZSB0d28gb3B0
aW9ucyBoZXJlIGZvciBsYXlpbmcgdGhlIERUIHJhbmdlcy4KPiA+IAo+ID4gMSkgVGhpcyBpcyB0
aGUgcHJvcG9zYWwgaW1wbGllZCBpbiB0aGUgcGF0Y2hzZXQgSSBzZW50Ogo+ID4gCj4gPiBtYnVz
IHsKPiA+IAlyYW5nZXMgPSA8IHdlIG9ubHkgcHV0IHRoZSBpbnRlcm5hbC1yZWcgdHJhbnNsYXRp
b24gaGVyZT4KPiA+IAlkZXZidXMtYm9vdGNzIHsKPiA+IAkJcmFuZ2VzID0gPDAge3RhcmdldF9p
ZC9hdHRyaWJ1dGV9IHt3aW5kb3dfcGh5c2ljYWxfYmFzZX0ge3NpemV9Pgo+ID4gCX0KPiA+IH0K
PiAKPiBBcyBKYXNvbiBleHBsYWluZWQsIHlvdSBjYW5ub3QgaGF2ZSB0aGUgd2luZG93X3BoeXNp
Y2FsX2Jhc2UgaW4gdGhlIGNoaWxkCj4gZGV2aWNlLCB0aGF0IGp1c3Qgd291bGRuJ3Qgd29yay4g
SSBkb24ndCBrbm93IGlmIHRoYXQncyBhIHR5cG8gb3IgYSB0aGlua28gOy0pCj4gCgpJJ20gbm90
IHN1cmUgd2hhdCB5b3UgbWVhbiBieSAidGhhdCBqdXN0IHdvdWxkbid0IHdvcmsiLiBJIHVuZGVy
c3RhbmQgaXQKbWF5IGJlIGEgY3JhcHB5IERUIGxheW91dCwgYnV0IGl0IGRlZmluaXRlbHkgd29y
a3MuCgpUaGUgcHJvcG9zYWwgSSd2ZSBzZW50IGluIHRoaXMgcGF0Y2hzZXQgaGFzIGJlZW4gZnVs
bHkgdGVzdGVkIGFuZCB3b3JrcwppbiBBMzcwIGFuZCBBWFAsIHdpdGggTk9SLCBhbmQgUENJZSBk
ZXZpY2VzLiAKLS0gCkV6ZXF1aWVsIEdhcmPDrWEsIEZyZWUgRWxlY3Ryb25zCkVtYmVkZGVkIExp
bnV4LCBLZXJuZWwgYW5kIEFuZHJvaWQgRW5naW5lZXJpbmcKaHR0cDovL2ZyZWUtZWxlY3Ryb25z
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkZXZp
Y2V0cmVlLWRpc2N1c3MgbWFpbGluZyBsaXN0CmRldmljZXRyZWUtZGlzY3Vzc0BsaXN0cy5vemxh
YnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9kZXZpY2V0cmVlLWRpc2N1
c3MK
