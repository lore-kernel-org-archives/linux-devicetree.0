From: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v7 39/50] powerpc/powernv: Fundamental reset in pnv_pci_reset_secondary_bus()
Date: Fri, 13 Nov 2015 11:23:27 +1100
Message-ID: <87bnayzr0g.fsf@gamma.ozlabs.ibm.com>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com> <1446642770-4681-40-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1446642770-4681-40-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, aik@ozlabs.ru, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, frowand.list@gmail.com, Gavin Shan <gwshan@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Following some discussion on IRC, it looks like there are roughly 2
machines on the planet with skiboot and p5ioc2, so I'm not worried about
that any more.

I am still vaguely concerned about a failing fundamental reset.

Regards,
Daniel
