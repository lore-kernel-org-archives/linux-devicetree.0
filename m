From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v8 41/45] drivers/of: Avoid recursively calling
 unflatten_dt_node()
Date: Wed, 17 Feb 2016 08:53:51 -0600
Message-ID: <CAL_JsqKWokaUSgf8dfi7Ao_hrKCMf1LYS_ubd=Z=_+d6ehD9Jw@mail.gmail.com>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-42-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1455680668-23298-42-git-send-email-gwshan@linux.vnet.ibm.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, aik@ozlabs.ru, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, dja@axtens.net
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBGZWIgMTYsIDIwMTYgYXQgOTo0NCBQTSwgR2F2aW4gU2hhbiA8Z3dzaGFuQGxpbnV4
LnZuZXQuaWJtLmNvbT4gd3JvdGU6Cj4gSW4gY3VycmVudCBpbXBsZW1lbnRhdGlvbiwgdW5mbGF0
dGVuX2R0X25vZGUoKSBpcyBjYWxsZWQgcmVjdXJzaXZlbHkKPiB0byB1bmZsYXR0ZW4gZGV2aWNl
IG5vZGVzIGluIEZEVCBibG9iLiBJdCdzIHN0cmVzcyB0byBsaW1pdGVkIHN0YWNrCj4gY2FwYWNp
dHksIGVzcGVjaWFsbHkgdG8gYWRvcHQgdGhlIGZ1bmN0aW9uIHRvIHVuZmxhdHRlbiBkZXZpY2Ug
c3ViLXRyZWUKPiB0aGF0IHBvc3NpYmx5IGhhcyBtdWx0aXBsZSByb290IG5vZGVzLiBJbiB0aGF0
IGNhc2UsIHdlIHJ1bnMgb3V0IG9mCj4gc3RhY2sgYW5kIHRoZSBzeXN0ZW0gY2FuJ3QgYm9vdCB1
cCBzdWNjZXNzZnVsbHkuCj4KPiBJbiBvcmRlciB0byByZXVzZSB0aGUgZnVuY3Rpb24gdG8gdW5m
bGF0dGVuIGRldmljZSBzdWItdHJlZSwgdGhpcyBhdm9pZHMKPiBjYWxsaW5nIHRoZSBmdW5jdGlv
biByZWN1cnNpdmVseSwgbWVhbmluZyB0aGUgZGV2aWNlIG5vZGVzIGFyZSB1bmZsYXR0ZW5lZAo+
IGluIG9uZSBjYWxsIG9uIHVuZmxhdHRlbl9kdF9ub2RlKCk6IHR3byBhcnJheXMgYXJlIGludHJv
ZHVjZWQgdG8gdHJhY2sgdGhlCj4gcGFyZW50IHBhdGggc2l6ZSBhbmQgdGhlIGRldmljZSBub2Rl
IG9mIGN1cnJlbnQgbGV2ZWwgb2YgZGVwdGgsIHdoaWNoIHdpbGwKPiBiZSB1c2VkIGJ5IHRoZSBk
ZXZpY2Ugbm9kZSBvbiBuZXh0IGxldmVsIG9mIGRlcHRoIHRvIGJlIHVuZmxhdHRlbmVkLiBBbGwK
PiBkZXZpY2Ugbm9kZXMgaW4gbW9yZSB0aGFuIDY0IGxldmVsIG9mIGRlcHRoIGFyZSBkcm9wcGVk
IGFuZCBob3BlZnVsbHksCj4gdGhlIHN5c3RlbSBjYW4gYm9vdCB1cCBzdWNjZXNzZnVsbHkgd2l0
aCB0aGUgcGFydGlhbCBkZXZpY2UtdHJlZS4KPgo+IEFsc28sIHRoZSBwYXJhbWV0ZXIgInBvZmZz
ZXQiIGFuZCAiZnBzaXplIiBhcmUgdW51c2VkIGFuZCBkcm9wcGVkIGFuZCB0aGUKPiBwYXJhbWV0
ZXIgImRyeXJ1biIgaXMgZmlndXJlZCBvdXQgZnJvbSAibWVtID09IE5VTEwiLiBCZXNpZGVzLCB0
aGUgcmV0dXJuCj4gdmFsdWUgb2YgdGhlIGZ1bmN0aW9uIGlzIGNoYW5nZWQgdG8gaW5kaWNhdGUg
dGhlIHNpemUgb2YgbWVtb3J5IGNvbnN1bWVkIGJ5Cj4gdGhlIHVuZmxhdHRlbiBkZXZpY2UgdHJl
ZSBvciBlcnJvciBjb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogR2F2aW4gU2hhbiA8Z3dzaGFuQGxp
bnV4LnZuZXQuaWJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9vZi9mZHQuYyB8IDEyMiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eHBwYy1kZXYgbWFpbGluZyBsaXN0CkxpbnV4cHBjLWRl
dkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9saW51
eHBwYy1kZXY=
