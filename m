From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH 3/3] ARM: multi_v7_defconfig: enable STM32 SPI
Date: Tue, 26 Jun 2018 11:47:12 +0000
Message-ID: <120d8997-3184-bfed-26b7-e0ac7d995b74@st.com>
References: <1526566904-24514-1-git-send-email-amelie.delaunay@st.com>
 <1526566904-24514-4-git-send-email-amelie.delaunay@st.com>
 <e3bd3097-fbde-b790-e2b3-d78fb34b849d@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e3bd3097-fbde-b790-e2b3-d78fb34b849d@st.com>
Content-Language: en-US
Content-ID: <55F46414EAD27E4693744497095E9276@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgQWxleA0KDQpPbiAwNi8yNi8yMDE4IDEwOjQ0IEFNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3Rl
Og0KPiBIaSBBbcOpbGllDQo+IA0KPiBPbiAwNS8xNy8yMDE4IDA0OjIxIFBNLCBBbWVsaWUgRGVs
YXVuYXkgd3JvdGU6DQo+PiBFbmFibGUgdGhlIFNUTTMyIFNQSSBkcml2ZXIsIGltcGxlbWVudGVk
IG9uIFNUTTMyTVAxIFNvQy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbWVsaWUgRGVsYXVuYXkg
PGFtZWxpZS5kZWxhdW5heUBzdC5jb20+DQo+PiAtLS0NCj4+IMKgIGFyY2gvYXJtL2NvbmZpZ3Mv
bXVsdGlfdjdfZGVmY29uZmlnIHwgMSArDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92N19kZWZj
b25maWcgDQo+PiBiL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnDQo+PiBpbmRl
eCA4OTE2N2NkLi5mOTkwMzM1IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9hcm0vY29uZmlncy9tdWx0
aV92N19kZWZjb25maWcNCj4+ICsrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29u
ZmlnDQo+PiBAQCAtNDExLDYgKzQxMSw3IEBAIENPTkZJR19TUElfUzNDNjRYWD1tDQo+PiDCoCBD
T05GSUdfU1BJX1NIX01TSU9GPW0NCj4+IMKgIENPTkZJR19TUElfU0hfSFNQST15DQo+PiDCoCBD
T05GSUdfU1BJX1NJUkY9eQ0KPj4gK0NPTkZJR19TUElfU1RNMzI9eQ0KPj4gwqAgQ09ORklHX1NQ
SV9TVU40ST15DQo+PiDCoCBDT05GSUdfU1BJX1NVTjZJPXkNCj4+IMKgIENPTkZJR19TUElfVEVH
UkExMTQ9eQ0KPj4NCj4gDQo+IERyaXZlciB3aGljaCBhcmUgYXJlIG5vdCAidml0YWwiIHRvIGJv
b3QgU1RNMzIgcGxhdGZvcm0gc2hvdWxkIGJlIA0KPiBkZWZpbmVkIGFzIG1vZHVsZS4gSXQncyB0
aGUgY2FzZSBmb3IgdGhpcyBvbmUuIElzbid0ID8NCj4gDQoNCllvdSdyZSByaWdodC4gSSdsbCBz
ZW5kIHYyIHdpdGggQ09ORklHX1NQSV9TVE0zMj1tIEFTQVAuIFNob3VsZCBJIHJlc2VuZCANCnRo
ZSB3aG9sZSBwYXRjaHNldCAod2l0aCBEVCksIG9yIGp1c3QgdGhpcyBwYXRjaCBhbmQgeW91IHRh
a2UgdGhlIERUIA0KcGF0Y2hlcyBhcyB0aGV5IGFyZSA/DQoNClJlZ2FyZHMsDQpBbWVsaWUKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bAo=
