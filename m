From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: Re: [PATCH v3 3/5] PCI: st: Provide support for the sti PCIe controller
Date: Wed, 6 May 2015 11:14:25 +0200
Message-ID: <CAG374jAv9aHBPGV+x+xs2MyRGz+fw1ymwu78fqNXDPtPqehgZA@mail.gmail.com>
References: <1428657168-12495-1-git-send-email-gabriel.fernandez@linaro.org>
	<1428657168-12495-4-git-send-email-gabriel.fernandez@linaro.org>
	<20150505221646.GE24643@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20150505221646.GE24643@google.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Jingoo Han <jg1.han@samsung.com>, Lucas Stach <l.stach@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@st.com>, Kishon Vijay Abraham I <kishon@ti.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg KH <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@linaro.org>, Thierry
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 6 May 2015 at 00:16, Bjorn Helgaas <bhelgaas@google.com> wrote:
> On Fri, Apr 10, 2015 at 11:12:46AM +0200, Gabriel FERNANDEZ wrote:
>> sti pcie is built around a Synopsis Designware PCIe IP.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
>
>> +/* ST PCIe driver does not allow module unload */
>
> Is there something that prevents module unload, or is it just untested?
>
Yes we haven't tested

>> +static int __init pcie_init(void)
>> +{
>> +     return platform_driver_probe(&st_pcie_driver, st_pcie_probe);
>> +}
>> +device_initcall(pcie_init);
>
> Can you use module_platform_driver_probe() or module_init() here?
>

Yes we can use module_init() here.

By the way if figure out i removed __init attribute on st_pcie_probe()
in previous version to follow Arnd's remark.
But st_pcie_probe calls hook_fault_code() that has __init attribute.
So I think we need to keep __init for probe routine ?
Also, we have to restrict bind/unbind with "suppress_bind_attrs" in
platform_driver structure.
This is the main reason to not allow module unload/reload.

If you are ok i will send a v4 ?

BR
Gabriel

>> +MODULE_AUTHOR("Fabrice Gasnier <fabrice.gasnier@st.com>");
>> +MODULE_DESCRIPTION("PCI express Driver for ST SoCs");
>> +MODULE_LICENSE("GPL v2");
>> --
>> 1.9.1
>>
