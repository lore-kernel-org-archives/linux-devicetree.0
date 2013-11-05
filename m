From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: max17042: Add POR init procedure from Maxim appnote
Date: Tue, 5 Nov 2013 23:24:44 +0300
Message-ID: <20131105202444.GG3949@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Ramakrishna Pallala,

The patch f3a71a6eb13b: "max17042: Add POR init procedure from Maxim 
appnote" from Mar 13, 2012, leads to the following
static checker warning: "drivers/power/max17042_battery.c:339 
max17042_init_model()
	 warn: passing casted pointer 'temp_data' to 'max17042_model_data_compare()' 32 vs 16."

drivers/power/max17042_battery.c
   307  static inline int max17042_model_data_compare(struct max17042_chip *chip,
   308                                          u16 *data1, u16 *data2, int size)
   309  {
   310          int i;
   311  
   312          if (memcmp(data1, data2, size)) {
   313                  dev_err(&chip->client->dev, "%s compare failed\n", __func__);
   314                  for (i = 0; i < size; i++)
   315                          dev_info(&chip->client->dev, "0x%x, 0x%x",
   316                                  data1[i], data2[i]);
   317                  dev_info(&chip->client->dev, "\n");
   318                  return -EINVAL;
   319          }
   320          return 0;
   321  }
   322  
   323  static int max17042_init_model(struct max17042_chip *chip)
   324  {
   325          int ret;
   326          int table_size = ARRAY_SIZE(chip->pdata->config_data->cell_char_tbl);
   327          u32 *temp_data;
   328  
   329          temp_data = kcalloc(table_size, sizeof(*temp_data), GFP_KERNEL);
   330          if (!temp_data)
   331                  return -ENOMEM;
   332  
   333          max10742_unlock_model(chip);
   334          max17042_write_model_data(chip, MAX17042_MODELChrTbl,
   335                                  table_size);
   336          max17042_read_model_data(chip, MAX17042_MODELChrTbl, temp_data,
   337                                  table_size);
   338  
   339          ret = max17042_model_data_compare(
   340                  chip,
   341                  chip->pdata->config_data->cell_char_tbl,
   342                  (u16 *)temp_data,
   343                  table_size);

temp_data is a buffer of 32 bit numbers.

table_size is the number of 32 bit numbers in temp_data.

The max17042_model_data_compare() function is quite buggy because the
memcmp() assumes u8 and the for loop assumes u16.  Both can't be correct
and in fact both are wrong since we are passing the size in terms of
u32.

   344  
   345          max10742_lock_model(chip);
   346          kfree(temp_data);
   347  
   348          return ret;
   349  }

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
