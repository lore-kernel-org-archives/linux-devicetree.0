From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: Re: [PATCH 3/8] ARM: dts: armada-388-clearfog: Utilize new DSA binding
Date: Wed, 04 Jan 2017 12:38:30 -0500
Message-ID: <87fuky7mjt.fsf@weeman.i-did-not-set--mail-host-address--so-tickle-me>
References: <20170102022249.10657-1-f.fainelli@gmail.com> <20170102022249.10657-4-f.fainelli@gmail.com> <87shoyeo2j.fsf@free-electrons.com> <5a40436a-ebad-8a94-c5c5-546ba33ba545@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5a40436a-ebad-8a94-c5c5-546ba33ba545@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Florian, All,

Florian Fainelli <f.fainelli@gmail.com> writes:

>> However is there a way to be sure that the new binding is used?
>
> The best way is probably to make sure that your switch device appears
> parented to the MDIO bus driver under /sys/class/mdio_bus/*mvmdio*.
> Alternatively, if you see a message like:
>
> DSA: switch 0 0 parsed
>
> in your dmesg, that would also be indicative of using the new binding
> and corresponding code.

That makes me think that we should either remove, or use different
values for the version described in net/dsa/dsa.c:

    char dsa_driver_version[] = "0.1";

Today this is absolutely useless and erroneous.

Thanks,

        Vivien
