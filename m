From: Holger Schurig <hs4233@mail.mn-solutions.de>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Tue, 2 Jun 2009 09:57:20 +0200
Message-ID: <200906020957.20493.hs4233@mail.mn-solutions.de>
References: <20090527234801.GP6805@pengutronix.de> <1243677166.440.12.camel@pasglop> <20090530102153.GA6910@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760104AbZFBH5T@vger.kernel.org>
In-Reply-To: <20090530102153.GA6910@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.arm.linux.org.uk
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>, timur@freescale.com, devicetree-discuss@ozlabs.org, linux-kernel@vger.kernel.org, scottwood@freescale.com, yuan-bo.ye@motorola.com, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

> 1. implementers of the clock API which have not been subject
> to my rigorous review abuse it to the point of making the API
> essentially useless, and that causes Mark problems.

If that's a problem, when something needs changes. An API that 
can only be managed by implementers due to rigorous review lacks 
something, maybe easy-of-use, maybe documentation. Can it be the 
case that the current state makes you a single-point of failure?

If yes, I'd at least suggest better docs in linux/Documentation, 
e.g. describe the big-picture, the implementation and common 
cave-ats, e.g. why an approach "uniquely name every single 
clock ... makes the API pointless" doesn't work.
