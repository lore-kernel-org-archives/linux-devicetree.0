From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: Re: [PATCH 1/3] iio: chemical: add support for Plantower PMS7003
 sensor
Date: Tue, 8 Jan 2019 20:07:57 +0100
Message-ID: <20190108190756.GA25862@arch>
References: <20190106171614.12615-1-tduszyns@gmail.com>
 <20190106171614.12615-2-tduszyns@gmail.com>
 <20190107153542.GD14782@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190107153542.GD14782@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Tomasz Duszynski <tduszyns@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2019 at 04:35:42PM +0100, Johan Hovold wrote:
> On Sun, Jan 06, 2019 at 06:16:12PM +0100, Tomasz Duszynski wrote:
> > Add support for Plantower PMS7003 particulate matter sensor.
> >
> > Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
>
> > +static int pms7003_do_cmd(struct pms7003_state *state, u8 cmd)
> > +{
> > +	/*
> > +	 * commands have following format:
> > +	 *
> > +	 * +------+------+-----+------+-----+-----------+-----------+
> > +	 * | 0x42 | 0x4d | cmd | 0x00 | arg | cksum msb | cksum lsb |
> > +	 * +------+------+-----+------+-----+-----------+-----------+
> > +	 */
> > +	u8 tmp[PMS7003_CMD_LENGTH] = { PMS7003_MAGIC_MSB, PMS7003_MAGIC_LSB };
> > +	int ret, n = 2;
> > +	u16 checksum;
> > +
> > +	switch (cmd) {
> > +	case CMD_WAKEUP:
> > +		tmp[n++] = 0xe4;
> > +		tmp[n++] = 0x00;
> > +		tmp[n++] = 0x01;
> > +		break;
> > +	case CMD_ENTER_PASSIVE_MODE:
> > +		tmp[n++] = 0xe1;
> > +		tmp[n++] = 0x00;
> > +		tmp[n++] = 0x00;
> > +		break;
> > +	case CMD_READ_PASSIVE:
> > +		tmp[n++] = 0xe2;
> > +		tmp[n++] = 0x00;
> > +		tmp[n++] = 0x00;
> > +		break;
> > +	case CMD_SLEEP:
> > +		tmp[n++] = 0xe4;
> > +		tmp[n++] = 0x00;
> > +		tmp[n++] = 0x00;
> > +		break;
> > +	}
> > +
> > +	checksum = pms7003_calc_checksum(tmp, n);
> > +	put_unaligned_be16(checksum, tmp + n);
> > +	n += PMS7003_CHECKSUM_LENGTH;
> > +
> > +	ret = serdev_device_write(state->serdev, tmp, n, PMS7003_TIMEOUT);
> > +	if (ret)
> > +		return ret;
>
> Beginning with 5.0, serdev_device_write() returns the number of bytes
> written before timeout (or being interrupted) so you need to check
> against < n here.
>

Right, on the second though that can be simplified by just ignoring
return value I guess. Anyway, thanks for pointing this out.

> Johan
