From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 05/12] ARM: mvebu: Remove the harcoded BootROM window
 allocation
Date: Wed, 19 Jun 2013 15:17:36 -0300
Message-ID: <20130619181735.GA5701@localhost>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1371554737-25319-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130618173906.GC2204@obsidianresearch.com>
 <20130619100159.GB16138@localhost>
 <20130619165834.GB32155@obsidianresearch.com>
 <20130619175823.GB2324@localhost>
 <20130619180320.GA25000@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130619180320.GA25000-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
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

T24gV2VkLCBKdW4gMTksIDIwMTMgYXQgMTI6MDM6MjBQTSAtMDYwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDE5LCAyMDEzIGF0IDAyOjU4OjI0UE0gLTAzMDAsIEV6ZXF1
aWVsIEdhcmNpYSB3cm90ZToKPiAKPiA+IEkgd2Fzbid0IHN1cmUgeW91IHdhbnRlZCB0byBwYW5p
YygpLCB0byBjbGlwIG9uIGF2YWlsYWJsZSBDUFVzLAo+ID4gb3IgdG8ganVzdCBkbyBhIHByX3dh
cm4gLyBXQVJOKCksIHNvIGhlcmUncyBhIHBpZWNlIG9mIGNvZGU6Cj4gPiAoZGlzY2xhaW1lcjog
bm9uLXRlc3RlZCwgbm9uLWNvbXBpbGVkLCBldGMuKQo+IAo+IFVwIHRvIHlvdSwgYnV0IHlvdSBr
bm93IGl0IHdvbid0IHdvcmsgaWYgaXQgaXNuJ3QgcmlnaHQgc28gY29udGludWluZwo+IG9uIHRv
IHRyeSBhbmQgc3RhcnR1cCB0aGUgQ1BVcyBpcyBub3QgaWRlYWwuIHBhbmljIGlzIHByb2JhYmx5
Cj4gcmVhc29uYWJsZT8KPiAgCgpXZWxsLCB0aGUgb3RoZXIgQ1BVcyBkb24ndCBzdGFydCBidXQg
dGhlIHN5c3RlbSBpdHNlbGYgZG9lcyBub3QgZGllLAoob3IgYXQgbGVhc3QgdGhhdCdzIHRoZSBj
YXNlIG9uIG15IHN5c3RlbXMpLgoKSXQncyB1cCB0byB5b3UsIEknbSBmaW5lIHdpdGggZWl0aGVy
LCBhbHRob3VnaCBJJ20gaW5jbGluZWQgdG8ganVzdApwYW5pYy4KCj4gPiAJbm9kZSA9IG9mX2Zp
bmRfY29tcGF0aWJsZV9ub2RlKE5VTEwsIE5VTEwsICJib290cm9tIik7Cj4gCj4gIm1hcnZlbGws
Ym9vdHJvbSIgPwo+IAoKWWVzLCBpbmRlZWQuCgotLSAKRXplcXVpZWwgR2FyY8OtYSwgRnJlZSBF
bGVjdHJvbnMKRW1iZWRkZWQgTGludXgsIEtlcm5lbCBhbmQgQW5kcm9pZCBFbmdpbmVlcmluZwpo
dHRwOi8vZnJlZS1lbGVjdHJvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRldmljZXRyZWUtZGlzY3VzcyBtYWlsaW5nIGxpc3QKZGV2aWNldHJl
ZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3Rp
bmZvL2RldmljZXRyZWUtZGlzY3Vzcwo=
