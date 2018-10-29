From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH 08/10] usb: typec: Add support for usb role switch in
 rt1711h driver
Date: Mon, 29 Oct 2018 20:22:27 +0800
Message-ID: <d3268b28-db8c-fb1d-5cc4-5226c4181a2d@huawei.com>
References: <20181027095820.40056-1-chenyu56@huawei.com>
 <20181027095820.40056-9-chenyu56@huawei.com>
 <20181029115813.GA14534@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029115813.GA14534@kuha.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: wangbinghui@hisilicon.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas Tsai <lucas_tsai@richtek.com>, shufan_lee <shufan_lee@richtek.com>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org



On 2018/10/29 19:58, Heikki Krogerus wrote:
> On Sat, Oct 27, 2018 at 05:58:18PM +0800, Yu Chen wrote:
>> This patch add struct device_connection to rt1711h driver to support
>> find "usb-role-switch" in tcpm_register_port.
>>
>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Lucas Tsai <lucas_tsai@richtek.com>
>> Cc: shufan_lee <shufan_lee@richtek.com>
>> Cc: John Stultz <john.stultz@linaro.org>
>> Cc: Binghui Wang <wangbinghui@hisilicon.com>
>> Signed-off-by: Yu Chen <chenyu56@huawei.com>
>> ---
>>  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
>> index 017389021b96..5f8b952612fe 100644
>> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
>> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
>> @@ -39,6 +39,7 @@ struct rt1711h_chip {
>>  	struct tcpci_data data;
>>  	struct tcpci *tcpci;
>>  	struct device *dev;
>> +	struct device_connection dev_conn;
>>  };
>>  
>>  static int rt1711h_read16(struct rt1711h_chip *chip, unsigned int reg, u16 *val)
>> @@ -237,6 +238,7 @@ static int rt1711h_probe(struct i2c_client *client,
>>  {
>>  	int ret;
>>  	struct rt1711h_chip *chip;
>> +	const char *dev_conn_end;
>>  
>>  	ret = rt1711h_check_revision(client);
>>  	if (ret < 0) {
>> @@ -254,6 +256,7 @@ static int rt1711h_probe(struct i2c_client *client,
>>  		return PTR_ERR(chip->data.regmap);
>>  
>>  	chip->dev = &client->dev;
>> +	dev_set_name(chip->dev, "rt1711h");
>>  	i2c_set_clientdata(client, chip);
>>  
>>  	ret = rt1711h_sw_reset(chip);
>> @@ -264,6 +267,15 @@ static int rt1711h_probe(struct i2c_client *client,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> +	ret = device_property_read_string(chip->dev, "dev-conn-end",
>> +			&dev_conn_end);
>> +	if (!ret) {
>> +		chip->dev_conn.endpoint[0] = "rt1711h";
>> +		chip->dev_conn.endpoint[1] = dev_conn_end;
>> +		chip->dev_conn.id = "usb-role-switch";
>> +		device_connection_add(&chip->dev_conn);
>> +	}
> That is wrong. You should not read name of a device from a property.
>
> Regardless of that, I don't think this patch is needed at all. You
> need to describe this kind connection with OF device graph
> (Documentation/devicetree/bindings/graph.txt).
>
> I've prepared a proposal how we should be able handle graphs in the
> device connection API:
> https://lkml.org/lkml/2018/10/24/613
I will fix this patch. Thanks!
>
> thanks,
>
