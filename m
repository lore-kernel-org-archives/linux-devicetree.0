From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Patch v2][ 14/37] staging: imx-drm: parallel display: add
 regulator support.
Date: Thu, 17 Oct 2013 19:47:59 +0300
Message-ID: <20131017164759.GI11731@mwanda>
References: <1382022155-21954-1-git-send-email-denis@eukrea.com>
 <1382022155-21954-15-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1382022155-21954-15-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Denis Carikli <denis@eukrea.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, Rob Herring <rob.herring@calxeda.com>, dri-devel@lists.freedesktop.org, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 17, 2013 at 05:02:12PM +0200, Denis Carikli wrote:
> +	if (imxpd->lcd_reg)
> +		if (regulator_enable(imxpd->lcd_reg))
> +			dev_err(imxpd->dev, "Failed to enable lcd regulator.\n");
> +

In staging the style is to use braces around multi-line indents for
readability.  Or you could do:

	if (imxpd->lcd_reg && regulator_enable(imxpd->lcd_reg))
		dev_err(imxpd->dev, "Failed to enable lcd regulator.\n");

These kind of tiny things aren't worth resending, but for next time.

regards,
dan carpenter
