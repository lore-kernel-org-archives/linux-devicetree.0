From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: Re: [PATCH 3/8] ARM: dts: armada-388-clearfog: Utilize new DSA binding
Date: Wed, 04 Jan 2017 12:48:20 -0500
Message-ID: <87bmvmvhqz.fsf@weeman.i-did-not-set--mail-host-address--so-tickle-me>
References: <20170102022249.10657-1-f.fainelli@gmail.com> <20170102022249.10657-4-f.fainelli@gmail.com> <87shoyeo2j.fsf@free-electrons.com> <5a40436a-ebad-8a94-c5c5-546ba33ba545@gmail.com> <87fuky7mjt.fsf@weeman.i-did-not-set--mail-host-address--so-tickle-me> <20170104174248.GG5517@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170104174248.GG5517@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

Andrew Lunn <andrew@lunn.ch> writes:

>> That makes me think that we should either remove, or use different
>> values for the version described in net/dsa/dsa.c:
>> 
>>     char dsa_driver_version[] = "0.1";
>> 
>> Today this is absolutely useless and erroneous.
>
> I think it has been useless for over 9 years.

Do we want to get rid of it, or do we want to have a string version per
DSA implementation? (old vs. new bindings).

I don't like the actual way to distinguish between the two (grep'ing
dmesg as Florian shown). Maybe a pr_info in dsa2.c would be enough to
inform about DSA "v2". What do you guys prefer?

Thanks,

        Vivien
