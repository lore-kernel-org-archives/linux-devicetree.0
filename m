Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:57287 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755715Ab3HFSyJ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 6 Aug 2013 14:54:09 -0400
Message-ID: <5201464B.90102@wwwdotorg.org>
Date: Tue, 06 Aug 2013 12:54:03 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH V3 2/3] pinctrl: pinconf-generic: add generic APIs for
 mapping pinctrl node
References: <1375794755-6246-1-git-send-email-ldewangan@nvidia.com> <1375794755-6246-3-git-send-email-ldewangan@nvidia.com>
In-Reply-To: <1375794755-6246-3-git-send-email-ldewangan@nvidia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, ian.campbell@citrix.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, rob@landley.net, sameo@linux.intel.com, lee.jones@linaro.org, grant.likely@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gg@slimlogic.co.uk, kishon@ti.com
List-ID: <devicetree@vger.kernel.org>

On 08/06/2013 07:12 AM, Laxman Dewangan wrote:
> Add generic APIs to map the DT node and its sub node in pinconf generic
> driver. These APIs can be used from driver to parse the DT node who
> uses the pinconf generic APIs for defining their nodes.

> Changes from V2:
> - Rebased the pinctrl binding doc on top of Stephen's cleanup.
> - Rename properties "pinctrl-pins" and "pinctrl-function" to
>   "pins" and "function".

> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

> +
> +The valid pin names and function are device/chip specific and it can be
> +found from the device/chip specific binding documents.

Oh, I ended up posting a V2 of my cleanup of that file with a wordier
version of that text added:-) Linus may want to drop those 3 lines when
applying this.
