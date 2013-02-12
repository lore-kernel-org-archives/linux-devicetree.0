From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: RFC: Static memory controller node description
Date: Tue, 12 Feb 2013 14:48:47 +0100
Message-ID: <CAHTX3dJT40OC1vf-KYLshhiDNigZRKOBh6ieH8qPgbyCMcjwPA@mail.gmail.com>
References: <CAHTX3dJ+ii9dP7w860Or80NWOAPoYZt8ftUwNfAe6WkEoeQJXQ@mail.gmail.com>
 <CALF0-+V8iJZGW1riVSEXv0PGThOHxRh7P6JZb_ESb9C=+OyPOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CALF0-+V8iJZGW1riVSEXv0PGThOHxRh7P6JZb_ESb9C=+OyPOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2013/2/12 Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hi Michal,
>
> On Thu, Jan 10, 2013 at 12:40 PM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
>> Hi guys,
>>
>> we want to add static memory controller driver for xilinx zynq to the
>> linux kernel. (It will go to drivers/memory/ folder)
>> Just need to clear dts fragment which describe it.
>>
>
> I'm working on a (perhaps) similar memory controller and I'm
> interested in seeing
> how you will implement this one.
>
> Do you have some patches (no matter they are preliminary) for me to look at?

http://git.xilinx.com/?p=linux-xlnx.git;a=shortlog;h=refs/heads/master-next

look for: memory: Add driver for Zynq SMC

> Also, which SoC is this? Does it have a public manual?

It is xilinx zynq. - arm cortex a9 dual core.
http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform
