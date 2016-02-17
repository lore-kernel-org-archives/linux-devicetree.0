From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: Re: [PATCH v8 04/45] powerpc/powernv: Cleanup on pci_controller_ops
 instances
Date: Wed, 17 Feb 2016 15:38:32 +1100
Message-ID: <56C3F948.5090804@au1.ibm.com>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-5-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1455680668-23298-5-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, aik@ozlabs.ru, linux-pci@vger.kernel.org, grant.likely@linaro.org, robherring2@gmail.com, bhelgaas@google.com, dja@axtens.net
List-Id: devicetree@vger.kernel.org

On 17/02/16 14:43, Gavin Shan wrote:
> This cleans up on below data struct instances to use tab instead of
> space indent of statement to avoid complains from scripts/checkpatch.pl.
> No logical changes introduced.
>
>    @pnv_pci_ioda_controller_ops
>    @pnv_npu_ioda_controller_ops
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> Reviewed-by: Daniel Axtens <dja@axtens.net>

Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

-- 
Andrew Donnellan              Software Engineer, OzLabs
andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
+61 2 6201 8874 (work)        IBM Australia Limited
