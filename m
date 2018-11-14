From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/2] clk: Add driver and bindings for Fixed MMIO clock
Date: Wed, 14 Nov 2018 14:21:23 -0800
Message-ID: <154223408357.88331.5555853411586910501@swboyd.mtv.corp.google.com>
References: <37A652CE-2DB0-4232-8F94-F11A38D2FA76@global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <37A652CE-2DB0-4232-8F94-F11A38D2FA76@global.cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Janek Kotas <jank@cadence.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Janek Kotas (2018-11-14 07:24:17)
> This patchset adds a driver support for Fixed Memory Mapped IO clock.
> =

> The driver reads a clock frequency value from a single 32-bit memory
> mapped register and registers it as a fixed rate clock.
> =

> It can be useful for prototyping Linux on various hardware platforms.

Please fix your mailer (is it git send-email?) to do proper threading of
emails and cover letters. I see these aren't sent as replies to the
cover, and so I get three different mail lines in my inbox which makes
it take more time for me to go through the patches.
