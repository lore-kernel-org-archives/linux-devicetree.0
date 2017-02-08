From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH for-4.11 1/2] Revert "phy: Add USB3 PHY support for
 Broadcom NSP SoC"
Date: Thu, 09 Feb 2017 00:39:08 +0100
Message-ID: <1b66f9ab3a9efd1bd0817a114e5b9ec9@milecki.pl>
References: <20170208233023.31922-1-zajec5@gmail.com>
 <82b47a03-c41b-378b-2d7c-f263eff514a9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <82b47a03-c41b-378b-2d7c-f263eff514a9@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMjAxNy0wMi0wOSAwMDozMiwgRmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPiBPbiAwMi8wOC8y
MDE3IDAzOjMwIFBNLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4+IEZyb206IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4gCj4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgZDdiYzFh
N2Q0MWJmICgicGh5OiBBZGQgVVNCMyBQSFkgc3VwcG9ydCBmb3IKPj4gQnJvYWRjb20gTlNQIFNv
QyIpIGFzIHdlIGFscmVhZHkgaGF2ZSBkcml2ZXIgZm9yIHRoaXMgUEhZIChzaGFyZWQgYnkgCj4+
IE5TCj4+IGFuZCBOU1ApLiBJdCB3YXMgYWRkZWQgaW4gY29tbWl0IGU1NjY2MjgxZDllYSAoInBo
eTogYmNtLW5zLXVzYjM6IG5ldwo+PiBkcml2ZXIgZm9yIFVTQiAzLjAgUEhZIG9uIE5vcnRoc3Rh
ciIpLgo+PiAKPj4gSW5zdGVhZCBvZiBhZGRpbmcgc2VwYXJhdGVkIGRyaXZlciAmIGR1cGxpY2F0
aW5nIGNvZGUgd2Ugc2hvdWxkIHdvcmsgCj4+IG9uCj4+IGltcHJvdmluZyBleGlzdGluZyAob2xk
KSBvbmUuIFRoYW5rcyB0byB3b3JrIGRvbmUgYnkgQnJvYWRjb20gd2Uga25vdwo+PiB0aGVyZSBp
cyBNRElPIGJ1cyB3ZSB3ZXJlbid0IGF3YXJlIG9mICYgd2Uga25vdyByZWdpc3RlciBuYW1lcyB3
aGljaAo+PiBtYWtlcyBpbml0aWFsaXphdGlvbiBtb3JlIGNsZWFyLiBUaGlzIGlzIHZlcnkgdmFs
dWFibGUgaW5mbyBhbmQgd2UKPj4gc2hvdWxkIHdvcmsgb24gdXNpbmcgaXQgaW4gZXhpc3Rpbmcg
ZHJpdmVyIGFmdGVyd2FyZHMuCj4gCj4gU2hvdWxkIG5vdCB3ZSBmaXJzdCBleHRlbmQgdGhlIG9s
ZCBkcml2ZXIgdG8gc3VwcG9ydCBOU1AgYW5kIHRoZW4gCj4gcmV2ZXJ0Cj4gZDdiYzFhN2Q0MWJm
ICgicGh5OiBBZGQgVVNCMyBQSFkgc3VwcG9ydCBmb3IgQnJvYWRjb20gTlNQIFNvQyIpPwoKU291
bmRzIGxpa2UgYSB3ZWlyZCAvIGRpcnR5IGRldmVsb3BtZW50IG1ldGhvZCB0byBtZTogYWRkaW5n
IGR1cGxpY2F0ZWQgCmNvZGUKZmlyc3QgdGhlbiB3b3JraW5nIG9uIGNsZWFuaW5nIGl0LiBVbmxl
c3MgeW91IG1lYW4gZHJpdmVycy9zdGFnaW5nLy4KCldlIGFsc28gc2hvdWxkIG5ldmVyIGRyb3Ag
c3VwcG9ydCBmb3Igc3VwcG9ydGVkIERUIGJpbmRpbmdzLCBzbyBJIHJlYWxseSAKdGhpbmsKaXQn
cyB0aGUgY2xlYW5lc3QgdG8gcmV2ZXJ0IGl0IG5vdy4KCkkgdGhpbmsgSm9uIHdhcyBhbHNvIE9L
IHdpdGggdGhpcyBzb2x1dGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
