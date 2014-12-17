From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/5] PCI: designware: Add setup bus-related to pcie_host_ops
Date: Wed, 17 Dec 2014 23:16:12 +0100
Message-ID: <1507589.aeTeyNn1QF@wuerfel>
References: <1418812486-12394-1-git-send-email-gabriel.fernandez@linaro.org> <1418812486-12394-5-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1418812486-12394-5-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-pci-owner@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Mohit Kumar <mohit.kumar@st.com>, Jingoo Han <jg1.han@samsung.com>, Grant Likely <grant.likely@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <treding@nvidia.com>, Minghuan Lian <Minghuan.Lian@freescale.com>, Magnus Damm <damm@opensource.se>, Will Deacon <will.deacon@arm.com>, Tanmay Inamdar <tinamdar@apm.com>, Murali Karicheri <m-karicheri2@ti.com>, Kishon
List-Id: devicetree@vger.kernel.org

On Wednesday 17 December 2014 11:34:45 Gabriel FERNANDEZ wrote:
> ST sti SoCs PCIe IPs are built around DesignWare IP Core.
> But in these SoCs PCIe IP doesn't support IO.
> 
> To support this, add setup_bus() to pcie_host_ops.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>

The dw-pcie driver should be able to tell whether the device has
an I/O space or not, and do the right thing based on that. Don't
add an implementation specific callback for that.

	Arnd
