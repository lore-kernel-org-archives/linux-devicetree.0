Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:53508 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082Ab3HSVgH (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 19 Aug 2013 17:36:07 -0400
Message-ID: <52128FBE.4080103@wwwdotorg.org>
Date: Mon, 19 Aug 2013 15:35:58 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
References: <cover.1376912873.git.b42378@freescale.com> <a5b34243c0323e7692fab6a52a7adf4e3e8a5844.1376912873.git.b42378@freescale.com>
In-Reply-To: <a5b34243c0323e7692fab6a52a7adf4e3e8a5844.1376912873.git.b42378@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, tomasz.figa@gmail.com, mark.rutland@arm.com, R65777@freescale.com, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On 08/19/2013 06:08 AM, Nicolin Chen wrote:
> This patch implements a device-tree-only CPU DAI driver for Freescale
> S/PDIF controller that supports stereo playback and record feature.

> diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.txt b/Documentation/devicetree/bindings/sound/fsl,spdif.txt

> +Freescale Sony/Philips Digital Interface Format (S/PDIF) Controller
> +
> +The Freescale S/PDIF audio block is a stereo transceiver that allows the
> +processor to receive and transmit digital audio via an coaxial cable or
> +a fibre cable.

Well, the cable type is more a property of the components that are
hooked to the SoC signals that this module drives, so are somewhat out
of scope of this binding document. However, this is nit-picky comment,
and I'm not too worried about it.

> +  - clock-names : Includes the following entries:
> +	"core"		The core clock of spdif controller
> +	"rxtx<0-7>"	Clock source list for tx and rx clock.
> +			This clock list should be identical to
> +			the source list connecting to the spdif
> +			clock mux in "SPDIF Transceiver Clock
> +			Diagram" of SoC reference manual. It
> +			can also be referred to TxClk_Source
> +			bit of register SPDIF_STC.

So, the HW block has 1 clock input, yet there's a mux somewhere else in
the SoC which has 8 inputs?

If so, I'm not completely sure it's correct to reference anything other
than the "core" clock in this binding. I think the other clocks would be
more suitably represented in the system-level "sound card" binding that
I guess patch 2/2 (which I haven't read yet) adds, since I assume those
clock are more to do with system-level clock tree setup decisions, and
might not even exist in some other SoC that included this IP block.

What do others think, assuming I'm correct about my HW design assumptions?
