From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4] uio/pdrv_genirq: Add OF support
Date: Wed, 4 May 2011 15:12:45 +0200
Message-ID: <201105041512.45294.arnd@arndb.de>
References: <1304319115-32745-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1304319115-32745-1-git-send-email-monstr@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, john.williams@petalogix.com, linux-kernel@vger.kernel.org, hjk@hansjkoch.de, w.sang@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Monday 02 May 2011, Michal Simek wrote:
> Adding OF binding to genirq.
> Version string is setup to the "devicetree".
> 
> Compatible string is not setup for now but you can add your
> custom compatible string to uio_of_genirq_match structure.
> 
> For example with "vendor,device" compatible string:
> static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
>         { .compatible = "vendor,device", },
>         { /* empty for now */ },
> };
> 
> Signed-off-by: Michal Simek <monstr@monstr.eu>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
