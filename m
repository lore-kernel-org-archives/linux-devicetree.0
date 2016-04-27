From: Akshay Bhat <akshay.bhat@timesys.com>
Subject: [PATCH v3 2/2] dt-bindings: imx: ldb: Add ddc-i2c-bus property
Date: Wed, 27 Apr 2016 16:23:34 -0400
Message-ID: <1461788614-7784-2-git-send-email-akshay.bhat@timesys.com>
References: <1461788614-7784-1-git-send-email-akshay.bhat@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1461788614-7784-1-git-send-email-akshay.bhat@timesys.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, steve_longerbeam@mentor.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

RG9jdW1lbnQgdGhlIGRkYy1pMmMtYnVzIHByb3BlcnR5IHVzZWQgYnkgaW14LWxkYiBkcml2ZXIg
dG8gcmVhZCBFRElECmluZm9ybWF0aW9uIHZpYSBJMkMgaW50ZXJmYWNlLgoKU2lnbmVkLW9mZi1i
eTogQWtzaGF5IEJoYXQgPGFrc2hheS5iaGF0QHRpbWVzeXMuY29tPgotLS0KCnYzOgpOZXdseSBh
ZGRlZC4KCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbGRi
LnR4dCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW14L2xkYi50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbGRiLnR4dAppbmRl
eCAwYTE3NWQ5Li5hNDA3NDYyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9pbXgvbGRiLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbGRiLnR4dApAQCAtNjIsNiArNjIsNyBAQCBSZXF1aXJl
ZCBwcm9wZXJ0aWVzOgogICAgZGlzcGxheS10aW1pbmdzIGFyZSB1c2VkIGluc3RlYWQuCiAKIE9w
dGlvbmFsIHByb3BlcnRpZXMgKHJlcXVpcmVkIGlmIGRpc3BsYXktdGltaW5ncyBhcmUgdXNlZCk6
CisgLSBkZGMtaTJjLWJ1czogcGhhbmRsZSBvZiBhbiBJMkMgY29udHJvbGxlciB1c2VkIGZvciBE
REMgRURJRCBwcm9iaW5nCiAgLSBkaXNwbGF5LXRpbWluZ3MgOiBBIG5vZGUgdGhhdCBkZXNjcmli
ZXMgdGhlIGRpc3BsYXkgdGltaW5ncyBhcyBkZWZpbmVkIGluCiAgICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9kaXNwbGF5LXRpbWluZy50eHQuCiAgLSBmc2wsZGF0
YS1tYXBwaW5nIDogc2hvdWxkIGJlICJzcHdnIiBvciAiamVpZGEiCi0tIAoyLjguMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
