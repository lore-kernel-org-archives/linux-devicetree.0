From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: dts: keystone-k2l: fix broken Ethernet due to
 disabled OSR
Date: Fri, 26 May 2017 13:14:49 +0530
Message-ID: <1a5730ea-7601-d0bb-15ef-168252f54446@ti.com>
References: <59ba5ef37f17ff1c10d9d52ca06ef341b2d476eb.1490782833.git.nsekhar@ti.com>
 <5adb4f5d-78c4-453d-898d-60c588eb1d14@oracle.com>
 <CAK8P3a2yYK3zO=K__W4jCFYYpFCZLYkm97ADZHunttdUmO_ZOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a2yYK3zO=K__W4jCFYYpFCZLYkm97ADZHunttdUmO_ZOw@mail.gmail.com>
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
To: Arnd Bergmann <arnd@arndb.de>, "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Kristo,
 Tero" <t-kristo@ti.com>, "arm@kernel.org" <arm@kernel.org>, "Karicheri,
 Muralidharan" <m-karicheri2@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Friday 31 March 2017 03:43 PM, Arnd Bergmann wrote:
> On Wed, Mar 29, 2017 at 6:13 PM, santosh.shilimkar@oracle.com
> <santosh.shilimkar@oracle.com> wrote:
>>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>>> Acked-by: Tero Kristo <t-kristo@ti.com>
>>> [nsekhar@ti.com: commit message updates, port to latest mainline]
>>> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
>>> ---
>>
>> Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
>>
>> Can you please pick this up for rcx fixes ?
> 
> Applied, thanks!

Looks like this fix never made to to mainline. Do you have the patch
with you still? It will have to be marked for v4.11 stable and pushed.

Thanks,
Sekhar
