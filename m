Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:34937 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756392Ab3GZPlz (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 26 Jul 2013 11:41:55 -0400
Message-ID: <51F298C0.1090801@wwwdotorg.org>
Date: Fri, 26 Jul 2013 09:41:52 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: wm8994: Add clock bindings to the device tree
References: <1374762668-5037-1-git-send-email-broonie@kernel.org>
In-Reply-To: <1374762668-5037-1-git-send-email-broonie@kernel.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 07/25/2013 08:31 AM, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Due to the variable availability of the clock API there is no code in the
> driver to use these at present, for the time being the machine drivers
> will need to handle requesting clocks.

Presumably before considering any/most CODEC bindings complete, we need
to make a similar change?
