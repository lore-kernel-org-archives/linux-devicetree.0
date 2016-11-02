From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/3] ipmi/bt-bmc: fix compatible node and add a request expiry
 list
Date: Wed,  2 Nov 2016 08:57:03 +0100
Message-ID: <1478073426-3714-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Corey Minyard <minyard@acm.org>, openipmi-developer@lists.sourceforge.net, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
List-Id: devicetree@vger.kernel.org

SGVsbG8gQ29yZXksCgpIZXJlIGlzIGEgc2hvcnQgc2VyaWUgZml4aW5nIHRoZSBuYW1lIG9mIHRo
ZSBkZXZpY2UgdHJlZSAnY29tcGF0aWJsZScKbm9kZSBvZiB0aGUgaXBtaS9idC1ibWMgZHJpdmVy
IGFuZCBhZGRpbmcgYSByZXF1ZXN0IGV4cGlyeSBsaXN0IHRvIHRoZQpkcml2ZXIuCgpUaGUgZmly
c3QgcGF0Y2ggc2hvdWxkIGJlIGNvbnNpZGVyZWQgYXMgYSA0LjkgZml4LCBpZiBwb3NzaWJsZS4K
ClRoYW5rcywKCkMuCgoKQ8OpZHJpYyBMZSBHb2F0ZXIgKDMpOgogIGlwbWkvYnQtYm1jOiBjaGFu
Z2UgY29tcGF0aWJsZSBub2RlIHRvICdhc3BlZWQsYXN0MjQwMC1pYnQtYm1jJwogIGlwbWkvYnQt
Ym1jOiBtYWludGFpbiBhIHJlcXVlc3QgZXhwaXJ5IGxpc3QKICBpcG1pL2J0LWJtYzogYWRkIGEg
c3lzZnMgZmlsZSB0byBjb25maWd1cmUgYSBtYXhpbXVtIHJlc3BvbnNlIHRpbWUKCiAuLi50MjQw
MC1idC1ibWMudHh0ID0+IGFzcGVlZCxhc3QyNDAwLWlidC1ibWMudHh0fSB8ICAgNCArLQogZHJp
dmVycy9jaGFyL2lwbWkvYnQtYm1jLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNjcgKysr
KysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDE2NyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQogcmVuYW1lIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
cG1pL3thc3BlZWQsYXN0MjQwMC1idC1ibWMudHh0ID0+IGFzcGVlZCxhc3QyNDAwLWlidC1ibWMu
dHh0fSAoODUlKQoKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
