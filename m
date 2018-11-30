From: PETER CHEN <peter.chen@nxp.com>
Subject: RE: [RFC PATCH v2 02/15] usb:cdns3: Device side header file.
Date: Fri, 30 Nov 2018 06:48:08 +0000
Message-ID: <VI1PR04MB5327F686BE6E9F5D85380BA98BD30@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-3-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542535751-16079-3-git-send-email-pawell@cadence.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, "sureshp@cadence.com" <sureshp@cadence.com>, "pjez@cadence.com" <pjez@cadence.com>, "kurahul@cadence.com" <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

=20
=20
> +
> +/*
> + * USBSS-DEV register interface.
> + * This corresponds to the USBSS Device Controller Interface  */
> +/**
> + * struct xhci_cap_regs - xHCI Host Controller Capability Registers.

struct cdns3_usb_regs - device controller registers

> +struct cdns3_device;
> +
> +struct cdns3_endpoint {
> +	struct usb_ep		endpoint;
> +	struct list_head	request_list;
> +	struct list_head	ep_match_pending_list;
> +
> +	struct cdns3_trb	*trb_pool;
> +	dma_addr_t		trb_pool_dma;
> +
> +	struct cdns3_device	*cdns3_dev;
> +	char			name[20];
> +
> +#define EP_ENABLED		BIT(0)
> +#define EP_STALL		BIT(1)
> +#define EP_WEDGE		BIT(2)
> +#define EP_TRANSFER_STARTED	BIT(3)
> +#define EP_UPDATE_EP_TRBADDR	BIT(4)
> +#define EP_PENDING_REQUEST	BIT(5)
> +#define EP_USED			BIT(5)
> +	u32			flags;
> +
> +	void			*aligned_buff;
> +	dma_addr_t		aligned_dma_addr;
> +	u8			dir;
> +	u8			num;
> +	u8			type;
> +
> +	int			free_trbs;
> +	u8			pcs;
> +	u8			ccs;
> +	int			enqueue;
> +	int			dequeue;
> +};
> +

Would you please add kernel doc for above structure?

> +struct cdns3_request {
> +	struct usb_request request;
> +	struct cdns3_endpoint *priv_ep;
> +	struct cdns3_trb *trb;
> +	int start_trb;
> +	int end_trb;
> +	int on_ring:1;
> +};
> +
> +#define to_cdns3_request(r) (container_of(r, struct cdns3_request,
> +request))
> +
> +struct cdns3_device {
> +	struct device			dev;
> +	struct cdns3_usb_regs		__iomem *regs;
> +
> +	struct usb_gadget		gadget;
> +	struct usb_gadget_driver	*gadget_driver;
> +
> +	struct usb_ctrlrequest		*setup;
> +	dma_addr_t			setup_dma;
> +	dma_addr_t			trb_ep0_dma;
> +	struct cdns3_trb		*trb_ep0;
> +	void				*zlp_buf;
> +
> +	struct cdns3_endpoint		*eps[USB_SS_ENDPOINTS_MAX_COUNT];
> +	int				ep_nums;
> +	/*
> +	 * field used for improving performance. It holds the last
> +	 * selected endpoint number
> +	 */
> +	u32				selected_ep;
> +	struct usb_request		*ep0_request;
> +	int				ep0_data_dir;
> +	int				hw_configured_flag;
> +	int				wake_up_flag;
> +	u16				isoch_delay;
> +	/* generic spin-lock for drivers */
> +	spinlock_t			lock;
> +
> +	unsigned			is_connected:1;
> +	unsigned			in_standby_mode:1;
> +	unsigned			status_completion_no_call:1;
> +	unsigned			u1_allowed:1;
> +	unsigned			u2_allowed:1;
> +
> +	u32				usb_ien;
> +	u32				ep_ien;
> +	int				setup_pending;
> +	struct device			*sysdev;
> +	/* The device mode is enabled */
> +	int				start_gadget;
> +	struct list_head		ep_match_list;
> +	/* KB */
> +	int				onchip_mem_allocated_size;
> +	/* Memory is allocated for OUT */
> +	int				out_mem_is_allocated:1;
> +	struct work_struct		pending_status_wq;
> +	struct usb_request		*pending_status_request;
> +};
> +

kernel-doc please

Peter
