Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:34923 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537Ab3HUQIN (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 12:08:13 -0400
Message-ID: <5214E5E8.1000102@wwwdotorg.org>
Date: Wed, 21 Aug 2013 10:08:08 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [alsa-devel] [PATCH v8 2/2] ASoC: fsl: Add S/PDIF machine driver
References: <cover.1376912873.git.b42378@freescale.com> <ca3061d70ab8bf59afc59031fa7befcfaed26d51.1376912873.git.b42378@freescale.com> <5212908E.6050104@wwwdotorg.org> <20130820001858.GF30073@sirena.org.uk> <52138FDE.3080007@wwwdotorg.org> <20130820190701.GR30073@sirena.org.uk> <5213C94D.7050304@wwwdotorg.org> <20130820222810.GU30073@sirena.org.uk> <20130821021801.GA6177@MrMyself>
In-Reply-To: <20130821021801.GA6177@MrMyself>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: Mark Brown <broonie@kernel.org>, mark.rutland@arm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de, festevam@gmail.com, s.hauer@pengutronix.de, timur@tabi.org, rob.herring@calxeda.com, tomasz.figa@gmail.com, p.zabel@pengutronix.de, R65777@freescale.com, shawn.guo@linaro.org, linuxppc-dev@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

On 08/20/2013 08:18 PM, Nicolin Chen wrote:
> On Tue, Aug 20, 2013 at 11:28:10PM +0100, Mark Brown wrote:
>> On Tue, Aug 20, 2013 at 01:53:49PM -0600, Stephen Warren wrote:
>>> On 08/20/2013 01:07 PM, Mark Brown wrote:
>>
>>>> The point is that it might turn into a more correct binding
>>>> depending on what the S/PDIF device actually is.
>>
>>> There's *never* an object on the board called a "dummy codec".
>>
>> Oh, is that what you're talking about?  Yes, that makes sense.  I had
>> been responding to the comments about the transceivers.
> 
> I'll remove the 'dummy' words in the next version from the binding doc.

I think the word "CODEC" is also problematic in this context, since
whatever is connector to the S/PDIF output path may not be a CODEC.
That's why I suggested some more generic property names that IIRC
concentrated on enabling rx/tx rather than indicating what was actually
connected to the S/PDIF controller.
