Return-Path: <anish.khurana130181@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140509151946.GM6455@distanz.ch>
References: <201405081450.14449.Andreas.Irestal@axis.com>
	<20140509151946.GM6455@distanz.ch>
Date: Sat, 10 May 2014 15:49:14 +0530
Message-ID: <CANKiNjUewie02AAe1z+NWGKLAZ_0ayPYnEnrfd3X8QCjXKzFPw@mail.gmail.com>
Subject: Re: [RFC PATCH] net:Add basic DWC Ethernet QoS Driver
From: Anish Khurana <anish.khurana130181@gmail.com>
Content-Type: multipart/alternative; boundary=089e016354d4ca9e8a04f9090bf6
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Andreas Irestal <andreas.irestal@axis.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>, "abrodkin@synopsys.com" <abrodkin@synopsys.com>, "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>, "ben@decadent.org.uk" <ben@decadent.org.uk>, "sr@denx.de" <sr@denx.de>, "jonas.jensen@gmail.com" <jonas.jensen@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jesper Nilsson <jespern@axis.com>
List-ID: <devicetree@vger.kernel.org>

--089e016354d4ca9e8a04f9090bf6
Content-Type: text/plain; charset=UTF-8

small suggestions regarding interrupt registration ( request_irq()) call:
1. instead of request_irq() call in probe function , i think interrupt can
be registered in dwceqos_open() call . since packet only come when we make
interface up( ifconfig up) .
2. in request_irq() thier is flag parameter can either be zero or flag as :
IRQF_DISABLED
IRQF_SHARED
...
normally if we have to share the irq line with other device we use
IRQF_SHARED .






On Fri, May 9, 2014 at 8:49 PM, Tobias Klauser <tklauser@distanz.ch> wrote:

