From: Harish Bandi <c-hbandi@codeaurora.org>
Subject: Re: [PATCH v6 1/2] Bluetooth: hci_qca: Added support for WCN3998
Date: Fri, 29 Mar 2019 10:12:51 +0530
Message-ID: <a75d686f28a2c73562e9bbf5b601d37c@codeaurora.org>
References: <1553689723-21017-2-git-send-email-c-hbandi@codeaurora.org>
 <201903290535.u5TF12SC%lkp@intel.com> <20190328212320.GF112750@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328212320.GF112750@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, marcel@holtmann.org, johan.hedberg@gmail.com, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, devicetree@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On 2019-03-29 02:53, Matthias Kaehlcke wrote:
> On Fri, Mar 29, 2019 at 05:05:49AM +0800, kbuild test robot wrote:
>> Hi Harish,
>> 
>> Thank you for the patch! Perhaps something to improve:
>> 
>> [auto build test WARNING on bluetooth-next/master]
>> [also build test WARNING on next-20190328]
>> [cannot apply to v5.1-rc2]
>> [if your patch is applied to the wrong git tree, please drop us a note 
>> to help improve the system]
>> 
>> url:    
>> https://github.com/0day-ci/linux/commits/Harish-Bandi/Bluetooth-hci_qca-Added-support-for-WCN3998/20190328-213357
>> base:   
>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git 
>> master
>> config: riscv-allmodconfig (attached as .config)
>> compiler: riscv64-linux-gcc (GCC) 8.1.0
>> reproduce:
>>         wget 
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>> -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # save the attached .config to linux build tree
>>         GCC_VERSION=8.1.0 make.cross ARCH=riscv
>> 
>> Note: it may well be a FALSE warning. FWIW you are at least aware of 
>> it now.
>> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
>> 
>> All warnings (new ones prefixed by >>):
>> 
>>    drivers/bluetooth/btqca.c: In function 'qca_uart_setup':
>> >> drivers/bluetooth/btqca.c:369:3: warning: 'rom_ver' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>       snprintf(config.fwname, sizeof(config.fwname),
>>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>         "qca/crnv%02x.bin", rom_ver);
>>         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> 
>> vim +/rom_ver +369 drivers/bluetooth/btqca.c
>> 
>> 83e81961 Ben Young Tae Kim      2015-08-10  333
>> aadebac4 Balakrishna Godavarthi 2018-08-03  334  int 
>> qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>> aadebac4 Balakrishna Godavarthi 2018-08-03  335  		   enum 
>> qca_btsoc_type soc_type, u32 soc_ver)
>> 83e81961 Ben Young Tae Kim      2015-08-10  336  {
>> 83e81961 Ben Young Tae Kim      2015-08-10  337  	struct rome_config 
>> config;
>> 83e81961 Ben Young Tae Kim      2015-08-10  338  	int err;
>> 4219d468 Balakrishna Godavarthi 2018-08-03  339  	u8 rom_ver;
> 
> With the use of qca_is_wcn399x() the compiler can't determine anymore
> that rom_ver is only read for WCN399x, in which case it is also
> initialized. Just initialize rom_ver with 0 to keep the compiler happy.
> 
[Harish] - sure, will wait for few more comments and address all 
comments in new patch version.

>> 83e81961 Ben Young Tae Kim      2015-08-10  340
>> ba493d4f Balakrishna Godavarthi 2018-08-03  341  	bt_dev_dbg(hdev, 
>> "QCA setup on UART");
>> 83e81961 Ben Young Tae Kim      2015-08-10  342
>> 83e81961 Ben Young Tae Kim      2015-08-10  343  
>> 	config.user_baud_rate = baudrate;
>> 83e81961 Ben Young Tae Kim      2015-08-10  344
>> 83e81961 Ben Young Tae Kim      2015-08-10  345  	/* Download rampatch 
>> file */
>> 83e81961 Ben Young Tae Kim      2015-08-10  346  	config.type = 
>> TLV_TYPE_PATCH;
>> cc8a70bd Harish Bandi           2019-03-27  347  	if 
>> (qca_is_wcn399x(soc_type)) {
>> 4219d468 Balakrishna Godavarthi 2018-08-03  348  		/* Firmware files 
>> to download are based on ROM version.
>> 4219d468 Balakrishna Godavarthi 2018-08-03  349  		 * ROM version is 
>> derived from last two bytes of soc_ver.
>> 4219d468 Balakrishna Godavarthi 2018-08-03  350  		 */
>> 4219d468 Balakrishna Godavarthi 2018-08-03  351  		rom_ver = ((soc_ver 
>> & 0x00000f00) >> 0x04) |
>> 4219d468 Balakrishna Godavarthi 2018-08-03  352  			    (soc_ver & 
>> 0x0000000f);
>> 4219d468 Balakrishna Godavarthi 2018-08-03  353  
>> 		snprintf(config.fwname, sizeof(config.fwname),
>> 4219d468 Balakrishna Godavarthi 2018-08-03  354  			 
>> "qca/crbtfw%02x.tlv", rom_ver);
>> 4219d468 Balakrishna Godavarthi 2018-08-03  355  	} else {
>> 4219d468 Balakrishna Godavarthi 2018-08-03  356  
>> 		snprintf(config.fwname, sizeof(config.fwname),
>> 4219d468 Balakrishna Godavarthi 2018-08-03  357  			 
>> "qca/rampatch_%08x.bin", soc_ver);
>> 4219d468 Balakrishna Godavarthi 2018-08-03  358  	}
>> 4219d468 Balakrishna Godavarthi 2018-08-03  359
>> ba493d4f Balakrishna Godavarthi 2018-08-03  360  	err = 
>> qca_download_firmware(hdev, &config);
>> 83e81961 Ben Young Tae Kim      2015-08-10  361  	if (err < 0) {
>> ba493d4f Balakrishna Godavarthi 2018-08-03  362  		bt_dev_err(hdev, 
>> "QCA Failed to download patch (%d)", err);
>> 83e81961 Ben Young Tae Kim      2015-08-10  363  		return err;
>> 83e81961 Ben Young Tae Kim      2015-08-10  364  	}
>> 83e81961 Ben Young Tae Kim      2015-08-10  365
>> 83e81961 Ben Young Tae Kim      2015-08-10  366  	/* Download NVM 
>> configuration */
>> 83e81961 Ben Young Tae Kim      2015-08-10  367  	config.type = 
>> TLV_TYPE_NVM;
>> cc8a70bd Harish Bandi           2019-03-27  368  	if 
>> (qca_is_wcn399x(soc_type))
>> 4219d468 Balakrishna Godavarthi 2018-08-03 @369  
>> 		snprintf(config.fwname, sizeof(config.fwname),
>> 4219d468 Balakrishna Godavarthi 2018-08-03  370  			 
>> "qca/crnv%02x.bin", rom_ver);
>> 4219d468 Balakrishna Godavarthi 2018-08-03  371  	else
>> 4219d468 Balakrishna Godavarthi 2018-08-03  372  
>> 		snprintf(config.fwname, sizeof(config.fwname),
>> 4219d468 Balakrishna Godavarthi 2018-08-03  373  			 
>> "qca/nvm_%08x.bin", soc_ver);
>> 4219d468 Balakrishna Godavarthi 2018-08-03  374
>> ba493d4f Balakrishna Godavarthi 2018-08-03  375  	err = 
>> qca_download_firmware(hdev, &config);
>> 83e81961 Ben Young Tae Kim      2015-08-10  376  	if (err < 0) {
>> ba493d4f Balakrishna Godavarthi 2018-08-03  377  		bt_dev_err(hdev, 
>> "QCA Failed to download NVM (%d)", err);
>> 83e81961 Ben Young Tae Kim      2015-08-10  378  		return err;
>> 83e81961 Ben Young Tae Kim      2015-08-10  379  	}
>> 83e81961 Ben Young Tae Kim      2015-08-10  380
>> 83e81961 Ben Young Tae Kim      2015-08-10  381  	/* Perform HCI reset 
>> */
>> ba493d4f Balakrishna Godavarthi 2018-08-03  382  	err = 
>> qca_send_reset(hdev);
>> 83e81961 Ben Young Tae Kim      2015-08-10  383  	if (err < 0) {
>> ba493d4f Balakrishna Godavarthi 2018-08-03  384  		bt_dev_err(hdev, 
>> "QCA Failed to run HCI_RESET (%d)", err);
>> 83e81961 Ben Young Tae Kim      2015-08-10  385  		return err;
>> 83e81961 Ben Young Tae Kim      2015-08-10  386  	}
>> 83e81961 Ben Young Tae Kim      2015-08-10  387
>> ba493d4f Balakrishna Godavarthi 2018-08-03  388  	bt_dev_info(hdev, 
>> "QCA setup on UART is completed");
>> 83e81961 Ben Young Tae Kim      2015-08-10  389
>> 83e81961 Ben Young Tae Kim      2015-08-10  390  	return 0;
>> 83e81961 Ben Young Tae Kim      2015-08-10  391  }
>> ba493d4f Balakrishna Godavarthi 2018-08-03  392  
>> EXPORT_SYMBOL_GPL(qca_uart_setup);
>> 83e81961 Ben Young Tae Kim      2015-08-10  393
>> 
>> :::::: The code at line 369 was first introduced by commit
>> :::::: 4219d4686875fdd83df3da00fda5ff0551e0a2d7 Bluetooth: btqca: Add 
>> wcn3990 firmware download support.
>> 
>> :::::: TO: Balakrishna Godavarthi <bgodavar@codeaurora.org>
>> :::::: CC: Marcel Holtmann <marcel@holtmann.org>
>> 
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology 
>> Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel 
>> Corporation

Thanks,
Harish
