From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 2/2] arm64: allwinner: a64: Add Oceanic A64-5inMFD initial support
Date: Wed, 6 Mar 2019 15:06:00 +0530
Message-ID: <CAMty3ZDRAqV10u7QkujxkXtJYOUX8zbxkKtb5oxJMt+2jUbaHg@mail.gmail.com>
References: <20190226060240.8783-1-jagan@amarulasolutions.com>
 <20190226060240.8783-2-jagan@amarulasolutions.com> <20190227153346.dwd3stsbsvf7rwly@flea>
 <CAMty3ZDSZvaxMjcQJLNaTDJQ5OjJ9NbjpOJKWMUE5PhRCzYvqw@mail.gmail.com>
 <20190301145724.vhvyoqkkxdflg2g7@flea> <CAMty3ZCUSsN71Q5h_nj6de0Smhqht1S5zq0pLKUqpwq=85XqXw@mail.gmail.com>
 <20190305155919.cm3yrve3vqp7jimh@flea> <CAMty3ZD6Bsu7B6phhf4h7jreoM1uvM-ZQNCaUZKKa=1DNOtb8A@mail.gmail.com>
 <7AB137701821F94BAF7B06C1747BA691011A3FE123@OS01.os.local> <20190306092708.2pjc7uz6wvku4hkb@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306092708.2pjc7uz6wvku4hkb@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Ryan Pannell <ryan@osukl.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 6, 2019 at 2:57 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Tue, Mar 05, 2019 at 04:35:04PM +0000, Ryan Pannell wrote:
> > We don't mind if it has to be:
> > compatible = "oceanic,5inmfd", "allwinner,sun50i-a64";
> >
> > However, to avoid confusion, might it be worth including the part number (We list this as '5205 5" MFD') so this would become:
> > compatible = "oceanic,5205-5inmfd", "allwinner,sun50i-a64";
> >
> > Perhaps this solves the issue. Please let me know thoughts.
>
> Yep, that works for me

A64 instead of part-number 5205 seems less confused isn't it? or we
need to give more priority with real hardware definition?
