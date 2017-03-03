From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dt-bindings: drm: rcar-du: Document optional reset
 properties
Date: Fri, 3 Mar 2017 20:23:34 +0100
Message-ID: <CAMuHMdXgow=oF3e52MHANKywzFSeV8hzBUSY4GSxCOiti-EaJQ@mail.gmail.com>
References: <1488547835-25229-1-git-send-email-geert+renesas@glider.be>
 <2423895.QcDWT1fsiC@avalon>
 <CAMuHMdU=1O_ZZgAXWSecO=HRtZdY8s0LfEMuUkpgvr528HV+Jw@mail.gmail.com>
 <5304812.zzcGWdqkpi@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5304812.zzcGWdqkpi@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgTGF1cmVudCwKCk9uIEZyaSwgTWFyIDMsIDIwMTcgYXQgODoxNyBQTSwgTGF1cmVudCBQaW5j
aGFydAo8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiBPbiBGcmlk
YXkgMDMgTWFyIDIwMTcgMjA6MDM6MDkgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+PiBPbiBG
cmksIE1hciAzLCAyMDE3IGF0IDM6NDEgUE0sIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4+ID4g
V2hhdCdzIGluIHRoZSByZXNldCBzcGVjaWZpZXIgPwo+Pgo+PiBUaGF0IGRlcGVuZHMgb24gdGhl
IHJlc2V0IHByb3ZpZGVyLgo+Pgo+PiBTZWUgIlt2MiwxLzRdIGR0LWJpbmRpbmdzOiBjbG9jazog
cmVuZXNhczogY3BnLW1zc3I6IERvY3VtZW50IHJlc2V0IGNvbnRyb2wKPj4gc3VwcG9ydCIgKGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTUzNjYyNy8pIGZvciB0aGUgUmVuZXNh
cwo+PiBDUEcvTVNTUiBjYXNlLgo+Pgo+PiBFLmcuICJyZXNldHMgPSA8JmNwZyAzMTA+OyIKPgo+
IFRoYW5rcy4gSSBuZXZlciBrbm93IHdoZXRoZXIgdGhlIHNwZWNpZmllZCBpcyB0aGUgY29tYmlu
YXRpb24gb2YgcGhhbmRsZSArCj4gZGF0YSwgb3IgaXMgb25seSB0aGUgY2VsbHMgZm9sbG93aW5n
IHRoZSBwaGFuZGxlLgoKVHJpY2sgdG8gcmVtZW1iZXI6IHRoZSAjPGZvbz4tY2VsbHMgcHJvcGVy
dHkgdGVsbHMgaG93IG1hbnkgY2VsbHMgdGhlcmUKYXJlIGluIHRoZSBzcGVjaWZpZXIuCgpHcntv
ZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
