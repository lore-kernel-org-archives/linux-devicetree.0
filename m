From: Josh Cartwright <joshc@codeaurora.org>
Subject: Re: [PATCH v5 1/6] spmi: Linux driver framework for SPMI
Date: Tue, 18 Feb 2014 12:56:23 -0600
Message-ID: <20140218185623.GF31116@joshc.qualcomm.com>
References: <1391468739-20987-1-git-send-email-joshc@codeaurora.org>
 <1391468739-20987-2-git-send-email-joshc@codeaurora.org>
 <20140215234748.GA26494@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140215234748.GA26494@saruman.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Felipe Balbi <balbi@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gilad Avidov <gavidov@codeaurora.org>, linux-kernel@vger.kernel.org, Kenneth Heitke <kheitke@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Michael Bohan <mbohan@codeaurora.org>, linux-arm-msm@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 15, 2014 at 05:47:48PM -0600, Felipe Balbi wrote:
> On Mon, Feb 03, 2014 at 05:05:33PM -0600, Josh Cartwright wrote:
> > +#ifdef CONFIG_PM_RUNTIME
> > +static int spmi_runtime_suspend(struct device *dev)
> > +{
> > +	struct spmi_device *sdev = to_spmi_device(dev);
> > +	int err;
> > +
> > +	err = pm_generic_runtime_suspend(dev);
> > +	if (err)
> > +		return err;
> > +
> > +	return spmi_command_sleep(sdev);
> 
> shouldn't this too calls be swapped ? I mean, some pm_runtime
> implementations could be gating clocks at the driver's
> ->runtime_suspend() callback.

Perhaps.  I had added the explicit SLEEP/WAKEUP commands to
suspend()/resume(), but now I'm thinking issuing these commands should
not be the responsibility of the core, since the semantics of the
SLEEP/ACTIVE state aren't well defined in general (each
implementation/slave defines what, if anything, these states mean).

Fortunately, there are no users yet, so this is a painless change. :)

Thanks for taking a look.

  Josh

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
