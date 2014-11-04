From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 0/2] make imx hdmi publicly used by dw hdmi compatible
 platform
Date: Tue, 4 Nov 2014 14:29:09 +0000
Message-ID: <20141104142908.GG4042@n2100.arm.linux.org.uk>
References: <1415107992-34289-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1415107992-34289-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: heiko@sntech.de, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBOb3YgMDQsIDIwMTQgYXQgMDk6MzM6MTBQTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6
Cj4gRnJvbTogQW5keSB5YW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+IAo+IFdlIGZvdW5k
IGZyZWVzY2FsZSBpbXg2IGFuZCByb2NrY2hpcCByazMyODggYW5kIEluZ2VuaWMgSlo0NzgwIChY
YnVyc3QvTUlQUykKPiB1c2UgdGhlIGludGVyZmFjZSBjb21wYXRpYmxlIERlc2lnbndhcmUgSERN
SSBJUCwgYnV0IHRoZXkgYWxzbyBoYXZlIHNvbWUKPiBsaWdodGx5IGRpZmZlcmVuY2UsIHN1Y2gg
YXMgcGh5IHBsbCBjb25maWd1cmF0aW9uLCByZWdpc3RlciB3aWR0aChpbXggaGRtaQo+IHJlZ2lz
dGVyIGlzIG9uZSBieXRlLCBidXQgcmszMjg4IGlzIDQgYnl0ZXMgd2lkdGggYW5kIGNhbiBvbmx5
IGFjY2VzcyBieSB3b3JkKSwKPiA0SyBzdXBwb3J0KGlteDYgZG9lc24ndCBzdXBwb3J0IDRrLCBi
dXQgcmszMjg4IGRvZXMpLgo+IAo+IFRvIHJldXNlIHRoZSBpbXgtaGRtaSBkcml2ZXIsIHdlIGRv
IHRoaXMgcGF0Y2ggc2V0Ogo+IHBhdGNoICgxKTogc3BsaXQgb3V0IGlteC1zb2MgY29kZSBmcm9t
IGlteC1oZG1pIHRvIGR3X2hkbWktaW14LmMKPiBwYXRjaCAoMik6IG1vdmUgaW14LWhkbWkgdG8g
YnJpZGdlLywgYW5kIHJlbmFtZSB0byBkdy1oZG1pIHRvCj4gbWFrZSB0aGlzIGRyaXZlciBpbmRl
cGVudCBvZiBkcm0taW14IC4gQW5kIHdlIHdpbGwgYWRkIHJvY2tjaGlwIAo+IHBsYXRmb3JtIHNw
ZWNpZmljIGNvZGUgZHdfaGRtaS1yb2NrY2hpcC5jIGxhdGVyLCB0aGlzIGlzIGRlcGVuZAo+IG9u
IGRybS1yb2NrY2hpcC4KCkdyZWF0IC0gSSBmdWxseSBhZ3JlZSB0aGF0IHRoaXMgbmVlZHMgdG8g
YmUgcmVuYW1lZCBhcyBpdCBpcyBhIERlc2lnbndhcmUKSVAuCgpTaG91bGQgaXQgYmUgbW92ZWQg
aW50byBicmlkZ2UvID8gIEl0IGlzbid0IGltcGxlbWVudGVkIGFzIGEgRFJNIGJyaWRnZQpkcml2
ZXIgYXQgcHJlc2VudCwgc28gdGhpcyBzZWVtcyBpbGxvZ2ljYWwuICBJcyB0aGUgbG9uZ2VyIHRl
cm0gcGxhbiB0bwpjb252ZXJ0IGl0IHRvIGJlIGEgRFJNIGJyaWRnZT8KClNlY29uZGx5LCBpZiB5
b3Ugd2FudCBIRE1JIGF1ZGlvIHN1cHBvcnQsIHlvdSBtYXkgZmluZCB0aGUgcGF0Y2hlcyBJCm1h
aW50YWluIGZvciB0aGUgU29saWRSdW4gZGV2aWNlcyB1c2VmdWwsIHdoaWNoIGFkZCB0aGlzIGFz
IGEgc3RhbmRhcmQKQUxTQSBkZXZpY2UuICBJIGFsc28gaGF2ZSBDRUMgc3VwcG9ydCBmb3IgaXQg
YXMgd2VsbC4gIElmIHlvdSdyZQppbnRlcmVzdGVkLCBJJ2xsIGVtYWlsIHRob3NlLgoKLS0gCkZU
VEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmU6IGN1cnJlbnRseSBhdCA5LjVNYnBzIGRvd24g
NDAwa2JwcyB1cAphY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldC4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