> On 2014-05-08 at 14:50:14 +0200, Andreas Irestal <andreas.irestal@axis.com>
> wrote:
> > This is an early version of a driver for the Synopsys DWC Ethernet QoS IP
> > version 4. Unfortunately, version 4.00a and onwards of this IP is totally
> > different from earlier versions used in the STMicroelectronics drivers.
> Both
> > functionality and registers are different. As this is my first network
> driver
> > I am submitting an RFC to catch design flaws and bad coding standards at
> an
> > early stage. Also, others looking at this IP could hopefully be helped
> by this
> > early code.
> >
> > The driver is quite inefficient, yet still functional (Gbit only) and
> uses a
> > polling-driven TX-approach. For the RX side NAPI and interrupts are used.
> > There are still quite a lot of work to do. Link handling, more robust
> > error-handling, HW Checksumming, scatter-gather and TCP Segmentation and
> > checksum offloading to name a few.
> >
> > All code has been developed and tested using an FPGA implementation of
> the IP,
> > with an ARM Cortex A9 as the main CPU, running Linux 3.13.
> >
> > Signed-off-by: Andreas Irestaal <Andreas.Irestal@axis.com>
> > ---
> >  drivers/net/ethernet/Kconfig                |    1 +
> >  drivers/net/ethernet/Makefile               |    1 +
> >  drivers/net/ethernet/synopsys/Kconfig       |   24 +
> >  drivers/net/ethernet/synopsys/Makefile      |    5 +
> >  drivers/net/ethernet/synopsys/dwc_eth_qos.c |  706
> +++++++++++++++++++++++++++
> >  drivers/net/ethernet/synopsys/dwc_eth_qos.h |  308 ++++++++++++
> >  6 files changed, 1045 insertions(+), 0 deletions(-)
> >  create mode 100644 drivers/net/ethernet/synopsys/Kconfig
> >  create mode 100644 drivers/net/ethernet/synopsys/Makefile
> >  create mode 100644 drivers/net/ethernet/synopsys/dwc_eth_qos.c
> >  create mode 100644 drivers/net/ethernet/synopsys/dwc_eth_qos.h
>
> [...]
>
> > diff --git a/drivers/net/ethernet/synopsys/dwc_eth_qos.c
> b/drivers/net/ethernet/synopsys/dwc_eth_qos.c
> > new file mode 100644
> > index 0000000..20b1a9e
> > --- /dev/null
> > +++ b/drivers/net/ethernet/synopsys/dwc_eth_qos.c
> > @@ -0,0 +1,706 @@
>
> [...]
>
> > +struct net_local {
> > +       void __iomem *baseaddr;
> > +       struct clk *phy_ref_clk;
> > +       struct clk *apb_pclk;
> > +
> > +       struct net_device *ndev;
> > +       struct platform_device *pdev;
> > +
> > +       volatile struct dwc_eth_qos_txdesc *tx_descs;
> > +       volatile struct dwc_eth_qos_rxdesc *rx_descs;
> > +
> > +       void *tx_buf;
> > +
> > +       struct ring_info *rx_skb;
> > +
> > +       dma_addr_t tx_descs_addr;
> > +       dma_addr_t rx_descs_addr;
> > +
> > +       u32 next_tx;
> > +       u32 next_rx;
> > +
> > +       struct napi_struct napi;
> > +
> > +       struct net_device_stats stats;
>
> You don't need a private copy of struct net_device_stats, just use the
> one from struct net_device. It looks like the driver is not returning
> these stats currently anyway. If you use ndev->stats, they will be
> picked up by dev_get_stats() and i.e. show up in ifconfig output.
>
> > +       spinlock_t rx_lock;
> > +};
> > +
> > +/* Allocate DMA helper structure at position given by index */
> > +static void dwceqos_alloc_rxring_desc(struct net_local *lp, int index)
> > +{
> > +       struct sk_buff *new_skb;
> > +       u32 new_skb_baddr = 0;
> > +       new_skb = netdev_alloc_skb(lp->ndev, DWCEQOS_RX_BUF_SIZE);
> > +       if (!new_skb) {
> > +               dev_err(&lp->ndev->dev, "alloc_skb error for desc %d\n",
> index);
> > +               goto out;
> > +       }
> > +
> > +       /* Get dma handle of skb->data */
> > +       new_skb_baddr = (u32)dma_map_single(lp->ndev->dev.parent,
> > +               new_skb->data, DWCEQOS_RX_BUF_SIZE, DMA_FROM_DEVICE);
> > +       if (dma_mapping_error(lp->ndev->dev.parent, new_skb_baddr)) {
> > +               dev_err(&lp->pdev->dev, "DMA map error\n");
> > +               dev_kfree_skb(new_skb);
> > +               new_skb = NULL;
> > +       }
> > +out:
> > +       lp->rx_skb[index].skb = new_skb;
> > +       lp->rx_skb[index].mapping = new_skb_baddr;
> > +       lp->rx_skb[index].len = DWCEQOS_RX_BUF_SIZE;
> > +
> > +       return;
> > +}
> > +
> > +static void dwceqos_mtl_init(struct net_local *lp)
> > +{
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_MTL_OP_MODE, 0x00000060);
> > +}
> > +
> > +static void dwceqos_mtl_tx_init(struct net_local *lp)
> > +{
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_MTL_TXQ0_OP_MODE,
> > +                       DWCEQOS_MTL_TXQ_EN);
> > +}
> > +
> > +static void dwceqos_mtl_rx_init(struct net_local *lp)
> > +{
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_MTL_RXQ0_OP_MODE,
> > +               DWCEQOS_MTL_RXQ_RQS256 | DWCEQOS_MTL_RXQ_DIS_TCP_EF |
> > +               DWCEQOS_MTL_RXQ_FEP | DWCEQOS_MTL_RXQ_FUP |
> > +               DWCEQOS_MTL_RXQ_RTC32);
> > +}
> > +
> > +static void dwceqos_mac_rx_init(struct net_local *lp)
> > +{
> > +       u32 val;
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_MAC_RXQ_CTRL0, 2);
> > +       val = DWCEQOS_MAC_PKT_FILTER_RX_ALL |
> DWCEQOS_MAC_PKT_FILTER_PCF_ALL |
> > +               DWCEQOS_MAC_PKT_FILTER_PROMISCUOUS;
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_MAC_PKT_FILTER, val);
> > +}
> > +
> > +static int dwceqos_mac_enable(struct net_local *lp)
> > +{
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_MAC_CFG,
> > +               DWCEQOS_MAC_CFG_DM | DWCEQOS_MAC_CFG_TE |
> > +               DWCEQOS_MAC_CFG_RE);
> > +       return 0;
> > +}
> > +
> > +static void dwceqos_dma_wake_rx(struct net_local *lp)
> > +{
> > +       u32 offset;
> > +       offset = DWCEQOS_RX_DCNT * sizeof(struct dwc_eth_qos_rxdesc);
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_RXDESC_TAIL,
> > +               (u32)lp->rx_descs_addr + offset);
> > +}
> > +
> > +static inline void dwceqos_dma_rx_start(struct net_local *lp)
> > +{
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_RX_CTRL,
> > +               DWCEQOS_DMA_CH0_TXRX_CONTROL_START |
> > +               DWCEQOS_DMA_CH0_TXRX_CONTROL_PBL16 |
> > +               DWCEQOS_RX_BUF_SIZE);
> > +       dwceqos_dma_wake_rx(lp);
> > +}
> > +
> > +static inline void dwceqos_dma_tx_start(struct net_local *lp)
> > +{
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_TX_CTRL,
> > +               DWCEQOS_DMA_CH0_TXRX_CONTROL_START |
> > +               DWCEQOS_DMA_CH0_TXRX_CONTROL_PBL16);
> > +}
> > +
> > +static void dwceqos_dma_setmode(struct net_local *lp)
> > +{
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_MODE,
> > +               DWCEQOS_DMA_MODE_TXPR | DWCEQOS_DMA_MODE_DA);
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_SYSBUS_MODE,
> > +               DWCEQOS_DMA_SYSBUS_MB);
> > +}
> > +
> > +static void dwceqos_dma_txenable(struct net_local *lp)
> > +{
> > +       u32 val;
> > +       val = DWCEQOS_DMA_CH0_TXRX_CONTROL_PBL16 |
> > +               DWCEQOS_DMA_CH0_TXRX_CONTROL_START;
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_TX_CTRL, val);
> > +}
> > +
> > +static void dwceqos_dma_rx_enable(struct net_local *lp)
> > +{
> > +       u32 val;
> > +       val = DWCEQOS_DMA_CH0_TXRX_CONTROL_PBL16 |
> > +               DWCEQOS_RX_BUF_SIZE | DWCEQOS_DMA_CH0_TXRX_CONTROL_START;
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_RX_CTRL, val);
> > +}
> > +
> > +/* Initialize DMA descriptors to their start values */
> > +static void dwceqos_dma_prepare(struct net_local *lp)
> > +{
> > +       int i;
> > +       for (i = 0; i < DWCEQOS_TX_DCNT; ++i) {
> > +               lp->tx_descs[i].tdes0.raw = 0;
> > +               lp->tx_descs[i].tdes1.raw = 0;
> > +               lp->tx_descs[i].tdes2.raw = 0;
> > +               lp->tx_descs[i].tdes3.raw = 0;
> > +       }
> > +
> > +       for (i = 0; i < DWCEQOS_RX_DCNT; ++i) {
> > +               lp->rx_descs[i].rdes0.rd.buffer1 = lp->rx_skb[i].mapping;
> > +               lp->rx_descs[i].rdes1.raw = 0;
> > +               lp->rx_descs[i].rdes2.rd.buffer2 = 0;
> > +               lp->rx_descs[i].rdes3.raw = 0;
> > +               lp->rx_descs[i].rdes3.rd.buf1v = 1;
> > +               lp->rx_descs[i].rdes3.rd.inte = 1;
> > +               lp->rx_descs[i].rdes3.rd.own = 1;
> > +       }
> > +       lp->next_tx = 0;
> > +       lp->next_rx = 0;
> > +}
> > +
> > +/* Allocate and initiate DMA rings for TX and RX. Also allocates RX
> buffers for
> > + * incoming packets.
> > + */
> > +static int dwceqos_dma_alloc(struct net_local *lp)
> > +{
> > +       u32 size;
> > +       int i;
> > +
> > +       size = DWCEQOS_RX_DCNT * sizeof(struct ring_info);
> > +       lp->rx_skb = kzalloc(size, GFP_KERNEL);
> > +       if (!lp->rx_skb) {
> > +               dev_err(&lp->pdev->dev, "Unable to allocate ring
> descriptor area\n");
> > +               return -ENOMEM;
> > +       }
> > +
> > +       /* Allocate DMA descriptors */
> > +       size = DWCEQOS_TX_DCNT * sizeof(struct dwc_eth_qos_txdesc);
> > +       lp->tx_descs = dma_alloc_coherent(&lp->pdev->dev, size,
> > +                       &lp->tx_descs_addr, 0);
> > +       if (!lp->tx_descs) {
> > +               dev_err(&lp->pdev->dev, "Failed to allocate TX DMA
> descriptors\n");
> > +               /* Should deallocate memory here */
> > +               return -ENOMEM;
> > +       }
> > +       size = DWCEQOS_RX_DCNT * sizeof(struct dwc_eth_qos_rxdesc);
> > +       lp->rx_descs = dma_alloc_coherent(&lp->pdev->dev, size,
> > +                       &lp->rx_descs_addr, 0);
> > +       if (!lp->rx_descs) {
> > +               dev_err(&lp->pdev->dev, "Failed to allocate RX DMA
> descriptors\n");
> > +               /* Should deallocate memory here */
> > +               return -ENOMEM;
> > +       }
> > +
> > +       for (i = 0; i < DWCEQOS_RX_DCNT; ++i) {
> > +               dwceqos_alloc_rxring_desc(lp, i);
> > +               if (!(lp->rx_skb[lp->next_rx].skb)) {
> > +                       dev_err(&lp->pdev->dev, "Unable to map
> descriptor %d to DMA\n",
> > +                               lp->next_rx);
> > +                       /* What error code to return for mapping error?
> */
> > +                       return -1;
> > +               }
> > +       }
> > +
> > +       dwceqos_dma_prepare(lp);
> > +
> > +       /* Tell HW where to look*/
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_RXDESC_RING_LEN,
> > +               DWCEQOS_RX_DCNT-1);
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_TXDESC_RING_LEN,
> > +               DWCEQOS_TX_DCNT-1);
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_RXDESC_LIST_ADDR,
> > +               (u32)lp->rx_descs_addr);
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_TXDESC_LIST_ADDR,
> > +               (u32)lp->tx_descs_addr);
> > +       return 0;
> > +}
> > +
> > +/* Checks if there are any available incoming packets ready for
> processing */
> > +int dwceqos_packet_avail(struct net_local *lp)
>
> Make this function static.
>
> > +{
> > +       return !lp->rx_descs[lp->next_rx].rdes3.wr.own;
> > +}
> > +
> > +/* Free DMA descriptor area */
> > +static void dwceqos_dma_free(struct net_local *lp)
> > +{
> > +       u32 size;
> > +       size = DWCEQOS_TX_DCNT * sizeof(struct dwc_eth_qos_txdesc);
> > +       if (lp->tx_descs)
> > +               dma_free_coherent(&lp->pdev->dev, size,
> > +                       lp->tx_descs, lp->tx_descs_addr);
> > +       size = DWCEQOS_RX_DCNT * sizeof(struct dwc_eth_qos_rxdesc);
> > +       if (lp->rx_descs)
> > +               dma_free_coherent(&lp->pdev->dev, size,
> > +                       lp->rx_descs, lp->rx_descs_addr);
> > +}
> > +
> > +/* HW transmit function. */
> > +static void dwceqos_dma_xmit(struct net_local *lp, void *data, int len)
> > +{
> > +       u32 regval;
> > +       int i = lp->next_tx;
> > +       int dwc_wait;
> > +       dma_addr_t dma_handle;
> > +
> > +       dma_handle = dma_map_single(lp->ndev->dev.parent,
> > +               data, DWCEQOS_RX_BUF_SIZE, DMA_TO_DEVICE);
> > +       if (dma_mapping_error(lp->ndev->dev.parent, dma_handle)) {
> > +               dev_err(&lp->pdev->dev, "DMA Mapping error\n");
> > +               return;
> > +       }
> > +
> > +       lp->tx_descs[i].tdes0.rd.buffer1 = dma_handle;
> > +       lp->tx_descs[i].tdes2.rd.buf1len = len;
> > +       lp->tx_descs[i].tdes3.rd.fl = len;
> > +       lp->tx_descs[i].tdes3.rd.fd = 1;
> > +       lp->tx_descs[i].tdes3.rd.ld = 1;
> > +       lp->tx_descs[i].tdes3.rd.own = 1;
> > +
> > +       /* Issue Transmit Poll by writing address of next free
> descriptor */
> > +       regval = lp->tx_descs_addr + (i+1) * sizeof(struct
> dwc_eth_qos_txdesc);
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_TXDESC_TAIL, regval);
> > +
> > +       /* Set poll wait timeout to 2 seconds */
> > +       dwc_wait = 200;
> > +
> > +       while (lp->tx_descs[i].tdes3.wr.own) {
> > +               mdelay(10);
> > +               if (!dwc_wait--)
> > +                       break;
> > +       }
> > +       if (lp->tx_descs[i].tdes3.wr.own)
> > +               dev_err(&lp->pdev->dev, "Failed to transmit: Timed
> out\n");
> > +
> > +       lp->next_tx = (lp->next_tx + 1) % DWCEQOS_TX_DCNT;
> > +       dma_unmap_single(lp->ndev->dev.parent,
> > +                       dma_handle, DWCEQOS_RX_BUF_SIZE, DMA_TO_DEVICE);
> > +}
> > +
> > +/* Store HW Addr in MAC registers. Source Address Replacement not used
> yet */
> > +static void dwceqos_set_hwaddr(struct net_local *lp)
> > +{
> > +       u32 val;
> > +
> > +       val = DWCEQOS_MAC_ADDR_HI_EN | (lp->ndev->dev_addr[0] << 8) |
> > +               (lp->ndev->dev_addr[1]);
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_MAC_ADDR_HI, val);
> > +       val = (lp->ndev->dev_addr[2] << 24) | (lp->ndev->dev_addr[3] <<
> 16) |
> > +               (lp->ndev->dev_addr[4] << 8)  | (lp->ndev->dev_addr[5]);
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_MAC_ADDR_LO, val);
> > +}
> > +
> > +/* DMA reset. When issued also resets all MTL and MAC registers as well
> */
> > +static void dwceqos_dma_reset(struct net_local *lp)
> > +{
> > +       /* Wait 5 seconds for DMA reset*/
> > +       int i = 5000;
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_MODE, 1);
> > +
> > +       do {
> > +               mdelay(1);
> > +       } while ((dwceqos_read(lp->baseaddr, DWCEQOS_DMA_MODE) & 0x1) &&
> i--);
> > +}
> > +
> > +/* Interrupt handler. So far only RX interrupts are used */
> > +static irqreturn_t dwceqos_interrupt(int irq, void *dev_id)
> > +{
> > +       struct net_device *ndev = dev_id;
> > +       struct net_local *lp = netdev_priv(ndev);
> > +
> > +       u32 cause;
> > +       u32 val;
> > +
> > +       cause = dwceqos_read(lp->baseaddr, DWCEQOS_DMA_INT_STAT);
> > +       if (cause & 0x00000001) {
> > +               /* DMA Channel 0 Interrupt. Assume RX interrupt for now
> */
> > +               val = dwceqos_read(lp->baseaddr, DWCEQOS_DMA_CH0_STAT);
> > +               /* Ack */
> > +               dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_STAT, val);
> > +               if (val & 0x00000040)
> > +                       napi_schedule(&lp->napi);
> > +       } else if (unlikely(!cause)) {
> > +               return IRQ_NONE;
> > +       }
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static int dwceqos_open(struct net_device *ndev)
> > +{
> > +       /* Allocate Buffers & DMA Descr. + Initiate DMA descriptors */
> > +       struct net_local *lp = netdev_priv(ndev);
> > +
> > +       /* Set up hardware. It looks like order of writes is important
> here.
> > +        * Only gigatbit support, no advanced MTL or MAC configuration
> yet.
> > +        */
> > +       dwceqos_dma_reset(lp);
> > +       dwceqos_mtl_init(lp);
> > +       dwceqos_mtl_tx_init(lp);
> > +       dwceqos_dma_setmode(lp);
> > +       dwceqos_dma_alloc(lp);
> > +       dwceqos_dma_wake_rx(lp);
> > +       dwceqos_dma_txenable(lp);
> > +       dwceqos_mtl_rx_init(lp);
> > +       dwceqos_mac_rx_init(lp);
> > +       dwceqos_dma_rx_enable(lp);
> > +       dwceqos_dma_wake_rx(lp);
> > +       dwceqos_set_hwaddr(lp);
> > +       dwceqos_mac_enable(lp);
> > +
> > +       /* Enable RX Interrupts */
> > +       dwceqos_write(lp->baseaddr, DWCEQOS_DMA_CH0_INT_EN, 0x00010040);
> > +
> > +       napi_enable(&lp->napi);
> > +       netif_carrier_on(ndev);
> > +       netif_start_queue(ndev);
> > +       return 0;
> > +}
> > +
> > +
> > +int dwceqos_stop(struct net_device *ndev)
>
> Make this function static.
>
> > +{
> > +       struct net_local *lp = netdev_priv(ndev);
> > +       dwceqos_dma_free(lp);
> > +       netif_stop_queue(ndev);
> > +       napi_disable(&lp->napi);
> > +       netif_carrier_off(ndev);
> > +       return 0;
> > +}
> > +
> > +/* Receive one packet and return skb */
> > +struct sk_buff *
> > +dwceqos_recv_packet(struct net_local *lp)
>
> Make this function static.
>
> > +{
> > +       struct sk_buff *skb;
> > +       u32 len;
> > +
> > +       skb = lp->rx_skb[lp->next_rx].skb;
> > +       len = lp->rx_descs[lp->next_rx].rdes3.wr.length;
> > +
> > +       /* Unmap old buffer */
> > +       dma_unmap_single(lp->ndev->dev.parent,
> lp->rx_skb[lp->next_rx].mapping,
> > +               lp->rx_skb[lp->next_rx].len, DMA_FROM_DEVICE);
> > +       skb_put(skb, len);
> > +       skb->protocol = eth_type_trans(skb, lp->ndev);
> > +       skb->ip_summed = 0;
> > +
> > +       /* Initialize new Buffer descriptor */
> > +       dwceqos_alloc_rxring_desc(lp, lp->next_rx);
> > +       if (!(lp->rx_skb[lp->next_rx].skb)) {
> > +               dev_err(&lp->pdev->dev, "Unable to map descriptor %d to
> DMA\n",
> > +                       lp->next_rx);
> > +               return NULL;
> > +       }
> > +
> > +       /* Initialize new DMA descriptor */
> > +       lp->rx_descs[lp->next_rx].rdes0.rd.buffer1 =
> > +               lp->rx_skb[lp->next_rx].mapping;
> > +       lp->rx_descs[lp->next_rx].rdes1.raw = 0;
> > +       lp->rx_descs[lp->next_rx].rdes2.rd.buffer2 = 0;
> > +       lp->rx_descs[lp->next_rx].rdes3.raw = 0;
> > +       lp->rx_descs[lp->next_rx].rdes3.rd.buf1v = 1;
> > +       lp->rx_descs[lp->next_rx].rdes3.rd.inte = 1;
> > +       lp->rx_descs[lp->next_rx].rdes3.rd.own = 1;
> > +       lp->next_rx = (lp->next_rx + 1) % DWCEQOS_RX_DCNT;
> > +       return skb;
> > +}
> > +
> > +
> > +/* NAPI poll routine */
> > +int dwceqos_rx_poll(struct napi_struct *napi, int budget)
> > +{
> > +       struct net_local *lp = container_of(napi, struct net_local,
> napi);
> > +       int npackets = 0;
> > +       struct sk_buff *skb;
> > +
> > +       spin_lock(&lp->rx_lock);
> > +       while (npackets < budget && dwceqos_packet_avail(lp)) {
> > +
> > +               skb = dwceqos_recv_packet(lp);
> > +               if (!skb)
> > +                       break;
> > +
> > +               netif_receive_skb(skb);
> > +
> > +               lp->stats.rx_packets++;
> > +               lp->stats.rx_bytes += skb->len;
> > +               npackets++;
> > +       }
> > +       if (npackets < budget)
> > +               napi_complete(napi);
> > +
> > +       spin_unlock(&lp->rx_lock);
> > +       return npackets;
> > +}
> > +
> > +/* Main transmit function called from kernel */
> > +int dwceqos_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>
> Make this function static.
>
> > +{
> > +       int len;
> > +       struct net_local *lp = netdev_priv(ndev);
> > +       char *data;
> > +       data = skb->data;
> > +       len = skb->len;
> > +
> > +       /* Send packet on wire */
> > +       dwceqos_dma_xmit(lp, data, len);
> > +
> > +       skb_tx_timestamp(skb);
> > +
> > +       ndev->stats.tx_bytes += len;
> > +       dev_kfree_skb(skb);
> > +
> > +       return 0;
> > +}
> > +
> > +struct net_device_ops dwceq_netdev_ops;
>
> Why not initialize this here?
>
> > +#ifdef CONFIG_OF
> > +static inline int dwceqos_probe_config_dt(struct platform_device *pdev)
> > +{
> > +       struct net_device *ndev;
> > +       const void *mac_address;
> > +
> > +       ndev = platform_get_drvdata(pdev);
> > +       /* Set the MAC address. */
> > +       mac_address = of_get_mac_address(pdev->dev.of_node);
> > +       if (mac_address)
> > +               memcpy(ndev->dev_addr, mac_address, ETH_ALEN);
> > +       else
> > +               dev_warn(&pdev->dev, "No MAC address found\n");
> > +       return 0;
> > +}
> > +#else
> > +static inline int dwceqos_probe_config_dt()
> > +{
> > +       return -ENOSYS;
> > +}
> > +#endif
> > +
> > +
> > +/**
> > + * dwceqos_probe - Platform driver probe
> > + * @pdev: Pointer to platform device structure
> > + *
> > + * Return 0 on success, negative value if error
> > + */
> > +int dwceqos_probe(struct platform_device *pdev)
>
> Make this function static.
>
> > +{
> > +       struct resource *r_mem = NULL;
> > +       struct resource *r_irq = NULL;
> > +       struct net_device *ndev;
> > +       struct net_local *lp;
> > +       int ret = -ENXIO;
> > +
> > +       r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       r_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > +       if (!r_mem || !r_irq) {
> > +               dev_err(&pdev->dev, "no IO resource defined.\n");
> > +               return -ENXIO;
> > +       }
> > +       ndev = alloc_etherdev(sizeof(*lp));
> > +       if (!ndev) {
> > +               dev_err(&pdev->dev, "etherdev allocation failed.\n");
> > +               return -ENOMEM;
> > +       }
> > +
> > +       SET_NETDEV_DEV(ndev, &pdev->dev);
> > +
> > +       lp = netdev_priv(ndev);
> > +       lp->ndev = ndev;
> > +       lp->pdev = pdev;
> > +
> > +       lp->baseaddr = devm_ioremap_resource(&pdev->dev, r_mem);
> > +       if (IS_ERR(lp->baseaddr)) {
> > +               dev_err(&pdev->dev, "failed to map baseaddress.\n");
> > +               ret = PTR_ERR(lp->baseaddr);
> > +               goto err_out_free_netdev;
> > +       }
> > +
> > +
> > +       dev_dbg(&lp->pdev->dev, "BASEADDRESS hw: %p virt: %p\n",
> > +                       (void *)r_mem->start, lp->baseaddr);
> > +
> > +       ndev->irq = platform_get_irq(pdev, 0);
> > +       ndev->netdev_ops = &dwceq_netdev_ops;
> > +       ndev->base_addr = r_mem->start;
> > +       ndev->features = 0;
> > +
> > +       netif_napi_add(ndev, &lp->napi, dwceqos_rx_poll, 64);
> > +
> > +       ret = register_netdev(ndev);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "Cannot register net device,
> aborting.\n");
> > +               goto err_out_free_netdev;
> > +       }
> > +
> > +       lp->apb_pclk = devm_clk_get(&pdev->dev, "apb_pclk");
> > +       if (IS_ERR(lp->apb_pclk)) {
> > +               dev_err(&pdev->dev, "apb_pclk clock not found.\n");
> > +               ret = PTR_ERR(lp->apb_pclk);
> > +               goto err_out_unregister_netdev;
> > +       }
> > +       lp->phy_ref_clk = devm_clk_get(&pdev->dev, "phy_ref_clk");
> > +       if (IS_ERR(lp->phy_ref_clk)) {
> > +               dev_err(&pdev->dev, "phy_ref_clk clock not found.\n");
> > +               ret = PTR_ERR(lp->phy_ref_clk);
> > +               goto err_out_unregister_netdev;
> > +       }
> > +
> > +       ret = clk_prepare_enable(lp->apb_pclk);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "Unable to enable APER clock.\n");
> > +               goto err_out_unregister_netdev;
> > +       }
> > +       ret = clk_prepare_enable(lp->phy_ref_clk);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "Unable to enable device clock.\n");
> > +               goto err_out_clk_dis_aper;
> > +       }
> > +
> > +       platform_set_drvdata(pdev, ndev);
> > +       dwceqos_probe_config_dt(pdev);
> > +       dev_info(&lp->pdev->dev, "pdev->id %d, baseaddr 0x%08lx, irq
> %d\n",
> > +                       pdev->id, ndev->base_addr, ndev->irq);
> > +
> > +       ret = devm_request_irq(&pdev->dev, ndev->irq,
> &dwceqos_interrupt, 0,
> > +               ndev->name, ndev);
> > +       if (ret) {
> > +               dev_err(&lp->pdev->dev, "Unable to request IRQ %p, error
> %d\n",
> > +                       r_irq, ret);
> > +               goto err_out_unregister_clk_notifier;
> > +       }
> > +
> > +       return 0;
> > +
> > +err_out_unregister_clk_notifier:
> > +       clk_disable_unprepare(lp->phy_ref_clk);
> > +err_out_clk_dis_aper:
> > +       clk_disable_unprepare(lp->apb_pclk);
> > +err_out_unregister_netdev:
> > +       unregister_netdev(ndev);
> > +err_out_free_netdev:
> > +       free_netdev(ndev);
> > +       platform_set_drvdata(pdev, NULL);
> > +       return ret;
> > +}
> > +
> > +int dwceqos_remove(struct platform_device *pdev)
>
> Make this function static.
>
> > +{
> > +       struct net_device *ndev = platform_get_drvdata(pdev);
> > +       unregister_netdev(ndev);
> > +       free_netdev(ndev);
> > +       return 0;
> > +}
> > +
> > +struct net_device_ops dwceq_netdev_ops = {
> > +       .ndo_open       = dwceqos_open,
> > +       .ndo_stop       = dwceqos_stop,
> > +       .ndo_start_xmit = dwceqos_start_xmit,
> > +};
>
> Move initialization to where it is declared and make the struct static.
>
> > +
> > +struct of_device_id dwceq_of_match[] = {
> > +       { .compatible = "dwc,qos-ethernet", },
> > +       {}
> > +};
>
> Make this struct static.
>
> Make this struct static.
> > +MODULE_DEVICE_TABLE(of, dwceq_of_match);
> > +
> > +struct platform_driver dwceqos_driver = {
> > +       .probe   = dwceqos_probe,
> > +       .remove  = dwceqos_remove,
> > +       .driver  = {
> > +               .name  = DRIVER_NAME,
> > +               .owner = THIS_MODULE,
> > +               .of_match_table = dwceq_of_match,
> > +       },
> > +};
>
> Make this struct static.
> --
> To unsubscribe from this list: send the line "unsubscribe netdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--089e016354d4ca9e8a04f9090bf6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>small suggestions regarding interrupt registrati=
on ( request_irq()) call:<br>1. instead of request_irq() call in probe func=
tion , i think interrupt can be registered in dwceqos_open() call . since p=
acket only come when we make interface up( ifconfig up) .<br>
</div>2. in request_irq() thier is flag parameter can either be zero or fla=
g as :<br>IRQF_DISABLED=C2=A0=C2=A0=C2=A0=C2=A0 <br>IRQF_SHARED=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 <br>...<br></div>normally if we have to share the=
 irq line with other device we use IRQF_SHARED . <br>
