From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND controller
Date: Sat, 7 Mar 2015 23:15:28 +0100
Message-ID: <CACna6ryrDT7OUAr81ebcVdnX0-_fwA24hU9FeVyFRF-BusEaMw@mail.gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
	<1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425691129-1150-4-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7 March 2015 at 02:18, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> +static int brcmnand_waitfunc(struct mtd_info *mtd, struct nand_chip *this)
> +{
> +       struct nand_chip *chip = mtd->priv;
> +       struct brcmnand_host *host = chip->priv;
> +       struct brcmnand_controller *ctrl = host->ctrl;
> +       unsigned long timeo = msecs_to_jiffies(100);
> +
> +       dev_dbg(ctrl->dev, "wait on native cmd %d\n", ctrl->cmd_pending);
> +       if (ctrl->cmd_pending &&
> +                       wait_for_completion_timeout(&ctrl->done, timeo) <= 0) {
> +               unsigned long cmd = brcmnand_read_reg(ctrl, BRCMNAND_CMD_START)
> +                                       >> brcmnand_cmd_shift(ctrl);
> +
> +               dev_err_ratelimited(ctrl->dev,
> +                       "timeout waiting for command %u (%ld)\n",
> +                       host->last_cmd, cmd);

I think that using host->last_cmd in the above message is really
misleading. Please consider following:

[    2.061139] [brcmnand_cmdfunc:1151] command:0x90 native_cmd:0x07
[    2.067123] brcmstb_nand 18028000.nand: send native cmd 7 addr_lo 0x40
[    2.168395] brcmstb_nand 18028000.nand: timeout waiting for command 144 (7)
[    2.175321] brcmstb_nand 18028000.nand: intfc status f0000000
[    2.181051] nand: device found, Manufacturer ID: 0x92, Chip ID: 0xf1
[    2.187370] nand: Eon NAND 128MiB 3,3V 8-bit
[    2.191632] nand: 128 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 64
[    2.199192] brcmstb_nand 18028000.nand: detected 128MiB total,
128KiB blocks, 2KiB pages, 16B OOB, 8-bit, BCH-8
[    2.199192]
[    2.210724] Scanning device for bad blocks
[    2.214812] brcmstb_nand 18028000.nand: send native cmd 1 addr_lo 0x0
[    2.318394] brcmstb_nand 18028000.nand: timeout waiting for command 144 (1)

As you can see, first there was a brcmnand_cmdfunc call with 0x90
(NAND_CMD_READID). It was translated into internal command 0x07
(CMD_DEVICE_ID_READ).

Then there was a call to brcmnand_read_by_pio which resulted in
sending internal command 0x01 (CMD_PAGE_READ). This one overwrote
previous command. So the timeout wasn't about 144 (0x90) anymore.

I suggest replacing that with something like
"timeout waiting for internal command 0x%02x\n", cmd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
