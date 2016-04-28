From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V5 1/6] SLIMbus: Device management on SLIMbus
Date: Thu, 28 Apr 2016 12:00:26 +0200
Message-ID: <2692115.H6acsZmTjn@wuerfel>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org> <1461801489-16254-2-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1461801489-16254-2-git-send-email-sdharia@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 27 April 2016 17:58:04 Sagar Dharia wrote:

> +/**
> + * slim_driver_register: Client driver registration with slimbus
> + * @drv:Client driver to be associated with client-device.
> + * This API will register the client driver with the slimbus
> + * It is called from the driver's module-init function.
> + */
> +int slim_driver_register(struct slim_driver *drv)
> +{
> +	drv->driver.bus = &slimbus_type;
> +
> +	return driver_register(&drv->driver);
> +}
> +EXPORT_SYMBOL_GPL(slim_driver_register);

Please make this use the same trick as platform_driver_register() to implicitly
set the .owner field of the driver to THIS_MODULE.

> +/**
> + * slim_add_device: Add a new device without register board info.
> + * @ctrl: Controller to which this device is to be added to.
> + * Called when device doesn't have an explicit client-driver to be probed, or
> + * the client-driver is a module installed dynamically.
> + */
> +int slim_add_device(struct slim_controller *ctrl, struct slim_device *sbdev)

This looks like an artifact of ancient pre-DT times. I'd say kill it off before
someone starts using it.

> +struct sbi_boardinfo {
> +	struct list_head	list;
> +	struct slim_boardinfo	board_info;
> +};
> +
> +static LIST_HEAD(board_list);
> +static LIST_HEAD(slim_ctrl_list);
> +static DEFINE_MUTEX(board_lock);
> +

> +/**
> + * slim_register_board_info: Board-initialization routine.
> + * @info: List of all devices on all controllers present on the board.
> + * @n: number of entries.
> + * API enumerates respective devices on corresponding controller.
> + * Called from board-init function.
> + */
> +int slim_register_board_info(struct slim_boardinfo const *info, unsigned n)
> +{

Same for all of this.

> +struct slim_device_id {
> +	__u16 manf_id, prod_code;
> +	__u8 dev_index, instance;
> +
> +	/* Data private to the driver */
> +	kernel_ulong_t driver_data;
> +};

Can you add explicit padding here to avoid having the anonymous two bytes in the middle?

Also, I think a void pointer instead of a kernel_ulong_t makes it more useful,
but there are always cases where one or the other fits better.

	Arnd