<br><br><br><div><br></div></div><div class=3D"gmail_extra"><br><br><div cl=
ass=3D"gmail_quote">On Fri, May 9, 2014 at 8:49 PM, Tobias Klauser <span di=
r=3D"ltr">&lt;<a href=3D"mailto:tklauser@distanz.ch" target=3D"_blank">tkla=
user@distanz.ch</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 2=
014-05-08 at 14:50:14 +0200, Andreas Irestal &lt;<a href=3D"mailto:andreas.=
irestal@axis.com">andreas.irestal@axis.com</a>&gt; wrote:<br>

&gt; This is an early version of a driver for the Synopsys DWC Ethernet QoS=
 IP<br>
&gt; version 4. Unfortunately, version 4.00a and onwards of this IP is tota=
lly<br>
&gt; different from earlier versions used in the STMicroelectronics drivers=
. Both<br>
&gt; functionality and registers are different. As this is my first network=
 driver<br>
&gt; I am submitting an RFC to catch design flaws and bad coding standards =
at an<br>
&gt; early stage. Also, others looking at this IP could hopefully be helped=
 by this<br>
&gt; early code.<br>
&gt;<br>
&gt; The driver is quite inefficient, yet still functional (Gbit only) and =
uses a<br>
&gt; polling-driven TX-approach. For the RX side NAPI and interrupts are us=
ed.<br>
&gt; There are still quite a lot of work to do. Link handling, more robust<=
br>
&gt; error-handling, HW Checksumming, scatter-gather and TCP Segmentation a=
nd<br>
&gt; checksum offloading to name a few.<br>
&gt;<br>
&gt; All code has been developed and tested using an FPGA implementation of=
 the IP,<br>
