From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: Re: [PATCH 4/5] PCI: designware: Add setup bus-related to pcie_host_ops
Date: Mon, 19 Jan 2015 14:09:43 +0100
Message-ID: <CAG374jBpafrgvSqzmOzUYVNob4OZHT5_EuveD52y+8BRquzXkg@mail.gmail.com>
References: <1418812486-12394-1-git-send-email-gabriel.fernandez@linaro.org>
	<1418812486-12394-5-git-send-email-gabriel.fernandez@linaro.org>
	<1507589.aeTeyNn1QF@wuerfel>
	<000e01d01a7f$47592e20$d60b8a60$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <000e01d01a7f$47592e20$d60b8a60$%han@samsung.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Mohit Kumar <mohit.kumar@st.com>, Grant Likely <grant.likely@linaro.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <treding@nvidia.com>, Minghuan Lian <Minghuan.Lian@freescale.com>, Magnus Damm <damm@opensource.se>, Will Deacon <will.deacon@arm.com>, Tanmay Inamdar <tinamdar@apm.com>, Murali Karicheri <m-karicheri2@ti.com>, Kishon
List-Id: devicetree@vger.kernel.org

Hi Arnd, Jingoo,

On 18 December 2014 at 05:58, Jingoo Han <jg1.han@samsung.com> wrote:
> On Thursday, December 18, 2014 7:16 AM, Arnd Bergmann wrote:
>> On Wednesday 17 December 2014 11:34:45 Gabriel FERNANDEZ wrote:
>> > ST sti SoCs PCIe IPs are built around DesignWare IP Core.
>> > But in these SoCs PCIe IP doesn't support IO.
>
> Hi Gabriel,
>
> I cannot understand how ST sti SoCs PCIe IP does not support I/O.
> As far as I know, it cannot be selected by the 'parameter'.
> Then, H/W engineers dropped out the I/O control logic?
>
>> >
>> > To support this, add setup_bus() to pcie_host_ops.
>
>
>> >
>> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>> > Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
>>
>> The dw-pcie driver should be able to tell whether the device has
>> an I/O space or not, and do the right thing based on that. Don't
>> add an implementation specific callback for that.
>
> I agree with Arnd's opinion.
>
> In addition, I have one more question.
> Then, if a device that requires I/O region is connected to
> PCIe slot of ST sti SoCs PCIe, what will happen?
> It just prints error messages?
>
> Best regards,
> Jingoo Han
>
>>
>>       Arnd
>

Arnd in other post mention to add an empty I/O space to workaround
lack of I/O port access.
Is it the right thing to do ?
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November/299623.html

Best regards
