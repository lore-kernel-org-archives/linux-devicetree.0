From: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: add driver for the flash in Lattice machxo2 FPGAs
Date: Fri, 25 Jul 2014 09:41:25 +0530
Message-ID: <53D1D8ED.4010209@gmail.com>
References: <20140724162225.22308.66538.stgit@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140724162225.22308.66538.stgit@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/24/2014 09:52 PM, Martin Fuzzey wrote:
> This driver provides two MTD devices, one for the configuration data
> (FPGA bitstream) and another for the general purpose user flash.
>
> Both behave as normal MTD devices bit the configuration one has
> some extra sysfs entries to synchronize updating.
>
> Signed-off-by: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
> ---
>   .../bindings/mtd/lattice-machxo2-fpga.txt          |   32 +
>   Documentation/mtd/machxo2-fpga.txt                 |  104 ++
>   drivers/mtd/devices/Kconfig                        |   31 +
>   drivers/mtd/devices/Makefile                       |    3
>   drivers/mtd/devices/machxo2-core.c                 |  929 ++++++++++++++++++++
>   drivers/mtd/devices/machxo2-spi.c                  |  114 ++
>   drivers/mtd/devices/machxo2.h                      |   24 +
>   7 files changed, 1236 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/mtd/lattice-machxo2-fpga.txt
>   create mode 100644 Documentation/mtd/machxo2-fpga.txt
>   create mode 100644 drivers/mtd/devices/machxo2-core.c
>   create mode 100644 drivers/mtd/devices/machxo2-spi.c
>   create mode 100644 drivers/mtd/devices/machxo2.h
>
> diff --git a/Documentation/devicetree/bindings/mtd/lattice-machxo2-fpga.txt b/Documentation/devicetree/bindings/mtd/lattice-machxo2-fpga.txt
> new file mode 100644
> index 0000000..2fd30fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/lattice-machxo2-fpga.txt
> @@ -0,0 +1,32 @@
> +MTD SPI driver for the configuration (bitstream) and user flash of the Lattice
> +Machxo2 family FPGAs.
> +
> +Required properties:
> +- compatible : lattice,machxo2
> +
> +The two flash regions of the device are represented by the child nodes:
> +	"configflash" : for the configuration data (FPGA bitstream)
> +	"userflash" :	for the general purpose flash memory
> +
> +Both of these child nodes are optional (if the child node is missing no
> +mtd device will be created)
> +
> +Each of these child nodes have the same optional properties:
> +- linux,mtd-name : name of mtd to create
> +
> +
> +Example:
> +&ecspi2 {
> +	mainboard-fpga@2 {
> +		compatible = "lattice,machxo2";
> +		spi-max-frequency = <25000000>;
> +		reg = <2>;
> +		configflash {
> +			linux,mtd-name = "mainboard-fpga-bitstream";
> +		};
> +		userflash {
> +			linux,mtd-name = "mainboard-fpga-userflash";
> +		};
> +	};
> +};
> +
> diff --git a/Documentation/mtd/machxo2-fpga.txt b/Documentation/mtd/machxo2-fpga.txt
> new file mode 100644
> index 0000000..c7727a7
> --- /dev/null
> +++ b/Documentation/mtd/machxo2-fpga.txt
> @@ -0,0 +1,104 @@
> +The Lattice MachXO2 family of FPGAs contain varying amounts of flash memory.
> +
> +The memory is divided into two parts:
> +
> +* Configuration flash :
> +	Stores the data that determines the logic implemented by the FPGA
> +	(sometimes called a "bitstream").
> +	This data is created using the Lattice design tools.
> +
> +* User flash :
> +	General user defined data like any other flash memory.
> +
> +The amount of each type of memory available is hardware defined and depends
> +on the exact chip model.
> +
> +Each part consists of a single erase block, meaning that the user flash is
> +probably not suited as backing store for a filesystem.
> +
> +The FPGA logic actually "executes" from internal RAM, intialised from the
> +configuration flash at power up. This means that it is possible to erase and
> +reprogram the configuration flash without affecting the FPGA's function.
> +
> +In order to access these memories the FPGA is connected to the CPU over a
> +SPI or I2C bus (the driver currently only supports SPI).
> +This is in addition to any other connection the FPGA may have to the CPU bus
> +as part of the functionality of it's programmed design.
> +
> +The user flash is exposed as a standard MTD device.
> +
> +=== Sysfs Interface ===
> +The configuration flash is also exposed as a standard MTD but there are also
> +a few special sysfs entries used to identify the FPGA and control the update
> +procedure.
> +
> +device_id	(ro)
> +	4 byte hexadecimal raw device model identifer
> +	Eg: 01 2b bo 43
> +
> +name		(ro)
> +	Human readable device type name (determined from device_id)
> +	Eg: MachXO2-2000 / MachXO2-1200U (those two devices have the same id)
> +
> +trace_id	(ro)
> +	8 byte hexadecimal unique chip identifer
> +	Eg: 55 44 30 80 78 0c 68 4e
> +
> +usercode	(ro)
> +	4 byte hexadecimal user defined data.
> +	This is programmed into the device as part of the bitstream and
> +	may be used for purposes such as version identification etc.
> +	Eg: 00 01 01 02
> +
> +running		(ro)
> +	Boolean flag indicating if the internal RAM has been loaded from
> +	the flash and the configuration data accepted.
> +
> +prog_done	(rw)
> +	Boolean flag indicating if the configuration flash memory has been
> +	programmed.
> +	Erasing the configuration flash will set this to zero.
> +	Writing any value will set it to one
> +	The FPGA cannot apply the data until this is set
> +
> +refresh		(wo)
> +	Writing any value causes the FPGA to refresh it's RAM from the flash
> +	and apply the new configuration.
> +
> +
> +=== Bitstream update example ===
> +1) Erase the configuration flash
> +	# flash_erase /dev/mtd2 0 0
> +	Erasing 49 Kibyte @ 0 -- 100 % complete
> +
> +	# cat /sys/bus/spi/devices/spi2.2/prog_done
> +	0
> +
> +	The FPGA is still running normally from RAM
> +	# cat /sys/bus/spi/devices/spi2.2/usercode
> +	00 01 01 00
> +
> +2) Write the new bitstram
> +	# cp bitsteam.bin /dev/mtd2
> +
> +3) Signal that we have finished writing
> +	# echo 1 > /sys/bus/spi/devices/spi2.2/prog_done
> +
> +4) Request a refresh
> +	# echo 1 > /sys/bus/spi/devices/spi2.2/refresh
> +
> +5) Observe new usercode
> +	# cat /sys/bus/spi/devices/spi2.2/usercode
> +	00 01 01 02
> +
> +Note that step 4) is the critical one as it will cause any "hardware"
> +implemented in the FPGA to temporarilly disappear. Therefore if the FPGA is
> +being used to implement "hardware" devices visible to linux the appropriate
> +drivers should be unbound between steps 3 and 4.
> +
> +Alternatively, step 4 may be omitted and a full power cycle done instead.
> +
> +In some cases a reboot may be done instead of a power cycle but that will
> +depend on the board and bootloader design. It will only work if the bootloader
> +requests a refresh using the PROGN electrical signal to the FPGA or sending
> +the refresh command over SPI.
> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> index c49d0b1..7ecd457 100644
> --- a/drivers/mtd/devices/Kconfig
> +++ b/drivers/mtd/devices/Kconfig
> @@ -120,6 +120,37 @@ config MTD_BCM47XXSFLASH
>   	  registered by bcma as platform devices. This enables driver for
>   	  serial flash memories (only read-only mode is implemented).
>   
> +config MTD_MACHXO2_CORE
> +	tristate "Lattice MACHXO2 family FPGAs"
> +	depends on SPI_MASTER
> +	help
> +	  This provides access to the configuration ( bitstream) and
> +	  general purpose flash memories of the Lattice MACHXO2 family FPGAs
> +	  See Documenation/mtd/machxo2-fpga for usage information
> +
> +	  You should also select a bus interface below (currently only
> +	  SPI is implemented but the hardware supports I2C too)
> +
> +config MTD_MACHXO2_CONFIGFLASH
> +	boolean "Allow access to MACHXO2 configuration flash"
> +	depends on MTD_MACHXO2_CORE
> +	help
> +	  If selected the configuration flash (bitstream) in the FPGA
> +	  will be exposed as a linux MTD device.
> +
> +config MTD_MACHXO2_USERFLASH
> +	boolean "Allow access to MACHXO2 user flash"
> +	depends on MTD_MACHXO2_CORE
> +	help
> +	  If selected the general purpose user flash in the FPGA will
> +	  be exposed as a linux MTD device.
> +
> +config MTD_MACHXO2_SPI
> +	tristate "Lattice MACHXO2 family FPGAs using SPI bus interface"
> +	depends on MTD_MACHXO2_CORE && SPI_MASTER
> +	help
> +	  Select this if your MAXCHXO2 FPGA is connected via a SPI bus.
> +
>   config MTD_SLRAM
>   	tristate "Uncached system RAM"
>   	help
> diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
> index c68868f..f39df4a 100644
> --- a/drivers/mtd/devices/Makefile
> +++ b/drivers/mtd/devices/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_MTD_SPEAR_SMI)	+= spear_smi.o
>   obj-$(CONFIG_MTD_SST25L)	+= sst25l.o
>   obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
>   obj-$(CONFIG_MTD_ST_SPI_FSM)    += st_spi_fsm.o
> -
> +obj-$(CONFIG_MTD_MACHXO2_CORE)	+= machxo2-core.o
> +obj-$(CONFIG_MTD_MACHXO2_SPI)	+= machxo2-spi.o
>   
>   CFLAGS_docg3.o			+= -I$(src)
> diff --git a/drivers/mtd/devices/machxo2-core.c b/drivers/mtd/devices/machxo2-core.c
> new file mode 100644
> index 0000000..07f4bf1
> --- /dev/null
> +++ b/drivers/mtd/devices/machxo2-core.c
> @@ -0,0 +1,929 @@
> +/*
> + * Core MTD driver for Lattice MachXO2 family FPGAs
> + *
> + * It supplies 2 mtd devices for accessing:
> + *	Configuration flash (FPGA bitstream)
> + *	Userflash (general user data)
> + *
> + * In addition it provides a number of sysfs attributes to identify the
> + * FPGA and control the programming process.
> + * See Documentation/mtd/machxo2-fpga.txt
> + *
> + * Copyright 2014 Parkeon
> + * Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it under
> + * the terms of the GNU General Public License version 2 as published by the
> + * Free Software Foundation.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>

Includes in alphabetical order...

> +
> +#include "machxo2.h"
> +
> +#define MACHXO2_PAGESIZE		16
> +#define MACHXO2_DEVICE_ID_LEN		4
> +#define MACHXO2_TRACE_ID_LEN		8
> +#define MACHXO2_USERCODE_LEN		4
> +
> +#define MACHXO2_CMD_SET_ADDR			0xb4
> +#define MACHXO2_CMD_READ_CONFIG_FLASH		0x73
> +#define MACHXO2_CMD_WRITE_CONFIG_FLASH		0x70
> +#define MACHXO2_CMD_READ_UFM			0xca
> +#define MACHXO2_CMD_WRITE_UFM			0xc9
> +#define MACHXO2_CMD_ERASE			0x0e
> +#define MACHXO2_CMD_READ_TRACE_ID		{0x19, 0x00, 0x00, 0x00}
> +#define MACHXO2_CMD_READ_USERCODE		{0xc0, 0x00, 0x00, 0x00}
> +#define MACHXO2_CMD_READ_DEVICE_ID		{0xe0, 0x00, 0x00, 0x00}
> +#define MACHXO2_CMD_BYPASS			{0xff, 0xff, 0xff, 0xff}
> +#define MACHXO2_CMD_ENABLE_CONFIG_INTERFACE	{0x74, 0x08, 0x00, 0x00}
> +#define MACHXO2_CMD_DISABLE_CONFIG_INTERFACE	{0x26, 0x00, 0x00}
> +#define MACHXO2_CMD_PROGRAM_DONE		{0x5e, 0x00, 0x00, 0x00}
> +#define MACHXO2_CMD_REFRESH			{0x79, 0x00, 0x00}
> +#define MACHXO2_CMD_READ_STATUS_REGSITER	{0x3c, 0x00, 0x00, 0x00}
> +#define MACHXO2_STATUS_DONE	(1 << 8)
> +#define MACHXO2_STATUS_BUSY	(1 << 12)
> +#define MACHXO2_STATUS_FAILED	(1 << 13)
> +#define MACHXO2_STATUS_ERR_SHIFT 23
> +#define MACHXO2_STATUS_ERR_MASK (7 << MACHXO2_STATUS_ERR_SHIFT)
> +
> +struct machxo2_flash_descriptor {
> +	const char *name;
> +	uint8_t read_cmd;
> +	uint8_t write_cmd;
> +	uint8_t set_addr_param;
> +	uint8_t erase_param;
> +};
> +
> +struct machxo2_flash {
> +	const char *name;
> +	uint32_t nr_pages;
> +	const struct machxo2_flash_descriptor *descr;
> +	struct machxo2 *machxo2;
> +	struct mtd_info mtd;
> +};
> +
> +struct machxo2_device_info {
> +	uint8_t b2;
> +	const char *name;
> +	uint32_t cfg_pages;
> +	uint32_t ufm_pages;
> +	int max_erase_ms;
> +};
> +
> +struct machxo2 {
> +	struct device *dev;
> +	struct mutex lock;
> +	struct machxo2_busops *busops;
> +	uint8_t device_id[MACHXO2_DEVICE_ID_LEN];
> +	const struct machxo2_device_info *device_info;
> +	struct machxo2_flash configflash;
> +	struct machxo2_flash userflash;
> +};
> +
> +struct machxo2_addr {
> +	uint16_t first_page;
> +	uint16_t nr_pages;
> +	uint8_t skip_bytes;
> +};
> +
> +/* Values below taken from dataheet TN1246 Table 17-97
> + * For the max erase time we use the value for the config flash (always larger)
> + */
> +static struct machxo2_device_info machxo2_device_ids[] = {
> +	{0x00, "MachXO2-256",
> +		.cfg_pages = 575, .ufm_pages = 0, .max_erase_ms = 700},
> +	{0x10, "MachXO2-640",
> +		.cfg_pages = 1151, .ufm_pages = 192, .max_erase_ms = 1100},
> +	{0x20, "MachXO2-1200 / MachXO2-640U",
> +		.cfg_pages = 2175, .ufm_pages = 512, .max_erase_ms = 1400 },
> +	{0x30, "MachXO2-2000 / MachXO2-1200U",
> +		.cfg_pages = 3198, .ufm_pages = 640, .max_erase_ms = 1900},
> +	{0x40, "MachXO2-4000 / MachXO2-2000U",
> +		.cfg_pages = 5758, .ufm_pages = 768, .max_erase_ms = 3100},
> +	{0x50, "MachXO2-7000",
> +		.cfg_pages = 9212, .ufm_pages = 2048, .max_erase_ms = 4800},
> +};
> +
> +
> +static const struct machxo2_flash_descriptor machxo2_userflash_descr = {
> +	.name = "userflash",
> +	.read_cmd = MACHXO2_CMD_READ_UFM,
> +	.write_cmd = MACHXO2_CMD_WRITE_UFM,
> +	.set_addr_param = 0x40,
> +	.erase_param = 0x08,
> +};
> +
> +static const struct machxo2_flash_descriptor machxo2_configflash_descr = {
> +	.name = "configflash",
> +	.read_cmd = MACHXO2_CMD_READ_CONFIG_FLASH,
> +	.write_cmd = MACHXO2_CMD_WRITE_CONFIG_FLASH,
> +	.set_addr_param = 0x00,
> +	.erase_param = 0x04,
> +};
> +
> +
> +/* ============================================================= */
> +/* Helpers */
> +/* ============================================================= */
> +static void machxo2_lock(struct machxo2 *machxo2)
> +{
> +	if (!mutex_trylock(&machxo2->lock)) {
> +		dev_dbg(machxo2->dev, "wait for %s from %pf\n",
> +				__func__, __builtin_return_address(0));
> +

dev_dbg(machxo2->dev, "wait for %s from %pf\n",
	__func__, __builtin_return_address(0));

> +		mutex_lock(&machxo2->lock);
> +	}
> +	dev_dbg(machxo2->dev, "%s from %pf\n",
> +			__func__, __builtin_return_address(0));
> +}
> +

