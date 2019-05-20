From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH RE-RESEND 1/2] drm/panel: Add support for Armadeus ST0700
 Adapt
Date: Mon, 20 May 2019 09:34:24 +0200
Message-ID: <0c5d70db-e7c1-5d02-9c33-65dabd431a68@armadeus.com>
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5B2nMsVNO6O_D+YTSjux=-DjNPGxhkEi3AQquOZVODumA@mail.gmail.com>
 <20190507161950.GA24879@ravnborg.org>
 <20190508083303.GR17751@phenom.ffwll.local>
 <20190508090612.GT17751@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190508090612.GT17751@phenom.ffwll.local>
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
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, stable <stable@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGVsbG8gU2FtLAoKT24gNS84LzE5IDExOjA2IEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9u
IFdlZCwgTWF5IDA4LCAyMDE5IGF0IDEwOjMzOjAzQU0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3Jv
dGU6Cj4+IE9uIFR1ZSwgTWF5IDA3LCAyMDE5IGF0IDA2OjE5OjUwUE0gKzAyMDAsIFNhbSBSYXZu
Ym9yZyB3cm90ZToKPj4+IEhpIEZhYmlvCj4+Pgo+Pj4gT24gVHVlLCBNYXkgMDcsIDIwMTkgYXQg
MTI6MzM6MzlQTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPj4+PiBbQWRkaW5nIFNhbSwg
d2hvIGlzIGhlbHBpbmcgdG8gcmV2aWV3L2NvbGxlY3QgcGFuZWwtc2ltcGxlIHBhdGNoZXNdCj4+
Pj4KPj4+PiBPbiBUdWUsIE1heSA3LCAyMDE5IGF0IDEyOjI3IFBNIFPDqWJhc3RpZW4gU3p5bWFu
c2tpCj4+Pj4gPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPiB3cm90ZToKPj4+Pj4K
Pj4+Pj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBBcm1hZGV1cyBTVDA3MDAgQWRh
cHQuIEl0IGNvbWVzIHdpdGggYQo+Pj4+PiBTYW50ZWsgU1QwNzAwSTVZLVJCU0xXIDcuMCIgV1ZH
QSAoODAweDQ4MCkgVEZUIGFuZCBhbiBhZGFwdGVyIGJvYXJkIHNvCj4+Pj4+IHRoYXQgaXQgY2Fu
IGJlIGNvbm5lY3RlZCBvbiB0aGUgVEZUIGhlYWRlciBvZiBBcm1hZGV1cyBEZXYgYm9hcmRzLgo+
Pj4+Pgo+Pj4+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY0LjE5Cj4+Pj4+IFJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+
Cj4+PiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+Pj4KPj4+
IElmIHlvdSB3aWwgbHJlc2VuZCB0aGUgcGF0Y2ggSSBjYW4gYXBwbHkgaXQuCj4+PiBJIGhhdmUg
bG9zdCB0aGUgb3JpZ2luYWwgbWFpbC4KPj4KPj4gVXN1YWxseSBwYXRjaHdvcmsgc2hvdWxkIGhh
dmUgaXQgYWxyZWFkeSAoYW5kIHlvdSBjYW4gcGlwZSB0aGUgcmF3Cj4+IHBhdGNod29yayBtYm94
IGludG8gZGltIGFwcGx5KSwgYnV0IHNvbWVob3cgaXQncyBub3QgdGhlcmUgZWl0aGVyLgo+PiBO
b3Qgc3VyZSB3aHksIHNvbWV0aW1lcyB0aGlzIGlzIGJlY2F1c2UgbWFpbHMgYXJlIHN0dWNrIGlu
IG1vZGVyYXRpb24sCj4+IHNvbWV0aW1lcyBiZWNhdXNlIHBlb3BsZSBkbyBpbnRlcmVzdGluZyB0
aGluZ3Mgd2l0aCB0aGVpciBtYWlscyAoZS5nLiBzbXRwCj4+IHNlcnZlcnMgbWFuZ2xpbmcgZm9y
bWF0dGluZykuCj4gCj4gcGF0Y2h3b3JrIHdhcyBqdXN0IGEgYml0IHNsb3csIGl0J3MgdGhlcmUg
bm93Ogo+IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjA0MDgv
Cj4gCgpXaWxsIHlvdSB0YWtlIHRoZSBwYXRjaCBmcm9tIHBhdGNod29yayBvciBzaG91bGQgSSBy
ZXNlbnQgaXQgPwoKUmVnYXJkcywKCj4gQ2hlZXJzLCBEYW5pZWwKPiAKCgotLSAKU8OpYmFzdGll
biBTenltYW5za2kKU29mdHdhcmUgZW5naW5lZXIsIEFybWFkZXVzIFN5c3RlbXMKVGVsOiArMzMg
KDApOSA3MiAyOSA0MSA0NApGYXg6ICszMyAoMCk5IDcyIDI4IDc5IDI2CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
