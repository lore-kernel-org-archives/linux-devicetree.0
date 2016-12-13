From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
Date: Tue, 13 Dec 2016 13:22:26 +0100
Message-ID: <4ed8b39b-69af-e62b-f6d6-472a6c791bcc@kaod.org>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-2-git-send-email-clg@kaod.org>
 <3f3260d1-e677-b6d9-5571-a08a80344495@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <3f3260d1-e677-b6d9-5571-a08a80344495@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMTIvMTMvMjAxNiAwODo1MCBBTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMTIvMTIvMjAx
NiAwNDo0MCBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IFRoaXMgZHJpdmVyIGFkZHMg
bXRkIHN1cHBvcnQgZm9yIHRoZSBBc3BlZWQgQVNUMjUwMCBTb0Mgc3RhdGljIG1lbW9yeQo+PiBj
b250cm9sbGVycyA6Cj4gCj4gWy4uLl0KPiAKPj4gKyNkZWZpbmUgREVWSUNFX05BTUUJImFzcGVl
ZC1zbWMiCj4+ICsKPj4gKy8qCj4+ICsgKiBUaGUgZHJpdmVyIG9ubHkgc3VwcG9ydCBTUEkgZmxh
c2gKPj4gKyAqLwo+PiArZW51bSBhc3BlZWRfc21jX2ZsYXNoX3R5cGUgewo+PiArCXNtY190eXBl
X25vciAgPSAwLAo+PiArCXNtY190eXBlX25hbmQgPSAxLAo+PiArCXNtY190eXBlX3NwaSAgPSAy
LAo+PiArfTsKPiAKPiBTbyB3aHkgaXMgdGhpcyBoZXJlID8gOikKCndlbGwsIGJlY2F1c2Ugd2Ug
ZG8gZW5mb3JjZSB0aGUgU1BJIHR5cGUgaW4gYXNwZWVkX3NtY19jaGlwX3NldF90eXBlKCkKYnV0
IEkgYWdyZWUsIHdlIGNvdWxkIGJlIGEgYml0IG1vcmUgZGlyZWN0IHdpdGggaXQgYW5kIGp1c3Qg
d3JpdGUKdGhlIFNQSSB0eXBlLiBNYXkgYmUgaW4gYSBmb2xsb3d1cCBwYXRjaCB0aGVuLgoKPiAK
Pj4gK3N0cnVjdCBhc3BlZWRfc21jX2NoaXA7Cj4+ICsKPj4gK3N0cnVjdCBhc3BlZWRfc21jX2lu
Zm8gewo+PiArCXUzMiBtYXhzaXplOwkJLyogbWF4aW11bSBzaXplIG9mIGNoaXAgd2luZG93ICov
Cj4+ICsJdTggbmNlOwkJCS8qIG51bWJlciBvZiBjaGlwIGVuYWJsZXMgKi8KPj4gKwlib29sIGhh
c3R5cGU7CQkvKiBmbGFzaCB0eXBlIGZpZWxkIGV4aXN0cyBpbiBjb25maWcgcmVnICovCj4+ICsJ
dTggd2UwOwkJCS8qIHNoaWZ0IGZvciB3cml0ZSBlbmFibGUgYml0IGZvciBDRTAgKi8KPj4gKwl1
OCBjdGwwOwkJLyogb2Zmc2V0IGluIHJlZ3Mgb2YgY3RsIGZvciBDRTAgKi8KPj4gKwo+PiArCXZv
aWQgKCpzZXRfNGIpKHN0cnVjdCBhc3BlZWRfc21jX2NoaXAgKmNoaXApOwo+PiArfTsKPiAKPiBP
dGhlcndpc2UgbG9va3MgZ29vZDoKPiBSZXZpZXdlZC1ieTogTWFyZWsgVmFzdXQgPG1hcmVrLnZh
c3V0QGdtYWlsLmNvbT4KPiAKClRoYW5rcyBmb3IgdGhlIHJldmlldywKCkMuIAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