dev_dbg(machxo2->dev, "%s from %pf\n",
	__func__, __builtin_return_address(0));

> +static void machxo2_unlock(struct machxo2 *machxo2)
> +{
> +	dev_dbg(machxo2->dev, "%s from %pf\n",
> +			__func__, __builtin_return_address(0));

dev_dbg(machxo2->dev, "%s from %pf\n",
	__func__, __builtin_return_address(0));

> +	mutex_unlock(&machxo2->lock);
> +}
> +
> +
> +static int machxo2_transceive(
> +			struct machxo2 *machxo2,
> +			const void *send_buf, unsigned send_len,
> +			void *recv_buf, unsigned recv_len)

static int machxo2_transceive(struct machxo2 *machxo2,
			      const void *send_buf, unsigned send_len,
			      void *recv_buf, unsigned recv_len)

> +{
> +	bool need_lock;
> +	int ret;
> +
> +	if (!machxo2)
> +		return -EINVAL;
> +
> +	/* Simplify single message case by allowing caller to not take lock */
> +	need_lock = !mutex_is_locked(&machxo2->lock);
> +	if (need_lock)
> +		machxo2_lock(machxo2);
> +
> +	print_hex_dump_debug("machxo2: send ", DUMP_PREFIX_NONE,
> +					32, 1, send_buf, send_len, false);

dto...

> +	ret = machxo2->busops->transceive(machxo2->dev,
> +					send_buf, send_len,

dto...

> +					recv_buf, recv_len);
> +	if (!ret && recv_buf)
> +		print_hex_dump_debug("machxo2: recv ", DUMP_PREFIX_NONE,
> +					32, 1, recv_buf, recv_len, false);

dto...

> +
> +	if (need_lock)
> +		machxo2_unlock(machxo2);
> +
> +	return ret;
> +}
> +
> +static int machxo2_read_device_id(struct machxo2 *machxo2, uint8_t *buf)
> +{
> +	uint8_t cmd[] = MACHXO2_CMD_READ_DEVICE_ID;
> +
> +	return machxo2_transceive(machxo2, cmd, sizeof(cmd),
> +					buf, MACHXO2_DEVICE_ID_LEN);

dto...

> +}
> +
> +static int machxo2_read_trace_id(struct machxo2 *machxo2, uint8_t *buf)
> +{
> +	uint8_t cmd[] = MACHXO2_CMD_READ_TRACE_ID;
> +
> +	return machxo2_transceive(machxo2, cmd, sizeof(cmd),
> +					buf, MACHXO2_TRACE_ID_LEN);

dto...

> +}
> +
> +static int machxo2_read_usercode(struct machxo2 *machxo2, uint8_t *buf)
> +{
> +	uint8_t cmd[] = MACHXO2_CMD_READ_USERCODE;
> +
> +	return machxo2_transceive(machxo2, cmd, sizeof(cmd),
> +					buf, MACHXO2_USERCODE_LEN);

dto...

> +}
> +
> +static const struct machxo2_device_info *machxo2_parse_device_id(uint8_t *buf)
> +{
> +	int i;
> +
> +	if (buf[0] != 0x01 || buf[1] != 0x2B || buf[3] != 0x43)
> +		return NULL;
> +
> +	for (i = 0; i < ARRAY_SIZE(machxo2_device_ids); i++) {
> +		if ((buf[2] & 0x7F) ==  machxo2_device_ids[i].b2)
> +			return &machxo2_device_ids[i];
> +	}
> +	return NULL;
> +}
> +
> +static int machxo2_identify_device(struct machxo2 *machxo2)
> +{
> +	uint8_t trace_id[MACHXO2_TRACE_ID_LEN];
> +	uint8_t usercode[MACHXO2_USERCODE_LEN];
> +	int ret;
> +
> +	ret = machxo2_read_device_id(machxo2, machxo2->device_id);
> +	if (ret)
> +		return ret;
> +
> +	ret = machxo2_read_trace_id(machxo2, trace_id);
> +	if (ret)
> +		return ret;
> +
> +	ret = machxo2_read_usercode(machxo2, usercode);
> +	if (ret)
> +		return ret;
> +
> +	machxo2->device_info = machxo2_parse_device_id(machxo2->device_id);
> +	if (!machxo2->device_info)
> +		goto unsupported_id;
> +
> +	dev_info(machxo2->dev,
> +		"Found Lattice FPGA %s (%s) Trace ID=%*ph Usercode=%*ph\n",
> +			machxo2->device_info->name,
> +			machxo2->device_id[2] & 0x80 ? "HC" : "HE/ZE",
> +			sizeof(trace_id), trace_id,
> +			sizeof(usercode), usercode);

dto...

> +	return 0;
> +
> +unsupported_id:
> +	dev_err(machxo2->dev, "Unsupported device id: %*ph\n",
> +			sizeof(machxo2->device_id), machxo2->device_id);

dto...

> +	return -ENODEV;
> +}
> +
> +/* ============================================================= */
> +/* MTD */
> +/* ============================================================= */
> +static void machxo2_make_address(struct mtd_info *mtd,
> +	uint32_t from, uint32_t len, struct machxo2_addr *addr)
> +{
> +	addr->first_page = from / MACHXO2_PAGESIZE;
> +	addr->skip_bytes = from % MACHXO2_PAGESIZE;
> +
> +	addr->nr_pages = len / MACHXO2_PAGESIZE;
> +	if (len % MACHXO2_PAGESIZE)
> +		addr->nr_pages++;
> +
> +	if (addr->skip_bytes && len > MACHXO2_PAGESIZE - addr->skip_bytes)
> +		addr->nr_pages++;
> +
> +	dev_dbg(&mtd->dev, "First page=%u nr_pages=%u skip_bytes=%u\n",
> +		addr->first_page, addr->nr_pages, addr->skip_bytes);

dto...

> +}
> +
> +
> +static int machxo2_check_error_code(struct device *dev,
> +				uint32_t status, const char *operation)

