From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v18 6/6] ARM: socfpga: fpga bridge driver support
Date: Mon, 8 Aug 2016 13:44:59 -0700
Message-ID: <CAAtXAHev2Dytadp-_Hs0agcSXUTyrFhJQxHcsFd7faOReHzr9Q@mail.gmail.com>
References: <20160712193645.9098-1-atull@opensource.altera.com>
 <20160712193645.9098-7-atull@opensource.altera.com>
 <CAP=VYLo2jtp57kQe5671xM=4o_ZAU6XG_W1MXU8aPv4Ws7kkDA@mail.gmail.com>
 <alpine.DEB.2.02.1608081416110.11063@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.02.1608081416110.11063@linuxheads99>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: atull <atull@opensource.altera.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matthew Gerlach <mgerlach@altera.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Alan Tull <delicious.quinoa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Alan,

On Mon, Aug 8, 2016 at 12:18 PM, atull <atull@opensource.altera.com> wrote:

>> Please don't use module.h in drivers controlled by a bool
>> Kconfig setting.
>>
>> THanks,
>> Paul.
>>
>
> Thanks for the feedback.  Can you provide an example of what you
> would consider to be proper usage in the kernel?


I think Paul is suggesting to use

static int __init alt_fpga_bridge_init(void)
{
        platform_driver_register(&alt_fpga_bridge_driver);
}

device_initcall(alt_fpga_bridge_init);

or better:

builtin_platform_driver(&alt_fpga_bridge_driver);

Like for example in: drivers/cpuidle/cpuidle-mvebu-v7.c

Cheers,

Moritz
