From: Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v3 0/3] Add support for the otm8009a dsi panel
Date: Mon, 17 Jul 2017 15:19:50 +0200
Message-ID: <1500297593-30633-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

VmVyc2lvbiAzOgotIHBhbmVsLW9yaXNldGVjaC1vdG04MDA5YS5jOiBSZW1vdmUgYSBGSVhNRSAo
QW5kcnplaiBIYWpkYSkKLSBwYW5lbC9NYWtlZmlsZSAmIEtjb25maWc6IEFscGhhYmV0aWNhbCBv
cmRlciAoQW5kcnplaiBIYWpkYSkKClZlcnNpb24gMjoKLSBwYW5lbC1vcmlzZXRlY2gtb3RtODAw
OWEuYzogQWRkIE1hbnVmYWN0dXJlciBDb21tYW5kIFNldCBkZWZpbmVzLAogIGFkZCBuZXcgbWFj
cm8gZm9yIGhhbmRsaW5nIGFkZHJlc3Mgc2hpZnRpbmcsIGltcHJvdmUgcmVzZXQKICBzZXF1ZW5j
ZSwgdXNlIG1vcmUgbWlwaSBkY3MgaGVscGVycyAoQW5kcnplaiBIYWpkYSkKLSBkdC1iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQ6IEZpeCByZXNldCBncGlvCiAg
YWN0aXZlIGxldmVsIGluIHRoZSBleGFtcGxlIChBbmRyemVqIEhhamRhKSwgQWRkIGFuICJPcHRp
b25hbAogIFByb3BlcnRpZXMiIHNlY3Rpb24gKFJvYiBIZXJyaW5nKS4KClZlcnNpb24gMToKLSBJ
bml0aWFsIGNvbW1pdAoKVGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBpcyB0byBhZGQgc3VwcG9y
dCBmb3IgdGhlIE9yaXNlIFRlY2gKb3RtODAwOWEgMy45NyIgNDgweDgwMCBURlQgTENEIHBhbmVs
IChNSVBJLURTSSB2aWRlbyBtb2RlKS4KVGhpcyBMQ0QgcGFuZWwgaXMgdXNlZCBpbiBzZXZlcmFs
IFNUTTMyIGJvYXJkcy4KClBoaWxpcHBlIENPUk5VICgzKToKICBkdC1iaW5kaW5nczogQWRkIHZl
bmRvciBwcmVmaXggZm9yIE9yaXNlIFRlY2hub2xvZ3kKICBkdC1iaW5kaW5nczogZGlzcGxheTog
cGFuZWw6IEFkZCBzdXBwb3J0IGZvciBPcmlzZSBUZWNoIG90bTgwMDlhIGRzaQogICAgcGFuZWwK
ICBkcm0vcGFuZWw6IEFkZCBzdXBwb3J0IGZvciBvdG04MDA5YSBwYW5lbCBkcml2ZXIKCiAuLi4v
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gsb3RtODAwOWEudHh0ICB8ICAyMSArCiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMudHh0ICAgICAgICB8ICAgMSAr
CiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAg
OSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8
ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtb3Jpc2V0ZWNoLW90bTgwMDlhLmMg
ICB8IDQ5MSArKysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNTIzIGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gsb3RtODAwOWEudHh0CiBjcmVhdGUgbW9kZSAx
MDA3NTUgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW9yaXNldGVjaC1vdG04MDA5YS5jCgot
LSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
