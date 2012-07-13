From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: regulator: tps65217: Add device tree support
Date: Fri, 13 Jul 2012 12:02:20 +0300
Message-ID: <20120713090220.GA18561@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: anilkumar-l0cyMroinI0@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello AnilKumar Ch,

This is a semi-automatic email about new static checker warnings.

The patch a7f1b63eb856: "regulator: tps65217: Add device tree 
support" from Jul 10, 2012, leads to the following Smatch complaint:

drivers/mfd/tps65217.c:245 tps65217_probe()
	 error: we previously assumed 'pdata' could be null (see line 205)

drivers/mfd/tps65217.c
   204	
   205		if (!pdata && client->dev.of_node)
                    ^^^^^^
New check.

   206			pdata = tps65217_parse_dt(client);
   207	
   208		tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
   209		if (!tps)
   210			return -ENOMEM;
   211	
   212		tps->pdata = pdata;
   213		tps->regmap = devm_regmap_init_i2c(client, &tps65217_regmap_config);
   214		if (IS_ERR(tps->regmap)) {
   215			ret = PTR_ERR(tps->regmap);
   216			dev_err(tps->dev, "Failed to allocate register map: %d\n",
   217				ret);
   218			return ret;
   219		}
   220	
   221		i2c_set_clientdata(client, tps);
   222		tps->dev = &client->dev;
   223	
   224		ret = tps65217_reg_read(tps, TPS65217_REG_CHIPID, &version);
   225		if (ret < 0) {
   226			dev_err(tps->dev, "Failed to read revision register: %d\n",
   227				ret);
   228			return ret;
   229		}
   230	
   231		dev_info(tps->dev, "TPS65217 ID %#x version 1.%d\n",
   232				(version & TPS65217_CHIPID_CHIP_MASK) >> 4,
   233				version & TPS65217_CHIPID_REV_MASK);
   234	
   235		for (i = 0; i < TPS65217_NUM_REGULATOR; i++) {
   236			struct platform_device *pdev;
   237	
   238			pdev = platform_device_alloc("tps65217-pmic", i);
   239			if (!pdev) {
   240				dev_err(tps->dev, "Cannot create regulator %d\n", i);
   241				continue;
   242			}
   243	
   244			pdev->dev.parent = tps->dev;
   245			pdev->dev.of_node = pdata->of_node[i];
                                            ^^^^^^^^^^^^^^
Old dereference.

   246			reg_data = pdata->tps65217_init_data[i];
   247			platform_device_add_data(pdev, reg_data, sizeof(*reg_data));

regards,
dan carpenter
