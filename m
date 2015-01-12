From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v8 0/4] FPGA Manager Framework
Date: Mon, 12 Jan 2015 17:06:43 +0300
Message-ID: <20150112140642.GD7568@mwanda>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <20150110181120.GA26067@t400>
 <alpine.DEB.2.10.1501111004580.2556@shineypoop>
 <20150111162426.GC26067@t400> <20150111195219.GA25760@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20150111195219.GA25760@amd>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Pavel Machek <pavel@denx.de>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, linus.walleij@linaro.org, pantelis.antoniou@konsulko.com, dinguyen@opensource.altera.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, iws@ovro.caltech.edu, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, rubini@gnudd.com, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, atull <atull@opensource.altera.com>, broonie@kernel.org, philip@balister.org, Konrad Zapalowicz <bergo.torino@gmail.com>, monstr@monstr.eu, gregkh@linuxfoundation.org, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundat
List-Id: devicetree@vger.kernel.org

On Sun, Jan 11, 2015 at 08:52:19PM +0100, Pavel Machek wrote:
> 
> Actually, why not? Tools should know to look at From: in the
> commit. AFAICT, Alan has it set up correctly.
> 								Pavel

Normally, the Extra From header should only be used if the patches were
sent on behalf of someone else.  It's just a bit of a pain to verify
that the Extra From matches the email headers.

Also sometimes people can't get their corporate email configured
properly for patches and so they use gmail but specify an Extra From so
their employer gets credit...  That's ok.

The patches apply fine so it's not a "redo the patch" type thing, it's
just a "In the long term, please, fix your email From header so the
Extra From isn't needed."

regards,
dan carpenter
