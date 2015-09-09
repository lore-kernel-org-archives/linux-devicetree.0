From: Gilad Avidov <gavidov@codeaurora.org>
Subject: Re: [PATCH] spmi-pmic-arb: support configurable number of
 peripherals
Date: Wed, 9 Sep 2015 17:32:39 -0600
Message-ID: <20150909173239.0f923b0e@gavidov-lnx.qualcomm.com>
References: <1441322451-30149-1-git-send-email-gavidov@codeaurora.org>
	<20150904001630.GJ15099@codeaurora.org>
	<20150904120459.034920a6@gavidov-lnx.qualcomm.com>
	<20150905005011.GO15099@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150905005011.GO15099@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: sdharia@codeaurora.org, mlocke@codeaurora.org, linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org, svarbanov@mm-sol.com, wsa@the-dreams.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iivanov@mm-sol.com, agross@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Fri, 4 Sep 2015 17:50:11 -0700
Stephen Boyd <sboyd@codeaurora.org> wrote:

> On 09/04, Gilad Avidov wrote:
> > On Thu, 3 Sep 2015 17:16:30 -0700
> > Stephen Boyd <sboyd@codeaurora.org> wrote:
> > 
> > > On 09/03, Gilad Avidov wrote:
> > > > +			 supported by HW. Default (minimum
> > > > supported) is 128. +
> > > > +Example V1 PMIC-Arbiter:
> > > >  
> > > >  	spmi {
> > > >  		compatible = "qcom,spmi-pmic-arb";
> > > > @@ -62,4 +66,32 @@ Example:
> > > >  
> > > >  		interrupt-controller;
> > > >  		#interrupt-cells = <4>;
> > > > +
> > > > +		qcom,max-peripherals = <256>;
> > > 
> > > If it's v1 isn't it always 128? So having 256 here is just
> > > confusing.
> > 
> > Hi Stephen,
> > 
> > Actually some v1 chipsets, such as Dragonboard APQ8074, support 256
> > peripherals.
> 
> Then the commit text should be updated. It only mentions that v2
> HW has sub-versions which support more than 128.
> 

Correct, I'll update the commit text.

> > 
> > > 
> > > > +	};
> > > > +
> > > > @@ -129,14 +131,15 @@ struct spmi_pmic_arb_dev {
> > > >  	u8			channel;
> > > >  	int			irq;
> > > >  	u8			ee;
> > > > -	u8			min_apid;
> > > > -	u8			max_apid;
> > > > -	u32
> > > > mapping_table[SPMI_MAPPING_TABLE_LEN];
> > > > +	u16			min_irq_apid;
> > > > +	u16			max_irq_apid;
> > > > +	u16			max_apid;
> > > > +	u32			*mapping_table;
> > > >  	struct irq_domain	*domain;
> > > >  	struct spmi_controller	*spmic;
> > > > -	u16			apid_to_ppid[256];
> > > > +	u16			*irq_apid_to_ppid;
> > > 
> > > Please drop all this renaming noise, or at the least, put it in a
> > > different patch. More than half the patch is just changing the
> > > names of these variables for what seems like no reason.
> > > 
> > 
> > Regarding the change of max/min_apid to max/min_irq_apid:
> > max_apid was already used but the name does not make good sense.
> > Since really it is not the max_apid supported. Instead it is the
> > largest apid which interrupt is currently requested for. But now we
> > need a value that is actually the maximum supported apid. This is
> > why repurposed max_apid and corrected the previous naming.
> 
> max_apid in this patch is only used in probe, so there's no need
> for that variable to be a member of the structure. Meaning we can
> leave max_apid alone and call this new variable max_periphs or
> something like that and leave it local to the probe function.
> 

I'll avoid the renaming altogether.

> > 
> > > >  	const struct pmic_arb_ver_ops *ver_ops;
> > > > -	u8			*ppid_to_chan;
> > > > +	u16			*ppid_to_chan;
> > > >  };
> > > >  
> > > >  	struct spmi_pmic_arb_dev *pa =
> > > > irq_get_handler_data(irq); struct irq_chip *chip =
> > > > irq_get_chip(irq); void __iomem *intr = pa->intr;
> > > > -	int first = pa->min_apid >> 5;
> > > > -	int last = pa->max_apid >> 5;
> > > > +	int first = pa->min_irq_apid >> 5;
> > > > +	int last = pa->max_irq_apid >> 5;
> > > >  	u32 status;
> > > >  	int i, id;
> > > >  
> > > > @@ -903,14 +915,30 @@ static int spmi_pmic_arb_probe(struct
> > > > platform_device *pdev) 
> > > >  	pa->ee = ee;
> > > >  
> > > > -	for (i = 0; i < ARRAY_SIZE(pa->mapping_table); ++i)
> > > > -		pa->mapping_table[i] = readl_relaxed(
> > > > -				pa->cnfg +
> > > > SPMI_MAPPING_TABLE_REG(i));
> > > > +	pa->irq_apid_to_ppid = devm_kzalloc(&ctrl->dev,
> > > > pa->max_apid *
> > > > +
> > > > sizeof(*pa->irq_apid_to_ppid),
> > > > +					    GFP_KERNEL);
> > > > +	if (!pa->irq_apid_to_ppid) {
> > > > +		err = -ENOMEM;
> > > > +		goto err_put_ctrl;
> > > > +	}
> > > > +
> > > > +	pa->mapping_table = devm_kzalloc(&ctrl->dev,
> > > > +					(pa->max_apid - 1) *
> > > > sizeof(u32),
> > > > +					GFP_KERNEL);
> > > > +	if (!pa->mapping_table) {
> > > > +		err = -ENOMEM;
> > > > +		goto err_put_ctrl;
> > > > +	}
> > > > +
> > > > +	for (i = 0; i < (pa->max_apid - 1); ++i)
> > > > +		pa->mapping_table[i] = readl_relaxed(pa->cnfg +
> > > > +
> > > > SPMI_MAPPING_TABLE_REG(i));
> > 
> > > we're searching through the mapping table we can cache the value
> > > from the register if the entry isn't 0. This delays the
> > 
> > Greedy approach (reading upto 512 registers from hw) have very small
> > upfront penalty since sequential reads take place very fast
> > and HW acceleration (prefetching) will improve it. A lazy approach
> > will required much more complex algorithm (for example any value
> > including zero is valid. So we will need to augment a marker for
> > unassigned entries) and prefetching will not help.
> 
> That's solvable with a bitmap of 512 entries, not too much of a
> complicated algorithm.
> 
> We're sort of screwed now that we have to find the channel for a
> ppid by reading X number of PMIC_ARB_REG_CHNL registers. We could
> lazily do that too though, where we fill in the array linearly
> with what we read until we find the ppid we're looking for. We
> would need to do a bitmap trick again, but since we know ppid is
> at most going to use 12 bits, we can set the highest bit to
> indicate the ppid_to_chan eI agree that the algorithm is not
> complicated. However, I still think

