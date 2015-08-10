From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v6 17/42] powerpc/powernv: Rename PE# fields in PHB
Date: Tue, 11 Aug 2015 00:21:16 +1000
Message-ID: <55C8B35C.4040501@ozlabs.ru>
References: <1438834307-26960-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1438834307-26960-18-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1438834307-26960-18-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com
List-Id: devicetree@vger.kernel.org

On 08/06/2015 02:11 PM, Gavin Shan wrote:
> This renames the fields related to PE# in "struct pnv_phb" for
> better reflecting of their usages as Alexey suggested. It doesn't
> introduce behavioural changes.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>


Makes sense to move this to the beginning of the patchset as patches prior 
this are changing the same lines as this patch changes.


-- 
Alexey
