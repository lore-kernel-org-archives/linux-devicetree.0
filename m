Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:38796 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757724Ab3HMTIB (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2013 15:08:01 -0400
Message-ID: <520A840B.6010107@wwwdotorg.org>
Date: Tue, 13 Aug 2013 13:07:55 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] regulator: palmas: Update the DT binding doc for
 smps10 out1 and out2
References: <1376379225-10604-1-git-send-email-ldewangan@nvidia.com> <1376379225-10604-2-git-send-email-ldewangan@nvidia.com>
In-Reply-To: <1376379225-10604-2-git-send-email-ldewangan@nvidia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@kernel.org, sameo@linux.intel.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, rob@landley.net, lee.jones@linaro.org, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gg@slimlogic.co.uk, kishon@ti.com, j-keerthy@ti.com, ian.campbell@citrix.com
List-ID: <devicetree@vger.kernel.org>

On 08/13/2013 01:33 AM, Laxman Dewangan wrote:
> Palams regulator SMPS10 is splitted into two regulator SMPS10-OUT1 and
> SMPS10-OUT2 to match with hw behavior. With this regulator name got
> changed in driver.
> 
> Update the DT binding document to match with driver.

Well, the driver should be derived from the binding document, not the
other way around, but this change is probably still fine...

> diff --git a/Documentation/devicetree/bindings/regulator/palmas-pmic.txt b/Documentation/devicetree/bindings/regulator/palmas-pmic.txt

>  	       For ti,palmas-pmic - smps12, smps123, smps3 depending on OTP,
> -	       smps45, smps457, smps7 depending on variant, smps6, smps[8-10],
> -	       ldo[1-9], ldoln, ldousb.
> +	       smps45, smps457, smps7 depending on variant, smps6, smps[8-9],
> +	       mps10_out2, smps10_out1, do[1-9], ldoln, ldousb.
               ^^^                      ^^
               s/mps/smp/               s/do/ldo/

