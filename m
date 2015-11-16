From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v7 12/50] powerpc/powernv: Track M64 segment consumption
Date: Mon, 16 Nov 2015 19:01:59 +1100
Message-ID: <56498D77.2060101@ozlabs.ru>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1446642770-4681-13-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1446642770-4681-13-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On 11/05/2015 12:12 AM, Gavin Shan wrote:
> As we track M32 segment consumption, this introduces an array to
> the PHB to track the mapping between M64 segment and PE number.
> The information is going to be used to find M64 segment from the
> PE number during PCI unplugging time in subsequent patches.


It would not hurt to put a few words about how we managed to live without 
such a mapping for M64 before but we needed mapping for M32.




-- 
Alexey
