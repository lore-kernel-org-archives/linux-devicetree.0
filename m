From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v5 0/6] Add Fieldbus subsystem + support HMS Profinet card
Date: Wed, 5 Dec 2018 20:05:33 -0600
Message-ID: <3b0b4c5c-23a6-428c-6060-3e5c314bd9e7@lechnology.com>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204220224.27324-1-TheSven73@googlemail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>, svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/4/18 4:02 PM, Sven Van Asbroeck wrote:
> This patch:
>    1. adds a Fieldbus subsystem
>    2. adds support for the HMS Industrial Networks AB Profinet card.

Does this actually need a new fieldbus subsystem or could it just be
implemented as a new network protocol?

> 
> 1. Fieldbus subsystem
> ---------------------
> 
> Fieldbus device (client) adapters allow data exchange with a PLC aka.
> "Fieldbus Controller" over a fieldbus (Profinet, FLNet, etc.)
> They are typically used when a Linux device wants to expose itself
> as an actuator, motor, console light, switch, etc. over the fieldbus.
> The framework is designed to provide a generic interface to Fieldbus
> Devices from both the Linux Kernel and the userspace.

Then this generic interface to a fieldbus device could just be a socket.

> 
> 2. Add support for HMS Profinet Card
> ------------------------------------
> 
> Profinet is an industry technical standard for data communication over
> Industrial Ethernet, designed for collecting data from, and controlling,
> equipment in industrial systems, with a particular strength in delivering data
> under tight time constraints (on the order of 1ms or less).
> 
> The profinet card itself is connected to the system via an industrial bus
> called 'anybus'.
> 
> I have followed the bus driver/client driver pattern, and created an anybus
> bus driver, plus a client driver for the profinet card.
> 
> In case this patch set gets (eventually) accepted, drivers for other anybus
> client cards may follow: flnet, cc-link, ...
> 
> The anybus slot on the host is located on an 'anybus controller', which is
> custom h/w designed by arcx. It exposes a dual anybus host implementation,
> plus a power readout unrelated to the anybus.
> 
