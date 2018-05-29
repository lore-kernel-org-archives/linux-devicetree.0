From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/8] driver core: make deferring probe after init
 optional
Date: Tue, 29 May 2018 09:46:46 -0500
Message-ID: <CAL_JsqKWuOKvyYDVPS_tq8VJ25ZazZvSXBxyu5j4LqDxycyLPg@mail.gmail.com>
References: <20180524175024.19874-1-robh@kernel.org>
 <20180524175024.19874-2-robh@kernel.org>
 <20180524181834.GF4828@sirena.org.uk>
 <1765be22-4bd7-c870-926c-2956e46df1d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1765be22-4bd7-c870-926c-2956e46df1d9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/boot-architecture>,
 <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/boot-architecture/>
List-Post: <mailto:boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/boot-architecture>,
 <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Errors-To: boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Sender: "boot-architecture" <boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Architecture Mailman List <boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBNYXkgMjksIDIwMTggYXQgMTI6MTIgQU0sIEZyYW5rIFJvd2FuZCA8ZnJvd2FuZC5s
aXN0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gMDUvMjQvMTggMTE6MTgsIE1hcmsgQnJvd24gd3Jv
dGU6Cj4+IE9uIFRodSwgTWF5IDI0LCAyMDE4IGF0IDEyOjUwOjE3UE0gLTA1MDAsIFJvYiBIZXJy
aW5nIHdyb3RlOgo+Pgo+Pj4gU3Vic3lzdGVtcyBvciBkcml2ZXJzIG1heSBvcHQtaW4gdG8gdGhp
cyBiZWhhdmlvciBieSBjYWxsaW5nCj4+PiBkcml2ZXJfZGVmZXJyZWRfcHJvYmVfY2hlY2tfaW5p
dF9kb25lKCkgaW5zdGVhZCBvZiBqdXN0IHJldHVybmluZwo+Pj4gLUVQUk9CRV9ERUZFUi4gVGhl
eSBtYXkgdXNlIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gZnJvbSBEVCBvciBrZXJuZWwncwo+Pj4g
Y29uZmlnIHRvIGRlY2lkZSB3aGV0aGVyIHRvIGNvbnRpbnVlIHRvIGRlZmVyIHByb2JlIG9yIG5v
dC4KPj4KPj4gU2hvdWxkIHVzZXJzcGFjZSBoYXZlIHNvbWUgaW52b2x2ZW1lbnQgaW4gdGhpcyBk
ZWNpc2lvbj8gIEl0IGtub3dzIGlmCj4+IGl0J3MgZ290IGFueSBpbnRlbnRpb24gb2YgbG9hZGlu
ZyBtb2R1bGVzIGZvciBleGFtcGxlLiAgS2VybmVsIGNvbmZpZwo+PiBjaGVja3MgbWlnaHQgYmUg
Z29vZCBlbm91Z2gsIHRob3VnaCBpdCdzIGdvaW5nIHRvIGJlIGEgcGFpbiB0byB3b3JrIG91dAo+
PiBpZiB0aGUgcmVsZXZhbnQgZHJpdmVyIGlzIGJ1aWx0IGFzIGEgbW9kdWxlIGZvciBleGFtcGxl
Lgo+Pgo+Cj4gQSBwYXJhbGxlbCBpc3N1ZSBpcyB0aGF0IGxvYWRpbmcgYW4gb3ZlcmxheSBjb3Vs
ZCBwcm92aWRlIHRoZSByZXNvdXJjZQo+IHRoYXQgd2lsbCBhbGxvdyB0aGUgZGVmZXJyZWQgcHJv
YmUgdG8gY29tcGxldGUuICAoVGhhdCBpcywgb25jZSB3ZQo+IGZpbmlzaCBpbXBsZW1lbnRpbmcg
dGhlIHJ1biB0aW1lIG92ZXJsYXlzIGZlYXR1cmUuKQoKSSdkIGxpa2UgdG8gc2VlIGFuIGFjdHVh
bCBleGFtcGxlIHdoZXJlIHRoYXQgY291bGQgaGFwcGVuLiBJIGFncmVlIHlvdQpjb3VsZCBjcmFm
dCBpdCwgYnV0IHdvdWxkIGl0IHJlYWxseSBiZSBhIHZhbGlkIHBhcnRpdGlvbmluZz8gRm9yCmV4
YW1wbGUsIFNvQyBwaW5jdHJsLCBpb21tdSwgb3IgcG93ZXIgZG9tYWlucyBkZWZpbmVkIGluIGFu
IG92ZXJsYXkKd291bGQgbm90IGJlIHNvbWV0aGluZyB2YWxpZCB0byBhcHBseSBkdXJpbmcga2Vy
bmVsIGJvb3Qgb3IgYWZ0ZXIgYm9vdAoodGhvdWdoIHB1dHRpbmcgdGhvc2UgaW50byBvdmVybGF5
cyBpcyBleGFjdGx5IHdoYXQgQWxleCB3YW50cyB0byBkbykuCgpSb2IKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYm9vdC1hcmNoaXRlY3R1cmUgbWFpbGlu
ZyBsaXN0CmJvb3QtYXJjaGl0ZWN0dXJlQGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5s
aW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vYm9vdC1hcmNoaXRlY3R1cmUK
