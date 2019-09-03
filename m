From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 3/3] dwc: PCI: intel: Intel PCIe RC controller driver
Date: Tue, 3 Sep 2019 20:36:16 +0200
Message-ID: <CAFBinCCPbwQ+8S9kG_Z43j-ieOEeo3TcNH48tE5WebU94ec6tw@mail.gmail.com>
References: <9bd455a628d4699684c0f9d439b64af1535cccc6.1566208109.git.eswara.kota@linux.intel.com>
 <20190824210302.3187-1-martin.blumenstingl@googlemail.com>
 <2c71003f-06d1-9fe2-2176-94ac816b40e3@linux.intel.com> <CAFBinCDSJdq6axcYM7AkqvzUbc6X1zfOZ85Q-q1-FPwVxvgnpA@mail.gmail.com>
 <9ba19f08-e25a-4d15-8854-8dc4f9b6faca@linux.intel.com> <CAFBinCDX2BqiKcZM-C0m7gsi4BPSK0gM15r0jHmL3+AKxff=wQ@mail.gmail.com>
 <7c0fd56f-ecc5-40c2-c435-3805ca1f97c7@linux.intel.com> <CAFBinCBa9G+E+vjmQCGBx=zRG80ad1am_1TrNbAMvqKCQU38gw@mail.gmail.com>
 <ee561743-d4bc-0aa4-ded7-bfa6bd3a509b@linux.intel.com> <4bab775a-0e39-a187-0791-40050feb7d67@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4bab775a-0e39-a187-0791-40050feb7d67@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dilip Kota <eswara.kota@linux.intel.com>
Cc: "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, devicetree@vger.kernel.org, gustavo.pimentel@synopsys.com, hch@infradead.org, jingoohan1@gmail.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, qi-ming.wu@intel.com, kishon@ti.com
List-Id: devicetree@vger.kernel.org

Hi Dilip,

On Tue, Sep 3, 2019 at 12:20 PM Dilip Kota <eswara.kota@linux.intel.com> wrote:
>
> Hi Martin,
>
> On 8/29/2019 10:54 AM, Chuan Hua, Lei wrote:
>
>
> On 8/29/2019 3:36 AM, Martin Blumenstingl wrote:
>
> On Wed, Aug 28, 2019 at 5:35 AM Chuan Hua, Lei
> <chuanhua.lei@linux.intel.com> wrote:
> [...]
>
> +static int intel_pcie_ep_rst_init(struct intel_pcie_port *lpp)
> +{
> +    struct device *dev = lpp->pci->dev;
> +    int ret = 0;
> +
> +    lpp->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +    if (IS_ERR(lpp->reset_gpio)) {
> +            ret = PTR_ERR(lpp->reset_gpio);
> +            if (ret != -EPROBE_DEFER)
> +                    dev_err(dev, "failed to request PCIe GPIO: %d\n", ret);
> +            return ret;
> +    }
> +    /* Make initial reset last for 100ms */
> +    msleep(100);
>
> why is there lpp->rst_interval when you hardcode 100ms here?
>
> There are different purpose. rst_interval is purely for asserted reset
> pulse.
>
> Here 100ms is to make sure the initial state keeps at least 100ms, then we
> can reset.
>
> my interpretation is that it totally depends on the board design or
> the bootloader setup.
>
> Partially, you are right. However, we should not add some dependency
> here from
> bootloader and board. rst_interval is just to make sure the pulse (low
> active or high active)
> lasts the specified the time.
>
> +Cc Kishon
>
> he recently added support for a GPIO reset line to the
> pcie-cadence-host.c [0] and I believe he's also maintaining
> pci-keystone.c which are both using a 100uS delay (instead of 100ms).
> I don't know the PCIe spec so maybe Kishon can comment on the values
> that should be used according to the spec.
> if there's then a reason why values other than the ones from the spec
> are needed then there should be a comment explaining why different
> values are needed (what problem does it solve).
>
> spec doesn't guide this part. It is a board or SoC specific setting.
> 100us also should work. spec only requirs reset duration should last
> 100ms. The idea is that before reset assert and deassert, make sure the
> default deassert status keeps some time. We take this value from
> hardware suggestion long time back. We can reduce this value to 100us,
> but we need to test on the board.
>
> OK. I don't know how other PCI controller drivers manage this. if the
> PCI maintainers are happy with this then I am as well
> maybe it's worth changing the comment to indicate that this delay was
> suggested by the hardware team (so it's clear that this is not coming
> from the PCI spec)
>
> Dilip will change to 100us delay and run the test. I also need to run some tests for old boards(XRX350/550/PRX300) to confirm this has no impact on function.
>
> I have tested 100us on the target and it is working fine.
> Along with this change, i have validated below changes and test is successful.
>     Enabling the A/B/C/D interrupts during the initialization instead of in map_irq()
>     Calling dw_pcie_setup_rc() function during initialization.
>
> I will push these changes in the next patch version.
great, thank you for working on simplifying the code!

> And, regarding [1]:
> I have checked the code for using regmap; Helper functions especially update_bits() cannot be avoided(it is required while configuring pcie RC registers too). and LGM is little endian.
> Switching to regmap() is not bringing any gain.
OK, if it doesn't help you for LGM then no need to switch to regmap now
I can still do it afterwards when adding support for other SoCs

> Regarding [2]:
> PCIE_SPEED2STR() is quite different from the pcie_link_gen_to_str().
> PCIE_SPEED2STR() expects a encoded value defined in pcie_link_speed[] array in probe.c, whereas pcie_link_gen_to_str() is a direct mapping to the register bits value.
> pcie_link_gen_to_str() is pretty much simple and straight forward.
>
> And, any of the pcie controller drivers are using neither PCIE_SPEED2STR() nor pcie_link_speed[].
OK, I see - thank you for following up
the PCI maintainers need to decide whether pcie_link_status_show is
acceptable (instead of using lspci) - that's the only place where
pcie_link_gen_to_str is used


Martin
