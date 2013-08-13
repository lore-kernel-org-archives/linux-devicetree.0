Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:50506 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757851Ab3HMTLf (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2013 15:11:35 -0400
Message-ID: <520A84E2.5090509@wwwdotorg.org>
Date: Tue, 13 Aug 2013 13:11:30 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] regulator: palmas: add support for external control
 of rails
References: <1376379225-10604-1-git-send-email-ldewangan@nvidia.com> <1376379225-10604-4-git-send-email-ldewangan@nvidia.com>
In-Reply-To: <1376379225-10604-4-git-send-email-ldewangan@nvidia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@kernel.org, sameo@linux.intel.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, rob@landley.net, lee.jones@linaro.org, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gg@slimlogic.co.uk, kishon@ti.com, j-keerthy@ti.com, ian.campbell@citrix.com
List-ID: <devicetree@vger.kernel.org>

On 08/13/2013 01:33 AM, Laxman Dewangan wrote:
> Palmas rails like LDOs, SMPSs, REGENs, SYSENs can be enable and disable
> by register programming through I2C communication as well as it can be
> enable/disable with the external control input ENABLE1, ENABLE2 and NSLEEP.
> 
> Add support for configuring these rails to be controlled by external control
> inputs. This is require to configure the rail's control register as well as
> configuration of resource register.
> 
> Provide the external input names through parameter "roof-floor". Updated the
> DT binding document to details different value of the roof-floor.

> diff --git a/Documentation/devicetree/bindings/regulator/palmas-pmic.txt b/Documentation/devicetree/bindings/regulator/palmas-pmic.txt

>  	       Optional sub-node properties:
>  	       ti,warm-reset - maintain voltage during warm reset(boolean)
> -	       ti,roof-floor - control voltage selection by pin(boolean)
> +	       ti,roof-floor - control voltage selection by pin. If the
> +	       external pin is:
> +			ENABLE1 then 0x1,
> +			ENABLE2 then 0x2 or
> +			NSLEEP then 0x4.

You can probably write 1, 2, 4 instead of 0x1, 0x2, 0x4.

This change doesn't look backwards-compatible and hence breaks the DT ABI.

Instead, can you allow an empty property to mean "yes" (in which case
the binding document must specify which pin), and *also* allow a
specific value to be provided as the enhancement? The binding document
would need to explicitly document both these options. Looking at the
code change, I think this property only applies to some pins. the
binding document should probably specify which, or at least mention this
fact and tell the reader to consult the HW documentation to see where
it's applicable.
