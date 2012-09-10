From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] regulator: gpio-regulator: add DT bindings
Date: Tue, 11 Sep 2012 07:41:46 +0800
Message-ID: <20120910234145.GA30699@opensource.wolfsonmicro.com>
References: <1347289429-18713-1-git-send-email-zonque@gmail.com>
 <504E4234.9090300@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <504E4234.9090300@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Daniel Mack <zonque@gmail.com>, devicetree-discuss@lists.ozlabs.org, lrg@ti.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 10, 2012 at 01:40:36PM -0600, Stephen Warren wrote:
> On 09/10/2012 09:03 AM, Daniel Mack wrote:

> > + - "enabled-at-boot":		If set, the regulator has been enabled at boot
> > +				time

> Isn't that regulator-boot-on, as defined in regulator.txt that you
> mentioned?

It's slightly different due to our unfortunate inability to support
GPIO readback for output GPIOs - this means the regualtor is enabled at
boot and the driver should use that to bootstrap state, the core one
means the regulator should be turned on at boot.  The latter would force
the regulator to be be enabled during boot.
