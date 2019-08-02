From: Tao Ren <taoren@fb.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Facebook Wedge100 BMC
Date: Fri, 2 Aug 2019 03:56:11 +0000
Message-ID: <0862C896-35D3-4032-8DA8-E4B7632CC333@fb.com>
References: <20190802010155.489238-1-taoren@fb.com>
 <CACPK8XdS4m9+74oxK0-ed3ZLr_QCh--AsFgGcF-OpLw24v9g4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACPK8XdS4m9+74oxK0-ed3ZLr_QCh--AsFgGcF-OpLw24v9g4Q@mail.gmail.com>
Content-Language: en-US
Content-ID: <84D26974C03CED42B63C839A5C734926@namprd15.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 8/1/19, 8:02 PM, "Joel Stanley" <joel@jms.id.au> wrote:

>  On Fri, 2 Aug 2019 at 01:02, Tao Ren <taoren@fb.com> wrote:
>> +
>> +       chosen {
>> +               stdout-path = &uart3;
>> +               bootargs = "debug console=ttyS2,9600n8 root=/dev/ram rw";
>  
>  Are you sure you want 'debug' in your boot arguments?
> 
> The rest lgtm. I can remove debug when applying, or leave it there if
> it was intentional.

Ahh, I copied bootargs from "/proc/cmdline" on my machine (running old kernel) but I don't think I need it.

Thank you for pointing it out. Let me send out v2 patches in a few minutes (so you could apply without extra changes).


Cheers,

Tao
