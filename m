From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 11/12] brcmfmac: Loading the correct firmware for brcm43456
Date: Sat, 13 Apr 2019 11:06:20 +0000 (UTC)
Message-ID: <20190413110621.ED2CA61834@smtp.codeaurora.org>
References: <20190405234514.6183-12-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190405234514.6183-12-megous@megous.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Cc: Ondrej Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, linux-stm32@st-md-mailman.stormreply.com, brcm80211-dev-list@cypress.com, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arend van Spriel <arend.vanspriel@broadcom.com>, Alexandre Torgue <alexandre.torgue@st.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Wright Feng <wright.feng@cypress.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Naveen Gupta <naveen.gupta@cypress.com>, Franky Lin <franky.lin@broadcom.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>brcm80211-dev-
List-Id: devicetree@vger.kernel.org

bWVnb3VzQG1lZ291cy5jb20gd3JvdGU6Cgo+IEZyb206IE9uZHJlaiBKaXJtYW4gPG1lZ291c0Bt
ZWdvdXMuY29tPgo+IAo+IFNESU8gYmFzZWQgYnJjbTQzNDU2IGlzIGN1cnJlbnRseSBtaXNkZXRl
Y3RlZCBhcyBicmNtNDM0NTUgYW5kIHRoZSB3cm9uZwo+IGZpcm13YXJlIG5hbWUgaXMgdXNlZC4g
Q29ycmVjdCB0aGUgZGV0ZWN0aW9uIGFuZCBsb2FkIHRoZSBjb3JyZWN0Cj4gZmlybXdhcmUgZmls
ZS4gQ2hpcHJldiBmb3IgYnJjbTQzNDU2IGlzICI5Ii4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbmRy
ZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KClBhdGNoIGFwcGxpZWQgdG8gd2lyZWxlc3Mt
ZHJpdmVycy1uZXh0LmdpdCwgdGhhbmtzLgoKZTMwNjJlMDVlMWNmIGJyY21mbWFjOiBMb2FkaW5n
IHRoZSBjb3JyZWN0IGZpcm13YXJlIGZvciBicmNtNDM0NTYKCi0tIApodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzEwODg4MDIzLwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5l
bC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
