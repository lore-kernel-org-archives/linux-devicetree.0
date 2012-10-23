From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 3/5] arm: mvebu: Added IPI support via doorbells
Date: Tue, 23 Oct 2012 07:50:28 +0200
Message-ID: <20121023075028.0f83d58e@skate>
References: <1350925368-24243-1-git-send-email-gregory.clement@free-electrons.com>
 <1350925368-24243-4-git-send-email-gregory.clement@free-electrons.com>
 <20121022173028.GM21046@lunn.ch>
 <50859976.6080601@free-electrons.com>
 <20121022200708.GO21046@lunn.ch>
 <5085B666.1040500@free-electrons.com>
 <20121023071419.222c46d3@skate> <20121023054455.GP21046@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121023054455.GP21046@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>, Will Deacon <will.deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Li Li <li.li@canonical.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Mike Turquette <mturquette@linaro.org>, linux-arm-
List-Id: devicetree@vger.kernel.org

QW5kcmV3LAoKT24gVHVlLCAyMyBPY3QgMjAxMiAwNzo0NDo1NSArMDIwMCwgQW5kcmV3IEx1bm4g
d3JvdGU6Cgo+IFRoYW5rcyBmb3IgdGhlIGNsZWFyIHJlcGx5LiBEb2VzIHRoZSBiaW5kaW5nIGRv
Y3VtZW50YXRpb24gbWFrZSB0aGlzCj4gY2xlYXI/IFNob3VsZCBpdCBiZSBleHRlbmRlZCB0byBp
bmRpY2F0ZSB3aGljaCBhZGRyZXNzIHJhbmdlIHNob3VsZCBiZQo+IHVzZWQ/CgpJbmRlZWQgaXQg
c2hvdWxkIGJlIGNsYXJpZmllZCBpbiB0aGUgRFQgYmluZGluZyBkb2N1bWVudGF0aW9uLiBJJ2xs
IHNlZQp3aXRoIEdyw6lnb3J5IHRvIGFkZCBzdWNoIGEgY2xhcmlmaWNhdGlvbiBpbiBoaXMgdjIg
b2YgdGhlIFNNUCBwYXRjaApzZXQsIGlmIHRoYXQncyBvayB3aXRoIHlvdS4KCkJlc3QgcmVnYXJk
cywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgRnJlZSBFbGVjdHJvbnMKS2VybmVsLCBk
cml2ZXJzLCByZWFsLXRpbWUgYW5kIGVtYmVkZGVkIExpbnV4CmRldmVsb3BtZW50LCBjb25zdWx0
aW5nLCB0cmFpbmluZyBhbmQgc3VwcG9ydC4KaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bAo=
