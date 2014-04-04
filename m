From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] axs_nand - add driver for NAND controller used on
 Synopsys AXS dev boards
Date: Fri, 4 Apr 2014 11:09:34 -0300
Message-ID: <20140404140933.GA25772@arch.cereza>
References: <1396597089-1081-1-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396597089-1081-1-git-send-email-abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Francois Bedard <Francois.Bedard-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Apr 04, Alexey Brodkin wrote:
> Signed-off-by: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>=20

Maybe it would be nice adding some driver description here, so the comm=
it
log actually says something useful about the commit.

[..]
> Reviewed-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> +/**
> + * axs_flag_wait_and_reset - Waits until requested flag in INT_STATU=
S register
> + *              is set by HW and resets it by writing "1" in INT_CLR=
_STATUS.
> + * @host:	Pointer to private data structure.
> + * @flag:	Bit/flag offset in INT_STATUS register
> + */
> +static void axs_flag_wait_and_reset(struct axs_nand_host *host, int =
flag)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < AXS_FLAG_WAIT_DELAY * 100; i++) {
> +		unsigned int status =3D reg_get(host, INT_STATUS);
> +
> +		if (status & (1 << flag)) {
> +			reg_set(host, INT_CLR_STATUS, 1 << flag);
> +			return;
> +		}
> +
> +		udelay(10);
> +	}
> +
> +	/*
> +	 * Since we cannot report this problem any further than
> +	 * axs_nand_{write|read}_buf() letting user know there's a problem.
> +	 */
> +	dev_err(host->dev, "Waited too long (%d s.) for flag/bit %d\n",
> +		AXS_FLAG_WAIT_DELAY, flag);
> +}

Hm... I'm not sure the above is really true.

The NAND core uses the replaceable chip->waitfunc callback to check the
status of issued commands. See for instance:

static int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *c=
hip,
                              int page)
{
        int status =3D 0;
        const uint8_t *buf =3D chip->oob_poi;
        int length =3D mtd->oobsize;

        chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
        chip->write_buf(mtd, buf, length);
        /* Send command to program the OOB data */
        chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);

        status =3D chip->waitfunc(mtd, chip);

        return status & NAND_STATUS_FAIL ? -EIO : 0;
}

On the other side, if you are clearing the flags in axs_flag_wait_and_r=
eset()
it might be a bit hard for you to get this right.

IOW, I'm not saying you *must* do this, but instead suggesting that you=
 take
a look at waitfunc() and see if it helps report a proper error in the
read/write path.
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
