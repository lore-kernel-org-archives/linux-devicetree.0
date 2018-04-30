From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/3] drm/bridge: add support for
 sn65dsi86 bridge driver
Date: Mon, 30 Apr 2018 09:50:12 +0800
Message-ID: <201804300739.pJBpbYIS%fengguang.wu@intel.com>
References: <1524821982-2778-2-git-send-email-spanda@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1524821982-2778-2-git-send-email-spanda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abhinavk-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Sandeep Panda <spanda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org, hoegsberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, chandanu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

SGkgU2FuZGVlcCwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoISBQZXJoYXBzIHNvbWV0aGluZyB0
byBpbXByb3ZlOgoKW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIGRybS9kcm0tbmV4dF0KW2Fs
c28gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIHY0LjE3LXJjMyBuZXh0LTIwMTgwNDI2XQpbaWYgeW91
ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRyb3AgdXMg
YSBub3RlIHRvIGhlbHAgaW1wcm92ZSB0aGUgc3lzdGVtXQoKdXJsOiAgICBodHRwczovL2dpdGh1
Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL1NhbmRlZXAtUGFuZGEvQWRkLXN1cHBwb3J0LWZv
ci1zbjY1ZHNpODYtYnJpZGdlLWNoaXAtYW5kLUlubm9sdXgtMmstZWRwLXBhbmVsLzIwMTgwNDMw
LTAzNTgzOQpiYXNlOiAgIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFpcmxpZWQvbGlu
dXguZ2l0IGRybS1uZXh0CgoKY29jY2luZWxsZSB3YXJuaW5nczogKG5ldyBvbmVzIHByZWZpeGVk
IGJ5ID4+KQoKPj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYzo3MTE6My04
OiBObyBuZWVkIHRvIHNldCAub3duZXIgaGVyZS4gVGhlIGNvcmUgd2lsbCBkbyBpdC4KClBsZWFz
ZSByZXZpZXcgYW5kIHBvc3NpYmx5IGZvbGQgdGhlIGZvbGxvd3VwIHBhdGNoLgoKLS0tCjAtREFZ
IGtlcm5lbCB0ZXN0IGluZnJhc3RydWN0dXJlICAgICAgICAgICAgICAgIE9wZW4gU291cmNlIFRl
Y2hub2xvZ3kgQ2VudGVyCmh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9rYnVpbGQtYWxs
ICAgICAgICAgICAgICAgICAgIEludGVsIENvcnBvcmF0aW9uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
