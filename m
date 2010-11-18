From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [1/2] of/phylib: Use device tree properties to initialize Marvell
	PHYs.
Date: Thu, 18 Nov 2010 09:40:58 -0800
Message-ID: <4CE5652A.7060508@caviumnetworks.com>
References: <1290038071-13296-2-git-send-email-ddaney@caviumnetworks.com>
	<marvell-phy@mdm.bga.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <marvell-phy-kM9DGJe42AJBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org Cyril Chemparathy" <cyril-l0cyMroinI0@public.gmane.org>, Arnaud Patard <arnaud.patard-dQbF7i+pzddAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/17/2010 09:38 PM, Milton Miller wrote:
[...]
>> +static int marvell_of_reg_init(struct phy_device *phydev)
>> +{
>> +	const __be32 *paddr;
>> +	int len, i, saved_page, current_page, page_changed, ret;
>> +
>> +	if (!phydev->dev.of_node)
>> +		return 0;
>> +
>> +	paddr = of_get_property(phydev->dev.of_node, "marvell,reg-init",&len);
>> +	if (!paddr || len<  (2 * sizeof(u32)))
>> +		return 0;
>> +
>> +	saved_page = phy_read(phydev, 22);
>> +	if (saved_page<  0)
>> +		return saved_page;
>> +	page_changed = 0;
>> +	current_page = saved_page;
>> +
>> +	ret = 0;
>> +	len /= sizeof(u32);
>> +	for (i = 0; i<  len / 2; i += 2) {
>
> i<  len - 1 would execute all the register inits specified in the property.
>

Right, a bit of a snafu I think.  I will fix it.


>> +		u32 reg_spec =  be32_to_cpup(&paddr[i]);
>> +		u32 val_spec =  be32_to_cpup(&paddr[i + 1]);
>> +		u16 reg = reg_spec&  0xffff;
>> +		u16 reg_page = reg_spec>>  16;
>> +		u16 val_bits = val_spec&  0xffff;
>> +		u16 mask = val_spec>>  16;
>> +		int val;
>> +
>
> While the outcome is the same, this code also mixes sizeof(u32)
> with __be32 pointer math.

I will think about how to make it more consistent.

Thank you for looking at it,
David Daney
