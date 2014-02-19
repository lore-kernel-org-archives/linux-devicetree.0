From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 4/5] ARM: Kirkwood: Fix qnap vendor prefix
Date: Wed, 19 Feb 2014 17:10:45 +0000
Message-ID: <20140219171045.GC25079@e106331-lin.cambridge.arm.com>
References: <1392814154-11284-1-git-send-email-klightspeed@killerwolves.net>
 <1392814154-11284-5-git-send-email-klightspeed@killerwolves.net>
 <20140219130553.GO17984@lunn.ch>
 <5304AE28.6030209@killerwolves.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5304AE28.6030209@killerwolves.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Peddell <klightspeed@killerwolves.net>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Anton Vorontsov <anton@enomsg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 19, 2014 at 01:14:16PM +0000, Ben Peddell wrote:
> On 19/02/14 23:05, Andrew Lunn wrote:
> >> diff --git a/drivers/power/reset/qnap-poweroff.c b/drivers/power/reset/qnap-poweroff.c
> >> index a75db7f..d350ece 100644
> >> --- a/drivers/power/reset/qnap-poweroff.c
> >> +++ b/drivers/power/reset/qnap-poweroff.c
> >> @@ -41,7 +41,7 @@ static const struct power_off_cfg synology_power_off_cfg = {
> >>  };
> >>  
> >>  static const struct of_device_id qnap_power_off_of_match_table[] = {
> >> -	{ .compatible = "qnap,power-off",
> >> +	{ .compatible = "qnapsz,power-off",
> >>  	  .data = &qnap_power_off_cfg,
> >>  	},
> > 
> > Hi Ben
> > 
> > This causes issues for devices using old DT blobs. You need to keep
> > the old entry as well as supporting the new vendor prefix.
> > 
> > We need to consider, is it worth the hassle of changing the prefix,
> > since it has been in use for a long time. I think using the stock
> > ticker is a "rule of thumb" and not a strict requirement.
> 
> So, in this case it would be best to change qnapsz back to qnap in 
> patch #1, and completely remove this patch?

If we already have users of the qnap prefix, yes please.

Thanks,
Mark.
