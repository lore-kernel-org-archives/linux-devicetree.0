From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 7/8] Documentation: devicetree: rockchip: Document
 Landingship
Date: Sun,  6 Mar 2016 20:53:56 +0100
Message-ID: <1457294038-14243-8-git-send-email-afaerber@suse.de>
References: <1457294038-14243-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1457294038-14243-1-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-rockchip@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Julien Chauveau <chauveau.julien@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

VXNlICJnZWVrYnV5aW5nLGdlZWtib3gtbGFuZGluZ3NoaXAiIGNvbXBhdGlibGUgc3RyaW5nLCBw
bHVzIHRob3NlIG9mCnRoZSBHZWVrQm94IG1vZHVsZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMg
RsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4KLS0tCiB2MiAtPiB2MzoKICogQ2hhbmdlZCBjb21w
YXRpYmxlIHN0cmluZyB0byBpbmNsdWRlIGdlZWtib3gtIChIZWlrbykKICAgYW5kIGNsYXJpZnkg
dGhhdCB0aGlzIGlzIGZvciBHZWVrQm94IG1vZHVsZQogCiB2MjogTmV3CiAKIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcm9ja2NoaXAudHh0IHwgNSArKysrKwogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vcm9ja2NoaXAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9yb2NrY2hpcC50eHQKaW5kZXggZjYzMzU5NWIxOTZjLi5hZTg0ZjRl
MWQ4M2IgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
cm9ja2NoaXAudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
cm9ja2NoaXAudHh0CkBAIC05MSw2ICs5MSwxMSBAQCBSb2NrY2hpcCBwbGF0Zm9ybXMgZGV2aWNl
IHRyZWUgYmluZGluZ3MKICAgICBSZXF1aXJlZCByb290IG5vZGUgcHJvcGVydGllczoKICAgICAg
IC0gY29tcGF0aWJsZSA9ICJnZWVrYnV5aW5nLGdlZWtib3giLCAicm9ja2NoaXAscmszMzY4IjsK
IAorLSBHZWVrQnV5aW5nIExhbmRpbmdzaGlwIHdpdGggR2Vla0JveCBtb2R1bGU6CisgICAgUmVx
dWlyZWQgcm9vdCBub2RlIHByb3BlcnRpZXM6CisgICAgICAtIGNvbXBhdGlibGUgPSAiZ2Vla2J1
eWluZyxnZWVrYm94LWxhbmRpbmdzaGlwIiwKKwkJICAgICAiZ2Vla2J1eWluZyxnZWVrYm94Iiwg
InJvY2tjaGlwLHJrMzM2OCI7CisKIC0gUm9ja2NoaXAgUkszMzY4IGV2YjoKICAgICBSZXF1aXJl
ZCByb290IG5vZGUgcHJvcGVydGllczoKICAgICAgIC0gY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxy
azMzNjgtZXZiLWFjdDg4NDYiLCAicm9ja2NoaXAscmszMzY4IjsKLS0gCjIuNi4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5l
bCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
