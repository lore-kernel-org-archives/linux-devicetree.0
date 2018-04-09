From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v3 7/7] dt-bindings: tda998x: add the calibration gpio
Date: Mon, 09 Apr 2018 13:16:43 +0100
Message-ID: <E1f5Vj1-0002Lx-Hz@rmk-PC.armlinux.org.uk>
References: <20180409121529.GA31403@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180409121529.GA31403@n2100.armlinux.org.uk>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

QWRkIHRoZSBvcHRpb25hbCBjYWxpYnJhdGlvbiBncGlvIGZvciBpbnRlZ3JhdGVkIFREQTk5NTAg
Q0VDIHN1cHBvcnQuClRoaXMgR1BJTyBjb3JyZXNwb25kcyB3aXRoIHRoZSBpbnRlcnJ1cHQgZnJv
bSB0aGUgVERBOTk4eCwgYXMgdGhlCmNhbGlicmF0aW9uIHJlcXVpcmVzIGRyaXZpbmcgdGhlIGlu
dGVycnVwdCBwaW4gbG93LgoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+ClNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcu
dWs+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L3RkYTk5OHgudHh0IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvdGRhOTk4eC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvdGRhOTk4eC50eHQKaW5kZXggMjRjYzI0NjYxODVhLi4xYTRlYWNhNDBkOTQgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS90ZGE5OTh4LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvdGRhOTk4eC50eHQKQEAgLTI3LDYgKzI3LDkgQEAgUmVxdWlyZWQgcHJvcGVy
dGllczsKIAlpbiBxdWVzdGlvbiBpcyB1c2VkLiBUaGUgaW1wbGVtZW50YXRpb24gYWxsb3dzIG9u
ZSBvciB0d28gREFJcy4gSWYgdHdvCiAJREFJcyBhcmUgZGVmaW5lZCwgdGhleSBtdXN0IGJlIG9m
IGRpZmZlcmVudCB0eXBlLgogCisgIC0gbnhwLGNhbGliLWdwaW9zOiBjYWxpYnJhdGlvbiBHUElP
LCB3aGljaCBtdXN0IGNvcnJlc3BvbmQgd2l0aCB0aGUKKwlncGlvIHVzZWQgZm9yIHRoZSBUREE5
OTh4IGludGVycnVwdCBwaW4uCisKIFsxXSBEb2N1bWVudGF0aW9uL3NvdW5kL2Fsc2Evc29jL0RB
SS50eHQKIFsyXSBpbmNsdWRlL2R0LWJpbmRpbmdzL2Rpc3BsYXkvdGRhOTk4eC5oCiAKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
