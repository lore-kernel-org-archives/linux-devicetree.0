From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [RFC PATCH v2 04/14] mtd: nand: define struct nand_timings
Date: Mon, 10 Mar 2014 14:44:04 +0100
Message-ID: <531DC1A4.7010208@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com> <1391006064-28890-5-git-send-email-b.brezillon.dev@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1391006064-28890-5-git-send-email-b.brezillon.dev@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Rob Herring <rob.herring@calxeda.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org

Hello,

Le 29/01/2014 15:34, Boris BREZILLON a =C3=A9crit :
> Define a struct containing the standard NAND timings as described in =
NAND
> datasheets.
>
> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
> ---
>   include/linux/mtd/nand.h |   49 +++++++++++++++++++++++++++++++++++=
+++++++++++
>   1 file changed, 49 insertions(+)
>
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 9e6c8f9..67f0829 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -805,4 +805,53 @@ static inline bool nand_is_slc(struct nand_chip =
*chip)
>   {
>   	return chip->bits_per_cell =3D=3D 1;
>   }
> +
> +/**
> + * struct nand_sdr_timings - SDR NAND chip timings
> + *
> + * This struct defines the timing requirements of a SDR NAND chip.
> + * These informations can be found in every NAND datasheets and the =
timings
> + * meaning are described in the ONFI specifications:
> + * www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf=E2=80=8E (chapt=
er 4.15 Timing
> + * Parameters)
> + *
> + */
> +
> +struct nand_sdr_timings {
> +	u32 tALH_min;
> +	u32 tADL_min;
> +	u32 tALS_min;
> +	u32 tAR_min;
> +	u32 tCEA_max;
> +	u32 tCEH_min;
> +	u32 tCH_min;
> +	u32 tCHZ_max;
> +	u32 tCLH_min;
> +	u32 tCLR_min;
> +	u32 tCLS_min;
> +	u32 tCOH_min;
> +	u32 tCS_min;
> +	u32 tDH_min;
> +	u32 tDS_min;
> +	u32 tFEAT_max;
> +	u32 tIR_min;
> +	u32 tITC_max;
> +	u32 tRC_min;
> +	u32 tREA_max;
> +	u32 tREH_min;
> +	u32 tRHOH_min;
> +	u32 tRHW_min;
> +	u32 tRHZ_max;
> +	u32 tRLOH_min;
> +	u32 tRP_min;
> +	u32 tRR_min;
> +	u64 tRST_max;
> +	u32 tWB_max;
> +	u32 tWC_min;
> +	u32 tWH_min;
> +	u32 tWHR_min;
> +	u32 tWP_min;
> +	u32 tWW_min;
> +};

Some timings are missing here (see Table 55 in the ONFI spec):

-tR
-tBERS
-tCCS
-tPLEBSY
-...

I see at least 3 of those timings that could be useful (for the moment)=
 :
- tR: this one should be used to fill the chip_delay field
- tPROG and tBERS: could be used within nand_wait to choose the timeo
   value appropriately.

The problem is that these timings cannot be deduced from the ONFI timin=
g=20
mode
but should rather be extracted from other ONFI parameters or from=20
specific DT
properties (hence why I didn't add them to the nand_sdr_timings struct=20
int the
first place).

Should I add these fields to the nand_sdr_timings struct and change the=
 way
onfi_async_timing_mode_to_sdr_timings works (fill a nand timing struct=20
passed
as an argument instead of returning a const pointer) ?
Or should I create a new struct for these timings ?
In the latter case how should I name it ?

Best Regards,

Boris

> +
>   #endif /* __LINUX_MTD_NAND_H */

