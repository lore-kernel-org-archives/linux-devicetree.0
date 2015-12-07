From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCHv6 5/5] drm: bridge: anx78xx: Add anx78xx driver support
 by analogix.
Date: Mon, 7 Dec 2015 11:09:56 +0300
Message-ID: <20151207080956.GB18797@mwanda>
References: <1449218107-6590-1-git-send-email-enric.balletbo@collabora.com>
 <1449218107-6590-6-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1449218107-6590-6-git-send-email-enric.balletbo@collabora.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Enric Balletbo i Serra <eballetbo@gmail.com>
Cc: mark.rutland@arm.com, airlied@linux.ie, djkurtz@chromium.org, sjoerd.simons@collabora.co.uk, laurent.pinchart@ideasonboard.com, devel@driverdev.osuosl.org, drinkcat@chromium.org, cawa.cheng@mediatek.com, nathan.chung@mediatek.com, javier@dowhile0.org, treding@nvidia.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, eddie.huang@mediatek.com, cjiao@analogixsemi.com, jb.tsai@mediatek.com, gregkh@linuxfoundation.org, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, galak@codeaurora.org, span@analogixsemi.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 04, 2015 at 09:35:07AM +0100, Enric Balletbo i Serra wrote:
> +static int sp_wait_aux_op_finish(struct anx78xx *anx78xx)
> +{
> +	u8 errcnt;
> +	u8 val;
> +	struct device *dev = &anx78xx->client->dev;
> +
> +	errcnt = 150;
> +	while (errcnt--) {
> +		sp_reg_read(anx78xx, TX_P0, SP_DP_AUX_CH_CTRL2_REG, &val);
> +		if (!(val & SP_AUX_EN))
> +			break;
> +		usleep_range(2000, 4000);
> +	}
> +
> +	if (!errcnt) {

This is off by one.  It should be:

	while (--errcnt) {
		...
	}
	if (errcnt == 0)
		return -EWHATEVER;

Or:

	while (errcnt--) {
		...
	}
	if (errcnt == -1)
		return -EWHATEVER;

Also "errcnt" is a bad name, it should be retry_cnt or something (or
maybe it actually is counting errors?).  Also -1 is never a correct
error code, please change all the -1 returns to something better.

> +	/* Buffer size of AUX CH is 16 */
> +	if (count > 16)
> +		return -1;

Just make a define so that you don't need to add comments about why 16
is correct.

	if (count > SIZE_AUX_CH)
		return -EINVAL;

> +	errcnt = 10;
> +	while (errcnt--) {
> +		sp_reg_read(anx78xx, TX_P0, SP_DP_AUX_CH_CTRL2_REG, &val);
> +		if (!(val & SP_AUX_EN))
> +			break;
> +		usleep_range(1000, 2000);
> +	}
> +
> +	if (!errcnt) {
> +		dev_err(dev,
> +			"failed to read DP AUX Channel Control Register 2\n");
> +		sp_reset_aux(anx78xx);
> +		return -1;
> +	}

Off by one again.


> +
> +	sp_reg_write(anx78xx, TX_P0, SP_AUX_ADDR_7_0_REG, SP_I2C_EXTRA_ADDR);
> +	sp_tx_aux_wr(anx78xx, offset);
> +	/* read 16 bytes (MOT = 1) */
> +	sp_tx_aux_rd(anx78xx, 0xf0 | DP_AUX_I2C_MOT | DP_AUX_I2C_READ);
> +
> +	for (i = 0; i < 16; i++) {
> +		errcnt = 10;
> +		while (errcnt--) {
> +			sp_reg_read(anx78xx, TX_P0, SP_BUF_DATA_COUNT_REG,
> +				    &val);
> +			if (val & SP_BUF_DATA_COUNT_MASK)
> +				break;
> +			usleep_range(2000, 4000);
> +		}
> +
> +		if (!errcnt) {
> +			dev_err(dev,
> +				"failed to read DP Buffer Data Count Register\n");
> +			sp_reset_aux(anx78xx);
> +			return -1;
> +		}

And here.

> +	errcnt = 10;
> +	while (errcnt--) {
> +		sp_reg_read(anx78xx, TX_P0, SP_DP_AUX_CH_CTRL2_REG, &val);
> +		if (!(val & SP_AUX_EN))
> +			break;
> +		usleep_range(1000, 2000);
> +	}
> +
> +	if (!errcnt) {
> +		dev_err(dev,
> +			"failed to read DP AUX Channel Control Register 2\n");
> +		sp_reset_aux(anx78xx);
> +		return -1;
> +	}

Here.


> +
> +	return 0;
> +}
> +
> +static int sp_edid_block_checksum(const u8 *raw_edid)
> +{
> +	int i;
> +	u8 csum = 0;
> +
> +	for (i = 0; i < EDID_LENGTH; i++)
> +		csum += raw_edid[i];
> +
> +	return csum;
> +}
> +
> +static int sp_tx_edid_read(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 val, last_block, offset = 0;
> +	u8 buf[16];
> +	int i, j, count;
> +
> +	sp_tx_edid_read_initial(anx78xx);
> +	sp_reg_write(anx78xx, TX_P0, SP_DP_AUX_CH_CTRL1_REG, 0x04);
> +	sp_reg_set_bits(anx78xx, TX_P0, SP_DP_AUX_CH_CTRL2_REG,
> +			SP_AUX_EN | SP_ADDR_ONLY);
> +
> +	if (sp_wait_aux_op_finish(anx78xx))
> +		return -1;
> +
> +	sp_addronly_set(anx78xx, false);
> +
> +	/* Read the number of blocks */
> +	sp_tx_aux_wr(anx78xx, 0x7e);
> +	sp_tx_aux_rd(anx78xx, DP_AUX_I2C_READ);
> +	sp_reg_read(anx78xx, TX_P0, SP_DP_BUF_DATA0_REG, &last_block);
> +	dev_dbg(dev, "last EDID block is %d\n", last_block);
> +
> +	/* FIXME: Why not just cap to 3 if the reported value is >3 */
> +	if (last_block > 3)
> +		last_block = 1;
> +
> +	/* for every block */
> +	for (count = 0; count <= last_block; count++) {
> +		switch (count) {
> +		case 0:
> +		case 1:
> +			for (i = 0; i < 8; i++) {
> +				offset = (i + count * 8) * 16;
> +				if (sp_edid_read(anx78xx, offset, buf))
> +					return -1;
> +				for (j = 0; j < 16; j++)
> +					sp.edid_blocks[offset + j] = buf[j];
> +			}
> +			break;
> +		case 2:
> +		case 3:
> +			offset = (count == 2) ? 0x00 : 0x80;
> +			for (j = 0; j < 8; j++) {
> +				if (sp_seg_edid_read(anx78xx, count / 2,
> +						     offset))
> +					return -1;
> +				offset = offset + 0x10;
> +			}
> +			break;
> +		default:
> +			break;

Is there something which complains if you leave out the default case
statement?  It's not reachable.

> +		}
> +	}
> +
> +	sp_reset_aux(anx78xx);
> +
> +	if (!drm_edid_block_valid(sp.edid_blocks, 0, true, NULL)) {
> +		dev_err(dev, "EDID block is invalid\n");
> +		return -1;
> +	}
> +
> +	sp_dp_read_bytes_from_dpcd(anx78xx, DP_TEST_REQUEST, 1, &val);
> +	if (val & DP_TEST_LINK_EDID_READ) {
> +		dev_dbg(dev, "EDID test requested\n");
> +		val = sp_edid_block_checksum(sp.edid_blocks);
> +		dev_dbg(dev, "EDID checksum is %d\n", val);
> +		sp_dp_write_bytes_to_dpcd(anx78xx, DP_TEST_EDID_CHECKSUM, 1,
> +					  &val);
> +		sp.tx_test_edid = true;
> +		val = DP_TEST_EDID_CHECKSUM_WRITE;
> +		sp_dp_write_bytes_to_dpcd(anx78xx, DP_TEST_RESPONSE, 1, &val);
> +	}
> +
> +	return 0;
> +}
> +
> +static bool sp_check_with_pre_edid(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 i;
> +	u8 buf[16];
> +	bool ret = false;
> +
> +	sp_tx_edid_read_initial(anx78xx);
> +	sp_reg_write(anx78xx, TX_P0, SP_DP_AUX_CH_CTRL1_REG, 0x04);
> +	sp_reg_set_bits(anx78xx, TX_P0, SP_DP_AUX_CH_CTRL2_REG, 0x03);
> +
> +	if (sp_wait_aux_op_finish(anx78xx))
> +		goto return_point;
> +
> +	sp_addronly_set(anx78xx, false);
> +
> +	if (sp_edid_read(anx78xx, 0x70, buf))
> +		goto return_point;
> +
> +	for (i = 0; i < 16; i++) {
> +		if (sp.edid_blocks[0x70 + i] != buf[i]) {
> +			dev_dbg(dev, "%s\n",
> +				"different checksum and blocks num\n");
> +			goto return_point;
> +		}
> +	}

Can you just say:

	if (memcmp(&sp.edid_blocks[0x70], buf, 16) != 0) {
		dev_dbg(dev, "different checksum and blocks num\n");
		goto return_point;
	}


> +
> +	if (sp_edid_read(anx78xx, 0x08, buf))
> +		goto return_point;
> +
> +	for (i = 0; i < 16; i++) {
> +		if (sp.edid_blocks[i + 8] != buf[i]) {
> +			dev_dbg(dev, "different edid information\n");
> +			goto return_point;
> +		}
> +	}
> +
> +	ret = true;
> +return_point:
> +	sp_reset_aux(anx78xx);
> +
> +	return ret;
> +}
> +

[ snip ]

> +static bool sp_config_video_output(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	u8 val;
> +
> +	switch (sp.tx_vo_state) {
> +	default:
> +	case VO_WAIT_VIDEO_STABLE:
> +		sp_reg_read(anx78xx, RX_P0, SP_SYSTEM_STATUS_REG, &val);
> +		if ((val & SP_TMDS_DE_DET) && (val & SP_TMDS_CLOCK_DET)) {
> +			if (sp_tx_bw_lc_sel(anx78xx))
> +				return false;
> +			sp_enable_video_input(anx78xx, false);
> +			sp_hdmi_new_avi_int(anx78xx);
> +			sp_reg_read(anx78xx, RX_P0,
> +				    SP_PACKET_RECEIVING_STATUS_REG, &val);
> +			if (val & SP_VSI_RCVD)
> +				sp_hdmi_new_vsi_int(anx78xx);
> +			sp_enable_video_input(anx78xx, true);
> +			sp.tx_vo_state = VO_WAIT_TX_VIDEO_STABLE;
> +		} else {
> +			dev_dbg(dev, "HDMI input video not stable!\n");
> +			break;
> +		}
> +	/* fallthrough */
> +	case VO_WAIT_TX_VIDEO_STABLE:
> +		/*
> +		 * The flag is write clear and can be latched from last
> +		 * status. So the first read and write is to clear the
> +		 * previous status.
> +		 */
> +		sp_reg_read(anx78xx, TX_P0, SP_DP_SYSTEM_CTRL_BASE + 2, &val);
> +		sp_reg_write(anx78xx, TX_P0, SP_DP_SYSTEM_CTRL_BASE + 2, val);
> +
> +		sp_reg_read(anx78xx, TX_P0, SP_DP_SYSTEM_CTRL_BASE + 2, &val);
> +		if (val & SP_CHA_STA) {
> +			dev_dbg(dev, "stream clock not stable!\n");
> +			break;
> +		} else {


No need for the else statement.  Pull it in one indent level.

> +			/*
> +			 * The flag is write clear and can be latched from
> +			 * last status. So the first read and write is to
> +			 * clear the previous status.
> +			 */
> +			sp_reg_read(anx78xx, TX_P0,
> +				    SP_DP_SYSTEM_CTRL_BASE + 3,
> +				    &val);
> +			sp_reg_write(anx78xx, TX_P0,
> +				     SP_DP_SYSTEM_CTRL_BASE + 3,
> +				     val);
> +
> +			sp_reg_read(anx78xx, TX_P0,
> +				    SP_DP_SYSTEM_CTRL_BASE + 3,
> +				    &val);
> +			if (val & SP_STRM_VALID) {
> +				if (sp.tx_test_lt)
> +					sp.tx_test_lt = false;
> +				sp.tx_vo_state = VO_FINISH;
> +			} else {
> +				dev_err(dev, "video stream not valid!\n");
> +				break;
> +			}
> +		}
> +	/* fallthrough */
> +	case VO_FINISH:
> +		sp_block_power_ctrl(anx78xx, SP_TX_PWR_AUDIO, false);
> +		sp_hdmi_mute_video(anx78xx, false);
> +		sp_video_mute(anx78xx, false);
> +		sp_show_information(anx78xx);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +

[ snip ]

> +static void sp_config_audio(struct anx78xx *anx78xx)
> +{
> +	int i;
> +	u8 val;
> +
> +	sp_block_power_ctrl(anx78xx, SP_TX_PWR_AUDIO, true);
> +
> +	sp_reg_read(anx78xx, TX_P0, SP_DP_MAIN_LINK_BW_SET_REG, &val);
> +	if (val & SP_INITIAL_SLIM_M_AUD_SEL)
> +		if (sp_calculate_audio_m_value(anx78xx))
> +			return;

Combine these:

	if ((val & SP_INITIAL_SLIM_M_AUD_SEL) &&
	    sp_calculate_audio_m_value(anx78xx))
		return;

> +
> +	sp_reg_clear_bits(anx78xx, TX_P1, SP_AUD_INTERFACE_CTRL0_REG,
> +			  SP_AUD_INTERFACE_DISABLE);
> +
> +	sp_reg_set_bits(anx78xx, TX_P1, SP_AUD_INTERFACE_CTRL2_REG,
> +			SP_M_AUD_ADJUST_ST);
> +
> +	sp_reg_read(anx78xx, RX_P0, SP_HDMI_STATUS_REG, &val);
> +	if (val & SP_HDMI_AUD_LAYOUT)
> +		sp_reg_set_bits(anx78xx, TX_P2, SP_AUD_CH_STATUS_BASE + 5,
> +				SP_I2S_CH_NUM_8 | SP_AUDIO_LAYOUT);
> +	else
> +		sp_reg_clear_bits(anx78xx, TX_P2, SP_AUD_CH_STATUS_BASE + 5,
> +				  SP_I2S_CHANNEL_NUM_MASK | SP_AUDIO_LAYOUT);
> +
> +	/* transfer audio channel status from HDMI Rx to Slimport Tx */
> +	for (i = 1; i <= SP_AUD_CH_STATUS_REG_NUM; i++) {
> +		sp_reg_read(anx78xx, RX_P0, SP_AUD_SPDIF_CH_STATUS_BASE + i,
> +			    &val);
> +		sp_reg_write(anx78xx, TX_P2, SP_AUD_CH_STATUS_BASE + i,
> +			     val);
> +	}

Either this loop is off by one or the loop in sp_hdmi_audio_samplechg_int()
is off by one.  Also just call that function instead of re-implimenting
it here.

> +
> +	/* enable audio */
> +	sp_enable_audio_output(anx78xx, true);
> +}
> +
> +static bool sp_config_audio_output(struct anx78xx *anx78xx)
> +{
> +	u8 val;
> +
> +	switch (sp.tx_ao_state) {
> +	default:
> +	case AO_INIT:
> +	case AO_CTS_RCV_INT:
> +	case AO_AUDIO_RCV_INT:
> +		sp_reg_read(anx78xx, RX_P0, SP_HDMI_STATUS_REG, &val);
> +		if (!val & SP_HDMI_MODE) {

This is a precendence error.  It should be:

		if (!(val & SP_HDMI_MODE)) {

> +			sp.tx_ao_state = AO_INIT;
> +			return true;
> +		}
> +		break;

regards,
dan carpenter
