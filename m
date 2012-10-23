From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 3/5] arm: mvebu: Added IPI support via doorbells
Date: Tue, 23 Oct 2012 07:14:19 +0200
Message-ID: <20121023071419.222c46d3@skate>
References: <1350925368-24243-1-git-send-email-gregory.clement@free-electrons.com>
 <1350925368-24243-4-git-send-email-gregory.clement@free-electrons.com>
 <20121022173028.GM21046@lunn.ch>
 <50859976.6080601@free-electrons.com>
 <20121022200708.GO21046@lunn.ch>
 <5085B666.1040500@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5085B666.1040500@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Will Deacon <will.deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Li Li <li.li@canonical.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.or
List-Id: devicetree@vger.kernel.org

Ck9uIE1vbiwgMjIgT2N0IDIwMTIgMjM6MTE6MDIgKzAyMDAsIEdyZWdvcnkgQ0xFTUVOVCB3cm90
ZToKCj4gVGhlIGNvcnJlY3QgZXhwbGFuYXRpb24gaXMgdGhhdCB0aGUgb2Zmc2V0ICsyMTA3MCBp
cyBhIENQVSB2aXJ0dWFsIG9mZnNldC4KPiBUaGF0IG1lYW5zIHRoYXQgZGVwZW5kaW5nIG9mIHRo
ZSBDUFUgY29yZSB3aGljaCB3aWxsIGFjY2VzcyB0byB0aGlzIHJlZ2lzdGVyLAo+IHRoZSBjb250
cm9sbGVyIHdpbGwgaW50ZXJuYWxseSBjaGFuZ2UgdGhlIG9mZnNldCBhdXRvbWFnaWNhbGx5IHRv
IHBvaW50IHRoZQo+IGNvcnJlY3Qgb2Zmc2V0Lgo+IAo+IEkgc2hvdWxkIGhhdmUgYWRkZWQgYW4g
ZXhwbGFuYXRpb24gaW4gdGhlIGNvbW1pdCBsb2cuIEkgd2lsbCBkbyBpdCBmb3IgVjIuCgpKdXN0
IHRvIGV4cGFuZCBvbiBHcsOpZ29yeSdzIGNvbW1lbnQ6IHRoZXJlIGlzIHBlci1DUFUgYmFua2lu
ZyBmb3IgdGhlCmludGVycnVwdCBjb250cm9sbGVyIHJlZ2lzdGVycy4gQXQgMHgyMTA3MCwgeW91
IGhhdmUgInZpcnR1YWwiCnJlZ2lzdGVycyB0aGF0IGF1dG9tYXRpY2FsbHkgbWFwIHRvIHRoZSBp
bnRlcnJ1cHQgY29udHJvbGxlciByZWdpc3RlcnMKb2YgdGhlIGN1cnJlbnQgQ1BVLiBBdCAweDIx
ODcwLCB5b3UgaGF2ZSB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXJzCnJlZ2lzdGVycyBvZiBDUFUw
LCByZWdhcmRsZXNzIG9mIHdoaWNoIENQVSB5b3UgYXJlIHJ1bm5pbmcgb24uCgpCZWZvcmUgdGhp
cyBwYXRjaCBzZXQsIHRoZXJlIHdhcyBubyBTTVAgc3VwcG9ydCBmb3IgQXJtYWRhIDM3MC9YUCwg
c28KYWNjZXNzaW5nIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciByZWdpc3RlcnMgYXQgMHgyMTg3
MCB3YXMgT0sKKGFjY2Vzc2luZyB0aGVtIGZyb20gMHgyMTA3MCB3b3VsZCBoYXZlIGJlZW4gT0sg
YXMgd2VsbCkuIFdpdGggdGhlCmludHJvZHVjdGlvbiBvZiBTTVAgc3VwcG9ydCwgYWNjZXNzaW5n
IHRoZW0gZnJvbSAweDIxODcwIG5vIGxvbmdlcgp3b3Jrcywgc28gd2Ugc3dpdGNoIHRvIHRoZSB2
aXJ0dWFsIHJlZ2lzdGVycyBhdCAweDIxMDcwLgoKSW4gb3RoZXIgd29yZHM6IG5vIGl0IGlzIG5v
dCBhIGJ1ZyBmaXggYW5kIGl0IHRoZXJlZm9yZSBkb2Vzbid0IG5lZWQgdG8KZ28gaW50byAzLjcu
CgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIEZyZWUgRWxlY3Ry
b25zCktlcm5lbCwgZHJpdmVycywgcmVhbC10aW1lIGFuZCBlbWJlZGRlZCBMaW51eApkZXZlbG9w
bWVudCwgY29uc3VsdGluZywgdHJhaW5pbmcgYW5kIHN1cHBvcnQuCmh0dHA6Ly9mcmVlLWVsZWN0
cm9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwK
