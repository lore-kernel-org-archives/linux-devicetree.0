From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 0/4] add slow clock support for SAM9X60
Date: Thu, 27 Jun 2019 07:57:37 -0700
Message-ID: <20190627145738.42BD52086D@mail.kernel.org>
References: <1561646841-7663-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561646841-7663-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com, mark.rutland@arm.com, mturquette@baylibre.com, nicolas.ferre@microchip.com, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

Quoting Claudiu Beznea (2019-06-27 07:47:17)
> Hi,
>=20
> This series add slow clock support for SAM9X60. Apart from previous IPs, =
this
> one uses different offsets in control register for different functionalit=
ies.
> The series adapt current driver to work for all IPs using per IP
> configurations initialized at probe.
>=20
> Stephen,
>=20
> I send a new version of this since I'm not seeing the patches on clk-next
> and I though you may had issues with the previous version of this series.

Ok thanks. I see that you've fixed it to send plain text. Great! But I
already applied the other patches so I'll just keep what I had. Should
be pushed out to clk-next today.
