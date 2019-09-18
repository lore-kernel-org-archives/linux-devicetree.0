From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/2] ptp: Add a ptp clock driver for IDT ClockMatrix.
Date: Wed, 18 Sep 2019 23:18:03 +0200
Message-ID: <20190918211803.GO9591@lunn.ch>
References: <1568837198-27211-1-git-send-email-vincent.cheng.xh@renesas.com>
 <1568837198-27211-2-git-send-email-vincent.cheng.xh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568837198-27211-2-git-send-email-vincent.cheng.xh@renesas.com>
Sender: netdev-owner@vger.kernel.org
To: vincent.cheng.xh@renesas.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, richardcochran@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 04:06:38PM -0400, vincent.cheng.xh@renesas.com wrote:
> From: Vincent Cheng <vincent.cheng.xh@renesas.com>
> 
> The IDT ClockMatrix (TM) family includes integrated devices that provide
> eight PLL channels.  Each PLL channel can be independently configured as a
> frequency synthesizer, jitter attenuator, digitally controlled
> oscillator (DCO), or a digital phase lock loop (DPLL).  Typically
> these devices are used as timing references and clock sources for PTP
> applications.  This patch adds support for the device.
> 
> Co-developed-by: Richard Cochran <richardcochran@gmail.com>
> Signed-off-by: Richard Cochran <richardcochran@gmail.com>
> Signed-off-by: Vincent Cheng <vincent.cheng.xh@renesas.com>

Hi Vincent 

> +static s32 idtcm_xfer(struct idtcm *idtcm,
> +		      u8 regaddr,
> +		      u8 *buf,
> +		      u16 count,
> +		      bool write)
> +{
> +	struct i2c_client *client = idtcm->client;
> +	struct i2c_msg msg[2];
> +	s32 cnt;
> +
> +	msg[0].addr = client->addr;
> +	msg[0].flags = 0;
> +	msg[0].len = 1;
> +	msg[0].buf = &regaddr;
> +
> +	msg[1].addr = client->addr;
> +	msg[1].flags = write ? 0 : I2C_M_RD;
> +	msg[1].len = count;
> +	msg[1].buf = buf;
> +
> +	cnt = i2c_transfer(client->adapter, msg, 2);
> +
> +	if (cnt < 0) {
> +		pr_err("i2c_transfer returned %d\n", cnt);

dev_err(client->dev, "i2c_transfer returned %d\n", cnt);

We then have an idea which device has a transfer error.

Please try to not use pr_err() when you have some sort of device.


> +static s32 idtcm_state_machine_reset(struct idtcm *idtcm)
> +{
> +	s32 err;
> +	u8 byte = SM_RESET_CMD;
> +
> +	err = idtcm_write(idtcm, RESET_CTRL, SM_RESET, &byte, sizeof(byte));
> +
> +	if (!err) {
> +		/* delay */
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		schedule_timeout(_msecs_to_jiffies(POST_SM_RESET_DELAY_MS));

Maybe use msleep_interruptable()? 

> +	}
> +
> +	return err;
> +}
> +
> +static s32 idtcm_load_firmware(struct idtcm *idtcm,
> +			       struct device *dev)
> +{
> +	const struct firmware *fw;
> +	struct idtcm_fwrc *rec;
> +	u32 regaddr;
> +	s32 err;
> +	s32 len;
> +	u8 val;
> +	u8 loaddr;
> +
> +	pr_info("requesting firmware '%s'\n", FW_FILENAME);

dev_debug()

> +
> +	err = request_firmware(&fw, FW_FILENAME, dev);
> +
> +	if (err)
> +		return err;
> +
> +	pr_info("firmware size %zu bytes\n", fw->size);

dev_debug()

Maybe look through all your pr_info and downgrade most of them to
dev_debug()

	Andrew
