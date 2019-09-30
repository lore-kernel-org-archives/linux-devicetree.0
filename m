From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 0/2] This patch introduces a feature to force
 gpio-poweroff module
Date: Mon, 30 Sep 2019 14:14:40 +0200
Message-ID: <20190930121440.GC13301@lunn.ch>
References: <20190930103531.13764-1-oleksandr.suvorov@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190930103531.13764-1-oleksandr.suvorov@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jamie Lentin <jm@lentin.co.uk>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Igor Opaniuk <igor.opaniuk@toradex.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 30, 2019 at 10:35:36AM +0000, Oleksandr Suvorov wrote:
> to register its own pm_power_off handler even if someone has registered
> this handler earlier.
> Useful to change a way to power off the system using DT files.

Hi Oleksandr

I'm not sure this is a good idea. What happens when there are two
drivers using forced mode? You then get which ever is register last.
Non deterministic behaviour.

What is the other driver which is causing you problems? How is it
getting probed? DT?

Thanks
	Andrew
