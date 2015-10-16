From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] rtc: pcf8563: add CLKOUT to common clock framework
Date: Fri, 16 Oct 2015 13:00:51 +0200
Message-ID: <20151016110051.GM3421@piout.net>
References: <1444982369-26046-1-git-send-email-hs@denx.de>
 <20151016105446.GK3421@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151016105446.GK3421-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Georg.Soffel-k21M0aUVSxZWk0Htik3J/w@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16/10/2015 at 12:54:46 +0200, Alexandre Belloni wrote :
> > +static struct clk *pcf8563_clkout_register_clk(struct pcf8563 *pcf8563)
> > +{
> > +	struct i2c_client *client = pcf8563->client;
> > +	struct device_node *node = client->dev.of_node;
> > +	struct clk *clk;
> > +	struct clk_init_data init;
> > +	int ret;
> > +	unsigned char buf;
> > +
> > +	/* disable the clkout output */
> > +	buf = 0;
> > +	ret = pcf8563_write_block_data(client, PCF8563_REG_CLKO, 1, &buf);
> > +	if (ret < 0)
> > +		return ERR_PTR(ret);
> > +
> 
> Isn't that done automatically for an unused clock? However, I would do
> that in the probe as you will have to sprinkle some #ifdef
> CONFIG_COMMON_CLK after seeing the kbuild report.

I'm rethinking about your comment about breaking existing boards. I'd
say that probably nobody is using the output from the rtc but maybe
(highly unlikely) some are configuring it from the bootloader and in
that case it is not nice to undo that configuration. Let's keep that
block here as long as it works fine for you.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
