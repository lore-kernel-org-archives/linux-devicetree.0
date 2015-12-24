From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2 1/3] clk: bcm2835: Add bindings for the auxiliary peripheral clock gates.
Date: Thu, 24 Dec 2015 15:45:15 -0800
Message-ID: <87wps3qulw.fsf@eliezer.anholt.net>
References: <1450222559-22461-1-git-send-email-eric@anholt.net> <20151219041935.GS14936@rob-hp-laptop> <CAEG3pNCOO1F8+nwOQGSjUKxYCGbWW_Ripc6xUwDyg6ay66uL7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAEG3pNCOO1F8+nwOQGSjUKxYCGbWW_Ripc6xUwDyg6ay66uL7w@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, "Stephen Boyd <sboyd@codeaurora.org>, Emilio Lopez
	<emilio@elopez.com.ar>, Hans de Goede <hdegoede@redhat.com>,
	linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>, linux-rpi-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Michael Turquette <mturquette@baylibre.com> writes:

> On Fri, Dec 18, 2015 at 8:19 PM, Rob Herring <robh@kernel.org> wrote:
>> On Tue, Dec 15, 2015 at 03:35:57PM -0800, Eric Anholt wrote:
>>> These will be used for enabling UART1, SPI1, and SPI2.
>>>
>>> Signed-off-by: Eric Anholt <eric@anholt.net>
>>> ---
>>>
>>> v2: Make the binding cover both the IRQ and clock enable registers.
>>>
>>>  .../bindings/clock/brcm,bcm2835-aux-clock.txt      | 31 ++++++++++++++++++++++
>>>  include/dt-bindings/clock/bcm2835-aux.h            | 17 ++++++++++++
>>>  2 files changed, 48 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
>>>  create mode 100644 include/dt-bindings/clock/bcm2835-aux.h
>>
>> Acked-by: Rob Herring <robh@kernel.org>
>
> Applied to clk-next.
>
> Next time if you put the header into the clk driver patch then we can
> send the binding description through the DT tree and take the header
> and C file through the clk tree in one patch.

I would *love* to do that, but I've previously been told that having the
bindings patch reference a header file not present as of the bindings
patch is not acceptable and made to change it.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWfIOLAAoJELXWKTbR/J7o5u4QALF1EWBUM5xA8yxZT8/8VrDN
sw6ErdSebzvjj4YTNYw89PSm2rnnZGiJL/g92AnrWbqAkRCguYUb5v9PNUvQyLyd
GoeMyggfqMRuLMcmfXiP7yWgLxzn2JnwbqUBGf+kHUGcH35j1NMEdniicRznbBnM
GQfdZJ+oQLv0DRfu2cdbwatjWFlC5ISDbgl3GM2GvdKArvOxzB6qqs0JjQViLxZ/
vcDROwMa3Pw/4oymo8+b6G+MIPWHHQkCxEd10VZrTRL/TW9Beri+GVpAoHC+oaaA
yZ/j+492R+Rpf9l/eLkF7tBlUhG8nbXyjtTAQf22087F6gkoynEjlosKGT8OFvDN
utL79Zl0P58ZLCg7RctMWTmGRUju2Z812a91zhAKyVI0uj1zigrnvSkAAJjnvKXR
V5F4aYlT+rKZcFrAHkaEx5L9SSz9wX/p45dqTJ5dgMZ/M+jd9e4eMMk1tnd9w3Qb
qEuQn4xpeDYivqXOy2doWB0B+vXmUuHzkIUw40l90apYR4sAXDqhAYXbhzN7Mfo2
Npa0V5fhWIu1F9YIrBhjNnrMbrALSEq1LxT2leR6pWMIQO7D3RQittxSR1kJTxRg
GIzBF/qaKI66dPpCVWDeKlklidj/IvlcRxf3TxKeaD8oCfOcNh5sUUzkbcdJYk9p
ALnErDrCJ4lsLmqElzYl
=Gv3p
-----END PGP SIGNATURE-----
--=-=-=--
