From: Alexander Popov <alex.popov@linux.com>
Subject: Re: [PATCH v3 1/3] powerpc/512x: add LocalPlus Bus FIFO device driver
Date: Tue, 6 Oct 2015 01:22:42 +0300
Message-ID: <5612F832.9060407@linux.com>
References: <1443115737-3948-1-git-send-email-alex.popov@linux.com>
 <1443115737-3948-2-git-send-email-alex.popov@linux.com>
 <56049CD0.7080104@tabi.org> <560C5325.6070406@linux.com>
 <560D692E.1010309@tabi.org>
Reply-To: alex.popov@linux.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <560D692E.1010309@tabi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Timur Tabi <timur@tabi.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Anatolij Gustschin <agust@denx.de>, Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@linaro.org>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Popov <alex.popov@linux.com>
List-Id: devicetree@vger.kernel.org

On 01.10.2015 20:11, Timur Tabi wrote:
> On 09/30/2015 04:24 PM, Alexander Popov wrote:
>>> Driver code that has to parse #address-cells or #size-cells
>>> is usually wrong.
>>
>> I would not call it "parsing", I just check whether the dts-file is good.
>> Anyway, could you give me a clue how to do better?
> 
> You should use of_n_size_cells() and of_n_addr_cells().

It seems that of_n_size_cells() and of_n_addr_cells() don't work well in
my case. These functions just help to get "#address-cells" and "#size-cells"
from a parent node of a given node.

"sclpc" device tree node is a child of "soc" node (not "localbus" node),
but the driver must use "ranges" property of "localbus" to determine
the chip select number of a client device which ordered the DMA transfer.

It seems that ns2_leds_get_of_pdata() from linux/drivers/leds/leds-ns2.c
or pnv_init_idle_states() from arch/powerpc/platforms/powernv/idle.c do
something similar to get_cs_ranges().
Is it OK?

Best regards,
Alexander
