From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 1/7] pci: Introduce pci_register_io_range() helper function.
Date: Tue, 4 Mar 2014 23:30:09 +0100
Message-ID: <201403042330.09607.arnd@arndb.de>
References: <1393948204-11555-1-git-send-email-Liviu.Dudau@arm.com> <1393948204-11555-2-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1393948204-11555-2-git-send-email-Liviu.Dudau@arm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 04 March 2014, Liviu Dudau wrote:
> +int __weak pci_register_io_range(phys_addr_t addr, resource_size_t size)
> +{
> +       return 0;
> +}
> +

How about returning an error here? You don't actually register the range.

	Arnd
