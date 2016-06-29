From: Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: Re: [PATCH V5 2/3] powerpc/opal: Add inline function to get rc from
 an ASYNC_COMP opal_msg
Date: Wed, 29 Jun 2016 19:07:09 +1000
Message-ID: <87shvw1hz6.fsf@linux.vnet.ibm.com>
References: <1467171519-19882-1-git-send-email-sjitindarsingh@gmail.com>
 <1467171519-19882-2-git-send-email-sjitindarsingh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1467171519-19882-2-git-send-email-sjitindarsingh@gmail.com>
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
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Cc: robh@kernel.org, arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, paulus@samba.org, sjitindarsingh@gmail.com
List-Id: devicetree@vger.kernel.org

U3VyYWogSml0aW5kYXIgU2luZ2ggPHNqaXRpbmRhcnNpbmdoQGdtYWlsLmNvbT4gd3JpdGVzOgo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9vcGFsLmgKPiArKysgYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vb3BhbC5oCj4gQEAgLTI3Niw2ICsyNzYsMTQgQEAgZXh0ZXJuIGludCBv
cGFsX2Vycm9yX2NvZGUoaW50IHJjKTsKPiAgCj4gIHNzaXplX3Qgb3BhbF9tc2dsb2dfY29weShj
aGFyICp0bywgbG9mZl90IHBvcywgc2l6ZV90IGNvdW50KTsKPiAgCj4gK3N0YXRpYyBpbmxpbmUg
aW50IG9wYWxfZ2V0X2FzeW5jX3JjKHN0cnVjdCBvcGFsX21zZyBtc2cpCj4gK3sKPiArCWlmICht
c2cubXNnX3R5cGUgIT0gT1BBTF9NU0dfQVNZTkNfQ09NUCkKPiArCQlyZXR1cm4gT1BBTF9QQVJB
TUVURVI7CgpTaG91bGQgaW5zdGVhZCBiZSBXQVJOX09OIG9yIEJVR19PTiA/IElzIHRoZXJlICpl
dmVyKiBhIHNpdHVhdGlvbiB3aGVyZQpjYWxsaW5nIG9wYWxfZ2V0X2FzeW5jX3JjIG9uIGEgbm9u
LU9QQUxfTVNHX0FTWU5DX0NPTVAgaXMgYSBub3QgYm90aCBhCmR1bWIgaWRlYSBhbmQgYSBidWc/
CgpvdGhlcndpc2UgKGluY2x1ZGluZyBpZiBhYm92ZSBjaGFuZ2UgaXMgbWFkZSkKQWNrZWQtYnk6
IFN0ZXdhcnQgU21pdGggPHN0ZXdhcnRAbGludXgudm5ldC5pYm0uY29tPgoKCi0tIApTdGV3YXJ0
IFNtaXRoCk9QQUwgQXJjaGl0ZWN0LCBJQk0uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eHBwYy1kZXYgbWFpbGluZyBsaXN0CkxpbnV4cHBjLWRl
dkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9saW51
eHBwYy1kZXY=
