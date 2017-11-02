From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/7] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Date: Thu, 2 Nov 2017 15:45:26 -0700
Message-ID: <ee206580-e419-903f-de36-72d5803b1b7b@caviumnetworks.com>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-7-david.daney@cavium.com>
 <55d6cf88-7444-42ea-02f1-27efdee2be4b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55d6cf88-7444-42ea-02f1-27efdee2be4b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/02/2017 12:13 PM, Florian Fainelli wrote:
> On 11/01/2017 05:36 PM, David Daney wrote:
>> From: Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>
>> The Cavium OCTEON cn78xx and cn73xx SoCs have network packet I/O
>> hardware that is significantly different from previous generations of
>> the family.
>>
>> Add a new driver for this hardware.  The Ethernet MAC is called BGX on
>> these devices.  Common code for the MAC is in octeon3-bgx-port.c.
>> Four of these BGX MACs are grouped together and managed as a group by
>> octeon3-bgx-nexus.c.  Ingress packet classification is done by the PKI
>> unit initialized in octeon3-pki.c.  Queue management is done in the
>> SSO, initialized by octeon3-sso.c.  Egress is handled by the PKO,
>> initialized in octeon3-pko.c.
>>
>> Signed-off-by: Carlos Munoz <cmunoz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Steven J. Hill <Steven.Hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> ---
> 
>> +static char *mix_port;
>> +module_param(mix_port, charp, 0444);
>> +MODULE_PARM_DESC(mix_port, "Specifies which ports connect to MIX interfaces.");
> 
> Can you derive this from Device Tree /platform data configuration?
> 
>> +
>> +static char *pki_port;
>> +module_param(pki_port, charp, 0444);
>> +MODULE_PARM_DESC(pki_port, "Specifies which ports connect to the PKI.");
> 
> Likewise

The SoC is flexible in how it is configured.  Technically the device 
tree should only be used to specify information about the physical 
configuration of the system that cannot be probed for, and this is about 
policy rather that physical wiring.  That said, we do take the default 
configuration from the device tree, but give the option here to override 
via the module command line.

> 
>> +
>> +#define MAX_MIX_PER_NODE	2
>> +
>> +#define MAX_MIX			(MAX_NODES * MAX_MIX_PER_NODE)
>> +
>> +/**
>> + * struct mix_port_lmac - Describes a lmac that connects to a mix
>> + *			  port. The lmac must be on the same node as
>> + *			  the mix.
>> + * @node:	Node of the lmac.
>> + * @bgx:	Bgx of the lmac.
>> + * @lmac:	Lmac index.
>> + */
>> +struct mix_port_lmac {
>> +	int	node;
>> +	int	bgx;
>> +	int	lmac;
>> +};
>> +
>> +/* mix_ports_lmacs contains all the lmacs connected to mix ports */
>> +static struct mix_port_lmac mix_port_lmacs[MAX_MIX];
>> +
>> +/* pki_ports keeps track of the lmacs connected to the pki */
>> +static bool pki_ports[MAX_NODES][MAX_BGX_PER_NODE][MAX_LMAC_PER_BGX];
>> +
>> +/* Created platform devices get added to this list */
>> +static struct list_head pdev_list;
>> +static struct mutex pdev_list_lock;
>> +
>> +/* Created platform device use this structure to add themselves to the list */
>> +struct pdev_list_item {
>> +	struct list_head	list;
>> +	struct platform_device	*pdev;
>> +};
> 
> Don't you have a top-level platform device that you could use which
> would hold this data instead of having it here?

This is the top-level platform device.


> 
> [snip]
> 
>> +/* Registers are accessed via xkphys */
>> +#define SSO_BASE			0x1670000000000ull
>> +#define SSO_ADDR(node)			(SET_XKPHYS + NODE_OFFSET(node) +      \
>> +					 SSO_BASE)
>> +#define GRP_OFFSET(grp)			((grp) << 16)
>> +#define GRP_ADDR(n, g)			(SSO_ADDR(n) + GRP_OFFSET(g))
>> +#define SSO_GRP_AQ_CNT(n, g)		(GRP_ADDR(n, g)		   + 0x20000700)
>> +
>> +#define MIO_PTP_BASE			0x1070000000000ull
>> +#define MIO_PTP_ADDR(node)		(SET_XKPHYS + NODE_OFFSET(node) +      \
>> +					 MIO_PTP_BASE)
>> +#define MIO_PTP_CLOCK_CFG(node)		(MIO_PTP_ADDR(node)		+ 0xf00)
>> +#define MIO_PTP_CLOCK_HI(node)		(MIO_PTP_ADDR(node)		+ 0xf10)
>> +#define MIO_PTP_CLOCK_COMP(node)	(MIO_PTP_ADDR(node)		+ 0xf18)
> 
> I am sure this will work great on anything but MIPS64 ;)

Sarcasm duly noted.

That said, by definition it is exactly an OCTEON-III/MIPS64, and can 
never be anything else.  It is known a priori that the hardware and this 
driver will never be used anywhere else.