dto...

> +{
> +	int err;
> +
> +	if (!(status & MACHXO2_STATUS_FAILED))
> +		return 0;
> +
> +
> +	err = (status & MACHXO2_STATUS_ERR_MASK) >> MACHXO2_STATUS_ERR_SHIFT;
> +	dev_err(dev, "Failed %s err=0x%x\n", operation, err);
> +
> +	return -EIO;
> +}
> +
> +static int machxo2_read_status(struct machxo2 *machxo2, uint32_t *status_out)
> +{
> +	uint8_t cmd[] = MACHXO2_CMD_READ_STATUS_REGSITER;
> +	uint32_t status;
> +	int ret;
> +
> +	ret = machxo2_transceive(machxo2,
> +					cmd, sizeof(cmd),
> +					&status, sizeof(status));
> +	if (!ret)
> +		*status_out = be32_to_cpu(status);
> +
> +	return ret;
> +}
> +
> +static int machxo2_flash_wait_not_busy(
> +		struct machxo2_flash *flash,
> +		unsigned poll_us, int retries,
> +		const char *operation)

dto...

> +{
> +	uint32_t status;
> +	int i, ret;
> +
> +	for (i = 0; i < retries; i++) {
> +		ret = machxo2_read_status(flash->machxo2, &status);
> +		if (ret)
> +			return ret;
> +
> +		if (!(status & MACHXO2_STATUS_BUSY)) {
> +			dev_dbg(&flash->mtd.dev, "Wait %s done loop %d\n",
> +							operation, i);
> +			return machxo2_check_error_code(&flash->mtd.dev,
> +							status, operation);
> +		}
> +
> +		if (poll_us < 1000)
> +			udelay(poll_us);
> +		else
> +			msleep(poll_us / 1000);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int machxo2_flash_enable_interface(struct machxo2_flash *flash)
> +{
> +	uint8_t cmd[] = MACHXO2_CMD_ENABLE_CONFIG_INTERFACE;
> +	int ret;
> +
> +	ret = machxo2_transceive(flash->machxo2, cmd, sizeof(cmd), NULL, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Datasheet: Enable time 5us
> +	 * So poll every 2us with 5 max polls */
> +	return machxo2_flash_wait_not_busy(flash, 2, 5, "enable");
> +}
> +
> +static int machxo2_flash_disable_interface(struct machxo2_flash *flash)
> +{
> +	struct machxo2 *machxo2 = flash->machxo2;
> +	uint8_t disable[] = MACHXO2_CMD_DISABLE_CONFIG_INTERFACE;
> +	uint8_t bypass[] = MACHXO2_CMD_BYPASS;
> +	int ret;
> +
> +	ret = machxo2_transceive(machxo2, disable, sizeof(disable), NULL, 0);
> +	if (ret)
> +		return ret;
> +
> +	return machxo2_transceive(machxo2, bypass, sizeof(bypass), NULL, 0);
> +}
> +
> +
> +/* Do a transceive wrapped in enable, disable */
> +static int machxo2_trasceive_wait_with_enable(struct machxo2 *machxo2,
> +				const void *send_buf, unsigned send_len,
> +				void *recv_buf, unsigned recv_len,
> +				unsigned poll_us, int retries,
> +				const char *name)
> +{
> +	int ret;
> +
> +	machxo2_lock(machxo2);
> +
> +	ret = machxo2_flash_enable_interface(&machxo2->configflash);
> +	if (ret)
> +		goto out;
> +
> +	ret = machxo2_transceive(machxo2, send_buf, send_len,
> +					recv_buf, recv_len);
> +
> +	if (!ret && poll_us)
> +		ret = machxo2_flash_wait_not_busy(&machxo2->configflash,
> +							poll_us, retries,
> +							name);
> +
> +	machxo2_flash_disable_interface(&machxo2->configflash);
> +
> +out:
> +	machxo2_unlock(machxo2);
> +	return ret;
> +}
> +
> +static int machxo2_set_page_address(struct machxo2_flash *flash, uint16_t page)
> +{
> +	uint8_t cmd[] = { MACHXO2_CMD_SET_ADDR, 0x00, 0x00, 0x00,
> +				flash->descr->set_addr_param, 0x00,
> +				(page & 0x3F00) >>  8,
> +				(page & 0xFF)};
> +
> +	return machxo2_transceive(flash->machxo2, cmd, sizeof(cmd), NULL, 0);
> +}
> +
> +
> +static int machxo2_write_page(struct machxo2_flash *flash, const uint8_t *buf)
> +{
> +	uint8_t cmd[MACHXO2_PAGESIZE + 4] = {
> +			flash->descr->write_cmd, 0x00, 0x00, 0x01 };
> +	int ret;
> +
> +	memcpy(cmd + 4, buf, MACHXO2_PAGESIZE);
> +
> +	ret = machxo2_transceive(flash->machxo2, cmd, sizeof(cmd), NULL, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Datasheet: Write time 200us
> +	 * So poll every 50us with 10 max polls */
> +	return machxo2_flash_wait_not_busy(flash, 50, 10, "write");
> +}
> +
> +
> +static int machxo2_flash_read_pages(
> +		struct machxo2_flash *flash, uint16_t nr_pages, uint8_t *buf)
> +{
> +	uint8_t cmd[] = {	flash->descr->read_cmd, 0x10,
> +				(nr_pages & 0x3F00) >>  8,
> +				(nr_pages & 0xFF)};
> +
> +	return machxo2_transceive(flash->machxo2,
> +			cmd, sizeof(cmd), buf, nr_pages * MACHXO2_PAGESIZE);
> +}
> +
> +static int machxo2_mtd_read(struct mtd_info *mtd,
> +		loff_t from, size_t len,
> +		size_t *retlen, u_char *buf)
> +{
> +	struct machxo2_flash *flash = mtd->priv;
> +	struct machxo2 *machxo2 = flash->machxo2;
> +	int ret;
> +	struct machxo2_addr addr;
> +
> +	dev_dbg(&mtd->dev, "read: from=%llu size=%zu\n", from, len);
> +
> +	machxo2_lock(machxo2);
> +
> +	ret = machxo2_flash_enable_interface(flash);
> +	if (ret)
> +		goto out;
> +
> +	machxo2_make_address(mtd, from, len, &addr);
> +	ret = machxo2_set_page_address(flash, addr.first_page);
> +	if (ret)
> +		goto out_disable;
> +
> +	if (addr.nr_pages == 1 && addr.skip_bytes == 0) {
> +		ret = machxo2_flash_read_pages(flash, 1, buf);
> +	} else {
> +		/* Warning: this will not work for I2C mode which returns
> +		 * data differently for > 1 page reads.
> +		 * However I2C mode is not implemented yet */
> +		uint8_t *tmp;
> +
> +		/* For > 1 page read chip returns a dummp page first */
> +		if (addr.nr_pages > 1) {
> +			addr.nr_pages++;
> +			addr.skip_bytes += MACHXO2_PAGESIZE;
> +		}
> +
> +		tmp = kmalloc(addr.nr_pages * MACHXO2_PAGESIZE, GFP_KERNEL);
> +		if (!tmp) {
> +			ret = -ENOMEM;
> +			goto out_disable;
> +		}
> +
> +		ret = machxo2_flash_read_pages(flash, addr.nr_pages, tmp);
> +		if (!ret)
> +			memcpy(buf, tmp + addr.skip_bytes, len);
> +		kfree(tmp);
> +	}
> +	if (!ret)
> +		*retlen = len;
> +
> +out_disable:
> +	machxo2_flash_disable_interface(flash);
> +
> +out:
> +	machxo2_unlock(machxo2);
> +	return ret;
> +}
> +
> +
> +static int machxo2_mtd_write(struct mtd_info *mtd,
> +		loff_t to, size_t len,
> +		size_t *retlen, const u_char *buf)
> +{
> +	struct machxo2_flash *flash = mtd->priv;
> +	struct machxo2 *machxo2 = flash->machxo2;
> +	int ret;
> +	struct machxo2_addr addr;
> +	uint8_t tmp[MACHXO2_PAGESIZE];
> +	uint32_t remaining = len;
> +
> +	dev_dbg(&mtd->dev, "write: to=%llu size=%zu\n", to, len);
> +
> +	machxo2_lock(machxo2);
> +
> +	ret = machxo2_flash_enable_interface(flash);
> +	if (ret)
> +		goto out;
> +
> +	machxo2_make_address(mtd, to, len, &addr);
> +	ret = machxo2_set_page_address(flash, addr.first_page);
> +	if (ret)
> +		goto out_disable;
> +
> +	if (addr.skip_bytes > 0) {
> +		/* Write the first partial page */
> +		uint32_t count = MACHXO2_PAGESIZE - addr.skip_bytes;
> +
> +		if (count > remaining)
> +			count = remaining;
> +		dev_dbg(&mtd->dev, "write: head partial page %d\n", count);
> +
> +		ret = machxo2_flash_read_pages(flash, 1, tmp);
> +		if (ret)
> +			goto out_disable;
> +
> +		ret = machxo2_set_page_address(flash, addr.first_page);
> +		if (ret)
> +			goto out_disable;
> +
> +		memcpy(tmp + addr.skip_bytes, buf, count);
> +		ret = machxo2_write_page(flash, tmp);
> +		if (ret)
> +			goto out_disable;
> +
> +		buf += count;
> +		remaining -= count;
> +	}
> +
> +	/* Writa all complete pages */
> +	while (remaining >= MACHXO2_PAGESIZE) {
> +		dev_dbg(&mtd->dev, "write: full page remaining=%d\n",
> +								remaining);
> +		ret = machxo2_write_page(flash, buf);
> +		if (ret)
> +			goto out_disable;
> +		buf += MACHXO2_PAGESIZE;
> +		remaining -= MACHXO2_PAGESIZE;
> +	}
> +
> +
> +	if (remaining > 0) {
> +		/* Write final partial page */
> +		dev_dbg(&mtd->dev, "write: partial page remaining=%d\n",
> +								remaining);
> +		ret = machxo2_flash_read_pages(flash, 1, tmp);
> +		if (ret)
> +			goto out_disable;
> +
> +		memcpy(tmp, buf, remaining);
> +
> +		ret = machxo2_set_page_address(flash,
> +			addr.first_page + addr.nr_pages - 1);
> +		if (ret)
> +			goto out_disable;
> +
> +		ret = machxo2_write_page(flash, tmp);
> +		if (ret)
> +			goto out_disable;
> +
> +		remaining = 0;
> +	}
> +
> +out_disable:
> +	machxo2_flash_disable_interface(flash);
> +	*retlen = len - remaining;
> +
> +out:
> +	machxo2_unlock(machxo2);
> +	dev_dbg(&mtd->dev, "write done ret=%d retlen=%zu", ret, *retlen);
> +	return ret;
> +}
> +
> +
> +static int machxo2_mtd_erase(struct mtd_info *mtd,
> +		struct erase_info *instr)
> +{
> +	struct machxo2_flash *flash = mtd->priv;
> +	struct machxo2 *machxo2 = flash->machxo2;
> +	uint8_t cmd[] = { MACHXO2_CMD_ERASE, flash->descr->erase_param, 0, 0 };
> +	int ret;
> +	int pollms;
> +
> +	dev_dbg(&mtd->dev, "erase\n");
> +
> +	machxo2_lock(machxo2);
> +
> +	ret = machxo2_flash_enable_interface(flash);
> +	if (ret)
> +		goto out;
> +
> +	ret = machxo2_transceive(machxo2, cmd, sizeof(cmd), NULL, 0);
> +	if (ret)
> +		goto out_disable;
> +
> +	pollms = 200;
> +	ret = machxo2_flash_wait_not_busy(flash,
> +			pollms * 1000,
> +			(machxo2->device_info->max_erase_ms + 500) / pollms,
> +			"erase");
> +
> +out_disable:
> +	machxo2_flash_disable_interface(flash);
> +
> +out:
> +	machxo2_unlock(machxo2);
> +
> +	dev_dbg(&mtd->dev, "erase done ret=%d", ret);
> +	if (!ret) {
> +		instr->state = MTD_ERASE_DONE;
> +		mtd_erase_callback(instr);
> +	}
> +
> +	return ret;
> +}
> +
> +static int machxo2_flash_add(struct machxo2_flash *flash)
> +{
> +	struct device *dev = flash->machxo2->dev;
> +	struct mtd_info *mtd = &flash->mtd;
> +	struct device_node *np;
> +	int ret;
> +
> +	np = of_find_node_by_name(dev->of_node, flash->descr->name);
> +	if (of_property_read_string(np, "linux,mtd-name", &mtd->name)) {
> +		flash->name = kasprintf(GFP_KERNEL, "%s-%s",
> +					dev_name(dev), flash->descr->name);
> +		if (!flash->name)
> +			return -ENOMEM;
> +
> +		mtd->name = flash->name;
> +	}
> +
> +	mtd->size = flash->nr_pages * MACHXO2_PAGESIZE;
> +	mtd->erasesize = mtd->size;
> +	mtd->writesize = MACHXO2_PAGESIZE;
> +	mtd->owner = THIS_MODULE;
> +	mtd->type = MTD_NANDFLASH;
> +	mtd->flags = MTD_WRITEABLE;
> +	mtd->_erase = machxo2_mtd_erase;
> +	mtd->_read = machxo2_mtd_read;
> +	mtd->_write = machxo2_mtd_write;
> +	mtd->priv = flash;
> +	mtd->dev.parent = dev;
> +
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (ret) {
> +		dev_err(dev, "Unable to register MTD device, aborting!\n");
> +		goto out_err;
> +	}
> +
> +	dev_info(dev, "mtd%d: (%s) size %uKiB.\n",
> +				mtd->index, mtd->name,
> +				(uint32_t)(mtd->size >> 10));
> +	return 0;
> +
> +out_err:
> +	kfree(flash->name);
> +	return ret;
> +}
> +
> +static void machxo2_flash_remove(struct machxo2_flash *flash)
> +{
> +	mtd_device_unregister(&flash->mtd);
> +	kfree(flash->name);
> +}
> +
> +
> +/* ============================================================= */
> +/* Sysfs */
> +/* ============================================================= */
> +
> +static ssize_t show_device_id(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct machxo2 *machxo2 = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%*ph\n",
> +			sizeof(machxo2->device_id), machxo2->device_id);
> +}
> +
> +static ssize_t show_device_name(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct machxo2 *machxo2 = dev_get_drvdata(dev);
> +	const struct machxo2_device_info *found;
> +
> +	found = machxo2_parse_device_id(machxo2->device_id);
> +
> +	return sprintf(buf, "%s\n", found ? found->name : "unknown");
> +}
> +
> +
> +static ssize_t show_trace_id(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct machxo2 *machxo2 = dev_get_drvdata(dev);
> +	uint8_t trace_id[MACHXO2_TRACE_ID_LEN];
> +	int ret;
> +
> +	ret = machxo2_read_trace_id(machxo2, trace_id);
> +	if (ret)
> +		return ret;
> +	return sprintf(buf, "%*ph\n",
> +			sizeof(trace_id), trace_id);
> +}
> +
> +static ssize_t show_usercode(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct machxo2 *machxo2 = dev_get_drvdata(dev);
> +	uint8_t usercode[MACHXO2_USERCODE_LEN];
> +	int ret;
> +
> +	ret = machxo2_read_usercode(machxo2, usercode);
> +	if (ret)
> +		return ret;
> +
> +	return sprintf(buf, "%*ph\n",
> +			sizeof(usercode), usercode);
> +}
> +
> +static ssize_t show_running(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct machxo2 *machxo2 = dev_get_drvdata(dev);
> +	uint32_t status;
> +	int ret;
> +
> +	/* Reading status without enabling interface gives RAM state
> +	 * Hence DONE => FPGA running */
> +	ret = machxo2_read_status(machxo2, &status);
> +	if (ret)
> +		return ret;
> +
> +	return sprintf(buf, "%d\n", status & MACHXO2_STATUS_DONE ? 1 : 0);
> +}
> +
> +
> +static ssize_t show_prog_done(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct machxo2 *machxo2 = dev_get_drvdata(dev);
> +	uint32_t status;
> +	int ret;
> +
> +	machxo2_lock(machxo2);
> +
> +	/* Reading status after enabling interface gives FLASH state
> +	 * Hence DONE => config FLASH programmed */
> +	ret = machxo2_flash_enable_interface(&machxo2->configflash);
> +	if (ret)
> +		goto out;
> +
> +	ret = machxo2_read_status(machxo2, &status);
> +	machxo2_flash_disable_interface(&machxo2->configflash);
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = sprintf(buf, "%d\n", status & MACHXO2_STATUS_DONE ? 1 : 0);
> +
> +out:
> +	machxo2_unlock(machxo2);
> +	return ret;
> +}
> +
> +static ssize_t store_prog_done(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct machxo2 *machxo2 = dev_get_drvdata(dev);
> +	uint8_t cmd[] = MACHXO2_CMD_PROGRAM_DONE;
> +	int ret;
> +
> +	/* Datasheet: Write time 200us so poll every 50us with 10 max polls */
> +	ret = machxo2_trasceive_wait_with_enable(machxo2,
> +			cmd, sizeof(cmd), NULL, 0, 50, 10, "set_prog_done");
> +
> +	if (!ret)
> +		ret = count;
> +
> +	return ret;
> +}
> +
> +static ssize_t store_refresh(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct machxo2 *machxo2 = dev_get_drvdata(dev);
> +	uint8_t cmd[] = MACHXO2_CMD_REFRESH;
> +	uint32_t status;
> +	int ret;
> +
> +	ret = machxo2_transceive(machxo2, cmd, sizeof(cmd), NULL, 0);
> +	if (ret)
> +		return ret;
> +
> +	msleep(25); /* Datasheet gives 3.8ms tREFRESH for largest device */
> +
> +	ret = machxo2_read_status(machxo2, &status);
> +	if (ret)
> +		return ret;
> +
> +	if (status & MACHXO2_STATUS_DONE)
> +		return count;
> +
> +	/* The chip didn't like the configuration data */
> +	dev_err(dev, "Refresh failed status=%d\n",
> +		(status & MACHXO2_STATUS_ERR_MASK) >> MACHXO2_STATUS_ERR_SHIFT);
> +
> +	return -EBADMSG;
> +}
> +
> +
> +static DEVICE_ATTR(device_id, S_IRUGO, show_device_id, NULL);
> +static DEVICE_ATTR(name, S_IRUGO, show_device_name, NULL);
> +static DEVICE_ATTR(trace_id, S_IRUGO, show_trace_id, NULL);
> +static DEVICE_ATTR(usercode, S_IRUGO, show_usercode, NULL);
> +static DEVICE_ATTR(running, S_IRUGO, show_running, NULL);
> +static DEVICE_ATTR(prog_done, S_IRUGO | S_IWUSR,
> +				show_prog_done, store_prog_done);
> +static DEVICE_ATTR(refresh, S_IWUSR, NULL, store_refresh);
> +
> +static struct attribute *machxo2_sysfs_entries[] = {
> +	&dev_attr_device_id.attr,
> +	&dev_attr_name.attr,
> +	&dev_attr_trace_id.attr,
> +	&dev_attr_usercode.attr,
> +	&dev_attr_running.attr,
> +	&dev_attr_prog_done.attr,
> +	&dev_attr_refresh.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group machxo2_attr_group = {
> +	.attrs	= machxo2_sysfs_entries,
> +};
> +
> +/* ============================================================= */
> +/* Init */
> +/* ============================================================= */
> +
> +struct machxo2 *machxo2_create(struct device *dev,
> +					struct machxo2_busops *busops)
> +{
> +	struct machxo2 *machxo2;
> +	struct machxo2_flash *flash;
> +	int ret;
> +
> +	machxo2 = devm_kzalloc(dev, sizeof(*machxo2), GFP_KERNEL);
> +	if (!machxo2)
> +		return ERR_PTR(-ENOMEM);
> +
> +	machxo2->dev = dev;
> +	machxo2->busops = busops;
> +
> +	mutex_init(&machxo2->lock);
> +
> +	machxo2_lock(machxo2);
> +	ret = machxo2_identify_device(machxo2);
> +	machxo2_unlock(machxo2);
> +
> +	if (ret)
> +		goto fail_identify;
> +
> +#ifdef CONFIG_MTD_MACHXO2_CONFIGFLASH
> +	flash = &machxo2->configflash;
> +	flash->machxo2 = machxo2;
> +	flash->descr = &machxo2_configflash_descr;
> +	flash->nr_pages = machxo2->device_info->cfg_pages;
> +	ret = machxo2_flash_add(flash);
> +	if (ret)
> +		goto fail_configflash;
> +#endif
> +
> +#ifdef CONFIG_MTD_MACHXO2_USERFLASH
> +	if (machxo2->device_info->ufm_pages > 0) {
> +		flash = &machxo2->userflash;
> +		flash->machxo2 = machxo2;
> +		flash->descr = &machxo2_userflash_descr;
> +		flash->nr_pages = machxo2->device_info->ufm_pages;
> +		ret = machxo2_flash_add(flash);
> +		if (ret)
> +			goto fail_userflash;
> +	}
> +#endif
> +
> +	ret = sysfs_create_group(&machxo2->dev->kobj, &machxo2_attr_group);
> +	if (ret)
> +		goto fail_sysfs;
> +
> +	return machxo2;
> +
> +fail_sysfs:
> +	machxo2_flash_remove(&machxo2->userflash);
> +fail_userflash:
> +	machxo2_flash_remove(&machxo2->configflash);
> +fail_configflash:
> +fail_identify:
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(machxo2_create);
> +
> +void machxo2_destroy(struct machxo2 *machxo2)
> +{
> +	machxo2_flash_remove(&machxo2->userflash);
> +	sysfs_remove_group(&machxo2->dev->kobj, &machxo2_attr_group);
> +}
> +EXPORT_SYMBOL_GPL(machxo2_destroy);
> +
> +MODULE_DESCRIPTION("MTD driver for Lattice MachXO2 family FPGAs");
> +MODULE_AUTHOR("Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mtd/devices/machxo2-spi.c b/drivers/mtd/devices/machxo2-spi.c
> new file mode 100644
> index 0000000..e4421fd
> --- /dev/null
> +++ b/drivers/mtd/devices/machxo2-spi.c
> @@ -0,0 +1,114 @@
> +/*
> + * SPI bus interface for Lattice MachXO2 family FPGAs
> + *
> + * Copyright (C) 2014 Parkeon
> + * Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it under
> + * the terms of the GNU General Public License version 2 as published by the
> + * Free Software Foundation.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/spi/spi.h>
> +
> +#include "machxo2.h"
> +
> +
> +static const struct spi_device_id machxo2_spi_device_id[] = {
> +	{
> +		.name = "machxo2",
> +	}, {
> +		/* sentinel */
> +	}
> +};
> +MODULE_DEVICE_TABLE(spi, machxo2_spi_device_id);
> +
> +static const struct of_device_id machxo2_dt_ids[] = {
> +	{ .compatible = "lattice,machxo2"},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, machxo2_dt_ids);
> +

move the device ids after probe()/remove()...

> +
> +static int  machxo2_spi_transceive(
> +			struct device *dev,
> +			const void *send_buf, unsigned send_len,
> +			void *recv_buf, unsigned recv_len)

proper alignment...

static int  machxo2_spi_transceive(struct device *dev,
				   const void *send_buf, unsigned send_len,
				   void *recv_buf, unsigned recv_len)

> +{
> +	struct spi_device *spi = to_spi_device(dev);
> +	struct spi_message msg;
> +	struct spi_transfer xfers[] = {
> +		{
> +			.tx_buf = send_buf,
> +			.len = send_len,
> +		},
> +		{
> +			.rx_buf = recv_buf,
> +			.len = recv_len,
> +		}
> +	};
> +
> +	spi_message_init_with_transfers(&msg, xfers, ARRAY_SIZE(xfers));
> +
> +	return spi_sync(spi, &msg);
> +}
> +
> +
> +static struct machxo2_busops machxo2_spi_busops = {
> +	.transceive = machxo2_spi_transceive,
> +};
> +
> +
> +static int machxo2_spi_probe(struct spi_device *spi)
> +{
> +	struct machxo2 *machxo2;
> +
> +	machxo2 =  machxo2_create(&spi->dev, &machxo2_spi_busops);
> +	if (IS_ERR(machxo2))
> +		return PTR_ERR(machxo2);
> +
> +	spi_set_drvdata(spi, machxo2);
> +
> +	return 0;
> +}
> +
> +
> +static int machxo2_spi_remove(struct spi_device *spi)
> +{
> +	struct machxo2 *machxo2 = spi_get_drvdata(spi);
> +
> +	machxo2_destroy(machxo2);
> +
> +	return 0;
> +}
> +
> +

Every driver list the device ids here....

> +static struct spi_driver machxo2_spi_driver = {
> +	.id_table = machxo2_spi_device_id,
> +	.driver = {
> +		.name	= "machxo2",
> +		.owner	= THIS_MODULE,

we can drop owner field...

> +		.of_match_table = machxo2_dt_ids,
> +	},
> +	.probe		= machxo2_spi_probe,
> +	.remove		= machxo2_spi_remove,
> +};
> +
> +
> +static int __init machxo2_init(void)
> +{
> +	return spi_register_driver(&machxo2_spi_driver);
> +}
> +subsys_initcall(machxo2_init);
> +
> +static void __exit machxo2_exit(void)
> +{
> +	spi_unregister_driver(&machxo2_spi_driver);
> +}
> +module_exit(machxo2_exit);
> +

module_spi_driver()...?

> +MODULE_AUTHOR("Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>");
> +MODULE_DESCRIPTION("MachXO2 FPGA SPI bus driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mtd/devices/machxo2.h b/drivers/mtd/devices/machxo2.h
> new file mode 100644
> index 0000000..e0213d0
> --- /dev/null
> +++ b/drivers/mtd/devices/machxo2.h
> @@ -0,0 +1,24 @@
> +/*
> + * Copyright 2014 Parkeon
> + * Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it under
> + * the terms of the GNU General Public License version 2 as published by the
> + * Free Software Foundation.
> + */
> +#ifndef __DRIVERS_MTD_MACHXO2_H
> +#define __DRIVERS_MTD_MACHXO2_H
> +
> +struct machxo2;
> +struct machxo2_busops {
> +	int (*transceive)(
> +			struct device *dev,
> +			const void *send_buf, unsigned send_len,
> +			void *recv_buf, unsigned recv_len);
> +};
> +

proper indentation...

int (*transceive)(struct device *dev,
		  const void *send_buf, unsigned send_len,
		  void *recv_buf, unsigned recv_len);

> +struct machxo2 *machxo2_create(struct device *dev,
> +			struct machxo2_busops *busops);
> +

struct machxo2 *machxo2_create(struct device *dev,
			       struct machxo2_busops *busops);



This patch has coding style problems.. run checkpatch on this patch..

Thanx.

-- 
Regards,
Varka Bhadram.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
