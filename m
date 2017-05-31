From: Oleksij Rempel <ore@pengutronix.de>
Subject: Re: [PATCH v2 4/6] regulator: pfuze100: add fsl,pmic_stby_poweroff
 property
Date: Wed, 31 May 2017 16:55:36 +0200
Message-ID: <20170531145536.r2hoeoohc7eiyhw4@pengutronix.de>
References: <20170531061457.23744-1-o.rempel@pengutronix.de>
 <20170531061457.23744-5-o.rempel@pengutronix.de>
 <20170531144438.xwdbrmb76ortbgnx@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170531144438.xwdbrmb76ortbgnx@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux@rempel-privat.de, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, May 31, 2017 at 03:44:38PM +0100, Mark Brown wrote:
> On Wed, May 31, 2017 at 08:14:55AM +0200, Oleksij Rempel wrote:
> > Document the new optional "fsl,pmic_stby_poweroff" property.
> 
> I'm missing both the cover letter and the rest of the series, what's
> going on with dependencies here?

Hmm... I probably needed to add same list of maintainers to all patches.
I will fix it next time. The patches are here:
https://patchwork.kernel.org/bundle/olerem/poweroff/

Should I resend it with complete Cc list?

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
