From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: crypto: omap-sham - Add code to use dmaengine API
Date: Wed, 6 Nov 2013 19:17:20 +0300
Message-ID: <20131106161720.GL15603@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Mark A. Greer,

This is a semi-automatic email about new static checker warnings.

The patch dfd061d5a8f5: "crypto: omap-sham - Add code to use 
dmaengine API" from Dec 21, 2012, leads to the following Smatch 
complaint:

drivers/crypto/omap-sham.c:1973 omap_sham_probe()
	 error: we previously assumed 'dd->dma_lch' could be null (see line 1934)

drivers/crypto/omap-sham.c
  1931  
  1932          dd->dma_lch = dma_request_slave_channel_compat(mask, omap_dma_filter_fn,
  1933							       &dd->dma, dev, "rx");
  1934		if (!dd->dma_lch) {
                     ^^^^^^^^^^^
New check.

  1935			dd->polling_mode = 1;
  1936			dev_dbg(dev, "using polling mode instead of dma\n");
  1937		}
  1938	

[snip]

  1964	
  1965		return 0;
  1966	
  1967	err_algs:
  1968		for (i = dd->pdata->algs_info_size - 1; i >= 0; i--)
  1969			for (j = dd->pdata->algs_info[i].registered - 1; j >= 0; j--)
  1970				crypto_unregister_ahash(
  1971						&dd->pdata->algs_info[i].algs_list[j]);
  1972		pm_runtime_disable(dev);
  1973		dma_release_channel(dd->dma_lch);
                                    ^^^^^^^^^^^
New unchecked dereference.

  1974	data_err:
  1975		dev_err(dev, "initialization failed.\n");

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
