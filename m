From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [Question] Memory attribute reserved by Device Tree?
Date: Thu, 30 Jun 2016 12:39:03 +0100
Message-ID: <577504D7.7080106@arm.com>
References: <CAK7LNATGoP-Wn-wiK_CgD_v=rQXyt937qRvr8LkUQ06jHB7FAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK7LNATGoP-Wn-wiK_CgD_v=rQXyt937qRvr8LkUQ06jHB7FAA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 30/06/16 12:10, Masahiro Yamada wrote:
> Hello.
> 
> Which memory attribute will ARM/ARM64 Linux
> set to the memory region reserved by
> /memreserve/ of Device Tree?
> 
> 
> Normal memory non-cacheable?
> Or, cacheable?
> Or, not defined?
> 
> Perhaps actual behavior depends on whether the reserved area is
> located in the low-memory region?

Isn't the point of memreserve that the kernel avoids mapping it at all?
If a reserved region is later mapped in by a driver using
dma_declare_coherent_memory(), ioremap(), memremap() or whatever else,
then the attributes will vary depending on the exact method used.

Robin.

> 
> 
> Thanks,
> 
> 
