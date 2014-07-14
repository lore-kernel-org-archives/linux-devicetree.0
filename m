Return-Path: <andy.green@linaro.org>
MIME-Version: 1.0
In-Reply-To: <18609483.Jzi9Hxcq2r@wuerfel>
References: <1405233107-4762-1-git-send-email-mollie.wu@linaro.org>
	<18609483.Jzi9Hxcq2r@wuerfel>
Date: Mon, 14 Jul 2014 22:00:25 +0800
Message-ID: <CAAfg0W4=UEPLWT87cogiaxwGUkXXqGHoWrOauGG4u9_WnaXiMA@mail.gmail.com>
Subject: Re: [PATCH 6/8] net: ethernet driver: Fujitsu OGMA
From: Andy Green <andy.green@linaro.org>
Content-Type: multipart/alternative; boundary=001a11c2e0a87c7f6404fe27b659
To: Arnd Bergmann <arnd@arndb.de>
Cc: mark.rutland@arm.com, David Miller <davem@davemloft.net>, robh+dt@kernel.org, Mollie Wu <mollie.wu@linaro.org>, linux@arm.linux.org.uk, Tetsuya Takinishi <t.takinishi@jp.fujitsu.com>, stephen@networkplumber.org, romieu@fr.zoreil.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, olof@lixom.net, jaswinder.singh@linaro.org, f.fainelli@gmail.com, patches@linaro.org, pawel.moll@arm.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a11c2e0a87c7f6404fe27b659
Content-Type: text/plain; charset=UTF-8

On 14 Jul 2014 21:51, "Arnd Bergmann" <arnd@arndb.de> wrote:
>
> On Sunday 13 July 2014 14:31:47 Mollie Wu wrote:
> > +
> > +Example:
> > +     eth0: f_taiki {
> > +                compatible = "fujitsu,ogma";
> > +             reg = <0 0x31600000 0x10000>, <0 0x31618000 0x4000>, <0
0x3161c000 0x4000>;
> > +             interrupts = <0 163 0x4>;
> > +             clocks = <&clk_alw_0_8>;
> > +             phy-mode = "rgmii";
> > +             max-speed = <1000>;
> > +             max-frame-size = <9000>;
> > +             local-mac-address = [ a4 17 31 00 00 ed ];
> > +             phy-handle = <&ethphy0>;
> > +
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             ethphy0: ethernet-phy@1 {
> > +                     device_type = "ethernet-phy";
> > +                     compatible = "ethernet-phy-ieee802.3-c22";
> > +                     reg = <1>;
> > +             };
> > +     };
>
> The name of the device should be "ethernet" rather than "f_taiki".

OK.

> For the compatible string, it would be good to have a version number
included.
> If you cannot find out the version of the ogma hardware, add the
identifier for
> the soc it is used in, e.g.
>
>         compatible = "fujitsu,mb86s73-ogma", "fujitsu,ogma";
>
> The driver only needs to match the generic string, but it's better
> to be prepared for the case where we have to support slightly different
> variants.

Yes it's a good idea, thanks.

> > +static inline void ogma_writel(struct ogma_priv *priv, u32 reg_addr,
u32 val)
> > +{
> > +     writel(val, priv->ioaddr + (reg_addr << 2));
> > +}
> > +
> > +static inline u32 ogma_readl(struct ogma_priv *priv, u32 reg_addr)
> > +{
> > +     return readl(priv->ioaddr + (reg_addr << 2));
> > +}
> for best performance, it may be better to use readl_relaxed() by default
> and only use the nonrelaxed accesses in the cases where you have to
> synchronize with DMA transfers.

OK.

> > +
> > +#define TIMEOUT_SPINS_MAC 1000000
> > +
> > +static u32 ogma_clk_type(u32 freq)
> > +{
> > +     if (freq < 35 * OGMA_CLK_MHZ)
> > +             return OGMA_GMAC_GAR_REG_CR_25_35_MHZ;
> > +     if (freq < 60 * OGMA_CLK_MHZ)
> > +             return OGMA_GMAC_GAR_REG_CR_35_60_MHZ;
> > +     if (freq < 100 * OGMA_CLK_MHZ)
> > +             return OGMA_GMAC_GAR_REG_CR_60_100_MHZ;
> > +     if (freq < 150 * OGMA_CLK_MHZ)
> > +             return OGMA_GMAC_GAR_REG_CR_100_150_MHZ;
> > +     if (freq < 250 * OGMA_CLK_MHZ)
> > +             return OGMA_GMAC_GAR_REG_CR_150_250_MHZ;
> > +
> > +     return OGMA_GMAC_GAR_REG_CR_250_300_MHZ;
> > +}
> > +
> > +static int ogma_wait_while_busy(struct ogma_priv *priv, u32 addr, u32
mask)
> > +{
> > +     u32 timeout = TIMEOUT_SPINS_MAC;
> > +
> > +     while (--timeout && ogma_readl(priv, addr) & mask)
> > +             ;
> > +     if (!timeout) {
> > +             netdev_WARN(priv->net_device, "%s: timeout\n", __func__);
> > +             return -ETIMEDOUT;
> > +     }
> > +
> > +     return 0;
> > +}
>
> The callers of this function seem to all be from non-atomic context, so it
> would be good to occasionally msleep() here, either after each try, or
> after initially spinning for as long as it takes to succeed most of the
> time.

