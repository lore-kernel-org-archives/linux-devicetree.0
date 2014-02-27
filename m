From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 3/4] pci: Introduce a domain number for pci_host_bridge.
Date: Thu, 27 Feb 2014 14:22:39 +0100
Message-ID: <7263969.1aniqAkfKX@wuerfel>
References: <1393506402-11474-1-git-send-email-Liviu.Dudau@arm.com> <1393506402-11474-4-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1393506402-11474-4-git-send-email-Liviu.Dudau@arm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linaro-kernel@lists.linaro.org
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 27 February 2014 13:06:41 Liviu Dudau wrote:
> Make it easier to discover the domain number of a bus by storing
> the number in pci_host_bridge for the root bus. Several architectures
> have their own way of storing this information, so it makes sense
> to try to unify the code. While at this, add a new function that
> creates a root bus in a given domain and make pci_create_root_bus()
> a wrapper around this function.
> 
> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>
