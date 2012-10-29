From: Mike Turquette <mturquette@ti.com>
Subject: Re: [RFC PATCH] dt: describe base reset signal binding
Date: Mon, 29 Oct 2012 11:32:33 -0700
Message-ID: <20121029183233.18780.11964@nucleus>
References: <1351028756-22309-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1351028756-22309-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Quoting Stephen Warren (2012-10-23 14:45:56)
> What do people think of this? Does it sound like a good idea to go ahead
> with a reset subsystem? Should we simply add a new API to the common clock
> subsystem instead (and assume that reset and clock domains match 1:1).
> Should this be implemented as part of the generic power management domains;
> see include/linux/pm_domain.h instead?
> 

Hi Stephen,

I'm not sure a "reset subsystem" is necessary, but I also do not like
using clocks as the keys for IP reset.  I think it is more common to map
IPs to struct device, no?

And of course for clocks shared by multiple users this will not scale.

Regards,
Mike
