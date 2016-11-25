From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Question regarding clocks in the DW-HDMI DT bindings
Date: Fri, 25 Nov 2016 17:56:04 +0200
Message-ID: <1816061.yACa48VjbY@avalon>
References: <2778019.JJI4Lz6scm@avalon> <2404891.arL9itCrmb@avalon>
 <CAOMZO5CJTu7jzCb-iVLe2wt8VjyzWq-oYaC2Jw34V8SgaqrGkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAOMZO5CJTu7jzCb-iVLe2wt8VjyzWq-oYaC2Jw34V8SgaqrGkw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeauraro.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, nickey.yang@rock-chips.com, Andy Yan <andy.yan@rock-chips.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org

SGkgRmFiaW8sCgpPbiBGcmlkYXkgMjUgTm92IDIwMTYgMTM6Mjk6MzcgRmFiaW8gRXN0ZXZhbSB3
cm90ZToKPiBPbiBGcmksIE5vdiAyNSwgMjAxNiBhdCAxOjIyIFBNLCBMYXVyZW50IFBpbmNoYXJ0
IHdyb3RlOgo+ID4+IEkgZ290IHRoZSBjbG9jayBuYW1lIGZyb20gSS5NWDZRIFRSTSwgSSBhbHNv
IGNoZWNrZWQgdGhlIG5hbWUgYWdhaW4KPiA+PiB3aXRoIFJvY2tjaGlwIElDIGRlc2lnbiB0ZWFt
IG5vdywgaG9wZSB0byBnZXQgc29tZSBuZXcgaW5mb3JtYXRpb24gc29vbi4KPiA+IAo+ID4gVGhh
bmsgeW91LiBXaGlsZSBhdCBpdCwgY291bGQgeW91IGFzayB0aGVtIHdoaWNoIHZlcnNpb24gb2Yg
dGhlIERXIEhETUkgSVAKPiA+IHVzZWQgaW4gdGhlIFNvQyA/Cj4gCj4gRFcgSERNSSBJUCB1c2Vk
IGluIFJvY2tjaGlwIGlzOgo+IGR3aGRtaS1yb2NrY2hpcCBmZjk4MDAwMC5oZG1pOiBEZXRlY3Rl
ZCBIRE1JIGNvbnRyb2xsZXIgMHgyMDoweGE6MHhhMDoweGMxCj4gCj4gYXMgc2hvd24gYXQKPiBo
dHRwczovL3N0b3JhZ2Uua2VybmVsY2kub3JnL21haW5saW5lL3Y0LjktcmM2LTE1Ny1nMTZhZTE2
YzZlNTYxL2FybS1tdWx0aV8KPiB2N19kZWZjb25maWcvbGFiLWNvbGxhYm9yYS9ib290LXJrMzI4
OC1yb2NrMi1zcXVhcmVfcm9vdGZzOm5mcy5odG1sCj4gCj4gRFcgSERNSSBJUCB1c2VkICBvbiBt
eDZxIGlzOgo+IGR3aGRtaS1pbXggMTIwMDAwLmhkbWk6IERldGVjdGVkIEhETUkgY29udHJvbGxl
ciAweDEzOjB4YToweGEwOjB4YzEKClRoYW5rIHlvdSBmb3IgdGhlIGluZm9ybWF0aW9uLiBUaGlz
IGlzIHdoYXQgSSBnZXQgb24gdGhlIFJlbmVzYXMgUi1DYXIgSDMuCgpyY2FyLWR3LWhkbWkgZmVh
ZDAwMDAuaGRtaTA6IERldGVjdGVkIEhETUkgY29udHJvbGxlciAweDIwOjB4MWE6MHhhMDoweGMx
CnJjYXItZHctaGRtaSBmZWFlMDAwMC5oZG1pMTogRGV0ZWN0ZWQgSERNSSBjb250cm9sbGVyIDB4
MjA6MHgxYToweGEwOjB4YzEKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
