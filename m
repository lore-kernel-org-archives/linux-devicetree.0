From: Yuval Mintz <Yuval.Mintz-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V3 net-next 1/5] net:hns: Add support of Hip06 SoC to the
 Hislicon Network Subsystem
Date: Sun, 22 Nov 2015 09:19:55 +0000
Message-ID: <CO2PR11MB0088145308CE8BF0C504C9C497180__4331.62934282354$1448184088$gmane$org@CO2PR11MB0088.namprd11.prod.outlook.com>
References: <1447966706-16219-1-git-send-email-salil.mehta@huawei.com>
 <1447966706-16219-2-git-send-email-salil.mehta@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447966706-16219-2-git-send-email-salil.mehta-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Salil Mehta <salil.mehta-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org" <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "kenneth-lee-2012-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org" <kenneth-lee-2012-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org>, "mehta.salil.lnk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mehta.sal>
Cc: yankejian <yankejian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, lipeng <lipeng321-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> +void hns_rcbv2_int_ctrl_hw(struct hnae_queue *q, u32 flag, u32 mask)
> +{
> +	u32 int_mask_en = !!mask;
> +
> +	if (flag & RCB_INT_FLAG_TX)
> +		dsaf_write_dev(q, RCB_RING_INTMSK_TXWL_REG,
> int_mask_en);
> +
> +	if (flag & RCB_INT_FLAG_RX)
> +		dsaf_write_dev(q, RCB_RING_INTMSK_RXWL_REG,
> int_mask_en);
> +}
> +
> +void hns_rcbv2_int_clr_hw(struct hnae_queue *q, u32 flag)
> +{
> +	u32 clr = 1;
> +
> +	if (flag & RCB_INT_FLAG_TX)
> +		dsaf_write_dev(q, RCBV2_TX_RING_INT_STS_REG, clr);
> +
> +	if (flag & RCB_INT_FLAG_RX)
> +		dsaf_write_dev(q, RCBV2_RX_RING_INT_STS_REG, clr);
> +}
> +

Why do you need the int_mask_en, clr variables? Why not directly use values?

> +static void fill_v2_desc(struct hnae_ring *ring, void *priv,
....
> +	hnae_set_field(bn_pid, 0x7, 0, buf_num - 1);

Magic values?

> +int hns_nic_net_xmit_hw(struct net_device *ndev,
> +			struct sk_buff *skb,
> +			struct hns_nic_ring_data *ring_data)
> +{

> -	/* If everything has gone correctly network should be the
> +	/**
> +	 * If everything has gone correctly network should be the
>  	 * data section of the packet and will be the end of the header.
>  	 * If not then it probably represents the end of the last recognized
>  	 * header.

What happened to the network style comments?

>  static int hns_nic_poll_rx_skb(struct hns_nic_ring_data *ring_data,
>  			       struct sk_buff **out_skb, int *out_bnum)
> +	/**
> +	 * we will be copying header into skb->data in
> +	 * pskb_may_pull so it is in our interest to prefetch
> +	 * it now to avoid a possible cache miss
> +	 */
> +	prefetchw(skb->data);
> +

Likewise

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
