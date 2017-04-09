From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v4 19/23] drivers/fsi: Add GPIO based FSI master
Date: Mon, 10 Apr 2017 07:41:32 +1000
Message-ID: <1491774092.4166.195.camel@kernel.crashing.org>
References: <20170329174340.89109-1-cbostic@linux.vnet.ibm.com>
 <20170329174340.89109-20-cbostic@linux.vnet.ibm.com>
 <CACPK8XfOSYPidHF6=psC4mP-tkRyWTu0psdcK6EwA2E6FF53Uw@mail.gmail.com>
 <0e1bcf3a-e8d7-9f50-bdf7-2a1e7466665b@linux.vnet.ibm.com>
 <1490907014.3177.207.camel@kernel.crashing.org>
 <93b21624-11fc-b71b-aa78-6cb4371c87ae@linux.vnet.ibm.com>
 <1491344360.4166.68.camel@kernel.crashing.org>
 <5344146a-f450-7959-4688-a83ee022574b@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5344146a-f450-7959-4688-a83ee022574b@linux.vnet.ibm.com>
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

T24gU3VuLCAyMDE3LTA0LTA5IGF0IDE2OjIyIC0wNTAwLCBDaHJpc3RvcGhlciBCb3N0aWMgd3Jv
dGU6Cj4gQSAzIG1pY3Jvc2Vjb25kIGRlbGF5IGlzIHJlcXVpcmVkLCBob3dldmVyLCB0byBwcmV2
ZW50IG9jY2FzaW9uYWwgaXNzdWVzwqAKPiBkdXJpbmcgaGVhdnkgRlNJIGJ1cyBsb2FkIHN0cmVz
cyB0ZXN0aW5nLgo+IEEgMSBuYW5vc2Vjb25kIGRlbGF5IHVzaW5nIG5kZWxheSgxKSBoYWQgYmVl
biBzcGVjaWZpZWQgcHJpb3IgdG8gdGhpc8KgCj4gYnV0IGFmdGVyIGxvb2tpbmcgbW9yZSBjbG9z
ZWx5IGF0IHJlYWwgdGltZSBwZXJmb3JtYW5jZSBpdCB0dXJuZWQgb3V0IHRvwqAKPiBhY3R1YWxs
eSBiZSByb3VnaGx5IDEtMiBtaWNyb3NlY29uZHMuwqDCoCBUaGlzIGFwcGVhcnMgdG8gYmUgdGhl
IG1pbmltdW3CoAo+IHJlc29sdXRpb24gdXNpbmcgdGhlIGRlbGF5KCkgbGludXggbGlicmFyaWVz
IG9uIHRoZSBBU1QyNDAwLzI1MDAuwqDCoMKgCj4gR2l2ZW4gdGhpcywgaW5jcmVhc2luZyBkZWxh
eSB0byAzIG1pY3Jvc2Vjb25kcyBkb2Vzbid0IGltcGFjdMKgCj4gcGVyZm9ybWFuY2UgbXVjaCBj
b25zaWRlcmluZyBJIGNhbiBub3cgcmVtb3ZlIHRoZSBzYW1wbGUgaW5wdXQgZGVsYXnCoAo+IGJh
c2VkIG9uIHlvdXIgcmVjb21tZW5kYXRpb25zIHRvIHJlLW9yZGVyIHRoZSB0d28gY2xvY2sgZGVs
YXlzLgoKVGhpcyBpcyBodWdlIGRlbGF5cy4gV2Ugc2hvdWxkIGNvbnNpZGVyIGEgQVNUMnh4eCBz
cGVjaWZpYyB2YXJpYW50IG9mCnRoZSBiYWNrZW5kIHRoYXQgdXNlcyBub3BzIG9yIHNpbWlsYXIg
bGFiLWNhbGlicmF0ZWQgY29uc3RydWN0cwppbnN0ZWFkLiBPdGhlcndpc2Ugd2UgYXJlIHN0dWNr
IGluIHRoZSBrSHogcmFuZ2UsIHRoaXMgaXMgYSA+MjAwTWh6IGJ1cwo6KQoKSSBkb24ndCB1bmRl
cnN0YW5kIHdoeSAzdXMgZGVsYXkgd291bGQgdGh1cyBiZSBuZWNlc3NhcnkuCgpXaGVyZSBhYm91
dCBkaWQgeW91IG9ic2VydmUgaXNzdWVzID8gQ291bGQgaXQgYmUgdGhhdCB5b3UgZG9uJ3Qgd2Fp
dApsb25nIGVub3VnaCBpbiB0aGUgdHJhbnNpdGlvbnMgZnJvbSB3cml0ZSB0byByZWFkID8KCkNo
ZWVycywKQmVuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXJtLWtlcm5lbAo=
