From: Ivo Sieben <meltedpianoman@gmail.com>
Subject: Re: [PATCH 2/2] misc/at25: Add an .id_table to at25 to facilitate
 driver loading and binding.
Date: Mon, 17 Sep 2012 09:49:20 +0200
Message-ID: <CAMSQXEHXG=DGT7egbSfdNb2VFTXS+HQ0DoaA2v9dTX_2zn2pZg@mail.gmail.com>
References: <1345662238-15211-1-git-send-email-ddaney.cavm@gmail.com>
	<1345662238-15211-3-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1345662238-15211-3-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

Hi,

2012/8/22 David Daney <ddaney.cavm@gmail.com>:
> From: David Daney <david.daney@cavium.com>
>
>  /*-------------------------------------------------------------------------*/
> +static const struct spi_device_id at25_id[] = {
> +       {"at25", 0},
> +       {"m95256", 0},
> +       { }
> +};
> +MODULE_DEVICE_TABLE(spi, at25_id);

I use this driver for the ST M95040, M95020 & M95010 eeprom devices.
So wouldn't it be better to use the "famliy" name for these chips
("m95" instead of "m95256").

Regards,
Ivo Sieben
