From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v4 5/7] dt-bindings: display/panel: Add common rotation
 property
Date: Sat, 11 Feb 2017 19:48:56 +0100
Message-ID: <20170211184858.26421-6-noralf@tronnes.org>
References: <20170211184858.26421-1-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170211184858.26421-1-noralf@tronnes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

RGlzcGxheSBwYW5lbHMgY2FuIGJlIG9yaWVudGVkIG1hbnkgd2F5cywgZXNwZWNpYWxseSBpbiB0
aGUgZW1iZWRkZWQKd29ybGQuIFRoZSByb3RhdGlvbiBwcm9wZXJ0eSBpcyBhIHdheSB0byBkZXNj
cmliZSB0aGlzIG9yaWVudGF0aW9uLgpUaGUgY291bnRlciBjbG9ja3dpc2UgZGlyZWN0aW9uIGlz
IGNob3NlbiBiZWNhdXNlIHRoYXQncyB3aGF0IGZiZGV2CmFuZCBkcm0gdXNlLgoKU2lnbmVkLW9m
Zi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CkFja2VkLWJ5OiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KCkNoYW5nZXMgc2luY2UgdmVyc2lv
biAzOgotIENoYW5nZWQgZGlzcGxheS9kaXNwbGF5LnR4dCAtPiBkaXNwbGF5L3BhbmVsL3BhbmVs
LnR4dAoKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Bh
bmVsLnR4dCB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3BhbmVsLnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwLi5lMmU2ODY3Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwudHh0CkBAIC0wLDAgKzEsNCBAQAor
Q29tbW9uIGRpc3BsYXkgcHJvcGVydGllcworLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCist
IHJvdGF0aW9uOglEaXNwbGF5IHJvdGF0aW9uIGluIGRlZ3JlZXMgY291bnRlciBjbG9ja3dpc2Ug
KDAsOTAsMTgwLDI3MCkKLS0KMi4xMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
