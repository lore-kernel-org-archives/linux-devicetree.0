Return-Path: <devicetree-owner@vger.kernel.org>
Received: from pegase1.c-s.fr ([93.17.236.30]:34296 "EHLO mailhub1.si.c-s.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932364Ab3HNNVf (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Wed, 14 Aug 2013 09:21:35 -0400
Message-ID: <520B845A.4070602@c-s.fr>
Date: Wed, 14 Aug 2013 15:21:30 +0200
From: leroy christophe <christophe.leroy@c-s.fr>
MIME-Version: 1.0
Subject: Re: Fwd: [PATCH] SPI: Set SPI bits per words in an OF DeviceTree
 SPI node
References: <201308071544.r77Fij2Y006649@localhost.localdomain> <52026DBA.8000202@c-s.fr> <52027637.7000309@wwwdotorg.org>
In-Reply-To: <52027637.7000309@wwwdotorg.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Rob Herring <rob.herring@calxeda.com>, linux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


>> In the node, you then have to include the 'spi-bits' property.
>>
>> Exemple:
>>      fpga-loader@7 {
>>          compatible = "cs,fpga-loader";
>>          spi-max-frequency = <10000000>;
>>          reg = <7>;
>>          spi-cs-high;
>>          spi-bits = <16>;
>>      };
> Shouldn't the driver for cs,fpga-loader be defining how many bit the SPI
> transactions should use? If the binding covers HW that can operate at
> various bits-per-word, it's reasonable for those individual bindings to
> define a property that sets that width, but I'm not convinced it's
> reasonable for the SPI core to allow any DT node to specify that, and
> presumably override the SPI device's driver's selection.
>
This is a tricky question.

The issue in the CPM (communication co-processor) on the MPC 8xx CPU is 
that, when you use the 16 bits mode, the CPM swaps the bytes, so the 
driver must unswap them to use them properly.
It looks like their is the same issue with other CPUs, like the MPCs 
having the Quick Engine. In the QE driver, it is done simple: the 
transfert is forced at 8bits at all time regardless on what the driver 
requests. This is known to work well, but I don't want to do that for 
the CPM driver, because the 16 bits mode is a lot less CPU consuming 
than the 8 bits mode, and my own drivers for my custom components do 
work in 16 bits mode (byte swap is included in those drivers).

That's the reason why I was proposing a way, through the Device Tree, to 
select the speed instead of forcing it inside the driver.
Because the MAX7301 driver for instance, which used to force 16 bits 
mode, does work perfectly well on the MPC8xx in 8 bits mode, but doesn't 
work in 16 bits because it doesn't unswap the bytes.
If I modify that driver to swap the bytes, it will not work anymore on 
platforms that don't require bytes to be swapped.

So, really, I don't know what to do here. Do you have any suggestion ?
