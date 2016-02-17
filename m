From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: Re: [PATCH v8 03/45] powerpc/pci: Cleanup on struct
 pci_controller_ops
Date: Wed, 17 Feb 2016 15:18:42 +1100
Message-ID: <56C3F4A2.1010909@au1.ibm.com>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-4-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1455680668-23298-4-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, aik@ozlabs.ru, linux-pci@vger.kernel.org, grant.likely@linaro.org, robherring2@gmail.com, bhelgaas@google.com, dja@axtens.net
List-Id: devicetree@vger.kernel.org

On 17/02/16 14:43, Gavin Shan wrote:
> Each PHB has one instance of "struct pci_controller_ops", which
> includes various callbacks called by PCI subsystem. In the definition
> of this struct, some callbacks have explicit names for its arguments,
> but the left don't have.
>
> This adds all explicit names of the arguments to the callbacks in
> "struct pci_controller_ops" so that the code looks consistent.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> Reviewed-by: Daniel Axtens <dja@axtens.net>

Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

-- 
Andrew Donnellan              Software Engineer, OzLabs
andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
+61 2 6201 8874 (work)        IBM Australia Limited