I agree that the algorithm is not complicated. However, I still think
that just reading max of 512 registers is simpler and overhead is small.

> 
> > 
> > > processing to when we're mapping irqs, hopefully speeding up
> > > probe for the case where you have a handful of irqs to map.
> > 
> > Please note that we traverse this mapping table every time a PMIC
> > driver registers for an interrupt. This means that even if we speed
> > up the probe of pmic-arb driver we will not speed the system boot
> > since the probing of the PMIC drivers will register for interrupts.
> 
> Do we need to read all 512 entries for a typical system? If we do
> then I agree reading it all upfront is probably better, but if we
> only read a sparse amount of entries then we can defer it to when

We need a many of the 512 entries since for each request_irq() we
traverse down the. Typically during boot pmic drivers request irqs.

> it's going to be used. On upstream 8974 dts files with all the
> devices we have in DT right now, I see 75 unique register reads
> during boot on apq8074 dragonboard.
> 

There are still very few of pmic driver upstreamed. However, many more
of them are likely to get upstreamed soon. Once all of them will be
active on upstream I am sure that the number of register access will
dramatically increase (just as it is today on Codeaurora).

> > 
> > > 
> > > The DT property wouldn't be necessary then. Arguably it's being
> > > added there to optimize the size of the mapping table and isn't
> > > really necessary otherwise.
> > > 
> > 
> > We need to know this value for both memory allocation
> > and for stopping before reading over the bounds of the
> > mapping_table in HW.
> > 
> 
> Presumably the hardware is correct and isn't telling us to read

HW tells us nothing about the size of the HW mapping table.

> entries in the mapping table that are beyond the bounds, so
> stepping over the bounds of the mapping table cache isn't
> possible if we always make it the size of the biggest table.
> 

The size of the table in RAM is the driver writer choice. It is
wasteful to have it larger then needed but no harm to stability.
On the flip side, reading registers beyond the HW bounds can have
undefined behavior. 

