From: "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/5] Documentation: DT: vdma: Rename vdma-chan prefix
 to dma-chan
Date: Thu, 7 Apr 2016 00:23:26 +0000
Message-ID: <1459988606.3136.88.camel@intel.com>
References: <1459959335-24083-1-git-send-email-appanad@xilinx.com>
	 <1459959335-24083-2-git-send-email-appanad@xilinx.com>
	 <20160406162022.GS23198@xsjsorenbubuntu>
	 <C246CAC1457055469EF09E3A7AC4E11A4A57364B@XAP-PVEXMBX01.xlnx.xilinx.com>
	 <57057C9B.8040804@metafoo.de> <1459980839.3136.87.camel@intel.com>
	 <20160406230014.GC16193@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160406230014.GC16193@xsjsorenbubuntu>
Content-Language: en-US
Content-ID: <18B47EE541BB484DAACE78066D833DDA-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "Williams, Dan J" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XWGXanvQGlWp@public.gmane.org
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE2LTA0LTA2IGF0IDE2OjAwIC0wNzAwLCBTw7ZyZW4gQnJpbmttYW5uIHdyb3Rl
Og0KPiBPbiBXZWQsIDIwMTYtMDQtMDYgYXQgMjI6MTM6NTkgKzAwMDAsIEtvdWwsIFZpbm9kIHdy
b3RlOg0KPiA+IE9uIFdlZCwgMjAxNi0wNC0wNiBhdCAyMzoxNiArMDIwMCwgTGFycy1QZXRlciBD
bGF1c2VuIHdyb3RlOg0KPiA+ID4gT24gMDQvMDYvMjAxNiAwNjoyNSBQTSwgQXBwYW5hIER1cmdh
IEtlZGFyZXN3YXJhIFJhbyB3cm90ZToNCj4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZG1hL3hpbGlueC94aWxpbnhfdmRtYS50eHQNCj4gPiA+ID4gPiA+ICsrKw0K
PiA+ID4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3hpbGlu
eC94aWxpbnhfdmRtYS50DQo+ID4gPiA+ID4gPiB4dA0KPiA+ID4gPiA+ID4gQEAgLTI0LDggKzI0
LDggQEAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4gPiA+ID4gPiA+ICAJezN9LCBmbHVzaCBzMm1t
IGNoYW5uZWwNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gIFJlcXVpcmVkIGNoaWxkIG5vZGUg
cHJvcGVydGllczoNCj4gPiA+ID4gPiA+IC0tIGNvbXBhdGlibGU6IEl0IHNob3VsZCBiZSBlaXRo
ZXIgInhsbngsYXhpLXZkbWEtbW0ycw0KPiA+ID4gPiA+ID4gLWNoYW5uZWwiDQo+ID4gPiA+ID4g
PiBvcg0KPiA+ID4gPiA+ID4gLQkieGxueCxheGktdmRtYS1zMm1tLWNoYW5uZWwiLg0KPiA+ID4g
PiA+ID4gKy0gY29tcGF0aWJsZTogSXQgc2hvdWxkIGJlIGVpdGhlciAieGxueCxheGktZG1hLW1t
MnMNCj4gPiA+ID4gPiA+IC1jaGFubmVsIg0KPiA+ID4gPiA+ID4gb3INCj4gPiA+ID4gPiA+ICsJ
InhsbngsYXhpLWRtYS1zMm1tLWNoYW5uZWwiLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoaXMg
Y2hhbmdlIGlzIG5vdCBiYWNrd2FyZHMgY29tcGF0aWJsZSBhbmQgYnJlYWtzIGV2ZXJ5IHVzZXIN
Cj4gPiA+ID4gPiBvZg0KPiA+ID4gPiA+IHRoZSBjdXJyZW50DQo+ID4gPiA+ID4gYmluZGluZy4N
Cj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgY29tbWl0IA0KPiA+ID4gPiBodHRwOi8vZ2l0Lmtlcm5l
bC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L3Zrb3VsL3NsYXZlLQ0KPiA+ID4gPiBkbWEuZ2l0
L2NvbW1pdC8/aD1uZXh0JmlkPThlNjZlN2Q2ODJiMDRmNzE0MWY4YWU2NjY5MDhjOGRjZDdmYzBi
DQo+ID4gPiA+IGZhIA0KPiA+ID4gPiBSZW5hbWVzIHhpbGlueF92ZG1hXyBwcmVmaXggdG8geGls
aW54X2RtYSB3aGljaCBpbmNsdWRlcw0KPiA+ID4gPiByZW5hbWluZyBvZg0KPiA+ID4gPiB0aGUg
YWJvdmUgcHJvcGVydGllcy4NCj4gPiANCj4gPiBUaGF0IHBhdGNoIGNoYW5nZXMgZHJpdmVyIGZy
b20gdmRtYSB0byBkbWEuIEl0IGRvZXMgbm90IGNoYW5nZQ0KPiA+IHByb3BlcnR5DQo+ID4gbmFt
ZSENCj4gDQo+IEl0IGRvZXMuIFVuZm9ydHVuYXRlbHkgdGhlcmUgYXJlIG5vIGxpbmUgbnVtYmVy
cyBvbiB0aGF0IHdlYnNpdGUsDQo+IGhlbmNlIGhlcmUgYW4gZXhjZXJwdA0KPiBmcm9tIHRoZSBj
b21taXQgeW91IG1lbnRpb246DQo+IEBAIC0xMjIwLDI2ICsxMjIwLDI2IEBAIHN0YXRpYyBpbnQg
eGlsaW54X3ZkbWFfY2hhbl9wcm9iZShzdHJ1Y3QNCj4geGlsaW54X3ZkbWFfZGV2aWNlICp4ZGV2
LA0KPiAgCWlmICghaGFzX2RyZSkNCj4gIAkJeGRldi0+Y29tbW9uLmNvcHlfYWxpZ24gPSBmbHMo
d2lkdGggLSAxKTsNCj4gIA0KPiAtCWlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAi
eGxueCxheGktdmRtYS1tbTJzDQo+IC1jaGFubmVsIikpIHsNCj4gKwlpZiAob2ZfZGV2aWNlX2lz
X2NvbXBhdGlibGUobm9kZSwgInhsbngsYXhpLWRtYS1tbTJzDQo+IC1jaGFubmVsIikpIHsNCj4g
IAkJY2hhbi0+ZGlyZWN0aW9uID0gRE1BX01FTV9UT19ERVY7DQo+ICAJCWNoYW4tPmlkID0gMDsN
Cg0KUmlnaHQsIG1pc3NlZCB0aGF0IHNvbWVob3cuDQoNCkFtIGRyb3BwaW5nIHRoZSBwYXRjaA0K
DQotLSANCn5WaW5vZA0K
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
