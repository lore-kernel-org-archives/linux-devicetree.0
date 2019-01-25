From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 0/3] at803x: Add quirk to disable SmartEEE
Date: Fri, 25 Jan 2019 20:07:56 +0100
Message-ID: <a8b8e82f-2b68-ed9d-6106-0542dddc1181@gmail.com>
References: <20190125125513.23656-1-ccaione@baylibre.com>
 <20190125130612.npknjuzjmny4yohg@e5254000004ec.dyn.armlinux.org.uk>
 <20190125184330.dm3kaoewvbwddacy@xps>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125184330.dm3kaoewvbwddacy@xps>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>, Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, abailon@baylibre.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, aisheng.dong@nxp.com, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

T24gMjUuMDEuMjAxOSAxOTo0OCwgQ2FybG8gQ2Fpb25lIHdyb3RlOgo+IE9uIDI1LzAxLzE5IDEz
OjA2LCBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4gd3JvdGU6Cj4+IE9uIEZyaSwgSmFu
IDI1LCAyMDE5IGF0IDEyOjU1OjEwUE0gKzAwMDAsIENhcmxvIENhaW9uZSB3cm90ZToKPj4+IFNt
YXJ0RUVFLCBjb21wYXRpYmxlIHdpdGggSUVFRTgwMi4zYXogc3RhbmRhcmQsIGlzIGRlc2lnbmVk
IHRvIGluY2x1ZGUKPj4+IGxlZ2FjeSBNQUMgd2l0aG91dCBFRUUgY2FwYWJpbGl0eSBpbnRvIHRo
ZSBwb3dlciBzYXZpbmcgc3lzdGVtLiBTbWFydEVFRQo+Pj4gaXMgZW5hYmxlZCBieSBkZWZhdWx0
IGNvbmZpZ3VyYXRpb24gb24gQVI4MDMxIGFmdGVyIHBvd2VyLW9uIG9yIGhhcmR3YXJlCj4+PiBy
ZXNldC4KPj4+Cj4+PiBVbmZvcnR1bmF0ZWx5IHRoaXMgaXMgcHJvdmVkIGNhdXNpbmcgaXNzdWVz
IGZvciBjZXJ0YWluIGh3Cj4+PiBjb25maWd1cmF0aW9ucy7CoCBXZSBhZGQgYSBxdWlyayB0byBv
cHRpb25hbGx5IGRpc2FibGUgU21hcnRFRUUuCj4+Cj4+IEl0IG1heSBiZSBhIGdvb2QgaWRlYSB0
byBkZXRhaWwgd2hhdCAiY2VydGFpbiBodyBjb25maWd1cmF0aW9ucyIgYXJlCj4+IGFuZC9vciB3
aGF0IHRoZSAiaXNzdWVzIiBhcmUsIHNvIGl0J3MgZWFzaWVyIHRvIGZpbmQgdGhpcyBpZi93aGVu
Cj4+IG90aGVycyBlbmNvdW50ZXIgdGhlIHNhbWUgaXNzdWUuCj4gCj4gVGhpcyBmaXggd2FzIHVw
c3RyZWFtZWQgZnJvbSB0aGUgaW14IGRvd25zdHJlYW0ga2VybmVsIHNvIEkgZG8gbm90IGhhdmUg
bXVjaCBpbmZvcm1hdGlvbnMgb24gdGhhdCBidXQgc29tZXRoaW5nIGlzIHJlcG9ydGVkIGluIHRo
ZSBVLUJvb3QgZml4IGZvciB0aGUgc2FtZSBwcm9ibGVtIGF0IFswXSBzbyBJJ2xsIGFkZCBtb3Jl
IGluZm8gaW4gdGhlIG5leHQgcmV2aXNpb24uCj4gCj4gQ2hlZXJzLAo+IAo+IFswXSBodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3BhdGNoLzEwMTU3ODMvCj4gClRoYW5rcyBmb3IgdGhlIGxp
bmsuIEFjY29yZGluZyB0byB0aGUgZGVzY3JpcHRpb24gU21hcnRFRUUgd29ya3Mgb25seSBpZgpi
b3RoIGxpbmsgcGFydG5lcnMgc3VwcG9ydCBpdCAoaGVuY2UgYXJlIEF0aGVyb3MgUEhZJ3MpLiBJ
IHdvdWxkIGFzc3VtZQp0aGF0IHRoaXMgdXN1YWxseSBpc24ndCB0aGUgY2FzZSwgc2hvdWxkbid0
IHRoZSBmZWF0dXJlIGJlIGFuIG9wdC1pbgp0aGVyZWZvcmU/CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
