From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] drivers/staging/pi433: New driver
Date: Mon, 17 Jul 2017 14:18:39 +0800
Message-ID: <201707171425.Idik3VOq%fengguang.wu@intel.com>
References: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolf Entwicklungen <Marcus.Wolf@Wolf-Entwicklungen.de>
Cc: kbuild-all@01.org, Greg KH <gregkh@linuxfoundation.org>, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, grant.likely@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Marcus,

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on v4.13-rc1 next-20170714]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Wolf-Entwicklungen/drivers-staging-pi433-New-driver/20170716-181617
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

   include/linux/compiler.h:260:8: sparse: attribute 'no_sanitize_address': unknown attribute
>> drivers/staging/pi433/pi433_if.c:1155:36: sparse: incompatible types for operation (<)
   drivers/staging/pi433/pi433_if.c:1155:36:    left side has type struct task_struct *tx_task_struct
   drivers/staging/pi433/pi433_if.c:1155:36:    right side has type int

vim +1155 drivers/staging/pi433/pi433_if.c

  1072	
  1073	static int pi433_probe(struct spi_device *spi)
  1074	{
  1075		struct pi433_device	*device;
  1076		int			retval;
  1077	
  1078		/* setup spi parameters */
  1079		spi->mode = 0x00;
  1080		spi->bits_per_word = 8;
  1081		/* spi->max_speed_hz = 10000000;  1MHz already set by device tree overlay */
  1082	
  1083		retval = spi_setup(spi);
  1084		if (retval)
  1085		{
  1086			dev_dbg(&spi->dev, "configuration of SPI interface failed!\n");
  1087			return retval;
  1088		}
  1089		else
  1090		{
  1091			dev_dbg(&spi->dev,
  1092				"spi interface setup: mode 0x%2x, %d bits per word, %dhz max speed",
  1093				spi->mode, spi->bits_per_word, spi->max_speed_hz);
  1094		}
  1095	
  1096		/* Ping the chip by reading the version register */
  1097		retval = spi_w8r8(spi, 0x10);
  1098		if (retval < 0)
  1099			return retval;
  1100	
  1101		switch(retval)
  1102		{
  1103			case 0x24:
  1104				dev_dbg(&spi->dev, "fonud pi433 (ver. 0x%x)", retval);
  1105				break;
  1106			default:
  1107				dev_dbg(&spi->dev, "unknown chip version: 0x%x", retval);
  1108				return -ENODEV;
  1109		}
  1110	
  1111		/* Allocate driver data */
  1112		device = kzalloc(sizeof(*device), GFP_KERNEL);
  1113		if (!device)
  1114			return -ENOMEM;
  1115	
  1116		/* Initialize the driver data */
  1117		device->spi = spi;
  1118		device->rx_active = false;
  1119		device->tx_active = false;
  1120		device->interrupt_rx_allowed = false;
  1121	
  1122		/* init wait queues */
  1123		init_waitqueue_head(&device->tx_wait_queue);
  1124		init_waitqueue_head(&device->rx_wait_queue);
  1125		init_waitqueue_head(&device->fifo_wait_queue);
  1126	
  1127		/* init fifo */
  1128		INIT_KFIFO(device->tx_fifo);
  1129	
  1130		/* init mutexes and locks */
  1131		mutex_init(&device->tx_fifo_lock);
  1132		mutex_init(&device->rx_lock);
  1133	
  1134		/* setup GPIO (including irq_handler) for the different DIOs */
  1135		retval = setup_GPIOs(device);
  1136		if (retval)
  1137		{
  1138			dev_dbg(&spi->dev, "setup of GPIOs failed");
  1139			goto GPIO_failed;
  1140		}
  1141	
  1142		/* setup the radio module */
  1143		SET_CHECKED(rf69_set_mode		(spi, standby));
  1144		SET_CHECKED(rf69_set_data_mode		(spi, packet));
  1145		SET_CHECKED(rf69_set_amplifier_0	(spi, optionOn));
  1146		SET_CHECKED(rf69_set_amplifier_1	(spi, optionOff));
  1147		SET_CHECKED(rf69_set_amplifier_2	(spi, optionOff));
  1148		SET_CHECKED(rf69_set_output_power_level	(spi, 13));
  1149		SET_CHECKED(rf69_set_antenna_impedance	(spi, fiftyOhm));
  1150	
  1151		/* start tx thread */
  1152		device->tx_task_struct = kthread_run(pi433_tx_thread,
  1153						     device,
  1154						     "pi433_tx_task");
> 1155		if (device->tx_task_struct < 0)
  1156		{
  1157			dev_dbg(device->dev, "start of send thread failed");
  1158			goto send_thread_failed;
  1159		}
  1160	
  1161		/* determ minor number */
  1162		retval = pi433_get_minor(device);
  1163		if (retval)
  1164		{
  1165			dev_dbg(device->dev, "get of minor number failed");
  1166			goto minor_failed;
  1167		}
  1168	
  1169		/* create device */
  1170		device->devt = MKDEV(MAJOR(pi433_dev), device->minor);
  1171		device->dev = device_create(pi433_class,
  1172					    &spi->dev,
  1173					    device->devt,
  1174					    device,
  1175					    "pi433");
  1176		if (IS_ERR(device->dev)) {
  1177			pr_err("pi433: device register failed\n");
  1178			retval = PTR_ERR(device->dev);
  1179			goto device_create_failed;
  1180		}
  1181		else {
  1182			dev_dbg(device->dev,
  1183				"created device for major %d, minor %d\n",
  1184				MAJOR(pi433_dev),
  1185				device->minor);
  1186		}
  1187	
  1188		/* create cdev */
  1189		device->cdev = cdev_alloc();
  1190		device->cdev->owner = THIS_MODULE;
  1191		cdev_init(device->cdev, &pi433_fops);
  1192		retval = cdev_add(device->cdev, device->devt, 1);
  1193		if (retval)
  1194		{
  1195			dev_dbg(device->dev, "register of cdev failed");
  1196			goto cdev_failed;
  1197		}
  1198	
  1199		/* spi setup */
  1200		spi_set_drvdata(spi, device);
  1201	
  1202		return 0;
  1203	
  1204	cdev_failed:
  1205		device_destroy(pi433_class, device->devt);
  1206	device_create_failed:
  1207		pi433_free_minor(device);
  1208	minor_failed:
  1209		kthread_stop(device->tx_task_struct);
  1210	send_thread_failed:
  1211		free_GPIOs(device);
  1212	GPIO_failed:
  1213		kfree(device);
  1214	
  1215		return retval;
  1216	}
  1217	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
