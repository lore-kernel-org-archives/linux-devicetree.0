From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH anybus v3 1/6] misc: support the Arcx anybus bridge
Date: Mon, 5 Nov 2018 15:20:49 -0600
Message-ID: <20181105212049.GA320@bogus>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-2-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181104155501.14767-2-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thesven73@gmail.com
Cc: svendev@arcx.com, linus.walleij@linaro.org, lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 04, 2018 at 10:54:56AM -0500, thesven73@gmail.com wrote:
> From: Sven Van Asbroeck <svendev@arcx.com>
> 
> Add a driver for the Arcx anybus bridge.
> 
> This chip embeds up to two Anybus-S application connectors
> (slots), and connects to the SoC via a parallel memory bus.
> There is also a CAN power readout, unrelated to the Anybus,
> modelled as a regulator.

bridge vs. host are confusing me as those are often the same thing. But 
here bridge is just some auxilliary controls for the bus and the host is 
the actual bus with devices? I'm not sure why you split this into 2 DT 
nodes? How many devices are connected to the host processor (i.MX) bus?

Rob
