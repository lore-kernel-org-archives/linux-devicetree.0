From: Pratyush Anand <pratyush.anand@gmail.com>
Subject: Re: [PATCH v4 3/4] PCI: st: Provide support for the sti PCIe
 controller
Date: Thu, 27 Aug 2015 23:01:16 +0530
Message-ID: <CAHM4w1=g=UFoz=R-6hxJC0=fSieN1WDvZT97ykL1b3_YPhBjZg@mail.gmail.com>
References: <1440678857-27118-1-git-send-email-gabriel.fernandez@linaro.org>
 <1440678857-27118-4-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1440678857-27118-4-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, kernel@stlinux.com, Viresh Kumar <viresh.kumar@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Sachin Kamat <sachin.kamat@samsung.com>, linux-kernel@vger.kernel.org, Tanmay Inamdar <tinamdar@apm.com>, Lee Jones <lee.jones@linaro.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Phil Edworthy <phil.edworthy@renesas.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Jingoo Han <jg1.han@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Tejun Heo <tj@kernel.org>, Rob
List-Id: devicetree@vger.kernel.org

Hi Gabriel,

Looks good to me.

On Thu, Aug 27, 2015 at 6:04 PM, Gabriel Fernandez
<gabriel.fernandez@linaro.org> wrote:
> sti pcie is built around a Synopsis Designware PCIe IP.
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>


> +static int st_pcie_link_up(struct pcie_port *pp)
> +{
> +       u32 status;
> +       int link_up;

nit: why not bool

> +       int count = 0;

[...]

> +static void st_pcie_board_reset(struct pcie_port *pp)
> +{
> +       struct st_pcie *pcie = to_st_pcie(pp);
> +
> +       if (!gpio_is_valid(pcie->reset_gpio))
> +               return;
> +
> +       if (gpio_direction_output(pcie->reset_gpio, 0)) {
> +               dev_err(pp->dev, "Cannot set PERST# (gpio %u) to output\n",
> +                       pcie->reset_gpio);
> +               return;
> +       }
> +
> +       /* From PCIe spec */
> +       msleep(2);
> +       gpio_direction_output(pcie->reset_gpio, 1);
> +
> +       /*
> +        * PCIe specification states that you should not issue any config
> +        * requests until 100ms after asserting reset, so we enforce that here
> +        */
> +       msleep(100);

IIRC, specification says to wait after link training completes. So
shouldn't it be after st_pcie_enable_ltssm. Moreover, I wonder why
others do not need it.

Reviewed-by: Pratyush Anand <pratyush.anand@gmail.com>
