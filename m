From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v7 11/12] hwmon: Add PECI dimmtemp driver
Date: Mon, 30 Jul 2018 16:06:14 -0600
Message-ID: <CAL_JsqK4k=c6k-BJT5fWQH_DCqGhr13fq6M_iZZehaveE-z5Hg@mail.gmail.com>
References: <20180723214751.1733-1-jae.hyun.yoo@linux.intel.com>
 <20180723214751.1733-12-jae.hyun.yoo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180723214751.1733-12-jae.hyun.yoo@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Randy Dunlap <rdunlap@infradead.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, fbarrat@linux.vnet.ibm.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Lee Jones <lee.jones@linaro.org>, Jason M Biils <jason.m.bills@linux.intel.com>, sandeen@redhat.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jonathan Corbet <corbet@lwn.net>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Joel Stanley <joel@jms.id.au>, bryantly@linux.vnet.ibm.com, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, david.kershner@unisys.com, Guenter Roeck <linux@roeck-us.net>, Wu Hao <hao.wu@intel.com>, Linux HWMON List <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>Arnd Bergmann <ar>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 23, 2018 at 3:49 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds PECI dimmtemp hwmon driver.
>

> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id peci_dimmtemp_of_table[] = {
> +       { .compatible = "intel,peci-dimmtemp" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, peci_dimmtemp_of_table);
> +#endif

This should be removed. Same for cpu temp driver I'm guessing.

Rob
