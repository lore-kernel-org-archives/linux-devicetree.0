From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 6/9] ARM: dts: wheat: Drop MTD partitioning from DT
Date: Wed, 23 May 2018 00:01:57 +0200
Message-ID: <fc1cfd7e-db27-9277-dbed-cc2274c614a6@gmail.com>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
 <20180522120257.13232-6-marek.vasut+renesas@gmail.com>
 <CAMuHMdXRnoyhNz=3v_=ZCV=FWX4TwKqx7MpH0g3c7GwtXKP1tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdXRnoyhNz=3v_=ZCV=FWX4TwKqx7MpH0g3c7GwtXKP1tg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, Richard Weinberger <richard@nod.at>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms+renesas@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On 05/22/2018 04:43 PM, Geert Uytterhoeven wrote:
> On Tue, May 22, 2018 at 2:02 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Drop the MTD partitioning from DT, since it does not describe HW
>> and to give way to a more flexible kernel command line partition
>> passing.
>>
>> To retain the original partitioning, assure you have enabled
>> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
>> following to your kernel command line:
>>
>>   mtdparts=spi0.0:256k@0(loader),4096k(user),-(flash)
> 
> I think the "@0" can be dropped, as it's optional?
> 4m?

My take on this is that the loader is actually at offset 0x0 of the MTD
device and we explicitly state that in the mtdparts to anchor the first
partition within the MTD device and all the other partitions are at
offset +(sum of the sizes of all partitions listed before the current
one) relative to that first partition.

Removing the @0 feels fragile at best and it seems to depend on the
current behavior of the code.

> (Gaining more knowledge during reviewing ;-)
> 
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Best regards,
Marek Vasut
