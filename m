From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] dma-mapping: fix size when of_dma_get_range() fails
Date: Fri, 20 Mar 2015 11:54:08 +0000
Message-ID: <CACxGe6sJKu9NFCxPKc5+XJStmda6jmAZ3jFGbi0m+D1oo9VbTQ@mail.gmail.com>
References: <1419458210-4079-1-git-send-email-m-karicheri2@ti.com> <20150319192514.0F9C7C40B87@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150319192514.0F9C7C40B87@trevor.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 19, 2015 at 7:25 PM, Grant Likely <grant.likely@linaro.org> wrote:
> On Wed, 24 Dec 2014 16:56:50 -0500
> , Murali Karicheri <m-karicheri2@ti.com>
>  wrote:
>> When call to of_dma_get_range() fails, the code currently set size
>> to dev->coherent_dma_mask instead of dev->coherent_dma_mask + 1. Fix this
>> to make the code consistent with the case when size is obtained from
>> dma-range property.
>>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> Looks okay to me. I've merged it into my tree.

Oops, never mind. I see that it's been rolled into the series going
through Bjorn's tree. Sorry for the noise.

g.
