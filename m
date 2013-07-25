Return-Path: <devicetree-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:43939 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753484Ab3GYDRV (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Wed, 24 Jul 2013 23:17:21 -0400
Date: Thu, 25 Jul 2013 13:17:18 +1000
From: Michael Ellerman <michael@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Feed entire flattened device tree into the
 random pool
Message-ID: <20130725031717.GB15673@concordia>
References: <20130725125122.78accf44@kryten>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130725125122.78accf44@kryten>
Sender: devicetree-owner@vger.kernel.org
To: Anton Blanchard <anton@samba.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 25, 2013 at 12:51:22PM +1000, Anton Blanchard wrote:
> 
> We feed the entire DMI table into the random pool to provide
> better random data during early boot, so do the same with the
> flattened device tree.
> 
> Signed-off-by: Anton Blanchard <anton@samba.org>
> ---
> 
> It might be worth doing this somewhere common, but the only place
> I could find (unflatten_device_tree) is almost certainly too
> early in the boot process.

Nice.

But why not put the initcall in drivers/of/fdt.c, that way it's not
early but it's still common ?

cheers