&gt; with an ARM Cortex A9 as the main CPU, running Linux 3.13.<br>
&gt;<br>
&gt; Signed-off-by: Andreas Irestaal &lt;<a href=3D"mailto:Andreas.Irestal@=
axis.com">Andreas.Irestal@axis.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0drivers/net/ethernet/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +<br>
&gt; =C2=A0drivers/net/ethernet/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +<br>
&gt; =C2=A0drivers/net/ethernet/synopsys/Kconfig =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 24 +<br>
&gt; =C2=A0drivers/net/ethernet/synopsys/Makefile =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A05 +<br>
&gt; =C2=A0drivers/net/ethernet/synopsys/dwc_eth_qos.c | =C2=A0706 ++++++++=
+++++++++++++++++++<br>
&gt; =C2=A0drivers/net/ethernet/synopsys/dwc_eth_qos.h | =C2=A0308 ++++++++=
++++<br>
&gt; =C2=A06 files changed, 1045 insertions(+), 0 deletions(-)<br>
&gt; =C2=A0create mode 100644 drivers/net/ethernet/synopsys/Kconfig<br>
&gt; =C2=A0create mode 100644 drivers/net/ethernet/synopsys/Makefile<br>
&gt; =C2=A0create mode 100644 drivers/net/ethernet/synopsys/dwc_eth_qos.c<b=
r>
&gt; =C2=A0create mode 100644 drivers/net/ethernet/synopsys/dwc_eth_qos.h<b=
r>
<br>
</div></div>[...]<br>
<div class=3D""><br>
&gt; diff --git a/drivers/net/ethernet/synopsys/dwc_eth_qos.c b/drivers/net=
/ethernet/synopsys/dwc_eth_qos.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..20b1a9e<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/net/ethernet/synopsys/dwc_eth_qos.c<br>
&gt; @@ -0,0 +1,706 @@<br>
<br>
</div>[...]<br>
<div class=3D""><br>
&gt; +struct net_local {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 void __iomem *baseaddr;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct clk *phy_ref_clk;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct clk *apb_pclk;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_device *ndev;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct platform_device *pdev;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 volatile struct dwc_eth_qos_txdesc *tx_descs;<b=
r>
&gt; + =C2=A0 =C2=A0 =C2=A0 volatile struct dwc_eth_qos_rxdesc *rx_descs;<b=
r>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 void *tx_buf;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct ring_info *rx_skb;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dma_addr_t tx_descs_addr;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dma_addr_t rx_descs_addr;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 next_tx;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 next_rx;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct napi_struct napi;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_device_stats stats;<br>
<br>
</div>You don&#39;t need a private copy of struct net_device_stats, just us=
e the<br>
one from struct net_device. It looks like the driver is not returning<br>
these stats currently anyway. If you use ndev-&gt;stats, they will be<br>
picked up by dev_get_stats() and i.e. show up in ifconfig output.<br>
<div><div class=3D"h5"><br>
&gt; + =C2=A0 =C2=A0 =C2=A0 spinlock_t rx_lock;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* Allocate DMA helper structure at position given by index */<br>
&gt; +static void dwceqos_alloc_rxring_desc(struct net_local *lp, int index=
)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct sk_buff *new_skb;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 new_skb_baddr =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 new_skb =3D netdev_alloc_skb(lp-&gt;ndev, DWCEQ=
OS_RX_BUF_SIZE);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!new_skb) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;lp-&gt=
;ndev-&gt;dev, &quot;alloc_skb error for desc %d\n&quot;, index);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Get dma handle of skb-&gt;data */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 new_skb_baddr =3D (u32)dma_map_single(lp-&gt;nd=
ev-&gt;dev.parent,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_skb-&gt;data, D=
WCEQOS_RX_BUF_SIZE, DMA_FROM_DEVICE);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (dma_mapping_error(lp-&gt;ndev-&gt;dev.paren=
t, new_skb_baddr)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;lp-&gt=
;pdev-&gt;dev, &quot;DMA map error\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_kfree_skb(new_s=
kb);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_skb =3D NULL;<b=
r>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +out:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_skb[index].skb =3D new_skb;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_skb[index].mapping =3D new_skb_baddr;=
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_skb[index].len =3D DWCEQOS_RX_BUF_SIZ=
E;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dwceqos_mtl_init(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_MTL_OP_M=
ODE, 0x00000060);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dwceqos_mtl_tx_init(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_MTL_TXQ0=
_OP_MODE,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DWCEQOS_MTL_TXQ_EN);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dwceqos_mtl_rx_init(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_MTL_RXQ0=
_OP_MODE,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_MTL_RXQ_RQS=
256 | DWCEQOS_MTL_RXQ_DIS_TCP_EF |<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_MTL_RXQ_FEP=
 | DWCEQOS_MTL_RXQ_FUP |<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_MTL_RXQ_RTC=
32);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dwceqos_mac_rx_init(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_MAC_RXQ_=
CTRL0, 2);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 val =3D DWCEQOS_MAC_PKT_FILTER_RX_ALL | DWCEQOS=
_MAC_PKT_FILTER_PCF_ALL |<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_MAC_PKT_FIL=
TER_PROMISCUOUS;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_MAC_PKT_=
FILTER, val);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int dwceqos_mac_enable(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_MAC_CFG,=
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_MAC_CFG_DM =
| DWCEQOS_MAC_CFG_TE |<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_MAC_CFG_RE)=
;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dwceqos_dma_wake_rx(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 offset;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 offset =3D DWCEQOS_RX_DCNT * sizeof(struct dwc_=
eth_qos_rxdesc);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_=
RXDESC_TAIL,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (u32)lp-&gt;rx_desc=
s_addr + offset);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void dwceqos_dma_rx_start(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_=
RX_CTRL,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_DMA_CH0_TXR=
X_CONTROL_START |<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_DMA_CH0_TXR=
X_CONTROL_PBL16 |<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_RX_BUF_SIZE=
);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_dma_wake_rx(lp);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void dwceqos_dma_tx_start(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_=
TX_CTRL,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_DMA_CH0_TXR=
X_CONTROL_START |<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_DMA_CH0_TXR=
X_CONTROL_PBL16);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dwceqos_dma_setmode(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_MODE=
,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_DMA_MODE_TX=
PR | DWCEQOS_DMA_MODE_DA);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_SYSB=
US_MODE,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_DMA_SYSBUS_=
MB);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dwceqos_dma_txenable(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 val =3D DWCEQOS_DMA_CH0_TXRX_CONTROL_PBL16 |<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_DMA_CH0_TXR=
X_CONTROL_START;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_=
TX_CTRL, val);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dwceqos_dma_rx_enable(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 val =3D DWCEQOS_DMA_CH0_TXRX_CONTROL_PBL16 |<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_RX_BUF_SIZE=
 | DWCEQOS_DMA_CH0_TXRX_CONTROL_START;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_=
RX_CTRL, val);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Initialize DMA descriptors to their start values */<br>
&gt; +static void dwceqos_dma_prepare(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; DWCEQOS_TX_DCNT; ++i) {<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;tx_descs[i].=
tdes0.raw =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;tx_descs[i].=
tdes1.raw =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;tx_descs[i].=
tdes2.raw =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;tx_descs[i].=
tdes3.raw =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; DWCEQOS_RX_DCNT; ++i) {<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[i].=
rdes0.rd.buffer1 =3D lp-&gt;rx_skb[i].mapping;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[i].=
rdes1.raw =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[i].=
rdes2.rd.buffer2 =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[i].=
rdes3.raw =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[i].=
rdes3.rd.buf1v =3D 1;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[i].=
rdes3.rd.inte =3D 1;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[i].=
rdes3.rd.own =3D 1;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;next_tx =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;next_rx =3D 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Allocate and initiate DMA rings for TX and RX. Also allocates RX b=
uffers for<br>
&gt; + * incoming packets.<br>
&gt; + */<br>
&gt; +static int dwceqos_dma_alloc(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 size;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 size =3D DWCEQOS_RX_DCNT * sizeof(struct ring_i=
nfo);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_skb =3D kzalloc(size, GFP_KERNEL);<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!lp-&gt;rx_skb) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;lp-&gt=
;pdev-&gt;dev, &quot;Unable to allocate ring descriptor area\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Allocate DMA descriptors */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 size =3D DWCEQOS_TX_DCNT * sizeof(struct dwc_et=
h_qos_txdesc);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;tx_descs =3D dma_alloc_coherent(&amp;lp-=
&gt;pdev-&gt;dev, size,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;lp-&gt;tx_descs_addr, 0);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!lp-&gt;tx_descs) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;lp-&gt=
;pdev-&gt;dev, &quot;Failed to allocate TX DMA descriptors\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Should deallocat=
e memory here */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 size =3D DWCEQOS_RX_DCNT * sizeof(struct dwc_et=
h_qos_rxdesc);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs =3D dma_alloc_coherent(&amp;lp-=
&gt;pdev-&gt;dev, size,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;lp-&gt;rx_descs_addr, 0);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!lp-&gt;rx_descs) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;lp-&gt=
;pdev-&gt;dev, &quot;Failed to allocate RX DMA descriptors\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Should deallocat=
e memory here */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; DWCEQOS_RX_DCNT; ++i) {<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dwceqos_alloc_rxrin=
g_desc(lp, i);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(lp-&gt;rx_skb=
[lp-&gt;next_rx].skb)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_err(&amp;lp-&gt;pdev-&gt;dev, &quot;Unable to map descriptor=
 %d to DMA\n&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;next_rx);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* What error code to return for mapping error? */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -1;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_dma_prepare(lp);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Tell HW where to look*/<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_=
RXDESC_RING_LEN,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_RX_DCNT-1);=
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_=
TXDESC_RING_LEN,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWCEQOS_TX_DCNT-1);=
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_=
RXDESC_LIST_ADDR,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (u32)lp-&gt;rx_desc=
s_addr);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_=
TXDESC_LIST_ADDR,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (u32)lp-&gt;tx_desc=
s_addr);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Checks if there are any available incoming packets ready for proce=
ssing */<br>
&gt; +int dwceqos_packet_avail(struct net_local *lp)<br>
<br>
</div></div>Make this function static.<br>
<div><div class=3D"h5"><br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return !lp-&gt;rx_descs[lp-&gt;next_rx].rdes3.w=
r.own;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Free DMA descriptor area */<br>
&gt; +static void dwceqos_dma_free(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 size;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 size =3D DWCEQOS_TX_DCNT * sizeof(struct dwc_et=
h_qos_txdesc);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (lp-&gt;tx_descs)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_free_coherent(&=
amp;lp-&gt;pdev-&gt;dev, size,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lp-&gt;tx_descs, lp-&gt;tx_descs_addr);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 size =3D DWCEQOS_RX_DCNT * sizeof(struct dwc_et=
h_qos_rxdesc);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (lp-&gt;rx_descs)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_free_coherent(&=
amp;lp-&gt;pdev-&gt;dev, size,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lp-&gt;rx_descs, lp-&gt;rx_descs_addr);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* HW transmit function. */<br>
&gt; +static void dwceqos_dma_xmit(struct net_local *lp, void *data, int le=
n)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 regval;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 int i =3D lp-&gt;next_tx;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 int dwc_wait;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dma_addr_t dma_handle;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dma_handle =3D dma_map_single(lp-&gt;ndev-&gt;d=
ev.parent,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data, DWCEQOS_RX_BU=
F_SIZE, DMA_TO_DEVICE);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (dma_mapping_error(lp-&gt;ndev-&gt;dev.paren=
t, dma_handle)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;lp-&gt=
;pdev-&gt;dev, &quot;DMA Mapping error\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;tx_descs[i].tdes0.rd.buffer1 =3D dma_han=
dle;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;tx_descs[i].tdes2.rd.buf1len =3D len;<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;tx_descs[i].tdes3.rd.fl =3D len;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;tx_descs[i].tdes3.rd.fd =3D 1;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;tx_descs[i].tdes3.rd.ld =3D 1;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;tx_descs[i].tdes3.rd.own =3D 1;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Issue Transmit Poll by writing address of ne=
xt free descriptor */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 regval =3D lp-&gt;tx_descs_addr + (i+1) * sizeo=
f(struct dwc_eth_qos_txdesc);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_=
TXDESC_TAIL, regval);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Set poll wait timeout to 2 seconds */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwc_wait =3D 200;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 while (lp-&gt;tx_descs[i].tdes3.wr.own) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mdelay(10);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dwc_wait--)<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (lp-&gt;tx_descs[i].tdes3.wr.own)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;lp-&gt=
;pdev-&gt;dev, &quot;Failed to transmit: Timed out\n&quot;);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;next_tx =3D (lp-&gt;next_tx + 1) % DWCEQ=
OS_TX_DCNT;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dma_unmap_single(lp-&gt;ndev-&gt;dev.parent,<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dma_handle, DWCEQOS_RX_BUF_SIZE, DMA_TO_DEVICE);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Store HW Addr in MAC registers. Source Address Replacement not use=
d yet */<br>
&gt; +static void dwceqos_set_hwaddr(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 val =3D DWCEQOS_MAC_ADDR_HI_EN | (lp-&gt;ndev-&=
gt;dev_addr[0] &lt;&lt; 8) |<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (lp-&gt;ndev-&gt;de=
v_addr[1]);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_MAC_ADDR=
_HI, val);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 val =3D (lp-&gt;ndev-&gt;dev_addr[2] &lt;&lt; 2=
4) | (lp-&gt;ndev-&gt;dev_addr[3] &lt;&lt; 16) |<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (lp-&gt;ndev-&gt;de=
v_addr[4] &lt;&lt; 8) =C2=A0| (lp-&gt;ndev-&gt;dev_addr[5]);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_MAC_ADDR=
_LO, val);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* DMA reset. When issued also resets all MTL and MAC registers as we=
ll */<br>
&gt; +static void dwceqos_dma_reset(struct net_local *lp)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Wait 5 seconds for DMA reset*/<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 int i =3D 5000;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_MODE=
, 1);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 do {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mdelay(1);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 } while ((dwceqos_read(lp-&gt;baseaddr, DWCEQOS=
_DMA_MODE) &amp; 0x1) &amp;&amp; i--);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Interrupt handler. So far only RX interrupts are used */<br>
&gt; +static irqreturn_t dwceqos_interrupt(int irq, void *dev_id)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_device *ndev =3D dev_id;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_local *lp =3D netdev_priv(ndev);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 cause;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 cause =3D dwceqos_read(lp-&gt;baseaddr, DWCEQOS=
_DMA_INT_STAT);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (cause &amp; 0x00000001) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* DMA Channel 0 In=
terrupt. Assume RX interrupt for now */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D dwceqos_rea=
d(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_STAT);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ack */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&g=
t;baseaddr, DWCEQOS_DMA_CH0_STAT, val);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val &amp; 0x000=
00040)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 napi_schedule(&amp;lp-&gt;napi);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 } else if (unlikely(!cause)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return IRQ_NONE;<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return IRQ_HANDLED;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int dwceqos_open(struct net_device *ndev)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Allocate Buffers &amp; DMA Descr. + Initiate=
 DMA descriptors */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_local *lp =3D netdev_priv(ndev);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Set up hardware. It looks like order of writ=
es is important here.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* Only gigatbit support, no advanced MTL =
or MAC configuration yet.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_dma_reset(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_mtl_init(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_mtl_tx_init(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_dma_setmode(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_dma_alloc(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_dma_wake_rx(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_dma_txenable(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_mtl_rx_init(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_mac_rx_init(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_dma_rx_enable(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_dma_wake_rx(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_set_hwaddr(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_mac_enable(lp);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Enable RX Interrupts */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_write(lp-&gt;baseaddr, DWCEQOS_DMA_CH0_=
INT_EN, 0x00010040);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 napi_enable(&amp;lp-&gt;napi);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 netif_carrier_on(ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 netif_start_queue(ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +int dwceqos_stop(struct net_device *ndev)<br>
<br>
</div></div>Make this function static.<br>
<div class=3D""><br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_local *lp =3D netdev_priv(ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_dma_free(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 netif_stop_queue(ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 napi_disable(&amp;lp-&gt;napi);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 netif_carrier_off(ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Receive one packet and return skb */<br>
&gt; +struct sk_buff *<br>
&gt; +dwceqos_recv_packet(struct net_local *lp)<br>
<br>
</div>Make this function static.<br>
<div><div class=3D"h5"><br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct sk_buff *skb;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 u32 len;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 skb =3D lp-&gt;rx_skb[lp-&gt;next_rx].skb;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 len =3D lp-&gt;rx_descs[lp-&gt;next_rx].rdes3.w=
r.length;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Unmap old buffer */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dma_unmap_single(lp-&gt;ndev-&gt;dev.parent, lp=
-&gt;rx_skb[lp-&gt;next_rx].mapping,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_skb[lp-&g=
t;next_rx].len, DMA_FROM_DEVICE);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 skb_put(skb, len);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 skb-&gt;protocol =3D eth_type_trans(skb, lp-&gt=
;ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 skb-&gt;ip_summed =3D 0;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Initialize new Buffer descriptor */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_alloc_rxring_desc(lp, lp-&gt;next_rx);<=
br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!(lp-&gt;rx_skb[lp-&gt;next_rx].skb)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;lp-&gt=
;pdev-&gt;dev, &quot;Unable to map descriptor %d to DMA\n&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lp-&gt;next_rx);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Initialize new DMA descriptor */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[lp-&gt;next_rx].rdes0.rd.buffer=
1 =3D<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_skb[lp-&g=
t;next_rx].mapping;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[lp-&gt;next_rx].rdes1.raw =3D 0=
;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[lp-&gt;next_rx].rdes2.rd.buffer=
2 =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[lp-&gt;next_rx].rdes3.raw =3D 0=
;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[lp-&gt;next_rx].rdes3.rd.buf1v =
=3D 1;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[lp-&gt;next_rx].rdes3.rd.inte =
=3D 1;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;rx_descs[lp-&gt;next_rx].rdes3.rd.own =
=3D 1;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;next_rx =3D (lp-&gt;next_rx + 1) % DWCEQ=
OS_RX_DCNT;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return skb;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +/* NAPI poll routine */<br>
&gt; +int dwceqos_rx_poll(struct napi_struct *napi, int budget)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_local *lp =3D container_of(napi, str=
uct net_local, napi);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 int npackets =3D 0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct sk_buff *skb;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 spin_lock(&amp;lp-&gt;rx_lock);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 while (npackets &lt; budget &amp;&amp; dwceqos_=
packet_avail(lp)) {<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skb =3D dwceqos_rec=
v_packet(lp);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!skb)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 netif_receive_skb(s=
kb);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;stats.rx_pac=
kets++;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;stats.rx_byt=
es +=3D skb-&gt;len;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npackets++;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (npackets &lt; budget)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 napi_complete(napi)=
;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 spin_unlock(&amp;lp-&gt;rx_lock);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return npackets;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Main transmit function called from kernel */<br>
&gt; +int dwceqos_start_xmit(struct sk_buff *skb, struct net_device *ndev)<=
br>
<br>
</div></div>Make this function static.<br>
<div class=3D""><br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 int len;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_local *lp =3D netdev_priv(ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 char *data;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 data =3D skb-&gt;data;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 len =3D skb-&gt;len;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Send packet on wire */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_dma_xmit(lp, data, len);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 skb_tx_timestamp(skb);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ndev-&gt;stats.tx_bytes +=3D len;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dev_kfree_skb(skb);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct net_device_ops dwceq_netdev_ops;<br>
<br>
</div>Why not initialize this here?<br>
<div><div class=3D"h5"><br>
&gt; +#ifdef CONFIG_OF<br>
&gt; +static inline int dwceqos_probe_config_dt(struct platform_device *pde=
v)<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_device *ndev;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 const void *mac_address;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ndev =3D platform_get_drvdata(pdev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 /* Set the MAC address. */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 mac_address =3D of_get_mac_address(pdev-&gt;dev=
.of_node);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (mac_address)<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(ndev-&gt;dev=
_addr, mac_address, ETH_ALEN);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_warn(&amp;pdev-=
&gt;dev, &quot;No MAC address found\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +#else<br>
&gt; +static inline int dwceqos_probe_config_dt()<br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return -ENOSYS;<br>
&gt; +}<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * dwceqos_probe - Platform driver probe<br>
&gt; + * @pdev: Pointer to platform device structure<br>
&gt; + *<br>
&gt; + * Return 0 on success, negative value if error<br>
&gt; + */<br>
&gt; +int dwceqos_probe(struct platform_device *pdev)<br>
<br>
</div></div>Make this function static.<br>
<div><div class=3D"h5"><br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct resource *r_mem =3D NULL;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct resource *r_irq =3D NULL;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_device *ndev;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_local *lp;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 int ret =3D -ENXIO;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 r_mem =3D platform_get_resource(pdev, IORESOURC=
E_MEM, 0);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 r_irq =3D platform_get_resource(pdev, IORESOURC=
E_IRQ, 0);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!r_mem || !r_irq) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&=
gt;dev, &quot;no IO resource defined.\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ndev =3D alloc_etherdev(sizeof(*lp));<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (!ndev) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&=
gt;dev, &quot;etherdev allocation failed.\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 SET_NETDEV_DEV(ndev, &amp;pdev-&gt;dev);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp =3D netdev_priv(ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;ndev =3D ndev;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;pdev =3D pdev;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;baseaddr =3D devm_ioremap_resource(&amp;=
pdev-&gt;dev, r_mem);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(lp-&gt;baseaddr)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&=
gt;dev, &quot;failed to map baseaddress.\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(lp-=
&gt;baseaddr);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_out_free_n=
etdev;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dev_dbg(&amp;lp-&gt;pdev-&gt;dev, &quot;BASEADD=
RESS hw: %p virt: %p\n&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (void *)r_mem-&gt;start, lp-&gt;baseaddr);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ndev-&gt;irq =3D platform_get_irq(pdev, 0);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ndev-&gt;netdev_ops =3D &amp;dwceq_netdev_ops;<=
br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ndev-&gt;base_addr =3D r_mem-&gt;start;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ndev-&gt;features =3D 0;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 netif_napi_add(ndev, &amp;lp-&gt;napi, dwceqos_=
rx_poll, 64);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D register_netdev(ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&=
gt;dev, &quot;Cannot register net device, aborting.\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_out_free_n=
etdev;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;apb_pclk =3D devm_clk_get(&amp;pdev-&gt;=
dev, &quot;apb_pclk&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(lp-&gt;apb_pclk)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&=
gt;dev, &quot;apb_pclk clock not found.\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(lp-=
&gt;apb_pclk);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_out_unregi=
ster_netdev;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 lp-&gt;phy_ref_clk =3D devm_clk_get(&amp;pdev-&=
gt;dev, &quot;phy_ref_clk&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(lp-&gt;phy_ref_clk)) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&=
gt;dev, &quot;phy_ref_clk clock not found.\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(lp-=
&gt;phy_ref_clk);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_out_unregi=
ster_netdev;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D clk_prepare_enable(lp-&gt;apb_pclk);<br=
>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&=
gt;dev, &quot;Unable to enable APER clock.\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_out_unregi=
ster_netdev;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D clk_prepare_enable(lp-&gt;phy_ref_clk);=
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&=
gt;dev, &quot;Unable to enable device clock.\n&quot;);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_out_clk_di=
s_aper;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dwceqos_probe_config_dt(pdev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 dev_info(&amp;lp-&gt;pdev-&gt;dev, &quot;pdev-&=
gt;id %d, baseaddr 0x%08lx, irq %d\n&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pdev-&gt;id, ndev-&gt;base_addr, ndev-&gt;irq);<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D devm_request_irq(&amp;pdev-&gt;dev, nde=
v-&gt;irq, &amp;dwceqos_interrupt, 0,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ndev-&gt;name, ndev=
);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;lp-&gt=
;pdev-&gt;dev, &quot;Unable to request IRQ %p, error %d\n&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r_irq, ret);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_out_unregi=
ster_clk_notifier;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +<br>
&gt; +err_out_unregister_clk_notifier:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 clk_disable_unprepare(lp-&gt;phy_ref_clk);<br>
&gt; +err_out_clk_dis_aper:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 clk_disable_unprepare(lp-&gt;apb_pclk);<br>
&gt; +err_out_unregister_netdev:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 unregister_netdev(ndev);<br>
&gt; +err_out_free_netdev:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 free_netdev(ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, NULL);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int dwceqos_remove(struct platform_device *pdev)<br>
<br>
</div></div>Make this function static.<br>
<div class=3D""><br>
&gt; +{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 struct net_device *ndev =3D platform_get_drvdat=
a(pdev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 unregister_netdev(ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 free_netdev(ndev);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct net_device_ops dwceq_netdev_ops =3D {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 .ndo_open =C2=A0 =C2=A0 =C2=A0 =3D dwceqos_open=
,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 .ndo_stop =C2=A0 =C2=A0 =C2=A0 =3D dwceqos_stop=
,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 .ndo_start_xmit =3D dwceqos_start_xmit,<br>
&gt; +};<br>
<br>
</div>Move initialization to where it is declared and make the struct stati=
c.<br>
<div class=3D""><br>
&gt; +<br>
&gt; +struct of_device_id dwceq_of_match[] =3D {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;dwc,qos-ethernet&quot;,=
 },<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 {}<br>
&gt; +};<br>
<br>
</div>Make this struct static.<br>
<br>
Make this struct static.<br>
<div class=3D"">&gt; +MODULE_DEVICE_TABLE(of, dwceq_of_match);<br>
&gt; +<br>
&gt; +struct platform_driver dwceqos_driver =3D {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 .probe =C2=A0 =3D dwceqos_probe,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 .remove =C2=A0=3D dwceqos_remove,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 .driver =C2=A0=3D {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0=3D DRI=
VER_NAME,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS_MOD=
ULE,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D=
 dwceq_of_match,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +};<br>
<br>
</div>Make this struct static.<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
To unsubscribe from this list: send the line &quot;unsubscribe netdev&quot;=
 in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at =C2=A0<a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><b=
r>
</div></div></blockquote></div><br></div>

--089e016354d4ca9e8a04f9090bf6--
