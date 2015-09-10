From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] spmi-pmic-arb: support configurable number of peripherals
Date: Wed, 9 Sep 2015 17:30:20 -0700
Message-ID: <20150910003020.GZ15099@codeaurora.org>
References: <1441322451-30149-1-git-send-email-gavidov@codeaurora.org>
 <20150904001630.GJ15099@codeaurora.org>
 <20150904120459.034920a6@gavidov-lnx.qualcomm.com>
 <20150905005011.GO15099@codeaurora.org>
 <20150909173239.0f923b0e@gavidov-lnx.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150909173239.0f923b0e@gavidov-lnx.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gilad Avidov <gavidov@codeaurora.org>
Cc: sdharia@codeaurora.org, mlocke@codeaurora.org, linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org, svarbanov@mm-sol.com, wsa@the-dreams.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iivanov@mm-sol.com, agross@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 09/09, Gilad Avidov wrote:
> On Fri, 4 Sep 2015 17:50:11 -0700
> Stephen Boyd <sboyd@codeaurora.org> wrote:
> 
> > On 09/04, Gilad Avidov wrote:
> > > On Thu, 3 Sep 2015 17:16:30 -0700
> > > Stephen Boyd <sboyd@codeaurora.org> wrote:
> > > 
> > > > On 09/03, Gilad Avidov wrote:
> 
> I agree that the algorithm is not complicated. However, I still think
> that just reading max of 512 registers is simpler and overhead is small.
> 
> > 
> > > 
> > > > processing to when we're mapping irqs, hopefully speeding up
> > > > probe for the case where you have a handful of irqs to map.
> > > 
> > > Please note that we traverse this mapping table every time a PMIC
> > > driver registers for an interrupt. This means that even if we speed
> > > up the probe of pmic-arb driver we will not speed the system boot
> > > since the probing of the PMIC drivers will register for interrupts.
> > 
> > Do we need to read all 512 entries for a typical system? If we do
> > then I agree reading it all upfront is probably better, but if we
> > only read a sparse amount of entries then we can defer it to when
> 
> We need a many of the 512 entries since for each request_irq() we
> traverse down the. Typically during boot pmic drivers request irqs.
> 
> > it's going to be used. On upstream 8974 dts files with all the
> > devices we have in DT right now, I see 75 unique register reads
> > during boot on apq8074 dragonboard.
> > 
> 
> There are still very few of pmic driver upstreamed. However, many more
> of them are likely to get upstreamed soon. Once all of them will be
> active on upstream I am sure that the number of register access will
> dramatically increase (just as it is today on Codeaurora).

So on the latest hardware I see 33 unique register reads. That's
on the codeaurora android tree. It seems to be less than on 8974.
I'll have to boot up the android tree on 8974 to see how much it
is. The patch is simple:

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index d7119db49cfe..8aea9f57f7af 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -603,6 +603,7 @@ static int search_mapping_table(struct spmi_pmic_arb_dev *pa,
 
 	for (i = 0; i < SPMI_MAPPING_TABLE_TREE_DEPTH; ++i) {
 		data = mapping_table[index];
+		pr_info("mapping table %d\n", index);
 
 		if (ppid & (1 << SPMI_MAPPING_BIT_INDEX(data))) {
 			if (SPMI_MAPPING_BIT_IS_1_FLAG(data)) {


And then

	$ dmesg | grep "mapping table " | sort -u | wc -l

> 
> > > 
> > > > 
> > > > The DT property wouldn't be necessary then. Arguably it's being
> > > > added there to optimize the size of the mapping table and isn't
> > > > really necessary otherwise.
> > > > 
> > > 
> > > We need to know this value for both memory allocation
> > > and for stopping before reading over the bounds of the
> > > mapping_table in HW.
> > > 
> > 
> > Presumably the hardware is correct and isn't telling us to read
> 
> HW tells us nothing about the size of the HW mapping table.
> 
> > entries in the mapping table that are beyond the bounds, so
> > stepping over the bounds of the mapping table cache isn't
> > possible if we always make it the size of the biggest table.
> > 
> 
> The size of the table in RAM is the driver writer choice. It is
> wasteful to have it larger then needed but no harm to stability.
> On the flip side, reading registers beyond the HW bounds can have
> undefined behavior. 

Sure. We could realloc the table at runtime if we really care
about saving the space.

> 
> > @@ -706,11 +712,37 @@ static u32 pmic_arb_offset_v1(struct
> > spmi_pmic_arb_dev *pa, u8 sid, u16 addr) return 0x800 + 0x80 *
> > pa->channel; }
> >  
> > +static u16 find_chan(struct spmi_pmic_arb_dev *pa, u16 ppid)
> > +{
> > +	u32 regval;
> > +	u16 chan;
> > +	u16 _ppid;
> > +
> > +	for (chan = pa->last_channel; ; chan++, pa->last_channel++) {
> > +		regval = readl_relaxed(pa->core +
> > PMIC_ARB_REG_CHNL(chan));
> > +		if (!regval)
> > +			continue;
> > +
> 
> I'm pretty sure that caching this table is way faster then searching it
> by reading from hw per any newly used apid. If we use 512 peripherals
> then we will read this table 512 times.

You missed the part where we don't read this table from hardware
more than once. We read the hw table linearly until we find the
ppid that we were looking for, caching other values along the
way. If that happens to be the whole table then I guess we don't
win anything by doing it here vs. in probe, but hopefully we
don't have to search the entire table on the first try to find
the ppid.

> 
> > +		_ppid = (regval >> 8) & PMIC_ARB_PPID_MASK;
> > +		pa->ppid_to_chan[_ppid] = chan | PMIC_ARB_PPID_VALID;
> > +		if (_ppid == ppid)
> > +			break;
> > +	}
> > +
> > +	return chan;
> > +}
> > +
> > +
> >  /* v2 offset per ppid (chan) and per ee */
> >  static u32 pmic_arb_offset_v2(struct spmi_pmic_arb_dev *pa, u8 sid,
> > u16 addr) {
> >  	u16 ppid = (sid << 8) | (addr >> 8);
> > -	u8  chan = pa->ppid_to_chan[ppid];
> > +	u16 chan;
> > +
> 
> I would use PMIC_ARB_PPID_VALID here to reject access to invalid ppids.

Do you mean PMIC_ARB_MAX_PPID? We don't have that check now. I
would guess that's because we assume the ppid is always valid at
this point.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
