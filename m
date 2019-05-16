From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH 1/3] enetc: add hardware timestamping support
Date: Thu, 16 May 2019 15:30:51 +0000
Message-ID: <VI1PR04MB4880B9B346D29E0EFC715D28960A0@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <20190516100028.48256-1-yangbo.lu@nxp.com>
 <20190516100028.48256-2-yangbo.lu@nxp.com>
 <20190516143251.akbt3ns6ue2jrhl5@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516143251.akbt3ns6ue2jrhl5@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>, "Y.b. Lu" <yangbo.lu@nxp.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


>-----Original Message-----
>From: Richard Cochran <richardcochran@gmail.com>
>Sent: Thursday, May 16, 2019 5:33 PM
>To: Y.b. Lu <yangbo.lu@nxp.com>
>Cc: netdev@vger.kernel.org; David Miller <davem@davemloft.net>; Claudiu
>Manoil <claudiu.manoil@nxp.com>; Shawn Guo <shawnguo@kernel.org>; Rob
>Herring <robh+dt@kernel.org>; devicetree@vger.kernel.org; linux-arm-
>kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>Subject: Re: [PATCH 1/3] enetc: add hardware timestamping support
>
>On Thu, May 16, 2019 at 09:59:08AM +0000, Y.b. Lu wrote:
>
[...]
>
>>  static bool enetc_clean_tx_ring(struct enetc_bdr *tx_ring, int napi_bud=
get)
>>  {
>>  	struct net_device *ndev =3D tx_ring->ndev;
>> +	struct enetc_ndev_priv *priv =3D netdev_priv(ndev);
>>  	int tx_frm_cnt =3D 0, tx_byte_cnt =3D 0;
>>  	struct enetc_tx_swbd *tx_swbd;
>> +	union enetc_tx_bd *txbd;
>> +	bool do_tstamp;
>>  	int i, bds_to_clean;
>> +	u64 tstamp =3D 0;
>
>Please keep in reverse Christmas tree order as much as possible:

For the xmass tree part, Yangbo, better move the priv and txbd declarations
inside the scope of the if() {} block where they are actually used, i.e.:

		if (unlikely(tx_swbd->check_wb)) {
			struct enetc_ndev_priv *priv =3D netdev_priv(ndev);
			union enetc_tx_bd *txbd;
			[...]
		}

>
>	union enetc_tx_bd *txbd;
>	int i, bds_to_clean;
>	bool do_tstamp;
>	u64 tstamp =3D 0;
>
>>  	i =3D tx_ring->next_to_clean;
>>  	tx_swbd =3D &tx_ring->tx_swbd[i];
>>  	bds_to_clean =3D enetc_bd_ready_count(tx_ring, i);
>>
>> +	do_tstamp =3D false;
>> +
>>  	while (bds_to_clean && tx_frm_cnt < ENETC_DEFAULT_TX_WORK) {
>>  		bool is_eof =3D !!tx_swbd->skb;
>>
>> +		if (unlikely(tx_swbd->check_wb)) {
>> +			txbd =3D ENETC_TXBD(*tx_ring, i);
>> +
>> +			if (!(txbd->flags & ENETC_TXBD_FLAGS_W))
>> +				goto no_wb;
>> +
>> +			if (tx_swbd->do_tstamp) {
>> +				enetc_get_tx_tstamp(&priv->si->hw, txbd,
>> +						    &tstamp);
>> +				do_tstamp =3D true;
>> +			}
>> +		}
>> +no_wb:
>
>This goto seems strange and unnecessary.  How about this instead?
>
>			if (txbd->flags & ENETC_TXBD_FLAGS_W &&
>			    tx_swbd->do_tstamp) {
>				enetc_get_tx_tstamp(&priv->si->hw, txbd, &tstamp);
>				do_tstamp =3D true;
>			}
>

Absolutely, somehow I missed this.  I guess the intention was to be able to=
 support multiple
if() blocks for the writeback case (W flag set) but the code is much better=
 off without the goto.

>>  		enetc_unmap_tx_buff(tx_ring, tx_swbd);
>>  		if (is_eof) {
>> +			if (unlikely(do_tstamp)) {
>> +				enetc_tstamp_tx(tx_swbd->skb, tstamp);
>> +				do_tstamp =3D false;
>> +			}
>>  			napi_consume_skb(tx_swbd->skb, napi_budget);
>>  			tx_swbd->skb =3D NULL;
>>  		}
>> @@ -167,6 +169,11 @@ struct enetc_cls_rule {
>>
>>  #define ENETC_MAX_BDR_INT	2 /* fixed to max # of available cpus */
>>
>> +enum enetc_hw_features {
>
>This is a poor choice of name.  It sounds like it describes HW
>capabilities, but you use it to track whether a feature is requested
>at run time.
>
>> +	ENETC_F_RX_TSTAMP	=3D BIT(0),
>> +	ENETC_F_TX_TSTAMP	=3D BIT(1),
>> +};
>> +
>>  struct enetc_ndev_priv {
>>  	struct net_device *ndev;
>>  	struct device *dev; /* dma-mapping device */
>> @@ -178,6 +185,7 @@ struct enetc_ndev_priv {
>>  	u16 rx_bd_count, tx_bd_count;
>>
>>  	u16 msg_enable;
>> +	int hw_features;
>
>This is also poorly named.  How about "tstamp_request" instead?
>

This ndev_priv variable was intended to gather flags for all the active h/w=
 related
features, i.e. keeping count of what h/w offloads are enabled for the curre=
nt device
(at least for those that don't have already a netdev_features_t flag).
I wouldn't waste an int for 2 timestamp flags, I'd rather have a more gener=
ic name.
Maybe active_offloads then?

Anyway, the name can be changed later too, when other offloads will be adde=
d.

Thanks,
Claudiu
