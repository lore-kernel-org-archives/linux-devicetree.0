From: Mark yao <mark.yao@rock-chips.com>
Subject: Re: [PATCH v7 0/5] Add mipi dsi support for rk3288
Date: Wed, 06 Jan 2016 16:39:24 +0800
Message-ID: <568CD2BC.7080800@rock-chips.com>
References: <1452053038-32098-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1452053038-32098-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chris Zhong <zyw@rock-chips.com>, heiko@sntech.de, linux-rockchip@lists.infradead.org, treding@nvidia.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMjAxNuW5tDAx5pyIMDbml6UgMTI6MDMsIENocmlzIFpob25nIHdyb3RlOgo+IFRoZSByazMy
ODggTUlQSSBEU0kgaXMgYSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkgRFNJIGhvc3QgY29udHJv
bGxlcgo+IElQLiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGEgU3lub3BzeXMgRGVzaWdu
V2FyZSBNSVBJIERTSSBob3N0Cj4gY29udHJvbGxlciBEUk0gZHJpdmVyLgo+Cj4gVGhlIE1JUEkg
RFNJIGZlYXR1cmUgaXMgdGVzdGVkIG9uIHJrMzI4OCBldmIgYm9hcmQsIGJhY2twb3J0IHRoZW0g
dG8KPiBjaHJvbWUgb3Mga2VybmVsIGNocm9tZV92My4xNCwgYW5kIGl0IGNhbiBkaXNwbGF5IG5v
cm1hbGx5Lgo+Cj4gVGhpcyBwYXRjaHNldCBpcyBiYXNlIG9uIHRoZSBwYXRjaHNldCBmcm9tIFlp
bmcubGl1QGZyZWVzY2FsZS5jb20uCj4gPGh0dHA6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJp
LWRldmVsL21zZzc3MTgxLmh0bWw+Cj4KPiBBY2NvcmRpbmcgdG8gdGhlIHN1Z2dlc3Rpb24gZnJv
bSBUaGllcnJ5LCBJIGhhdmUgZ2V0IHJpZCBvZiB0aGUgYnJpZGdlLAo+IGFuZCByZWdpc3RlciB0
aGUgZW5jb2RlciAmIGNvbm5lY3RlciBpbiBkcm0vcm9ja2NoaXAvZHctbWlwaS1kc2kuYy4KPgo+
IEFmdGVyIGJhY2twb3J0IGJlbG93IHBhdGNoZXMgZnJvbSBsaW51eC1uZXh0LCBJIGNhbiBtZXJn
ZSB0aGlzIHNlcmlhbCBpbnRvCj4gRGF2ZSdzIGRybS1uZXh0IGJyYW5jaC4KPgo+IDk0ZDVkNmEw
ZmJmMyBjbGs6IHJvY2tjaGlwOiBhZGQgYW4gaWQgZm9yIHJrMzI4OCBjcnlwdG8gY2xrCj4gYzZk
NDlmYmNmY2M0IGNsazogcm9ja2NoaXA6IGFkZCBpZCBmb3IgbWlwaWRzaSBzY2xrIG9uIHJrMzI4
OAo+IGEyZjRjNTYwZjE4ZSBjbGs6IHJvY2tjaGlwOiBhZGQgbWlwaWRzaSBjbG9jayBvbiByazMy
ODgKPiA2OWM5MjM3NDM2NDAgQVJNOiBkdHM6IHJvY2tjaGlwOiBjb3JyZWN0IHRoZSBuYW1lIG9m
IFJFRzggZm9yIHJrMzI4OC1ldmItYWN0ODg0Ngo+IDY2MjUxM2ExNGM5ZCBBUk06IGR0czogcm9j
a2NoaXA6IGFkZCAyIHJlZ3VsYXRvcnMgZm9yIHJrMzI4OC1ldmItYWN0ODg0Ngo+IGIwNDA2MWU2
NTk5YiBBUk06IGR0czogcm9ja2NoaXA6IG1vdmUgdGhlIHB1YmxpYyBwYXJ0IHRvIHJrMzI4OC1l
dmIgY29tbW9uCj4KPgo+CkhpIENocmlzCgpJIGhhZCBwaWNrZWQgZm9sbG93aW5nIHRocmVlIHBh
dGNoZXMgYW5kIHNlbmQgYSBwdWxsLXJlcXVlc3QgdG8gRGF2ZQogICAgICAgW1BBVENIIHY3IDEv
NV0gZHJtL3JvY2tjaGlwOiByZXR1cm4gYSB0cnVlIGNsb2NrIHJhdGUgdG8gCmFkanVzdGVkX21v
ZGUKICAgICAgIFtQQVRDSCB2NyAyLzVdIERvY3VtZW50YXRpb246IGR0LWJpbmRpbmdzOiBBZGQg
YmluZGluZ3MgZm9yIApyazMyODggRFcgTUlQSSBEU0kgZHJpdmVyCiAgICAgICBbUEFUQ0ggdjcu
MiAzLzVdIGRybTogcm9ja2NoaXA6IFN1cHBvcnQgU3lub3BzeXMgRFcgTUlQSSBEU0kKClRoYW5r
cy4KCi0tIArvvK1hcmsgWWFvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
