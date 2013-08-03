Return-Path: <devicetree-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40023 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751622Ab3HCLnt (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 3 Aug 2013 07:43:49 -0400
Date: Sat, 3 Aug 2013 12:43:21 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v3 2/4] ASoc: kirkwood: merge kirkwood-i2c and
	kirkwood-dma
Message-ID: <20130803114321.GW23006@n2100.arm.linux.org.uk>
References: <20130731081806.244752d4@armhf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130731081806.244752d4@armhf>
Sender: devicetree-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Rob Herring <rob.herring@calxeda.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 31, 2013 at 08:18:06AM +0200, Jean-Francois Moine wrote:
> To avoid the declaration of a 'kirkwood-pcm-audio' device in the DT,
> this patch merges the kirkwood-i2c and kirkwood-dma drivers into one
> module associated with 'kirkwood-i2s'. 

This is broken unless you use my patch.  You can't just stick the
two drivers together because they both make use of the platform
device's driver data field for two incompatible uses.  I've already
explained that, and I've even sent you a patch to fix that, but you
seem to ignore anything that you didn't write.

So... I'm going to work on this issue this weekend and merge the two
drivers myself, and send Mark my own patches to do this.

