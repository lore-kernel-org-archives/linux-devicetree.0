From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] regulator: tps6586x: add support for SYS rail
Date: Thu, 2 Aug 2012 17:10:46 +0100
Message-ID: <20120802161046.GC4537@opensource.wolfsonmicro.com>
References: <1343906193-8309-1-git-send-email-ldewangan@nvidia.com>
 <20120802114046.GK29157@opensource.wolfsonmicro.com>
 <501A69CA.2070507@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <501A69CA.2070507@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Stephen Warren <swarren@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 02, 2012 at 05:21:38PM +0530, Laxman Dewangan wrote:
> On Thursday 02 August 2012 05:10 PM, Mark Brown wrote:

> >Is the system rail actually regulated or is it just a nominal 5V?
> >Normally it's just the raw, unregulated input switched in with FETs or
> >whatever.

> It is unregulated with FET.
> The typical range (min-max) shows in data sheet

> V(SYS) with respect to AGND1: 2.9V(min) 5.5V(max).
> althoguh USB or AC have 4.30V(Min) 16.5V(max)

OK, so just don't provide any of the voltage related functionality for i
thtne.
