From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: Re: [PATCH v8 33/45] powerpc/powernv: Simplify pnv_eeh_reset()
Date: Wed, 17 Feb 2016 15:35:43 +1100
Message-ID: <56C3F89F.4070505@au1.ibm.com>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-34-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1455680668-23298-34-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, aik@ozlabs.ru, linux-pci@vger.kernel.org, grant.likely@linaro.org, robherring2@gmail.com, bhelgaas@google.com, dja@axtens.net
List-Id: devicetree@vger.kernel.org

On 17/02/16 14:44, Gavin Shan wrote:
> This drops unnecessary nested if statements in pnv_eeh_reset() to
> improve the code readability. After the changes, the unused local
> variable "ret" is dropped as well. No logical changes introduced.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>

This looks good to me.

Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

-- 
Andrew Donnellan              Software Engineer, OzLabs
andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
+61 2 6201 8874 (work)        IBM Australia Limited
