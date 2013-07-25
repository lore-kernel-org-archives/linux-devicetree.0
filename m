Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtpfb2-g21.free.fr ([212.27.42.10]:36487 "EHLO
	smtpfb2-g21.free.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755176Ab3GYJNE convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 25 Jul 2013 05:13:04 -0400
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 68836CA92DA
	for <devicetree@vger.kernel.org>; Thu, 25 Jul 2013 11:12:59 +0200 (CEST)
Date: Thu, 25 Jul 2013 11:12:32 +0200
From: Jean-Francois Moine <moinejf@free.fr>
Subject: [PATCH 0/4] ASoc: kirkwood: extend the kirkwood audio subsystem for
 DT usage
Message-ID: <20130725111232.08736072@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Rob Herring <rob.herring@calxeda.com>, Russell King <rmk+kernel@arm.linux.org.uk>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch series adds DT support to the kirkwood audio subsystem.

It cancels the previous patch requests:
- ARM: kirkwood: enable S/PDIF
- ARM: kirkwood: extend the kirkwood i2s driver for DT usage
- ARM: kirkwood: extend the kirkwood pcm/dma driver for DT usage

It also contains the merge of kirkwood-i2c and kirkwood-dma into one
module, and, the removal of the kirkwood-pcm-audio device.
This involves changes in the openrd and t5325 drivers, as in the common
Kirkwood machine initialization. These last changes have not been tested.

-- 
Ken ar c'hentañ	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