> 
>> +
>> +struct octeon3_ethernet;
>> +
>> +struct octeon3_rx {
>> +	struct napi_struct	napi;
>> +	struct octeon3_ethernet *parent;
>> +	int rx_grp;
>> +	int rx_irq;
>> +	cpumask_t rx_affinity_hint;
>> +} ____cacheline_aligned_in_smp;
>> +
>> +struct octeon3_ethernet {
>> +	struct bgx_port_netdev_priv bgx_priv; /* Must be first element. */
>> +	struct list_head list;
>> +	struct net_device *netdev;
>> +	enum octeon3_mac_type mac_type;
>> +	struct octeon3_rx rx_cxt[MAX_RX_QUEUES];
>> +	struct ptp_clock_info ptp_info;
>> +	struct ptp_clock *ptp_clock;
>> +	struct cyclecounter cc;
>> +	struct timecounter tc;
>> +	spinlock_t ptp_lock;		/* Serialize ptp clock adjustments */
>> +	int num_rx_cxt;
>> +	int pki_aura;
>> +	int pknd;
>> +	int pko_queue;
>> +	int node;
>> +	int interface;
>> +	int index;
>> +	int rx_buf_count;
>> +	int tx_complete_grp;
>> +	int rx_timestamp_hw:1;
>> +	int tx_timestamp_hw:1;
>> +	spinlock_t stat_lock;		/* Protects stats counters */
>> +	u64 last_packets;
>> +	u64 last_octets;
>> +	u64 last_dropped;
>> +	atomic64_t rx_packets;
>> +	atomic64_t rx_octets;
>> +	atomic64_t rx_dropped;
>> +	atomic64_t rx_errors;
>> +	atomic64_t rx_length_errors;
>> +	atomic64_t rx_crc_errors;
>> +	atomic64_t tx_packets;
>> +	atomic64_t tx_octets;
>> +	atomic64_t tx_dropped;
> 
> Do you really need those to be truly atomic64_t types, can't you use u64
> and use the helpers from u64_stats_sync.h? That should be good enough?

There is room for improvement here.  We probably need to keep statistics 
per queue, and then the atomic business would be unnecessary.


> 
>> +	/* The following two fields need to be on a different cache line as
>> +	 * they are updated by pko which invalidates the cache every time it
>> +	 * updates them. The idea is to prevent other fields from being
>> +	 * invalidated unnecessarily.
>> +	 */
>> +	char cacheline_pad1[CVMX_CACHE_LINE_SIZE];
>> +	atomic64_t buffers_needed;
>> +	atomic64_t tx_backlog;
>> +	char cacheline_pad2[CVMX_CACHE_LINE_SIZE];
>> +};
>> +
>> +static DEFINE_MUTEX(octeon3_eth_init_mutex);
>> +
>> +struct octeon3_ethernet_node;
>> +
>> +struct octeon3_ethernet_worker {
>> +	wait_queue_head_t queue;
>> +	struct task_struct *task;
>> +	struct octeon3_ethernet_node *oen;
>> +	atomic_t kick;
>> +	int order;
>> +};
>> +
>> +struct octeon3_ethernet_node {
>> +	bool init_done;
>> +	int next_cpu_irq_affinity;
>> +	int node;
>> +	int pki_packet_pool;
>> +	int sso_pool;
>> +	int pko_pool;
>> +	void *sso_pool_stack;
>> +	void *pko_pool_stack;
>> +	void *pki_packet_pool_stack;
>> +	int sso_aura;
>> +	int pko_aura;
>> +	int tx_complete_grp;
>> +	int tx_irq;
>> +	cpumask_t tx_affinity_hint;
>> +	struct octeon3_ethernet_worker workers[8];
>> +	struct mutex device_list_lock;	/* Protects the device list */
>> +	struct list_head device_list;
>> +	spinlock_t napi_alloc_lock;	/* Protects napi allocations */
>> +};
>> +
>> +static int wait_pko_response;
>> +module_param(wait_pko_response, int, 0644);
>> +MODULE_PARM_DESC(wait_pko_response, "Wait for response after each pko command.");
> 
> Under which circumstances is this used?

Rarely if ever, I think I will remove it.

> 
>> +
>> +static int num_packet_buffers = 768;
>> +module_param(num_packet_buffers, int, 0444);
>> +MODULE_PARM_DESC(num_packet_buffers,
>> +		 "Number of packet buffers to allocate per port.");
> 
> Consider implementing ethtool -g/G for this.

That may be work for a follow-on patch.

> 
>> +
>> +static int packet_buffer_size = 2048;
>> +module_param(packet_buffer_size, int, 0444);
>> +MODULE_PARM_DESC(packet_buffer_size, "Size of each RX packet buffer.");
> 
> How is that different from adjusting the network device's MTU?

Multiple buffers may be linked together creating a fragmented packet for 
MTU greater than packet_buffer_size.

MTU controls which packets are rejected because they are too large.
packet_buffer_size is the size of the RX buffers.


> 
>> +
>> +static int rx_queues = 1;
>> +module_param(rx_queues, int, 0444);
>> +MODULE_PARM_DESC(rx_queues, "Number of RX threads per port.");
> 
> Same thing, can you consider using an ethtool knob for that?

Also may be work for a follow-on patch.

