From: Barry Song <Barry.Song-kQvG35nSl+M@public.gmane.org>
Subject: RE: [PATCH] mfd: Support SiRF audio modules
Date: Tue, 11 Mar 2014 01:43:23 +0000
Message-ID: <5EB3BFCD089AD643B9BB63439F5FD5E9012BE2D157@SHAASIEXM01.ASIA.ROOT.PRI>
References: <1394184531-7679-1-git-send-email-rongjun.ying@csr.com>
 <20140310103532.GI14976@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140310103532.GI14976@lee--X1>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, RongJun Ying <rjying-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, DL-SHA-WorkGroupLinux <DL-SHA-WorkGroupLinux-z7JfP6tgrtVrifDez5n5bw@public.gmane.org>, Rongjun Ying <Rongjun.Ying-kQvG35nSl+M@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9zaXJmL2F1ZGlv
LmggYi9pbmNsdWRlL2xpbnV4L21mZC9zaXJmL2F1ZGlvLmgNCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLmQ4Y2ZmZjkN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9t
ZmQvc2lyZi9hdWRpby5oDQo+ID4gQEAgLTAsMCArMSwxNyBAQA0KPiA+ICsv
Kg0KPiA+ICsgKiBhdWRpby5oDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdo
dCAoYykgMjAxNCBDYW1icmlkZ2UgU2lsaWNvbiBSYWRpbyBMaW1pdGVkLCBh
IENTUiBwbGMgZ3JvdXANCj4gY29tcGFueS4NCj4gPiArICoNCj4gPiArICog
TGljZW5zZWQgdW5kZXIgR1BMdjIgb3IgbGF0ZXIuDQo+ID4gKyAqLw0KPiAN
Cj4gVXNlIGEgc3RhbmRhcmQgaGVhZGVyIHBsZWFzZQ0KDQpJIHRoaW5rIHRo
aXMgaGFzIGJlZW4gYSBzdGFuZGFyZCBoZWFkZXIuIEl0IGlzIG9uZSBzaW1w
bGVyIHZlcnNpb24gZm9yIGxpY2Vuc2UuDQpJZiB0aGVyZSBpcyBhbnkgcHJv
YmxlbSBoZXJlLCBpdCBzaG91bGQgYmUgdGhlIDFzdCBsaW5lLCB3ZSBtaWdo
dCByZXBsYWNlIGF1ZGlvLmggYnkgYSBzaW1wbGUgZGVzY3JpcHRpb24gb2Yg
dGhpcyBmaWxlLg0KDQotYmFycnkNCg0KCgpNZW1iZXIgb2YgdGhlIENTUiBw
bGMgZ3JvdXAgb2YgY29tcGFuaWVzLiBDU1IgcGxjIHJlZ2lzdGVyZWQgaW4g
RW5nbGFuZCBhbmQgV2FsZXMsIHJlZ2lzdGVyZWQgbnVtYmVyIDQxODczNDYs
IHJlZ2lzdGVyZWQgb2ZmaWNlIENodXJjaGlsbCBIb3VzZSwgQ2FtYnJpZGdl
IEJ1c2luZXNzIFBhcmssIENvd2xleSBSb2FkLCBDYW1icmlkZ2UsIENCNCAw
V1osIFVuaXRlZCBLaW5nZG9tCk1vcmUgaW5mb3JtYXRpb24gY2FuIGJlIGZv
dW5kIGF0IHd3dy5jc3IuY29tLiBLZWVwIHVwIHRvIGRhdGUgd2l0aCBDU1Ig
b24gb3VyIHRlY2huaWNhbCBibG9nLCB3d3cuY3NyLmNvbS9ibG9nLCBDU1Ig
cGVvcGxlIGJsb2csIHd3dy5jc3IuY29tL3Blb3BsZSwgWW91VHViZSwgd3d3
LnlvdXR1YmUuY29tL3VzZXIvQ1NScGxjLCBGYWNlYm9vaywgd3d3LmZhY2Vi
b29rLmNvbS9wYWdlcy9DU1IvMTkxMDM4NDM0MjUzNTM0LCBvciBmb2xsb3cg
dXMgb24gVHdpdHRlciBhdCB3d3cudHdpdHRlci5jb20vQ1NSX3BsYy4KTmV3
IGZvciAyMDE0LCB5b3UgY2FuIG5vdyBhY2Nlc3MgdGhlIHdpZGUgcmFuZ2Ug
b2YgcHJvZHVjdHMgcG93ZXJlZCBieSBhcHRYIGF0IHd3dy5hcHR4LmNvbS4K
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
