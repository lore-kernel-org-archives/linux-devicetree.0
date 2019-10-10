From: "Sa, Nuno" <Nuno.Sa@analog.com>
Subject: Re: [PATCH v3 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
Date: Thu, 10 Oct 2019 15:05:24 +0000
Message-ID: <eace751502e84651d4bc727b59464f7cfbbebbd5.camel@analog.com>
References: <20191010074234.7344-1-nuno.sa@analog.com>
 <20191010140512.GT2036@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191010140512.GT2036@sirena.org.uk>
Content-Language: en-US
Content-ID: <E145CDC4C8B2AC45B4D5E59FB7BC8EAC@namprd03.prod.outlook.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: "broonie@kernel.org" <broonie@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "lars@metafoo.de" <lars@metafoo.de>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE5LTEwLTEwIGF0IDE1OjA1ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiAN
Cj4gT24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDk6NDI6MzNBTSArMDIwMCwgTnVubyBTw6Egd3Jv
dGU6DQo+IA0KPiA+ICsJCQkvKiBwb3dlciBvbiAqLw0KPiA+ICsJCQlyZXQgPSByZWd1bGF0b3Jf
ZW5hYmxlKHN0LT5pb3ZkZCk7DQo+ID4gKwkJCWlmIChyZXQpDQo+ID4gKwkJCQlyZXR1cm4gcmV0
Ow0KPiA+ICsNCj4gPiArCQkJLyogdGhlcmUncyBubyB0aW1pbmcgY29uc3RyYWludHMgYmVmb3Jl
DQo+ID4gZW5hYmxpbmcgZHZkZCAqLw0KPiA+ICsJCQlyZXQgPSByZWd1bGF0b3JfZW5hYmxlKHN0
LT5kdmRkKTsNCj4gPiArCQkJaWYgKHJldCkgew0KPiA+ICsJCQkJcmVndWxhdG9yX2Rpc2FibGUo
c3QtPmlvdmRkKTsNCj4gPiArCQkJCXJldHVybiByZXQ7DQo+ID4gKwkJCX0NCj4gDQo+IFlvdSBj
b3VsZCB1c2UgcmVndWxhdG9yX2J1bGtfZW5hYmxlKCkgaGVyZSAoYW5kIHNpbWlsYXJseSBvbg0K
PiBkaXNhYmxlKSBidXQgaXQgZG9lc24ndCBmdW5kYW1lbnRhbGx5IG1hdHRlciAtIHRoZXkgZG8g
Z3VhcmFudGVlDQo+IHRoYXQgdGhleSdsbCBkbyB0aGluZ3MgaW4gc2VxdWVuY2UsIHRob3VnaCB0
aGV5IGRvbid0IHdhaXQgZm9yDQo+IHRoZSByYW1wIHRvIGNvbXBsZXRlIGJlZm9yZSBraWNraW5n
IG9mZiB0aGUgbmV4dCBlbmFibGUgaW4gdGhlDQo+IHNlcXVlbmNlIHdoaWNoIGNhbiBiZSBhbiBp
c3N1ZSBmb3Igc29tZSBoYXJkd2FyZS4NCg0KWWVzLCByZWd1bGF0b3JfYnVsa19lbmFibGUoKSBj
b3VsZCBmaXQuIFRoZSBvbmx5IHRoaW5nIHRoYXQgd29ycmllcyBtZQ0KaXMgdGhhdCB3ZSBvbmx5
IGNoZWNrIGZvciBlcnJvcnMgcmV0dXJuZWQgZnJvbSByZWd1bGF0b3JfZW5hYmxlKCkgYWZ0ZXIN
CmFsbCBhc3luYyB3b3JrIGlzIGRvbmUgKHdoaWNoIGlzIHByb2JhYmx5IHdoYXQgeW91IG1lYW4g
YnkgInRoZXkgZG9uJ3QNCndhaXQgZm9yIHRoZSByYW1wIHRvIGNvbXBsZXRlIGJlZm9yZSBraWNr
aW5nIG9mZiB0aGUgbmV4dCBlbmFibGUuLi4iKQ0Kd2hpY2ggY291bGQgbGVhdmUgdXMgd2l0aCBE
VkREIGFwcGxpZWQgd2l0aG91dCBJT1ZERCBmb3IgYSBzaG9ydCBhbW91bnQNCm9mIHRpbWUuIEkn
bSBub3Qgc3VyZSB0aGlzIHdvdWxkIGJlIGEgcmVhbGx5IGlzc3VlIGFuZCB0aGF0IHdvdWxkDQpk
YW1hZ2UgdGhlIEhXLCBidXQgZnJvbSB3aGF0IEkgY2FuIHRlbGwgZnJvbSB0aGUgZGF0YXNoZWV0
LCBJdCdzIG5vdA0KYWR2aXNlZCB0byBhcHBseSBEVkREIHdpdGhvdXQgSU9WREQuDQoNCk51bm8g
U8OhDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
