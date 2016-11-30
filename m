From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v3 3/3] fpga manager: Add cyclone-ps-spi driver for Altera
 FPGAs
Date: Wed, 30 Nov 2016 13:23:06 -0600
Message-ID: <alpine.DEB.2.10.1611301320440.2617@atull-730U3E-740U3E>
References: <cover.1480467185.git.stillcompiling@gmail.com>
 <e193572d7746e6f6b8666da7ac0f54031fed5214.1480467185.git.stillcompiling@gmail.com>
 <alpine.DEB.2.10.1611301122470.2617@atull-730U3E-740U3E>
 <6989b2ee-9caf-81b3-2328-9d4e287794cb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6989b2ee-9caf-81b3-2328-9d4e287794cb@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joshua Clayton <stillcompiling@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 30 Nov 2016, Joshua Clayton wrote:

Hi Joshua,

> Hi Alan,
> 
> On 11/30/2016 09:45 AM, atull wrote:
> > On Wed, 30 Nov 2016, Joshua Clayton wrote:
> >
> > Hi Clayton,
> >
> > I just have a few minor one line changes below.  Only one
> > is operational, I should have caught that earlier.
> >
> Thanks for the speedy review.
> >> +};
> >> +MODULE_DEVICE_TABLE(of, of_ef_match);
> >> +
> >> +static enum fpga_mgr_states cyclonespi_state(struct fpga_manager *mgr)
> >> +{
> >> +	return mgr->state;
> >> +}
> > This function gets called once to initialize mgr->state in
> > fpga_mgr_register().  So it should at least return the state the FPGA
> > is at then.  If it is unknown, it can just return
> > FPGA_MGR_STATE_UNKNOWN.
> >
> I guess I didn't understand the purpose of this function.
> The driver has access to the status pin at this phase, so I can return
> FPGA_MGR_STATE_UNKNOWN or FPGA_MGR_STATE_RESET depending
> on the state of that pin.
> 
> >> +
> >> +static int cyclonespi_write_init(struct fpga_manager *mgr, u32 flags,
> >> +				 const char *buf, size_t count)
> > Minor, but please fix the indentation of 'const' to match that of
> > 'struct' above.  checkpatch.pl is probably issuing warnings
> > about that.
> I double checked. The indentation is correct here. It only has
> The appearance of being off by one due to the diff format.

Yes, I understand.

> >> +{
> >> +	struct cyclonespi_conf *conf = (struct cyclonespi_conf *)mgr->priv;
> >> +	int i;
> >> +
> >> +	if (flags & FPGA_MGR_PARTIAL_RECONFIG) {
> >> +		dev_err(&mgr->dev, "Partial reconfiguration not supported.\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	gpiod_set_value(conf->config, 0);
> >> +	usleep_range(FPGA_RESET_TIME, FPGA_RESET_TIME + 20);
> >> +	if (gpiod_get_value(conf->status) == 1) {
> >> +		dev_err(&mgr->dev, "Status pin should be low.\n");
> >> +		return -EIO;
> >> +	}
> >> +
> >> +	gpiod_set_value(conf->config, 1);
> >> +	for (i = 0; i < (FPGA_MAX_DELAY / FPGA_MIN_DELAY); i++) {
> >> +		usleep_range(FPGA_MIN_DELAY, FPGA_MIN_DELAY + 20);
> >> +		if (gpiod_get_value(conf->status))
> >> +			return 0;
> >> +	}
> >> +
> >> +	dev_err(&mgr->dev, "Status pin not ready.\n");
> >> +	return -EIO;
> >> +}
> >> +
> >> +static void rev_buf(void *buf, size_t len)
> >> +{
> >> +	u32 *fw32 = (u32 *)buf;
> >> +	const u32 *fw_end = (u32 *)(buf + len);
> >> +
> >> +	/* set buffer to lsb first */
> >> +	while (fw32 < fw_end) {
> >> +		*fw32 = bitrev8x4(*fw32);
> >> +		fw32++;
> >> +	}
> >> +}
> >> +
> >> +static int cyclonespi_write(struct fpga_manager *mgr, const char *buf,
> >> +			    size_t count)
> > Please fix alignment here also.
> Same as above. Indentation is OK.
> 
> 
> I'll get a v4 turned around soon.

No rush since the other two patches need acks from
their respective maintainers and this won't be able
to go in without them.  But with that one change
it looks good to me.

Alan

> Thanks,
> Joshua
> 
