Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:60858 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188Ab3HTTxx (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 15:53:53 -0400
Message-ID: <5213C94D.7050304@wwwdotorg.org>
Date: Tue, 20 Aug 2013 13:53:49 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 2/2] ASoC: fsl: Add S/PDIF machine driver
References: <cover.1376912873.git.b42378@freescale.com> <ca3061d70ab8bf59afc59031fa7befcfaed26d51.1376912873.git.b42378@freescale.com> <5212908E.6050104@wwwdotorg.org> <20130820001858.GF30073@sirena.org.uk> <52138FDE.3080007@wwwdotorg.org> <20130820190701.GR30073@sirena.org.uk>
In-Reply-To: <20130820190701.GR30073@sirena.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Nicolin Chen <b42378@freescale.com>, lars@metafoo.de, p.zabel@pengutronix.de, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, tomasz.figa@gmail.com, mark.rutland@arm.com, R65777@freescale.com
List-ID: <devicetree@vger.kernel.org>

On 08/20/2013 01:07 PM, Mark Brown wrote:
> On Tue, Aug 20, 2013 at 09:48:46AM -0600, Stephen Warren wrote:
>> On 08/19/2013 06:18 PM, Mark Brown wrote:
> 
>>> S/PDIF is also sometimes used as an interconnect between
>>> devices - some CODECs have S/PDIF I/O (more normally used as an
>>> external connector on the box).  This is most frequently seen
>>> as a way to
> 
>> That's not a good argument for an incorrect binding.
> 
> The point is that it might turn into a more correct binding
> depending on what the S/PDIF device actually is.

There's *never* an object on the board called a "dummy codec".
