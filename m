From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: Re: [PATCH v7 6/6] ARM: dts: meson8b: add support for booting the
 secondary CPU cores
Date: Fri, 29 Sep 2017 13:29:59 +0200
Message-ID: <20170929112959.GM6726@otheros>
References: <20170917164523.6970-7-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170917164523.6970-7-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, f.fainelli@gmail.com, arnd@arndb.de, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com, linux@armlinux.org.uk, robh+dt@kernel.org, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QSBmaXZlIGhvdXJzIHRlc3QgcnVuIHdpdGggdGhlIHN0cmVzcy1uZyB0b29sIHdvcmtlZCBmaW5l
IGZvciB0aGlzCnBhdGNoc2V0IGZvciBtZS4KCnN0cmVzcy1uZyBjb21tYW5kOgokIHN0cmVzcy1u
ZyAtdiAtLXNlcXVlbnRpYWwgMCAtdCAxMjBzIC0tZXhjbHVkZSBzeXNmcyxvcGNvZGUgLS1tZXRy
aWNzCgpMb2dmaWxlICg2LjNNQik6Cmh0dHA6Ly9tZXRhbWV1dGUuZGUvfnR1eC9saW51eC9hbWxv
Z2ljL3N0cmVzcy1uZy1vZHJvaWRjMSUyYi13aXRoLXJlc21lbSUyYnNtcC1sb2cudHh0CgpUZXN0
ZWQgZGV2aWNlOgotIE9kcm9pZCBDMSsKClRlc3RlZCBPUzoKLSBEZWJpYW4gc3RhYmxlIChzdHJl
c3MtbmcgMC4wNy4xNikKClRlc3RlZCBrZXJuZWw6IHY0LjE0LXJjMSBwbHVzIHRoaXMgcGF0Y2hz
ZXQgcGx1czoKLSAiQVJNOiBkdHM6IG1lc29uOiBmaXhpbmcgVVNCIHN1cHBvcnQgb24gTWVzb242
LCBNZXNvbjggYW5kIE1lc29uOGIiCiAgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRj
aC85OTY1ODcxLwotICJBUk06IGR0czogbWVzb246IGVuYWJsaW5nIHRoZSBVU0IgSG9zdCBjb250
cm9sbGVyIG9uIE9kcm9pZC1DMS9DMSsgYm9hcmQiCiAgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wYXRjaC85OTYxNTY1LwotICJbUkZDXSBBUk06IGR0czogbWVzb244YjogYWRkIHJlc2Vy
dmVkIG1lbW9yeSB6b25lcyIKICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzk5
Nzc0NzkvCgpUZXN0ZWQga2VybmVsIGNvbmZpZzoKLSBtdWx0aV92N19kZWZjb25maWcsIGV4Y2Vw
dCBDT05GSUdfRFJNX1RFR1JBPW4gKGJ1aWxkIGVycm9yIG90aGVyd2lzZSkKCiAKSSBoYWQgdG8g
ZXhjbHVkZSB0aGUgc3lzZnMgYW5kIG9wY29kZSB0ZXN0cyB0aG91Z2guIFRoZSBmb3JtZXIKY3Jl
YXRlZCBhbiB1bmhhbmRsZWQga2VybmVsIHBhZ2luZyByZXF1ZXN0LiBBbmQgdGhlIGxhdHRlciBh
CnNpbGVudCBmcmVlemUgYWZ0ZXIgc29tZSBzZWNvbmRzLgoKVGhvc2UgdHdvIGlzc3VlcyBzZWVt
IHVucmVsYXRlZCB0byB0aGlzIHBhdGNoc2V0IHRob3VnaCwKdGhlcmVmb3JlCgpUZXN0ZWQtYnk6
IExpbnVzIEzDvHNzaW5nIDxsaW51cy5sdWVzc2luZ0BjMGQzLmJsdWU+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