> Here's the untested patch. I hope we don't ever have more than
> 512 periphs.
> 
> BTW, we shouldn't make qcom,channel required on v2 hardware. That
> doesn't make any sense so it should be changed to required only
> on v1 devices and we should remove it from the 8916 dtsi file.
> 
> ----8<-----
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> 
>  drivers/spmi/spmi-pmic-arb.c | 98
> +++++++++++++++++++++++++++++--------------- 1 file changed, 66
> insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c
> b/drivers/spmi/spmi-pmic-arb.c index c7aa6f1a898e..cbe963f829d7 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -10,6 +10,7 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>   * GNU General Public License for more details.
>   */
> +#include <linux/bitmap.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
> @@ -47,9 +48,9 @@
>  #define SPMI_MAPPING_BIT_IS_1_FLAG(X)	(((X) >> 8) & 0x1)
>  #define SPMI_MAPPING_BIT_IS_1_RESULT(X)	(((X) >> 0) & 0xFF)
>  
> -#define SPMI_MAPPING_TABLE_LEN		255
>  #define SPMI_MAPPING_TABLE_TREE_DEPTH	16	/* Maximum of
> 16-bits */ -#define PPID_TO_CHAN_TABLE_SZ
> BIT(12)	/* PPID is 12bit chan is 1byte*/ +#define
> PMIC_ARB_MAX_PPID		BIT(12) /* PPID is 12bit */ +#define
> PMIC_ARB_PPID_VALID		BIT(15) 
>  /* Ownership Table */
>  #define SPMI_OWNERSHIP_TABLE_REG(N)	(0x0700 + (4 * (N)))
> @@ -85,9 +86,7 @@ enum pmic_arb_cmd_op_code {
>  };
>  
>  /* Maximum number of support PMIC peripherals */
> -#define PMIC_ARB_MAX_PERIPHS		256
> -#define PMIC_ARB_MAX_CHNL		128
> -#define PMIC_ARB_PERIPH_ID_VALID	(1 << 15)
> +#define PMIC_ARB_MAX_PERIPHS		512
>  #define PMIC_ARB_TIMEOUT_US		100
>  #define PMIC_ARB_MAX_TRANS_BYTES	(8)
>  
> @@ -125,18 +124,21 @@ struct spmi_pmic_arb_dev {
>  	void __iomem		*wr_base;
>  	void __iomem		*intr;
>  	void __iomem		*cnfg;
> +	void __iomem		*core;
>  	raw_spinlock_t		lock;
>  	u8			channel;
>  	int			irq;
>  	u8			ee;
> -	u8			min_apid;
> -	u8			max_apid;
> -	u32
> mapping_table[SPMI_MAPPING_TABLE_LEN];
> +	u16			min_apid;
> +	u16			max_apid;
> +	u32			*mapping_table;
> +	DECLARE_BITMAP(mapping_table_valid, PMIC_ARB_MAX_PERIPHS);
>  	struct irq_domain	*domain;
>  	struct spmi_controller	*spmic;
> -	u16			apid_to_ppid[256];
> +	u16			*apid_to_ppid;
>  	const struct pmic_arb_ver_ops *ver_ops;
> -	u8			*ppid_to_chan;
> +	u16			*ppid_to_chan;
> +	u16			last_channel;
>  };
>  
>  /**
> @@ -614,6 +616,10 @@ static int search_mapping_table(struct
> spmi_pmic_arb_dev *pa, u32 data;
>  
>  	for (i = 0; i < SPMI_MAPPING_TABLE_TREE_DEPTH; ++i) {
> +		if (!test_and_set_bit(index,
> pa->mapping_table_valid))
> +			mapping_table[index] =
> readl_relaxed(pa->cnfg +
> +
> SPMI_MAPPING_TABLE_REG(index)); +
>  		data = mapping_table[index];
>  
>  		if (ppid & (1 << SPMI_MAPPING_BIT_INDEX(data))) {
> @@ -706,11 +712,37 @@ static u32 pmic_arb_offset_v1(struct
> spmi_pmic_arb_dev *pa, u8 sid, u16 addr) return 0x800 + 0x80 *
> pa->channel; }
>  
> +static u16 find_chan(struct spmi_pmic_arb_dev *pa, u16 ppid)
> +{
> +	u32 regval;
> +	u16 chan;
> +	u16 _ppid;
> +
> +	for (chan = pa->last_channel; ; chan++, pa->last_channel++) {
> +		regval = readl_relaxed(pa->core +
> PMIC_ARB_REG_CHNL(chan));
> +		if (!regval)
> +			continue;
> +

I'm pretty sure that caching this table is way faster then searching it
by reading from hw per any newly used apid. If we use 512 peripherals
then we will read this table 512 times.

> +		_ppid = (regval >> 8) & PMIC_ARB_PPID_MASK;
> +		pa->ppid_to_chan[_ppid] = chan | PMIC_ARB_PPID_VALID;
> +		if (_ppid == ppid)
> +			break;
> +	}
> +
> +	return chan;
> +}
> +
> +
>  /* v2 offset per ppid (chan) and per ee */
>  static u32 pmic_arb_offset_v2(struct spmi_pmic_arb_dev *pa, u8 sid,
> u16 addr) {
>  	u16 ppid = (sid << 8) | (addr >> 8);
> -	u8  chan = pa->ppid_to_chan[ppid];
> +	u16 chan;
> +

I would use PMIC_ARB_PPID_VALID here to reject access to invalid ppids.

> +	chan = pa->ppid_to_chan[ppid];
> +	if (!(chan & PMIC_ARB_PPID_VALID))
> +		chan = find_chan(pa, ppid);
> +	chan &= ~PMIC_ARB_PPID_MASK;
>  
>  	return 0x1000 * pa->ee + 0x8000 * chan;
>  }
> @@ -797,7 +829,7 @@ static int spmi_pmic_arb_probe(struct
> platform_device *pdev) struct resource *res;
>  	void __iomem *core;
>  	u32 channel, ee, hw_ver;
> -	int err, i;
> +	int err;
>  	bool is_v1;
>  
>  	ctrl = spmi_controller_alloc(&pdev->dev, sizeof(*pa));
> @@ -825,10 +857,7 @@ static int spmi_pmic_arb_probe(struct
> platform_device *pdev) pa->wr_base = core;
>  		pa->rd_base = core;
>  	} else {
> -		u8  chan;
> -		u16 ppid;
> -		u32 regval;
> -
> +		pa->core = core;
>  		pa->ver_ops = &pmic_arb_v2;
>  
>  		res = platform_get_resource_byname(pdev,
> IORESOURCE_MEM, @@ -847,23 +876,17 @@ static int
> spmi_pmic_arb_probe(struct platform_device *pdev) goto err_put_ctrl;
>  		}
>  
> -		pa->ppid_to_chan = devm_kzalloc(&ctrl->dev,
> -					PPID_TO_CHAN_TABLE_SZ,
> GFP_KERNEL);
> -		if (!pa->ppid_to_chan) {
> -			err = -ENOMEM;
> -			goto err_put_ctrl;
> -		}
>  		/*
>  		 * PMIC_ARB_REG_CHNL is a table in HW mapping
> channel to ppid.
>  		 * ppid_to_chan is an in-memory invert of that table.
>  		 */
> -		for (chan = 0; chan < PMIC_ARB_MAX_CHNL; ++chan) {
> -			regval = readl_relaxed(core +
> PMIC_ARB_REG_CHNL(chan));
> -			if (!regval)
> -				continue;
> -
> -			ppid = (regval >> 8) & 0xFFF;
> -			pa->ppid_to_chan[ppid] = chan;
> +		pa->ppid_to_chan = devm_kcalloc(&ctrl->dev,
> +						PMIC_ARB_MAX_PPID,
> +
> sizeof(*pa->ppid_to_chan),
> +						GFP_KERNEL);
> +		if (!pa->ppid_to_chan) {
> +			err = -ENOMEM;
> +			goto err_put_ctrl;
>  		}
>  	}
>  
> @@ -915,9 +938,20 @@ static int spmi_pmic_arb_probe(struct
> platform_device *pdev) 
>  	pa->ee = ee;
>  
> -	for (i = 0; i < ARRAY_SIZE(pa->mapping_table); ++i)
> -		pa->mapping_table[i] = readl_relaxed(
> -				pa->cnfg +
> SPMI_MAPPING_TABLE_REG(i));
> +	pa->apid_to_ppid = devm_kcalloc(&ctrl->dev,
> PMIC_ARB_MAX_PERIPHS,
> +
> sizeof(*pa->apid_to_ppid),
> +					    GFP_KERNEL);
> +	if (!pa->apid_to_ppid) {
> +		err = -ENOMEM;
> +		goto err_put_ctrl;
> +	}
> +
> +	pa->mapping_table = devm_kcalloc(&ctrl->dev,
> PMIC_ARB_MAX_PERIPHS - 1,
> +					sizeof(*pa->mapping_table),
> GFP_KERNEL);
> +	if (!pa->mapping_table) {
> +		err = -ENOMEM;
> +		goto err_put_ctrl;
> +	}
>  
>  	/* Initialize max_apid/min_apid to the opposite bounds,
> during
>  	 * the irq domain translation, we are sure to update these */