OK.  Normally it should complete quickly, so the initial spin idea sounds
like the way.

> > +
> > +static void ogma_napi_tx_processing(struct napi_struct *napi_p)
> > +{
> > +     struct ogma_priv *priv = container_of(napi_p, struct ogma_priv,
napi);
> > +
> > +     ogma_ring_irq_clr(priv, OGMA_RING_TX, OGMA_IRQ_EMPTY);
> > +     ogma_clean_tx_desc_ring(priv);
> > +
> > +     if (netif_queue_stopped(priv->net_device) &&
> > +         ogma_get_tx_avail_num(priv) >=
OGMA_NETDEV_TX_PKT_SCAT_NUM_MAX)
> > +             netif_wake_queue(priv->net_device);
> > +}
>
> You should probably call netdev_tx_completed_queue() here and
> netdev_tx_sent_queue() when sending the frame. See
http://lwn.net/Articles/454390/
> for a description of the API.

OK... thanks a lot for the review, I will fix these and send the rest
version in a few days.

-Andy

>         Arnd
>

--001a11c2e0a87c7f6404fe27b659
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 14 Jul 2014 21:51, &quot;Arnd Bergmann&quot; &lt;<a href=3D"mailto:arnd@=
arndb.de">arnd@arndb.de</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sunday 13 July 2014 14:31:47 Mollie Wu wrote:<br>
&gt; &gt; +<br>
&gt; &gt; +Example:<br>
&gt; &gt; + =C2=A0 =C2=A0 eth0: f_taiki {<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatib=
le =3D &quot;fujitsu,ogma&quot;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0 0x31600=
000 0x10000&gt;, &lt;0 0x31618000 0x4000&gt;, &lt;0 0x3161c000 0x4000&gt;;<=
br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;0 =
163 0x4&gt;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;c=
lk_alw_0_8&gt;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phy-mode =3D &quot;rg=
mii&quot;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max-speed =3D &lt;100=
0&gt;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max-frame-size =3D &l=
t;9000&gt;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local-mac-address =3D=
 [ a4 17 31 00 00 ed ];<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phy-handle =3D &lt;&a=
mp;ethphy0&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &l=
t;1&gt;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0=
&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ethphy0: ethernet-phy=
@1 {<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 device_type =3D &quot;ethernet-phy&quot;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 compatible =3D &quot;ethernet-phy-ieee802.3-c22&quot;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 reg =3D &lt;1&gt;;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; + =C2=A0 =C2=A0 };<br>
&gt;<br>
&gt; The name of the device should be &quot;ethernet&quot; rather than &quo=
t;f_taiki&quot;.</p>
<p dir=3D"ltr">OK.</p>
<p dir=3D"ltr">&gt; For the compatible string, it would be good to have a v=
ersion number included.<br>
&gt; If you cannot find out the version of the ogma hardware, add the ident=
ifier for<br>
&gt; the soc it is used in, e.g.<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;fujitsu,mb86s73-ogma&=
quot;, &quot;fujitsu,ogma&quot;;<br>
&gt;<br>
&gt; The driver only needs to match the generic string, but it&#39;s better=
<br>
&gt; to be prepared for the case where we have to support slightly differen=
t<br>
&gt; variants.</p>
<p dir=3D"ltr">Yes it&#39;s a good idea, thanks.</p>
<p dir=3D"ltr">&gt; &gt; +static inline void ogma_writel(struct ogma_priv *=
priv, u32 reg_addr, u32 val)<br>
&gt; &gt; +{<br>
&gt; &gt; + =C2=A0 =C2=A0 writel(val, priv-&gt;ioaddr + (reg_addr &lt;&lt; =
2));<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static inline u32 ogma_readl(struct ogma_priv *priv, u32 reg_add=
r)<br>
&gt; &gt; +{<br>
&gt; &gt; + =C2=A0 =C2=A0 return readl(priv-&gt;ioaddr + (reg_addr &lt;&lt;=
 2));<br>
&gt; &gt; +}<br>
&gt; for best performance, it may be better to use readl_relaxed() by defau=
lt<br>
&gt; and only use the nonrelaxed accesses in the cases where you have to<br=
>
&gt; synchronize with DMA transfers.</p>
<p dir=3D"ltr">OK.</p>
<p dir=3D"ltr">&gt; &gt; +<br>
&gt; &gt; +#define TIMEOUT_SPINS_MAC 1000000<br>
&gt; &gt; +<br>
&gt; &gt; +static u32 ogma_clk_type(u32 freq)<br>
&gt; &gt; +{<br>
&gt; &gt; + =C2=A0 =C2=A0 if (freq &lt; 35 * OGMA_CLK_MHZ)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return OGMA_GMAC_GAR_=
REG_CR_25_35_MHZ;<br>
&gt; &gt; + =C2=A0 =C2=A0 if (freq &lt; 60 * OGMA_CLK_MHZ)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return OGMA_GMAC_GAR_=
REG_CR_35_60_MHZ;<br>
&gt; &gt; + =C2=A0 =C2=A0 if (freq &lt; 100 * OGMA_CLK_MHZ)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return OGMA_GMAC_GAR_=
REG_CR_60_100_MHZ;<br>
&gt; &gt; + =C2=A0 =C2=A0 if (freq &lt; 150 * OGMA_CLK_MHZ)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return OGMA_GMAC_GAR_=
REG_CR_100_150_MHZ;<br>
&gt; &gt; + =C2=A0 =C2=A0 if (freq &lt; 250 * OGMA_CLK_MHZ)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return OGMA_GMAC_GAR_=
REG_CR_150_250_MHZ;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 return OGMA_GMAC_GAR_REG_CR_250_300_MHZ;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static int ogma_wait_while_busy(struct ogma_priv *priv, u32 addr=
, u32 mask)<br>
&gt; &gt; +{<br>
&gt; &gt; + =C2=A0 =C2=A0 u32 timeout =3D TIMEOUT_SPINS_MAC;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 while (--timeout &amp;&amp; ogma_readl(priv, addr=
) &amp; mask)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;<br>
&gt; &gt; + =C2=A0 =C2=A0 if (!timeout) {<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 netdev_WARN(priv-&gt;=
net_device, &quot;%s: timeout\n&quot;, __func__);<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ETIMEDOUT;<br=
>
&gt; &gt; + =C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; +}<br>
&gt;<br>
&gt; The callers of this function seem to all be from non-atomic context, s=
o it<br>
&gt; would be good to occasionally msleep() here, either after each try, or=
<br>
&gt; after initially spinning for as long as it takes to succeed most of th=
e<br>
&gt; time.</p>
<p dir=3D"ltr">OK.=C2=A0 Normally it should complete quickly, so the initia=
l spin idea sounds like the way.</p>
<p dir=3D"ltr">&gt; &gt; +<br>
&gt; &gt; +static void ogma_napi_tx_processing(struct napi_struct *napi_p)<=
br>
&gt; &gt; +{<br>
&gt; &gt; + =C2=A0 =C2=A0 struct ogma_priv *priv =3D container_of(napi_p, s=
truct ogma_priv, napi);<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 ogma_ring_irq_clr(priv, OGMA_RING_TX, OGMA_IRQ_EM=
PTY);<br>
&gt; &gt; + =C2=A0 =C2=A0 ogma_clean_tx_desc_ring(priv);<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 if (netif_queue_stopped(priv-&gt;net_device) &amp=
;&amp;<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 ogma_get_tx_avail_num(priv) &gt;=3D=
 OGMA_NETDEV_TX_PKT_SCAT_NUM_MAX)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 netif_wake_queue(priv=
-&gt;net_device);<br>
&gt; &gt; +}<br>
&gt;<br>
&gt; You should probably call netdev_tx_completed_queue() here and<br>
&gt; netdev_tx_sent_queue() when sending the frame. See <a href=3D"http://l=
wn.net/Articles/454390/">http://lwn.net/Articles/454390/</a><br>
&gt; for a description of the API.</p>
<p dir=3D"ltr">OK... thanks a lot for the review, I will fix these and send=
 the rest version in a few days.</p>
<p dir=3D"ltr">-Andy</p>
<p dir=3D"ltr">&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnd<br>
&gt;<br>
</p>

--001a11c2e0a87c7f6404fe27b659--
