From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 2/6] dt-bindings: pinctrl: add a 'pinctrl-use-default'
 property
Date: Mon,  9 Jul 2018 09:41:49 -0600
Message-ID: <20180709154153.15742-3-robh@kernel.org>
References: <20180709154153.15742-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20180709154153.15742-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/boot-architecture>,
 <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/boot-architecture/>
List-Post: <mailto:boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/boot-architecture>,
 <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Errors-To: boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Sender: "boot-architecture" <boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

UGluIHNldHVwIG1heSBiZSBvcHRpb25hbCBpbiBzb21lIGNhc2VzIHN1Y2ggYXMgdGhlIHJlc2V0
IGRlZmF1bHQgd29ya3MKb3IgdGhlIHBpbiBzZXR1cCBpcyBkb25lIGJ5IHRoZSBib290bG9hZGVy
LiBJbiB0aGVzZSBjYXNlcywgaXQgaXMgb3B0aW9uYWwKZm9yIHRoZSBPUyB0byBzdXBwb3J0IG1h
bmFnaW5nIHRoZSBwaW4gY29udHJvbGxlciBhbmQgcGluIHNldHVwLiBJbiBvcmRlcgp0byBzdXBw
b3J0IHRoaXMgc2NlbmFyaW8sIGFkZCBhIHByb3BlcnR5ICdwaW5jdHJsLXVzZS1kZWZhdWx0JyB0
byBpbmRpY2F0ZQp0aGF0IHRoZSBwaW4gY29uZmlndXJhdGlvbiBpcyBvcHRpb25hbC4KClNpZ25l
ZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLWJpbmRpbmdzLnR4dCAgICAgICAgfCA2ICsrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtYmluZGluZ3MudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1iaW5kaW5n
cy50eHQKaW5kZXggYWQ5YmJiYmEzNmU5Li5jZWYyYjU4NTVkNjAgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtYmluZGluZ3MudHh0
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwt
YmluZGluZ3MudHh0CkBAIC0xMDMsNiArMTAzLDEyIEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6CiAj
cGluY3RybC1jZWxsczoJTnVtYmVyIG9mIHBpbiBjb250cm9sIGNlbGxzIGluIGFkZGl0aW9uIHRv
IHRoZSBpbmRleCB3aXRoaW4gdGhlCiAJCXBpbiBjb250cm9sbGVyIGRldmljZSBpbnN0YW5jZQog
CitwaW5jdHJsLXVzZS1kZWZhdWx0OiBCb29sZWFuLiBJbmRpY2F0ZXMgdGhhdCB0aGUgT1MgY2Fu
IHVzZSB0aGUgYm9vdCBkZWZhdWx0CisJCXBpbiBjb25maWd1cmF0aW9uLiBUaGlzIGFsbG93cyB1
c2luZyBhbiBPUyB0aGF0IGRvZXMgbm90IGhhdmUgYQorCQlkcml2ZXIgZm9yIHRoZSBwaW4gY29u
dHJvbGxlci4gVGhpcyBwcm9wZXJ0eSBjYW4gYmUgc2V0IGVpdGhlcgorCQlnbG9iYWxseSBmb3Ig
dGhlIHBpbiBjb250cm9sbGVyIG9yIGluIGNoaWxkIG5vZGVzIGZvciBpbmRpdmlkdWFsCisJCXBp
biBncm91cCBjb250cm9sLgorCiBQaW4gY29udHJvbGxlciBkZXZpY2VzIHNob3VsZCBjb250YWlu
IHRoZSBwaW4gY29uZmlndXJhdGlvbiBub2RlcyB0aGF0IGNsaWVudAogZGV2aWNlcyByZWZlcmVu
Y2UuCiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYm9vdC1hcmNoaXRlY3R1cmUgbWFpbGluZyBsaXN0CmJvb3QtYXJjaGl0ZWN0dXJl
QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGlu
Zm8vYm9vdC1hcmNoaXRlY3R1cmUK
