From: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH v2] rtc: pcf8563: add CLKOUT to common clock framework
Date: Fri, 16 Oct 2015 13:31:57 +0200
Message-ID: <5620E02D.2000605@denx.de>
References: <1444982369-26046-1-git-send-email-hs@denx.de>
 <20151016105446.GK3421@piout.net> <20151016110051.GM3421@piout.net>
Reply-To: hs@denx.de
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151016110051.GM3421@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, Georg.Soffel@bosch-si.com, rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Alexandre,

Am 16.10.2015 um 13:00 schrieb Alexandre Belloni:
> On 16/10/2015 at 12:54:46 +0200, Alexandre Belloni wrote :
>>> +static struct clk *pcf8563_clkout_register_clk(struct pcf8563 *pcf8563)
>>> +{
>>> +	struct i2c_client *client = pcf8563->client;
>>> +	struct device_node *node = client->dev.of_node;
>>> +	struct clk *clk;
>>> +	struct clk_init_data init;
>>> +	int ret;
>>> +	unsigned char buf;
>>> +
>>> +	/* disable the clkout output */
>>> +	buf = 0;
>>> +	ret = pcf8563_write_block_data(client, PCF8563_REG_CLKO, 1, &buf);
>>> +	if (ret < 0)
>>> +		return ERR_PTR(ret);
>>> +
>>
>> Isn't that done automatically for an unused clock? However, I would do
>> that in the probe as you will have to sprinkle some #ifdef
>> CONFIG_COMMON_CLK after seeing the kbuild report.
>
> I'm rethinking about your comment about breaking existing boards. I'd
> say that probably nobody is using the output from the rtc but maybe
> (highly unlikely) some are configuring it from the bootloader and in
> that case it is not nice to undo that configuration. Let's keep that
> block here as long as it works fine for you.

Ok, so I have also a better feeling with it ... removing it back ;-)

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
