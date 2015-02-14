From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [FOR DISCUSSION 0/8] Dove PMU support
Date: Sat, 14 Feb 2015 17:49:52 +0100
Message-ID: <20150214164952.GF3213@lunn.ch>
References: <20150214152659.GI8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150214152659.GI8656@n2100.arm.linux.org.uk>
Sender: linux-pm-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Jason Cooper <jason@lakedaemon.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Len Brown <len.brown@intel.com>, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Russell

Thanks for posting these. Lets try to get them merged.

> There are a few things which are missing from this driver, such sa the
> DT binding documentation.  This will follow once people are happy with
> the first four patches, in particular where to locate the PMU driver
> in the kernel tree.  Currently, I have it in arch/arm/mach-dove, which
> is where the legacy Dove code lives, so it's not ideal.

Maybe time for a drivers/pmu? arch/arm/mach-dove is not good, we want
to be able to use this code from arch/arm/mach-mvebu.

   Andrew
