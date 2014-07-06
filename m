From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] video: fbdev: mxsfb.c:  Cleaning up variable that is never used
Date: Sun, 6 Jul 2014 23:06:59 +0200
Message-ID: <201407062306.59317.marex@denx.de>
References: <1404672272-19231-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404672272-19231-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Lothar =?iso-8859-1?q?Wa=DFmann?= <LW@karo-electronics.de>, Jingoo Han <jg1.han@samsung.com>, Fabio Estevam <fabio.estevam@freescale.com>, Julia Lawall <Julia.Lawall@lip6.fr>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sunday, July 06, 2014 at 08:44:32 PM, Rickard Strandqvist wrote:
> Variable ar assigned a value that is never used.
> I have also removed all the code that thereby serves no purpose.
> 
> This was found using a static code analysis program called cppcheck
> 
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

Makes perfect sense.

Acked-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
