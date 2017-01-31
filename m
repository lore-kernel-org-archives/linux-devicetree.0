From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCHv2 3/3] arm64: dts: marvell: adjust name of sd-mmc-gop
 clock in syscon
Date: Tue, 31 Jan 2017 11:52:40 +0100
Message-ID: <87bmun1oxz.fsf@free-electrons.com>
References: <1482316017-22154-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1482316017-22154-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170131114418.46e23bd4@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170131114418.46e23bd4@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 31 Jan 2017 11:44:18 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Boyd <sboyd@codeaurora.org>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Hanna Hawa <hannah@marvell.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgVGhvbWFzLAogCiBPbiBtYXIuLCBqYW52LiAzMSAyMDE3LCBUaG9tYXMgUGV0YXp6b25pIDx0
aG9tYXMucGV0YXp6b25pQGZyZWUtZWxlY3Ryb25zLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+Cj4g
T24gV2VkLCAyMSBEZWMgMjAxNiAxMToyNjo1NyArMDEwMCwgVGhvbWFzIFBldGF6em9uaSB3cm90
ZToKPj4gVGhpcyBjb21taXQgYWRqdXN0cyB0aGUgbmFtZXMgb2YgZ2F0YWJsZSBjbG9jayAjMTgg
b2YgdGhlIE1hcnZlbGwgQXJtYWRhCj4+IENQMTEwIHN5c3RlbSBjb250cm9sbGVyLiBUaGlzIGNs
b2NrIG5vdCBvbmx5IGNvbnRyb2xzIFNEL01NQywgYnV0IGFsc28KPj4gdGhlIEdPUCAoR3JvdXAg
T2YgUG9ydHMpIHVzZWQgZm9yIG5ldHdvcmtpbmcuIFNvIHRoZSBjbG9jayBpcyByZW5hbWVkIHRv
Cj4+IHtjcG0sY3BzfS1zZC1tbWMtZ29wIGluc3RlYWQgb2Yge2NwbSxjcHN9LXNkLW1tYy4KPj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAZnJl
ZS1lbGVjdHJvbnMuY29tPgo+Cj4gR3LDqWdvcnksIHNpbmNlIHBhdGNoZXMgMS8zIGFuZCAyLzMg
b2YgdGhpcyBzZXJpZXMgaGF2ZSBiZWVuIGFwcGxpZWQsCj4gY291bGQgeW91IHRha2UgdGhpcyBQ
QVRDSCAzLzMgPwoKSSBjb21wbGV0ZWx5IG1pc3NlZCB0aGlzIHBhdGNoIQoKTm93LCBhcHBsaWVk
IG9uIG12ZWJ1L2R0NjQKClRoYW5rcywKCkdyZWdvcnkKCgoKPgo+IFRoYW5rcyEKPgo+IFRob21h
cwo+IC0tIAo+IFRob21hcyBQZXRhenpvbmksIENUTywgRnJlZSBFbGVjdHJvbnMKPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNv
bQoKLS0gCkdyZWdvcnkgQ2xlbWVudCwgRnJlZSBFbGVjdHJvbnMKS2VybmVsLCBkcml2ZXJzLCBy
ZWFsLXRpbWUgYW5kIGVtYmVkZGVkIExpbnV4CmRldmVsb3BtZW50LCBjb25zdWx0aW5nLCB0cmFp
bmluZyBhbmQgc3VwcG9ydC4KaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWls
aW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
