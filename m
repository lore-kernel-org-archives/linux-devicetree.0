From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v4 19/23] drivers/fsi: Add GPIO based FSI master
Date: Wed, 05 Apr 2017 08:19:20 +1000
Message-ID: <1491344360.4166.68.camel@kernel.crashing.org>
References: <20170329174340.89109-1-cbostic@linux.vnet.ibm.com>
 <20170329174340.89109-20-cbostic@linux.vnet.ibm.com>
 <CACPK8XfOSYPidHF6=psC4mP-tkRyWTu0psdcK6EwA2E6FF53Uw@mail.gmail.com>
 <0e1bcf3a-e8d7-9f50-bdf7-2a1e7466665b@linux.vnet.ibm.com>
 <1490907014.3177.207.camel@kernel.crashing.org>
 <93b21624-11fc-b71b-aa78-6cb4371c87ae@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <93b21624-11fc-b71b-aa78-6cb4371c87ae@linux.vnet.ibm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Greg KH <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, rostedt@goodmis.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, "Edward A .
 James" <eajames@us.ibm.com>, Alistair Popple <alistair@popple.id.au>, mingo@redhat.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAyMDE3LTA0LTA0IGF0IDEyOjMyIC0wNTAwLCBDaHJpc3RvcGhlciBCb3N0aWMgd3Jv
dGU6Cj4gQWdyZWVkIHRoYXQgdGhlcmUgaXMgcm9vbSBmb3IgaW1wcm92ZW1lbnQuwqDCoCBJIGlu
dGVuZCB0byBsb29rIGZ1cnRoZXLCoAo+IGludG8geW91ciBzdWdnZXN0aW9ucyBmcm9tIGhlcmUg
YW5kIG91ciBwcml2YXRlIGNvbnZlcnNhdGlvbiBvbiB0aGXCoAo+IG1hdHRlciBhbmQgbWFrZSBj
aGFuZ2VzIGFzIGFwcHJvcHJpYXRlLsKgIEkgaGF2ZSBhbiBvcGVuIGlzc3VlIHRvIHRyYWNrwqAK
PiB0aGlzLsKgIEFzIGl0IGV4aXN0cyBpbiB0aGlzIHBhdGNoIHJlYWRzL3dyaXRlcyBmcm9tIG1h
c3RlciB0byBzbGF2ZcKgCj4gZnVuZGFtZW50YWxseSB3b3JrLsKgwqAKCk15IHVuZGVyc3RhbmRp
bmcgaXMgdGhleSAic2VlbSB0byB3b3JrIGlmIHlvdSBnZXQgbHVja3kgd2l0aCB0aGUgdGltaW5n
CmFuZCBmYWxsIGFwYXJ0IHVuZGVyIGxvYWQiLiBPciBkaWQgSSBoZWFyIHdyb25nID8KCj4gIEdp
dmVuIHRoZSBwZXJ2YXNpdmVuZXNzIGFuZCB0aW1lIHRvIGZ1bGx5IGV2YWx1YXRlwqAKPiBhbmQg
dGVzdCBhbnkgcHJvdG9jb2wgdXBkYXRlcyBJIGludGVuZCBhZGRyZXNzIHRoaXMgaW4gdGhlIG5l
YXIgZnV0dXJlwqAKPiB3aXRoIGEgc2VwYXJhdGUgZm9sbG93IG9uIHBhdGNoLgoKUGxlYXNlIHRy
eSB0aGUgc2ltcGxlIGNoYW5nZSBJIHByb3Bvc2VkIGluIG15IGVtYWlsLiBJdCdzIGEgNCBvciA1
CmxpbmVzIGNoYW5nZSBtYXggdG8geW91ciBjbG9ja190b2dnbGUgZnVuY3Rpb24gYW5kIGhvdyBp
dCdzIGNhbGxlZCBpbgpzZW5kIGFuZCByZWNlaXZlLiBJdCBzaG91bGQgYmUgdHJpdmlhbCB0byBj
aGVjayBpZiB0aGluZ3Mgc3RpbGwgInNlZW0KdG8gd29yayIgdG8gYmVnaW4gd2l0aC4KCkRvIHlv
dSBoYXZlIHNvbWUga2luZCBvZiB0ZXN0IG1lY2hhbmlzbSB0aGF0IGhhbW1lcnMgdGhlIEZTSQpj
b250aW51b3VzbHkgPyBTdWNoIGFzIGRvaW5nIGEgc2VyaWVzIG9mwqBwdXRtZW1wcm9jL2dldG1l
bXByb2MgJgpjaGVja2luZyB0aGUgdmFsdWVzID8KClRoZW4geW91IGNhbiBydW4gdGhhdCB3aGls
ZSBoYW1tZXJpbmcgdGhlIExQQyBidXMgYW5kIGdlbmVyYWxseSBwdXR0aW5nCnRoZSBCTUMgdW5k
ZXIgbG9hZCBhbmQgeW91J2xsIHF1aWNrbHkgc2VlIGlmIGl0J3MgcmVsaWFibGUgb3Igbm90LgoK
Q2hlZXJzLApCZW4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXJtLWtlcm5lbAo=