> 
>> +
>> +int ilk0_lanes = 1;
>> +module_param(ilk0_lanes, int, 0444);
>> +MODULE_PARM_DESC(ilk0_lanes, "Number of SerDes lanes used by ILK link 0.");
>> +
>> +int ilk1_lanes = 1;
>> +module_param(ilk1_lanes, int, 0444);
>> +MODULE_PARM_DESC(ilk1_lanes, "Number of SerDes lanes used by ILK link 1.");
>> +
>> +static struct octeon3_ethernet_node octeon3_eth_node[MAX_NODES];
>> +static struct kmem_cache *octeon3_eth_sso_pko_cache;
>> +
>> +/**
>> + * Reads a 64 bit value from the processor local scratchpad memory.
>> + *
>> + * @param offset byte offset into scratch pad to read
>> + *
>> + * @return value read
>> + */
>> +static inline u64 scratch_read64(u64 offset)
>> +{
>> +	return *(u64 *)((long)SCRATCH_BASE + offset);
>> +}
> 
> No barriers needed whatsoever?

Nope.

> 
>> +
>> +/**
>> + * Write a 64 bit value to the processor local scratchpad memory.
>> + *
>> + * @param offset byte offset into scratch pad to write
>> + @ @praram value to write
>> + */
>> +static inline void scratch_write64(u64 offset, u64 value)
>> +{
>> +	*(u64 *)((long)SCRATCH_BASE + offset) = value;
>> +}
>> +
>> +static int get_pki_chan(int node, int interface, int index)
>> +{
>> +	int	pki_chan;
>> +
>> +	pki_chan = node << 12;
>> +
>> +	if (OCTEON_IS_MODEL(OCTEON_CNF75XX) &&
>> +	    (interface == 1 || interface == 2)) {
>> +		/* SRIO */
>> +		pki_chan |= 0x240 + (2 * (interface - 1)) + index;
>> +	} else {
>> +		/* BGX */
>> +		pki_chan |= 0x800 + (0x100 * interface) + (0x10 * index);
>> +	}
>> +
>> +	return pki_chan;
>> +}
>> +
>> +/* Map auras to the field priv->buffers_needed. Used to speed up packet
>> + * transmission.
>> + */
>> +static void *aura2bufs_needed[MAX_NODES][FPA3_NUM_AURAS];
>> +
>> +static int octeon3_eth_lgrp_to_ggrp(int node, int grp)
>> +{
>> +	return (node << 8) | grp;
>> +}
>> +
>> +static void octeon3_eth_gen_affinity(int node, cpumask_t *mask)
>> +{
>> +	int cpu;
>> +
>> +	do {
>> +		cpu = cpumask_next(octeon3_eth_node[node].next_cpu_irq_affinity, cpu_online_mask);
>> +		octeon3_eth_node[node].next_cpu_irq_affinity++;
>> +		if (cpu >= nr_cpu_ids) {
>> +			octeon3_eth_node[node].next_cpu_irq_affinity = -1;
>> +			continue;
>> +		}
>> +	} while (false);
>> +	cpumask_clear(mask);
>> +	cpumask_set_cpu(cpu, mask);
>> +}
>> +
>> +struct wr_ret {
>> +	void *work;
>> +	u16 grp;
>> +};
>> +
>> +static inline struct wr_ret octeon3_core_get_work_sync(int grp)
>> +{
>> +	u64		node = cvmx_get_node_num();
>> +	u64		addr;
>> +	u64		response;
>> +	struct wr_ret	r;
>> +
>> +	/* See SSO_GET_WORK_LD_S for the address to read */
>> +	addr = 1ull << 63;
>> +	addr |= BIT(48);
>> +	addr |= DID_TAG_SWTAG << 40;
>> +	addr |= node << 36;
>> +	addr |= BIT(30);
>> +	addr |= BIT(29);
>> +	addr |= octeon3_eth_lgrp_to_ggrp(node, grp) << 4;
>> +	addr |= SSO_NO_WAIT << 3;
>> +	response = __raw_readq((void __iomem *)addr);
>> +
>> +	/* See SSO_GET_WORK_RTN_S for the format of the response */
>> +	r.grp = (response & GENMASK_ULL(57, 48)) >> 48;
>> +	if (response & BIT(63))
>> +		r.work = NULL;
>> +	else
>> +		r.work = phys_to_virt(response & GENMASK_ULL(41, 0));
> 
> There are quite a lot of phys_to_virt() and virt_to_phys() uses
> throughout this driver, this will likely not work on anything but
> MIPS64, so there should be a better way, abstracted to do this, see below.

See above, this is OCTEON-III/MIPS64 only.  More abstractions don't 
solve any problems, and may introduce function calls in the hot path 
with their associated pipeline stalls and branch mispredictions.


> 
>> +
>> +	return r;
>> +}
>> +
>> +/**
>> + * octeon3_core_get_work_async - Request work via a iobdma command. Doesn't wait
>> + *				 for the response.
>> + *
>> + * @grp: Group to request work for.
>> + */
>> +static inline void octeon3_core_get_work_async(unsigned int grp)
>> +{
>> +	u64	data;
>> +	u64	node = cvmx_get_node_num();
>> +
>> +	/* See SSO_GET_WORK_DMA_S for the command structure */
>> +	data = SCR_SCRATCH << 56;
>> +	data |= 1ull << 48;
>> +	data |= DID_TAG_SWTAG << 40;
>> +	data |= node << 36;
>> +	data |= 1ull << 30;
>> +	data |= 1ull << 29;
>> +	data |= octeon3_eth_lgrp_to_ggrp(node, grp) << 4;
>> +	data |= SSO_NO_WAIT << 3;
>> +
>> +	__raw_writeq(data, (void __iomem *)IOBDMA_SENDSINGLE);
>> +}
>> +
>> +/**
>> + * octeon3_core_get_response_async - Read the request work response. Must be
>> + *				     called after calling
>> + *				     octeon3_core_get_work_async().
>> + *
>> + * Returns work queue entry.
>> + */
>> +static inline struct wr_ret octeon3_core_get_response_async(void)
>> +{
>> +	struct wr_ret	r;
>> +	u64		response;
>> +
>> +	CVMX_SYNCIOBDMA;
>> +	response = scratch_read64(SCR_SCRATCH);
>> +
>> +	/* See SSO_GET_WORK_RTN_S for the format of the response */
>> +	r.grp = (response & GENMASK_ULL(57, 48)) >> 48;
>> +	if (response & BIT(63))
>> +		r.work = NULL;
>> +	else
>> +		r.work = phys_to_virt(response & GENMASK_ULL(41, 0));
>> +
>> +	return r;
>> +}
>> +
>> +static void octeon3_eth_replenish_rx(struct octeon3_ethernet *priv, int count)
>> +{
>> +	struct sk_buff *skb;
>> +	int i;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		void **buf;
>> +
>> +		skb = __alloc_skb(packet_buffer_size, GFP_ATOMIC, 0, priv->node);
>> +		if (!skb)
>> +			break;
>> +		buf = (void **)PTR_ALIGN(skb->head, 128);
>> +		buf[SKB_PTR_OFFSET] = skb;
> 
> Can you use build_skb()?

In theory we could, but that would require changing the architecture of 
the driver to use page fragments.  For better or worse, the choice was 
made to use __alloc_skb() instead.


> 
>> +		octeon_fpa3_free(priv->node, priv->pki_aura, buf);
>> +	}
>> +}
>> +
> 
> [snip]
> 
>> +static int octeon3_eth_tx_complete_worker(void *data)
>> +{
>> +	struct octeon3_ethernet_worker *worker = data;
>> +	struct octeon3_ethernet_node *oen = worker->oen;
>> +	int backlog;
>> +	int order = worker->order;
>> +	int tx_complete_stop_thresh = order * 100;
>> +	int backlog_stop_thresh = order == 0 ? 31 : order * 80;
>> +	u64 aq_cnt;
>> +	int i;
>> +
>> +	while (!kthread_should_stop()) {
>> +		wait_event_interruptible(worker->queue, octeon3_eth_tx_complete_runnable(worker));
>> +		atomic_dec_if_positive(&worker->kick); /* clear the flag */
>> +
>> +		do {
>> +			backlog = octeon3_eth_replenish_all(oen);
>> +			for (i = 0; i < 100; i++) {
> 
> Do you really want to bound your TX reclamation worker, all other
> network drivers never bound their napi TX completion task and instead
> reclaim every transmitted buffers.

They are not bounded, just chunked.  Note the outer do loop.

> 
>> +				void **work;
>> +				struct net_device *tx_netdev;
>> +				struct octeon3_ethernet *tx_priv;
>> +				struct sk_buff *skb;
>> +				struct wr_ret r;
>> +
>> +				r = octeon3_core_get_work_sync(oen->tx_complete_grp);
>> +				work = r.work;
>> +				if (!work)
>> +					break;
>> +				tx_netdev = work[0];
>> +				tx_priv = netdev_priv(tx_netdev);
>> +				if (unlikely(netif_queue_stopped(tx_netdev)) &&
>> +				    atomic64_read(&tx_priv->tx_backlog) < MAX_TX_QUEUE_DEPTH)
>> +					netif_wake_queue(tx_netdev);
>> +				skb = container_of((void *)work, struct sk_buff, cb);
>> +				if (unlikely(tx_priv->tx_timestamp_hw) &&
>> +				    unlikely(skb_shinfo(skb)->tx_flags & SKBTX_IN_PROGRESS))
>> +					octeon3_eth_tx_complete_hwtstamp(tx_priv, skb);
> 
> This is where you should be incremeting the TX bytes and packets
> statistcs, not in your ndo_start_xmit() like you are currently doing.

See below...

> 
>> +				dev_kfree_skb(skb);
> 
> Consider using dev_consume_skb() to be drop-monitor friendly.

I will look at that.

> 
>> +			}
>> +
>> +			aq_cnt = oct_csr_read(SSO_GRP_AQ_CNT(oen->node, oen->tx_complete_grp));
>> +			aq_cnt &= GENMASK_ULL(32, 0);
>> +			if ((backlog > backlog_stop_thresh || aq_cnt > tx_complete_stop_thresh) &&
>> +			    order < ARRAY_SIZE(oen->workers) - 1) {
>> +				atomic_set(&oen->workers[order + 1].kick, 1);
>> +				wake_up(&oen->workers[order + 1].queue);
>> +			}
>> +		} while (!need_resched() &&
>> +			 (backlog > backlog_stop_thresh ||
>> +			  aq_cnt > tx_complete_stop_thresh));
>> +
>> +		cond_resched();
>> +
>> +		if (!octeon3_eth_tx_complete_runnable(worker))
>> +			octeon3_sso_irq_set(oen->node, oen->tx_complete_grp, true);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t octeon3_eth_tx_handler(int irq, void *info)
>> +{
>> +	struct octeon3_ethernet_node *oen = info;
>> +	/* Disarm the irq. */
>> +	octeon3_sso_irq_set(oen->node, oen->tx_complete_grp, false);
>> +	atomic_set(&oen->workers[0].kick, 1);
>> +	wake_up(&oen->workers[0].queue);
> 
> Can you move the whole worker to a NAPI context/softirq context?

This could be an enhancement.

> 
>> +	return IRQ_HANDLED;
>> +}
>> +
[...]

>> +
>> +		/* Strip the ethernet fcs */
>> +		pskb_trim(skb, skb->len - 4);
>> +	}
>> +
>> +	if (likely(priv->netdev->flags & IFF_UP)) {
>> +		skb_checksum_none_assert(skb);
>> +		if (unlikely(priv->rx_timestamp_hw)) {
>> +			/* The first 8 bytes are the timestamp */
>> +			u64 hwts = *(u64 *)skb->data;
>> +			u64 ns;
>> +			struct skb_shared_hwtstamps *shts;
>> +
>> +			ns = timecounter_cyc2time(&priv->tc, hwts);
>> +			shts = skb_hwtstamps(skb);
>> +			memset(shts, 0, sizeof(*shts));
>> +			shts->hwtstamp = ns_to_ktime(ns);
>> +			__skb_pull(skb, 8);
>> +		}
>> +
>> +		skb->protocol = eth_type_trans(skb, priv->netdev);
>> +		skb->dev = priv->netdev;
>> +		if (priv->netdev->features & NETIF_F_RXCSUM) {
>> +			if ((work->word2.lc_hdr_type == PKI_LTYPE_IP4 ||
>> +			     work->word2.lc_hdr_type == PKI_LTYPE_IP6) &&
>> +			    (work->word2.lf_hdr_type == PKI_LTYPE_TCP ||
>> +			     work->word2.lf_hdr_type == PKI_LTYPE_UDP ||
>> +			     work->word2.lf_hdr_type == PKI_LTYPE_SCTP))
>> +				if (work->word2.err_code == 0)
>> +					skb->ip_summed = CHECKSUM_UNNECESSARY;
>> +		}
>> +
>> +		napi_gro_receive(&rx->napi, skb);
>> +	} else {
>> +		/* Drop any packet received for a device that isn't up */
> 
> If that happens, is not that a blatant indication that there is a bug in
> how the interface is brought down?

Yes.  I think we can remove this bit.

> 
>> +		atomic64_inc(&priv->rx_dropped);
>> +		dev_kfree_skb_any(skb);
>> +	}
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int octeon3_eth_napi(struct napi_struct *napi, int budget)
>> +{
>> +	int rx_count = 0;
>> +	struct octeon3_rx *cxt;
>> +	struct octeon3_ethernet *priv;
>> +	u64 aq_cnt;
>> +	int n = 0;
>> +	int n_bufs = 0;
>> +	u64 old_scratch;
>> +
>> +	cxt = container_of(napi, struct octeon3_rx, napi);
>> +	priv = cxt->parent;
>> +
>> +	/* Get the amount of work pending */
>> +	aq_cnt = oct_csr_read(SSO_GRP_AQ_CNT(priv->node, cxt->rx_grp));
>> +	aq_cnt &= GENMASK_ULL(32, 0);
>> +
>> +	if (likely(USE_ASYNC_IOBDMA)) {
>> +		/* Save scratch in case userspace is using it */
>> +		CVMX_SYNCIOBDMA;
>> +		old_scratch = scratch_read64(SCR_SCRATCH);
>> +
>> +		octeon3_core_get_work_async(cxt->rx_grp);
>> +	}
>> +
>> +	while (rx_count < budget) {
>> +		n = 0;
>> +
>> +		if (likely(USE_ASYNC_IOBDMA)) {
>> +			bool req_next = rx_count < (budget - 1) ? true : false;
>> +
>> +			n = octeon3_eth_rx_one(cxt, true, req_next);
>> +		} else {
>> +			n = octeon3_eth_rx_one(cxt, false, false);
>> +		}
>> +
>> +		if (n == 0)
>> +			break;
>> +
>> +		n_bufs += n;
>> +		rx_count++;
>> +	}
>> +
>> +	/* Wake up worker threads */
>> +	n_bufs = atomic64_add_return(n_bufs, &priv->buffers_needed);
>> +	if (n_bufs >= 32) {
>> +		struct octeon3_ethernet_node *oen;
>> +
>> +		oen = octeon3_eth_node + priv->node;
>> +		atomic_set(&oen->workers[0].kick, 1);
>> +		wake_up(&oen->workers[0].queue);
>> +	}
>> +
>> +	/* Stop the thread when no work is pending */
>> +	if (rx_count < budget) {
>> +		napi_complete(napi);
>> +		octeon3_sso_irq_set(cxt->parent->node, cxt->rx_grp, true);
>> +	}
>> +
>> +	if (likely(USE_ASYNC_IOBDMA)) {
>> +		/* Restore the scratch area */
>> +		scratch_write64(SCR_SCRATCH, old_scratch);
>> +	}
>> +
>> +	return rx_count;
>> +}
>> +
>> +#undef BROKEN_SIMULATOR_CSUM
>> +
>> +static void ethtool_get_drvinfo(struct net_device *netdev,
>> +				struct ethtool_drvinfo *info)
>> +{
>> +	strcpy(info->driver, "octeon3-ethernet");
>> +	strcpy(info->version, "1.0");
>> +	strcpy(info->bus_info, "Builtin");
> 
> I believe the correct way to specify that type of bus is to use "platform".

OK.

> 
> [snip]
> 
>> +static int octeon3_eth_common_ndo_stop(struct net_device *netdev)
>> +{
>> +	struct octeon3_ethernet *priv = netdev_priv(netdev);
>> +	void **w;
>> +	struct sk_buff *skb;
>> +	struct octeon3_rx *rx;
>> +	int i;
>> +
>> +	/* Allow enough time for ingress in transit packets to be drained */
>> +	msleep(20);
> 
> Can you find a better way to do that? You can put a hard disable on the
> hardware, and then wait until a particular condition to indicate full
> drainage?

We are doing the "hard disable", we must wait a non-zero (but bounded) 
abount of time before we can reliably do the polling for the backlog to 
reach zero.  Perhaps the comment is all that needs improving.

> 
> [snip]
> 
>> +static int octeon3_eth_ndo_start_xmit(struct sk_buff *skb,
>> +				      struct net_device *netdev)
>> +{
>> +	struct sk_buff *skb_tmp;
>> +	struct octeon3_ethernet *priv = netdev_priv(netdev);
>> +	u64 scr_off = LMTDMA_SCR_OFFSET;
>> +	u64 pko_send_desc;
>> +	u64 lmtdma_data;
>> +	u64 aq_cnt = 0;
>> +	struct octeon3_ethernet_node *oen;
>> +	long backlog;
>> +	int frag_count;
>> +	u64 head_len;
>> +	int i;
>> +	u64 *dma_addr;
> 
> dma_addr_t?

Nope.

Perhaps we should rename the variable to:

    u64 *lmtdma_addr;

It is a very special virtual address that must have the command word 
written into it.

> 
>> +	void **work;
>> +	unsigned int mss;
>> +	int grp;
>> +
>> +	frag_count = 0;
>> +	if (skb_has_frag_list(skb))
>> +		skb_walk_frags(skb, skb_tmp)
>> +			frag_count++;
>> +
>> +	/* Stop the queue if pko or sso are not keeping up */
>> +	oen = octeon3_eth_node + priv->node;
>> +	aq_cnt = oct_csr_read(SSO_GRP_AQ_CNT(oen->node, oen->tx_complete_grp));
>> +	aq_cnt &= GENMASK_ULL(32, 0);
>> +	backlog = atomic64_inc_return(&priv->tx_backlog);
>> +	if (unlikely(backlog > MAX_TX_QUEUE_DEPTH || aq_cnt > 100000))
>> +		netif_stop_queue(netdev);
>> +
>> +	/* We have space for 11 segment pointers, If there will be
>> +	 * more than that, we must linearize.  The count is: 1 (base
>> +	 * SKB) + frag_count + nr_frags.
>> +	 */
>> +	if (unlikely(skb_shinfo(skb)->nr_frags + frag_count > 10)) {
>> +		if (unlikely(__skb_linearize(skb)))
>> +			goto skip_xmit;
>> +		frag_count = 0;
>> +	}
> 
> What's so special about 10? The maximum the network stack could pass is
> SKB_MAX_FRAGS, what would happen in that case?


The comment attempts to answer this question.

The command block to the PKO consists of between 1 and 16 64-bit command 
words.  5 of these command words are needed for non-segment-pointer use, 
leaving 11 available for segment pointers.


> 
>> +
>> +	work = (void **)skb->cb;
>> +	work[0] = netdev;
>> +	work[1] = NULL;
>> +
>> +	/* Adjust the port statistics. */
>> +	atomic64_inc(&priv->tx_packets);
>> +	atomic64_add(skb->len, &priv->tx_octets);
> 
> Do this in the TX completion worker, there is no guarantee the packet
> will be transmitted that early in this function.

When we start doing XDP based forwarding, there is no TX completion 
event to software, so the simplest thing to do is account for things here.

> 
>> +
>> +	/* Make sure packet data writes are committed before
>> +	 * submitting the command below
>> +	 */
>> +	wmb();
> 
> That seems just wrong here, if your goal is to make sure that e.g:
> skb_linearize() did finish its pending writes to DRAM, you need to use
> DMA-API towards that goal. If the device is cache coherent, DMA-API will
> know that and do nothing.

It is a problem of write ordering, not cache coherency (OCTEON is fully 
coherent).  That said, the DMA-API does take care of ordering also.

This is really an optimization that skips a bunch of function calls in 
the hot path.

> 
>> +
>> +	/* Build the pko command */
>> +	pko_send_desc = build_pko_send_hdr_desc(skb);
>> +	preempt_disable();
> 
> Why do you disable preemption here?

So we don't have the overhead of having to save and restore the CPU 
local memory on each interrupt and task switch.


> 
>> +	scratch_write64(scr_off, pko_send_desc);
>> +	scr_off += sizeof(pko_send_desc);
>> +
>> +	/* Request packet to be ptp timestamped */
>> +	if ((unlikely(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)) &&
>> +	    unlikely(priv->tx_timestamp_hw)) {
>> +		pko_send_desc = build_pko_send_ext_desc(skb);
>> +		scratch_write64(scr_off, pko_send_desc);
>> +		scr_off += sizeof(pko_send_desc);
>> +	}
>> +
>> +	/* Add the tso descriptor if needed */
>> +	mss = skb_shinfo(skb)->gso_size;
>> +	if (unlikely(mss)) {
>> +		pko_send_desc = build_pko_send_tso(skb, netdev->mtu);
>> +		scratch_write64(scr_off, pko_send_desc);
>> +		scr_off += sizeof(pko_send_desc);
>> +	}
>> +
>> +	/* Add a gather descriptor for each segment. See PKO_SEND_GATHER_S for
>> +	 * the send gather descriptor format.
>> +	 */
>> +	pko_send_desc = 0;
>> +	pko_send_desc |= (u64)PKO_SENDSUBDC_GATHER << 45;
>> +	head_len = skb_headlen(skb);
>> +	if (head_len > 0) {
>> +		pko_send_desc |= head_len << 48;
>> +		pko_send_desc |= virt_to_phys(skb->data);
>> +		scratch_write64(scr_off, pko_send_desc);
>> +		scr_off += sizeof(pko_send_desc);
>> +	}
>> +	for (i = 1; i <= skb_shinfo(skb)->nr_frags; i++) {
>> +		struct skb_frag_struct *fs = skb_shinfo(skb)->frags + i - 1;
>> +
>> +		pko_send_desc &= ~(GENMASK_ULL(63, 48) | GENMASK_ULL(41, 0));
>> +		pko_send_desc |= (u64)fs->size << 48;
>> +		pko_send_desc |= virt_to_phys((u8 *)page_address(fs->page.p) + fs->page_offset);
>> +		scratch_write64(scr_off, pko_send_desc);
>> +		scr_off += sizeof(pko_send_desc);
>> +	}
>> +	skb_walk_frags(skb, skb_tmp) {
>> +		pko_send_desc &= ~(GENMASK_ULL(63, 48) | GENMASK_ULL(41, 0));
>> +		pko_send_desc |= (u64)skb_tmp->len << 48;
>> +		pko_send_desc |= virt_to_phys(skb_tmp->data);
>> +		scratch_write64(scr_off, pko_send_desc);
>> +		scr_off += sizeof(pko_send_desc);
>> +	}
>> +
>> +	/* Subtract 1 from the tx_backlog. */
>> +	pko_send_desc = build_pko_send_mem_sub(virt_to_phys(&priv->tx_backlog));
>> +	scratch_write64(scr_off, pko_send_desc);
>> +	scr_off += sizeof(pko_send_desc);
>> +
>> +	/* Write the ptp timestamp in the skb itself */
>> +	if ((unlikely(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP)) &&
>> +	    unlikely(priv->tx_timestamp_hw)) {
>> +		pko_send_desc = build_pko_send_mem_ts(virt_to_phys(&work[1]));
>> +		scratch_write64(scr_off, pko_send_desc);
>> +		scr_off += sizeof(pko_send_desc);
>> +	}
>> +
>> +	/* Send work when finished with the packet. */
>> +	grp = octeon3_eth_lgrp_to_ggrp(priv->node, priv->tx_complete_grp);
>> +	pko_send_desc = build_pko_send_work(grp, virt_to_phys(work));
>> +	scratch_write64(scr_off, pko_send_desc);
>> +	scr_off += sizeof(pko_send_desc);
>> +
>> +	/* See PKO_SEND_DMA_S in the HRM for the lmtdam data format */
>> +	lmtdma_data = 0;
>> +	lmtdma_data |= (u64)(LMTDMA_SCR_OFFSET >> 3) << 56;
>> +	if (wait_pko_response)
>> +		lmtdma_data |= 1ull << 48;
>> +	lmtdma_data |= 0x51ull << 40;
>> +	lmtdma_data |= (u64)priv->node << 36;
>> +	lmtdma_data |= priv->pko_queue << 16;
>> +
>> +	dma_addr = (u64 *)(LMTDMA_ORDERED_IO_ADDR | ((scr_off & 0x78) - 8));
>> +	*dma_addr = lmtdma_data;
>> +
>> +	preempt_enable();
>> +
>> +	if (wait_pko_response) {
>> +		u64	query_rtn;
>> +
>> +		CVMX_SYNCIOBDMA;
>> +
>> +		/* See PKO_QUERY_RTN_S in the HRM for the return format */
>> +		query_rtn = scratch_read64(LMTDMA_SCR_OFFSET);
>> +		query_rtn >>= 60;
>> +		if (unlikely(query_rtn != PKO_DQSTATUS_PASS)) {
>> +			netdev_err(netdev, "PKO enqueue failed %llx\n",
>> +				   (unsigned long long)query_rtn);
>> +			dev_kfree_skb_any(skb);
>> +		}
>> +	}
> 
> So I am not sure I fully understand how sending packets works, although
> it seems to be like you are building a work element (pko_send_desc)
> which references either a full-size Ethernet frame, or that frame and
> its fragments (multiple pko_send_desc). In that case, I don't see why
> you can't juse dma_map_single()/dma_unmap_single() against skb->data and
> its potential fragments instead of using virt_to_phys() like you
> currently do, which is absolutely not portable.
> 
> dma_map_single() on the kernel linear address space should be equivalent
> to virt_to_phys() anyway, and you would get the nice things about
> DMA-API like its portability.
> 
> I could imagine that, for coherency purposes, there may be a requirement
> to keep tskb->data and frieds to be within XKSEG0/1, if that's the case,
> DMA-API should know that too.
> 
> I might be completely off, but using virt_to_phys() sure does sound non
> portable here.


The PKO command block with all of its gather dma pointers is written 
into a special CPU local memory region.  The whole thing it atomically 
transmitted via a store to a special CPU local address window.

We need to keep everything on a single CPU, thus the preempt disable/enable.

The whole mechanism is highly OCTEON specific, and as such it works to 
use the wmb() and virt_to_phys() macros instead of calling all the 
dma_map_*() funcitons.  Would it be more clear to use dma_map_*()? 
Perhaps.  Would it be slower?  Yes.


> 
>> +
>> +	return NETDEV_TX_OK;
>> +skip_xmit:
>> +	atomic64_inc(&priv->tx_dropped);
>> +	dev_kfree_skb_any(skb);
>> +	return NETDEV_TX_OK;
>> +}
>> +
>> +static void octeon3_eth_ndo_get_stats64(struct net_device *netdev,
>> +					struct rtnl_link_stats64 *s)
>> +{
>> +	struct octeon3_ethernet *priv = netdev_priv(netdev);
>> +	u64 packets, octets, dropped;
>> +	u64 delta_packets, delta_octets, delta_dropped;
>> +
>> +	spin_lock(&priv->stat_lock);
> 
> Consider using u64_stats_sync to get rid of this lock...

My timer went missing.  This also has to be called periodically from a 
timer to catch wraparound in the 48 bit counters.

Locking is still necessary to synchronize between the timer and calls to 
the get_stat function.

I will sort this out.


> 
>> +
>> +	octeon3_pki_get_stats(priv->node, priv->pknd, &packets, &octets, &dropped);
>> +
>> +	delta_packets = (packets - priv->last_packets) & ((1ull << 48) - 1);
>> +	delta_octets = (octets - priv->last_octets) & ((1ull << 48) - 1);
>> +	delta_dropped = (dropped - priv->last_dropped) & ((1ull << 48) - 1);
>> +
>> +	priv->last_packets = packets;
>> +	priv->last_octets = octets;
>> +	priv->last_dropped = dropped;
>> +
>> +	spin_unlock(&priv->stat_lock);
>> +
>> +	atomic64_add(delta_packets, &priv->rx_packets);
>> +	atomic64_add(delta_octets, &priv->rx_octets);
>> +	atomic64_add(delta_dropped, &priv->rx_dropped);
> 
> and summing up these things as well.
> 
>> +
>> +	s->rx_packets = atomic64_read(&priv->rx_packets);
>> +	s->rx_bytes = atomic64_read(&priv->rx_octets);
>> +	s->rx_dropped = atomic64_read(&priv->rx_dropped);
>> +	s->rx_errors = atomic64_read(&priv->rx_errors);
>> +	s->rx_length_errors = atomic64_read(&priv->rx_length_errors);
>> +	s->rx_crc_errors = atomic64_read(&priv->rx_crc_errors);
>> +
>> +	s->tx_packets = atomic64_read(&priv->tx_packets);
>> +	s->tx_bytes = atomic64_read(&priv->tx_octets);
>> +	s->tx_dropped = atomic64_read(&priv->tx_dropped);
>> +}
> 
> [snip]
> 
>> +enum port_mode {
>> +	PORT_MODE_DISABLED,
>> +	PORT_MODE_SGMII,
>> +	PORT_MODE_RGMII,
>> +	PORT_MODE_XAUI,
>> +	PORT_MODE_RXAUI,
>> +	PORT_MODE_XLAUI,
>> +	PORT_MODE_XFI,
>> +	PORT_MODE_10G_KR,
>> +	PORT_MODE_40G_KR4
>> +};
> 
> Can you use phy_interface_t values for this?

They have many of the same names, but this enum contains only things we 
support, and maps to values in register fields.  using phy_interface_t 
might falsly imply we support everything in there.


> 
>> +
>> +enum lane_mode {
>> +	R_25G_REFCLK100,
>> +	R_5G_REFCLK100,
>> +	R_8G_REFCLK100,
>> +	R_125G_REFCLK15625_KX,
>> +	R_3125G_REFCLK15625_XAUI,
>> +	R_103125G_REFCLK15625_KR,
>> +	R_125G_REFCLK15625_SGMII,
>> +	R_5G_REFCLK15625_QSGMII,
>> +	R_625G_REFCLK15625_RXAUI,
>> +	R_25G_REFCLK125,
>> +	R_5G_REFCLK125,
>> +	R_8G_REFCLK125
>> +};
>> +
>> +struct port_status {
>> +	int	link;
>> +	int	duplex;
>> +	int	speed;
>> +};
> 
> Likewise, using phy_device would give you this information.

I will look at doing that.

> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
