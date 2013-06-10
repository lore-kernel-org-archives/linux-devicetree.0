From: Simon Baatz <gmbnomis@gmail.com>
Subject: Re: [RESEND PATCH V3 6/8] mmc: tegra: handle mmc_of_parse() errors
 during probe
Date: Tue, 11 Jun 2013 00:02:30 +0200
Message-ID: <20130610220230.GB30680@schnuecks.de>
References: <1370808858-32241-1-git-send-email-gmbnomis@gmail.com>
 <1370808858-32241-7-git-send-email-gmbnomis@gmail.com>
 <51B640F2.8030107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51B640F2.8030107@wwwdotorg.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, Jason Cooper <jason@lakedaemon.net>, Chris Ball <cjb@laptop.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Jun 10, 2013 at 03:11:14PM -0600, Stephen Warren wrote:
> On 06/09/2013 02:14 PM, Simon Baatz wrote:
> > Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> 
> Tested-by: Stephen Warren <swarren@nvidia.com>

Thanks!
 
> (On Seaboard/Springbank board, i.e. Tegra20)
> 
> > diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> 
> > +err_parse_dt:
> >  err_power_req:
> >  err_alloc_tegra_host:
> 
> Nit: It'd be nice if that new label got inserted into the middle of the
> list, so err_power_req, err_parse_dt, err_alloc_tegra_host. That way if
> we ever needed to add separate code there, they'd be in the right order
> already. Still, this isn't worth fixing unless you have to repost for
> some other reason I guess.

Yes, you are right. I updated the patch locally, so the update will
be in if I need to repost (or if the nicer version is explicitly
requested).

Since this change is only syntactical, I simply assume that your
Tested-by is still valid even with the change ;-)

- Simon
