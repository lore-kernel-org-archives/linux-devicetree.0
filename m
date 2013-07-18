From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [RFC PATCH v2 11/15] cpufreq: kirkwood-cpufreq: remove device
 tree parsing for cpu nodes
Date: Thu, 18 Jul 2013 13:23:42 +0530
Message-ID: <CAKohpomoxFBQjDh12OkFB-NnuKzf0u-ZiotF7qa8Cs8Sa8nvNQ@mail.gmail.com>
References: <1374069984-20567-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
	<1374069984-20567-12-git-send-email-Sudeep.KarkadaNagesha@arm.com>
	<20130717144355.GE1026@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20130717144355.GE1026@lunn.ch>
Sender: linux-pm-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sudeep.KarkadaNagesha@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, Shawn Guo <shawn.guo@linaro.org>, Gregory Clement <gregory.clement@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

On 17 July 2013 20:13, Andrew Lunn <andrew@lunn.ch> wrote:
> Are we not going a bit backwards here? You are replacing two lines
> with 10 lines.
>
> How about putting these 10 lines into some helper,
> of_get_cpu_device()?  It would be useful for spear, kirkwood and
> imx6q, and maybe others.

+1
