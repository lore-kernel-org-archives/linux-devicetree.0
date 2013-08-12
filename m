Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:57272 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755995Ab3HLPqL (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 12 Aug 2013 11:46:11 -0400
Message-ID: <52090340.60204@wwwdotorg.org>
Date: Mon, 12 Aug 2013 09:46:08 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ASoC: dt: Move ALC5632 pin list from Tegra board
 binding to CODEC binding
References: <1376244161-24206-1-git-send-email-broonie@kernel.org>
In-Reply-To: <1376244161-24206-1-git-send-email-broonie@kernel.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Mark Brown <broonie@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 08/11/2013 12:02 PM, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> The pin list is the same for any board using the CODEC.

> diff --git a/Documentation/devicetree/bindings/sound/alc5632.txt b/Documentation/devicetree/bindings/sound/alc5632.txt

> +  * DMICDAT
> +
> +
>  Example:

There's an extra blank line there.

The series,
Acked-by: Stephen Warren <swarren@nvidia.com>
