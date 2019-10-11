From: "Sa, Nuno" <Nuno.Sa@analog.com>
Subject: Re: [PATCH v3 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
Date: Fri, 11 Oct 2019 07:03:15 +0000
Message-ID: <944157fe22c59a997e86287ff9cd686be91ac0df.camel@analog.com>
References: <20191010074234.7344-1-nuno.sa@analog.com>
 <20191010140512.GT2036@sirena.org.uk>
 <eace751502e84651d4bc727b59464f7cfbbebbd5.camel@analog.com>
 <20191010153623.GD4741@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20191010153623.GD4741@sirena.org.uk>
Content-Language: en-US
Content-ID: <889624787611C244ABD41E62A3C6D110@namprd03.prod.outlook.com>
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

T24gVGh1LCAyMDE5LTEwLTEwIGF0IDE2OjM2ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiAN
Cj4gT24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDM6MDU6MjRQTSArMDAwMCwgU2EsIE51bm8gd3Jv
dGU6DQo+ID4gT24gVGh1LCAyMDE5LTEwLTEwIGF0IDE1OjA1ICswMTAwLCBNYXJrIEJyb3duIHdy
b3RlOg0KPiA+ID4gWW91IGNvdWxkIHVzZSByZWd1bGF0b3JfYnVsa19lbmFibGUoKSBoZXJlIChh
bmQgc2ltaWxhcmx5IG9uDQo+ID4gPiBkaXNhYmxlKSBidXQgaXQgZG9lc24ndCBmdW5kYW1lbnRh
bGx5IG1hdHRlciAtIHRoZXkgZG8gZ3VhcmFudGVlDQo+ID4gPiB0aGF0IHRoZXknbGwgZG8gdGhp
bmdzIGluIHNlcXVlbmNlLCB0aG91Z2ggdGhleSBkb24ndCB3YWl0IGZvcg0KPiA+ID4gdGhlIHJh
bXAgdG8gY29tcGxldGUgYmVmb3JlIGtpY2tpbmcgb2ZmIHRoZSBuZXh0IGVuYWJsZSBpbiB0aGUN
Cj4gPiA+IHNlcXVlbmNlIHdoaWNoIGNhbiBiZSBhbiBpc3N1ZSBmb3Igc29tZSBoYXJkd2FyZS4N
Cj4gPiBZZXMsIHJlZ3VsYXRvcl9idWxrX2VuYWJsZSgpIGNvdWxkIGZpdC4gVGhlIG9ubHkgdGhp
bmcgdGhhdCB3b3JyaWVzDQo+ID4gbWUNCj4gPiBpcyB0aGF0IHdlIG9ubHkgY2hlY2sgZm9yIGVy
cm9ycyByZXR1cm5lZCBmcm9tIHJlZ3VsYXRvcl9lbmFibGUoKQ0KPiA+IGFmdGVyDQo+ID4gYWxs
IGFzeW5jIHdvcmsgaXMgZG9uZSAod2hpY2ggaXMgcHJvYmFibHkgd2hhdCB5b3UgbWVhbiBieSAi
dGhleQ0KPiA+IGRvbid0DQo+ID4gd2FpdCBmb3IgdGhlIHJhbXAgdG8gY29tcGxldGUgYmVmb3Jl
IGtpY2tpbmcgb2ZmIHRoZSBuZXh0DQo+ID4gZW5hYmxlLi4uIikNCj4gPiB3aGljaCBjb3VsZCBs
ZWF2ZSB1cyB3aXRoIERWREQgYXBwbGllZCB3aXRob3V0IElPVkREIGZvciBhIHNob3J0DQo+ID4g
YW1vdW50DQo+ID4gb2YgdGltZS4gSSdtIG5vdCBzdXJlIHRoaXMgd291bGQgYmUgYSByZWFsbHkg
aXNzdWUgYW5kIHRoYXQgd291bGQNCj4gPiBkYW1hZ2UgdGhlIEhXLCBidXQgZnJvbSB3aGF0IEkg
Y2FuIHRlbGwgZnJvbSB0aGUgZGF0YXNoZWV0LCBJdCdzDQo+ID4gbm90DQo+ID4gYWR2aXNlZCB0
byBhcHBseSBEVkREIHdpdGhvdXQgSU9WREQuDQo+IA0KPiBZZWFoLCBleGFjdGx5LiAgT1RPSCB0
aGluZ3MgbGlrZSB0aGF0IChlc3BlY2lhbGx5IGZvciBicmllZiB0aW1lDQo+IHBlcmlvZHMpIGFy
ZSBtdWNoIG1vcmUgbGlrZWx5IHRvIHJlc3VsdCBpbiB0aGUgY2hpcCBiZWluZyBpbiBzb21lDQo+
IHdlaXJkIHN0YXRlIG9uIGluaXQgd2hpY2ggd29uJ3QgbWF0dGVyIGlmIHdlIGltbWVkaWF0ZWx5
IHBvd2VyDQo+IG9mZiB0aGFuIGFueXRoaW5nIGVsc2UuICBMaWtlIEkgc2F5IGl0J3Mgbm90IGEg
cmVxdWlyZW1lbnQgdG8gdXNlDQo+IGJ1bGsgb3BlcmF0aW9ucy4NCg0KWWVhaCwgdGhhdCdzIHBy
b2JhYmx5IHJpZ2h0LiBJIGNhbiBhbHNvIGRvIHNvbWUgaW50ZXJuYWwgcXVlcnlpbmcgdG8NCnVu
ZGVyc3RhbmQgaWYgdGhpcyBjb3VsZCByZWFsbHkgZGFtYWdlIHRoZSBwYXJ0LiBJZiBub3QgYW5k
IHNpbmNlIEkNCmhhdmUgdG8gcHJlcGFyZSBhIHY0IGVpdGhlciB3YXkgKGZvciBkdCBiaW5kaW5n
cyksIEkgd2lsbCB1c2UNCnJlZ3VsYXRvcl9idWxrX2VuYWJsZSgpLg0KDQpOdW5vIFPDoQ0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
