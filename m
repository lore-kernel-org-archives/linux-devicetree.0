From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 5/5] PCI: st: disable IO support
Date: Wed, 17 Dec 2014 14:01:31 +0000
Message-ID: <20141217140131.607a1ac7@lxorguk.ukuu.org.uk>
References: <1418812486-12394-1-git-send-email-gabriel.fernandez@linaro.org>
	<1418812486-12394-6-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418812486-12394-6-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Mohit Kumar <mohit.kumar@st.com>, Jingoo Han <jg1.han@samsung.com>, Grant Likely <grant.likely@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <treding@nvidia.com>, Minghuan Lian <Minghuan.Lian@freescale.com>, Magnus Damm <damm@opensource.se>, Will Deacon <will.deacon@arm.com>, Tanmay Inamdar <tinamdar@apm.com>, Murali Karicheri <m->
List-Id: devicetree@vger.kernel.org

On Wed, 17 Dec 2014 11:34:46 +0100
Gabriel FERNANDEZ <gabriel.fernandez@st.com> wrote:

> sti SoCs PCIe IPs are built around DesignWare IP Core.
> But in these SoCs, PCIe IP doesn't support IO.
> By default, when no IO space is provided, a default one is assigned.
> 
> Add an empty IO resource to the bus, and disable IO by default.

As a point of PCI pedantry I don't think this is quite sufficient. PCI
has a weird corner case where I/O resources are implied rather than
allocated.

For IDE/SATA you may need to something like

	if (class == PCI_CLASS_STORAGE_IDE) {
		u8 progif;
		pci_read_config_byte(dev, PCI_CLASS_PROG, &progif);
		progif |= 5;
		pci_write_config_byte(dev, PCI_CLASS_PROG, &progif);
	}

so that any adapter is kicked out of legacy mode and doesn't get implied
I/O resources and interrupts. I don't know if that case matters for your
usage.
