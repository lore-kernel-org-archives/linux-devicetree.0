From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH v7 5/7] drm: bridge/dw-hdmi: add support for multi byte
 register width access
Date: Tue, 11 Nov 2014 14:37:47 +0000
Message-ID: <54621F3B.8050103@imgtec.com>
References: <1415710229-11935-1-git-send-email-andy.yan@rock-chips.com>	
 <1415710432-12167-1-git-send-email-andy.yan@rock-chips.com>	
 <54621B23.1020602@imgtec.com> <1415715820.2815.9.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415715820.2815.9.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, rmk+kernel@arm.linux.org.uk, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org



On 11/11/14 14:23, Lucas Stach wrote:
> Am Dienstag, den 11.11.2014, 14:20 +0000 schrieb Zubair Lutfullah
> Kakakhel:
>> Hi Andy,
>>
>> This patch adds the reg-io-width binding.
>>
>> Hence the binding patch should come before it.
>>
>>
>> On 11/11/14 12:53, Andy Yan wrote:
>>> On rockchip rk3288, only word(32-bit) accesses are
>>> permitted for hdmi registers.  Byte width accesses (writeb,
>>> readb) generate an imprecise external abort.
>>>
>>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>>
>>> ---
>>>
>>>  }
>>>  
>>>  static void hdmi_modb(struct dw_hdmi *hdmi, u8 data, u8 mask, unsigned reg)
>>> @@ -1499,6 +1527,23 @@ static int dw_hdmi_bind(struct device *dev, struct device *master, void *data)
>>>  	struct device_node *ddc_node;
>>>  	struct resource *iores;
>>>  	int ret, irq;
>>> +	u32 val = 1;
>>> +
>>> +	of_property_read_u32(np, "reg-io-width", &val);
>>> +
>>> +	switch (val) {
>>> +	case 4:
>>> +		hdmi->write = dw_hdmi_writel;
>>> +		hdmi->read = dw_hdmi_readl;
>>> +		break;
>>> +	case 1:
>>> +		hdmi->write = dw_hdmi_writeb;
>>> +		hdmi->read = dw_hdmi_readb;
>>> +		break;
>>> +	default:
>>> +		dev_err(dev, "reg-io-width must be 1 or 4\n");
>>> +		return -EINVAL;
>>> +	}
>>
>> The binding patch says this is an optional property.
>> But here if undefined it returns -EINVAL.
>>
>> I would keep it optional and default it to byte access.
> 
> That's exactly what the patch does. val is initialized to 1, which is
> not changed if the property could not be found in the DT. The default
> case will only be taken if the property is present in DT but has any
> other value than 1 or 4, which is an error.
> 

I missed the initialization. My bad.

Thanks
ZubairLK
