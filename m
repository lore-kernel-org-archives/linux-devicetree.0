Return-Path: <SRS0=PeIc=AQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1F8C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Jul 2020 13:11:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0196C20739
	for <linux-devicetree@archiver.kernel.org>; Sun,  5 Jul 2020 13:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgGENLQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Jul 2020 09:11:16 -0400
Received: from mga04.intel.com ([192.55.52.120]:18533 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbgGENLQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 5 Jul 2020 09:11:16 -0400
IronPort-SDR: FvrrUOTnJmUzRDHWxwYJY+YdLLPVbhE/4+Q+L+LDHo2l/ehwuLYzNwZhnaVgR3BdsPPmBrk2Iv
 C7v5+GW/uebQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9672"; a="144817633"
X-IronPort-AV: E=Sophos;i="5.75,316,1589266800"; 
   d="gz'50?scan'50,208,50";a="144817633"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2020 06:11:12 -0700
IronPort-SDR: /YB87qO+3GccNVnZ2EcqaG0qe5QLTzfQ/mK3DOiaPRnhZ8AmXBZEkUm8dHgmKbl4xA4ZvWINyB
 rKDWQn69x9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,316,1589266800"; 
   d="gz'50?scan'50,208,50";a="322951684"
Received: from lkp-server01.sh.intel.com (HELO 6dc8ab148a5d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Jul 2020 06:11:08 -0700
Received: from kbuild by 6dc8ab148a5d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1js4QF-0001l5-Ow; Sun, 05 Jul 2020 13:11:07 +0000
Date:   Sun, 5 Jul 2020 21:10:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee.jones@linaro.org>, michael@walle.cc,
        robh+dt@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
        andriy.shevchenko@linux.intel.com, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com, arnd@arndb.de
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/1] mfd: Add I2C based System Configuaration (SYSCON)
 access
Message-ID: <202007052112.pJ6YfrrG%lkp@intel.com>
References: <20200622075145.1464020-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <20200622075145.1464020-1-lee.jones@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lee,

I love your patch! Yet something to improve:

[auto build test ERROR on ljones-mfd/for-mfd-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lee-Jones/mfd-Add-I2C-based-System-Configuaration-SYSCON-access/20200622-155310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
config: riscv-randconfig-r035-20200705 (attached as .config)
compiler: riscv32-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   riscv32-linux-ld: arch/riscv/kernel/sbi.o: in function `sbi_power_off':
   arch/riscv/kernel/sbi.c:544: undefined reference to `sbi_shutdown'
   riscv32-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_read':
>> drivers/base/regmap/regmap-i2c.c:25: undefined reference to `i2c_smbus_read_byte_data'
   riscv32-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_write':
>> drivers/base/regmap/regmap-i2c.c:43: undefined reference to `i2c_smbus_write_byte_data'
   riscv32-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_read':
>> drivers/base/regmap/regmap-i2c.c:61: undefined reference to `i2c_smbus_read_word_data'
   riscv32-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `i2c_smbus_read_word_swapped':
>> include/linux/i2c.h:159: undefined reference to `i2c_smbus_read_word_data'
   riscv32-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `i2c_smbus_write_word_swapped':
>> include/linux/i2c.h:168: undefined reference to `i2c_smbus_write_word_data'
   riscv32-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_write':
>> drivers/base/regmap/regmap-i2c.c:79: undefined reference to `i2c_smbus_write_word_data'
   riscv32-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_read':
>> drivers/base/regmap/regmap-i2c.c:233: undefined reference to `i2c_smbus_read_i2c_block_data'
   riscv32-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_write':
>> drivers/base/regmap/regmap-i2c.c:218: undefined reference to `i2c_smbus_write_i2c_block_data'
   riscv32-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_read':
>> drivers/base/regmap/regmap-i2c.c:191: undefined reference to `i2c_transfer'
   riscv32-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `i2c_master_send':
>> include/linux/i2c.h:105: undefined reference to `i2c_transfer_buffer_flags'
   riscv32-linux-ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_gather_write':
   drivers/base/regmap/regmap-i2c.c:161: undefined reference to `i2c_transfer'

vim +159 include/linux/i2c.h

ba98645c7d5464 Wolfram Sang     2017-11-04   93  
8a91732b3b3345 Wolfram Sang     2017-11-04   94  /**
8a91732b3b3345 Wolfram Sang     2017-11-04   95   * i2c_master_send - issue a single I2C message in master transmit mode
8a91732b3b3345 Wolfram Sang     2017-11-04   96   * @client: Handle to slave device
8a91732b3b3345 Wolfram Sang     2017-11-04   97   * @buf: Data that will be written to the slave
8a91732b3b3345 Wolfram Sang     2017-11-04   98   * @count: How many bytes to write, must be less than 64k since msg.len is u16
8a91732b3b3345 Wolfram Sang     2017-11-04   99   *
8a91732b3b3345 Wolfram Sang     2017-11-04  100   * Returns negative errno, or else the number of bytes written.
8a91732b3b3345 Wolfram Sang     2017-11-04  101   */
8a91732b3b3345 Wolfram Sang     2017-11-04  102  static inline int i2c_master_send(const struct i2c_client *client,
8a91732b3b3345 Wolfram Sang     2017-11-04  103  				  const char *buf, int count)
8a91732b3b3345 Wolfram Sang     2017-11-04  104  {
8a91732b3b3345 Wolfram Sang     2017-11-04 @105  	return i2c_transfer_buffer_flags(client, (char *)buf, count, 0);
8a91732b3b3345 Wolfram Sang     2017-11-04  106  };
^1da177e4c3f41 Linus Torvalds   2005-04-16  107  
ba98645c7d5464 Wolfram Sang     2017-11-04  108  /**
ba98645c7d5464 Wolfram Sang     2017-11-04  109   * i2c_master_send_dmasafe - issue a single I2C message in master transmit mode
ba98645c7d5464 Wolfram Sang     2017-11-04  110   *			     using a DMA safe buffer
ba98645c7d5464 Wolfram Sang     2017-11-04  111   * @client: Handle to slave device
ba98645c7d5464 Wolfram Sang     2017-11-04  112   * @buf: Data that will be written to the slave, must be safe to use with DMA
ba98645c7d5464 Wolfram Sang     2017-11-04  113   * @count: How many bytes to write, must be less than 64k since msg.len is u16
ba98645c7d5464 Wolfram Sang     2017-11-04  114   *
ba98645c7d5464 Wolfram Sang     2017-11-04  115   * Returns negative errno, or else the number of bytes written.
ba98645c7d5464 Wolfram Sang     2017-11-04  116   */
ba98645c7d5464 Wolfram Sang     2017-11-04  117  static inline int i2c_master_send_dmasafe(const struct i2c_client *client,
ba98645c7d5464 Wolfram Sang     2017-11-04  118  					  const char *buf, int count)
ba98645c7d5464 Wolfram Sang     2017-11-04  119  {
ba98645c7d5464 Wolfram Sang     2017-11-04  120  	return i2c_transfer_buffer_flags(client, (char *)buf, count,
ba98645c7d5464 Wolfram Sang     2017-11-04  121  					 I2C_M_DMA_SAFE);
ba98645c7d5464 Wolfram Sang     2017-11-04  122  };
ba98645c7d5464 Wolfram Sang     2017-11-04  123  
^1da177e4c3f41 Linus Torvalds   2005-04-16  124  /* Transfer num messages.
^1da177e4c3f41 Linus Torvalds   2005-04-16  125   */
c807da539e8276 Luca Ceresoli    2019-12-04  126  int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
b37d2a3a75cb0e Jean Delvare     2012-06-29  127  /* Unlocked flavor */
c807da539e8276 Luca Ceresoli    2019-12-04  128  int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
^1da177e4c3f41 Linus Torvalds   2005-04-16  129  
^1da177e4c3f41 Linus Torvalds   2005-04-16  130  /* This is the very generalized SMBus access routine. You probably do not
^1da177e4c3f41 Linus Torvalds   2005-04-16  131     want to use this, though; one of the functions below may be much easier,
^1da177e4c3f41 Linus Torvalds   2005-04-16  132     and probably just as fast.
^1da177e4c3f41 Linus Torvalds   2005-04-16  133     Note that we use i2c_adapter here, because you do not need a specific
^1da177e4c3f41 Linus Torvalds   2005-04-16  134     smbus adapter to call this function. */
63453b59e41173 Peter Rosin      2018-06-20  135  s32 i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
3ae70deef0a5cc Jean Delvare     2008-10-22  136  		   unsigned short flags, char read_write, u8 command,
63453b59e41173 Peter Rosin      2018-06-20  137  		   int protocol, union i2c_smbus_data *data);
63453b59e41173 Peter Rosin      2018-06-20  138  
63453b59e41173 Peter Rosin      2018-06-20  139  /* Unlocked flavor */
63453b59e41173 Peter Rosin      2018-06-20  140  s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
63453b59e41173 Peter Rosin      2018-06-20  141  		     unsigned short flags, char read_write, u8 command,
63453b59e41173 Peter Rosin      2018-06-20  142  		     int protocol, union i2c_smbus_data *data);
^1da177e4c3f41 Linus Torvalds   2005-04-16  143  
^1da177e4c3f41 Linus Torvalds   2005-04-16  144  /* Now follow the 'nice' access routines. These also document the calling
ae7193f7fa3e17 Jean Delvare     2008-07-14  145     conventions of i2c_smbus_xfer. */
^1da177e4c3f41 Linus Torvalds   2005-04-16  146  
c807da539e8276 Luca Ceresoli    2019-12-04  147  s32 i2c_smbus_read_byte(const struct i2c_client *client);
c807da539e8276 Luca Ceresoli    2019-12-04  148  s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value);
c807da539e8276 Luca Ceresoli    2019-12-04  149  s32 i2c_smbus_read_byte_data(const struct i2c_client *client, u8 command);
c807da539e8276 Luca Ceresoli    2019-12-04  150  s32 i2c_smbus_write_byte_data(const struct i2c_client *client,
^1da177e4c3f41 Linus Torvalds   2005-04-16  151  			      u8 command, u8 value);
c807da539e8276 Luca Ceresoli    2019-12-04  152  s32 i2c_smbus_read_word_data(const struct i2c_client *client, u8 command);
c807da539e8276 Luca Ceresoli    2019-12-04  153  s32 i2c_smbus_write_word_data(const struct i2c_client *client,
^1da177e4c3f41 Linus Torvalds   2005-04-16  154  			      u8 command, u16 value);
06a67848c6681a Jonathan Cameron 2011-10-30  155  
06a67848c6681a Jonathan Cameron 2011-10-30  156  static inline s32
06a67848c6681a Jonathan Cameron 2011-10-30  157  i2c_smbus_read_word_swapped(const struct i2c_client *client, u8 command)
06a67848c6681a Jonathan Cameron 2011-10-30  158  {
06a67848c6681a Jonathan Cameron 2011-10-30 @159  	s32 value = i2c_smbus_read_word_data(client, command);
06a67848c6681a Jonathan Cameron 2011-10-30  160  
06a67848c6681a Jonathan Cameron 2011-10-30  161  	return (value < 0) ? value : swab16(value);
06a67848c6681a Jonathan Cameron 2011-10-30  162  }
06a67848c6681a Jonathan Cameron 2011-10-30  163  
06a67848c6681a Jonathan Cameron 2011-10-30  164  static inline s32
06a67848c6681a Jonathan Cameron 2011-10-30  165  i2c_smbus_write_word_swapped(const struct i2c_client *client,
06a67848c6681a Jonathan Cameron 2011-10-30  166  			     u8 command, u16 value)
06a67848c6681a Jonathan Cameron 2011-10-30  167  {
06a67848c6681a Jonathan Cameron 2011-10-30 @168  	return i2c_smbus_write_word_data(client, command, swab16(value));
06a67848c6681a Jonathan Cameron 2011-10-30  169  }
06a67848c6681a Jonathan Cameron 2011-10-30  170  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--7JfCtLOvnd9MIVvH
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--7JfCtLOvnd9MIVvH--
