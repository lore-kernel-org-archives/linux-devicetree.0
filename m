From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v6 16/20] clk: add support for clocks provided by SCMI
Date: Tue, 20 Mar 2018 12:08:51 +0000
Message-ID: <6b5a56f7-ff0d-dde2-097b-bf245971e8a6@arm.com>
References: <1519403030-21189-1-git-send-email-sudeep.holla@arm.com>
 <1519403030-21189-17-git-send-email-sudeep.holla@arm.com>
 <152124137391.242365.17144416413429914606@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152124137391.242365.17144416413429914606@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, ALKML <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, Alexey Klimov <klimov.linux@gmail.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 16/03/18 23:02, Stephen Boyd wrote:
> Quoting Sudeep Holla (2018-02-23 08:23:46)
>> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
>> new file mode 100644
>> index 000000000000..1e4d7a57779b
>> --- /dev/null
>> +++ b/drivers/clk/clk-scmi.c
>> +                       hws[idx] = &sclk->hw;
>> +               }
>> +       }
>> +
>> +       return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
> 
> devm_of_clk_add_hw_provider?
> 

Thanks for noticing this, I wasn't aware of it's addition. This patch
predates that :(

>> +}
>> +
>> +static void scmi_clocks_remove(struct scmi_device *sdev)
>> +{
>> +       struct device *dev = &sdev->dev;
>> +       struct device_node *np = dev->of_node;
>> +
>> +       of_clk_del_provider(np);
>> +}
>> +
> 
> Drop?
> 

Sure, I will have to do these changes as add-on patch as this original
patch is already queued in ARM SoC tree for v4.17

> You can keep my acked-by otherwise.
> 

Thanks.

-- 
Regards,
Sudeep
