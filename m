From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] Fix ioport_map() for !CONFIG_GENERIC_IOMAP cases.
Date: Thu, 27 Feb 2014 15:09:28 +0100
Message-ID: <5331963.VjH27eqhpK@wuerfel>
References: <1393506599-11561-1-git-send-email-Liviu.Dudau@arm.com> <1393506599-11561-2-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1393506599-11561-2-git-send-email-Liviu.Dudau@arm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linaro-kernel@lists.linaro.org
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 27 February 2014 13:09:57 Liviu Dudau wrote:
> The inline version of ioport_map() that gets used when !CONFIG_GENERIC_IOMAP
> is wrong. It returns a mapped (i.e. virtual) address that can start from
> zero and completely ignores the PCI_IOBASE and IO_SPACE_LIMIT that most
> architectures that use !CONFIG_GENERIC_MAP define.
> 
> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> 
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>
