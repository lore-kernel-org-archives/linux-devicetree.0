From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v2 4/7] ARM: shmobile: r8a7791: Add SYS-DMAC channel definitions
 for bindings
Date: Wed, 04 Jun 2014 12:45:19 +0100
Message-ID: <538F06CF.5090406@codethink.co.uk>
References: <1401716531-29794-1-git-send-email-geert+renesas@glider.be> <538C818B.5060703@codethink.co.uk> <CAMuHMdWkPy8eydh4BntXdtf5ZJKP4yG26QovLUjvGUYYv3dStw@mail.gmail.com> <3770565.HiyLmu1184@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <3770565.HiyLmu1184@avalon>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/06/14 12:30, Laurent Pinchart wrote:
> On Tuesday 03 June 2014 09:53:17 Geert Uytterhoeven wrote:
>> On Mon, Jun 2, 2014 at 3:52 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>>>> +// FIXME
>>>> +#define CHCR_RX_8BIT SHDMA_ARM_CHCR_RX(SHDMA_ARM_SZ_8BIT)
>>>> +#define CHCR_TX_8BIT SHDMA_ARM_CHCR_TX(SHDMA_ARM_SZ_8BIT)
>>>> +#define CHCR_RX_16BIT        SHDMA_ARM_CHCR_RX(SHDMA_ARM_SZ_16BIT)
>>>> +#define CHCR_TX_16BIT        SHDMA_ARM_CHCR_TX(SHDMA_ARM_SZ_16BIT)
>>>> +#define CHCR_RX_32BIT        SHDMA_ARM_CHCR_RX(SHDMA_ARM_SZ_32BIT)
>>>> +#define CHCR_TX_32BIT        SHDMA_ARM_CHCR_TX(SHDMA_ARM_SZ_32BIT)
>>>> +#define CHCR_RX_256BIT       SHDMA_ARM_CHCR_RX(SHDMA_ARM_SZ_256BIT)
>>>> +#define CHCR_TX_256BIT       SHDMA_ARM_CHCR_TX(SHDMA_ARM_SZ_256BIT)
>>>
>>> I am pretty sure for round-2 we can remove these in favour of a
>>> table in the driver. The only device that has a non-standard setting
>>> is the SDHI and that will support 32bit and 256bit transfers.
>>
>> Thanks, I'm eagerly awaiting your next version...
> 
> Speaking of that, Ben, do you have a git tree with your latest patches ?

Not yet, as currently working on sorting out the soc_camera before
moving back to the DMA. I have a plan, just not had the time to sort
it out.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
