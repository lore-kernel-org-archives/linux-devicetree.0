From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: dts: keystone-k2l: fix broken Ethernet due to
 disabled OSR
Date: Fri, 26 May 2017 13:46:14 +0530
Message-ID: <af2aeda1-4a37-46b8-9aaa-56b7530ca3dd@ti.com>
References: <59ba5ef37f17ff1c10d9d52ca06ef341b2d476eb.1490782833.git.nsekhar@ti.com>
 <5adb4f5d-78c4-453d-898d-60c588eb1d14@oracle.com>
 <CAK8P3a2yYK3zO=K__W4jCFYYpFCZLYkm97ADZHunttdUmO_ZOw@mail.gmail.com>
 <1a5730ea-7601-d0bb-15ef-168252f54446@ti.com>
 <CAK8P3a3KQZeZjGQ2OraKP=28X7Sg22SXSCucS2NrwngsJ34-=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a3KQZeZjGQ2OraKP=28X7Sg22SXSCucS2NrwngsJ34-=Q@mail.gmail.com>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Kristo,
 Tero" <t-kristo@ti.com>, "arm@kernel.org" <arm@kernel.org>, "Karicheri,
 Muralidharan" <m-karicheri2@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Friday 26 May 2017 01:42 PM, Arnd Bergmann wrote:
> On Fri, May 26, 2017 at 9:44 AM, Sekhar Nori <nsekhar@ti.com> wrote:
>> Hi Arnd,
>>
>> On Friday 31 March 2017 03:43 PM, Arnd Bergmann wrote:
>>> On Wed, Mar 29, 2017 at 6:13 PM, santosh.shilimkar@oracle.com
>>> <santosh.shilimkar@oracle.com> wrote:
>>>>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>>>>> Acked-by: Tero Kristo <t-kristo@ti.com>
>>>>> [nsekhar@ti.com: commit message updates, port to latest mainline]
>>>>> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
>>>>> ---
>>>>
>>>> Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
>>>>
>>>> Can you please pick this up for rcx fixes ?
>>>
>>> Applied, thanks!
>>
>> Looks like this fix never made to to mainline. Do you have the patch
>> with you still? It will have to be marked for v4.11 stable and pushed.
> 
> Sorry about the mistake, I don't know what happened here but I
> found it in my git reflog and applied it to the latest fixes branch
> with the stable tag added.
> 
> Thanks for checking this and the reminder.

No problem, Arnd. Thanks for taking care of it.

Regards,
Sekhar
