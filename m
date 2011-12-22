From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/4] regulator: mc13892: remove the unnecessary prefix
 from regulator name
Date: Thu, 22 Dec 2011 11:08:30 +0000
Message-ID: <20111222110830.GI4546@opensource.wolfsonmicro.com>
References: <1324479647-4580-1-git-send-email-shawn.guo@linaro.org>
 <1324479647-4580-3-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1324479647-4580-3-git-send-email-shawn.guo@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2011 at 11:00:45PM +0800, Shawn Guo wrote:
> It's not really necessary to add a prefix 'MC13892__' for each mc13892
> regulator name, since the chip must have been identified as mc13892
> when we look at the regulator name.

Applied, thanks.

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Cc: Liam Girdwood <lrg@ti.com>
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Think something went wrong with your scripts here...  might be worth
checking.
