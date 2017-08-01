From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2 0/3] mailbox: arm: introduce smc triggered mailbox
Date: Tue, 1 Aug 2017 21:20:08 +0530
Message-ID: <CABb+yY04O+XQ5Dy=dEBYTcHEUwES_sFi1_3409qnUgV0r1y_bQ@mail.gmail.com>
References: <1500852206-28771-1-git-send-email-andre.przywara@arm.com>
 <ffabbe33-5edd-4642-6038-5b48c87ad372@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ffabbe33-5edd-4642-6038-5b48c87ad372@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Graf <agraf@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Andre Przywara <andre.przywara@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>, Sudeep Holla <sudeep.holla@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 1, 2017 at 4:20 PM, Alexander Graf <agraf@suse.de> wrote:
> Hi Andre,
>
> On 24.07.17 01:23, Andre Przywara wrote:
>>
>> This is a reworked version of my previous post. It addresses Jassi's
>> comments on the driver and also tries to cover Rob's and Mark's comments
>> on the binding documentation.
>> I dropped the more example-like DT changes from v1, as they are actually
>> not meant to be merged into the Linux tree, but instead are provided as
>> part of some firmware actually implementing this functionality.
>>
>> Please let me know what you think.
>
>
> Could you please quickly explain what it would take to provide SCMI on top
> of this instead of SCPI?
>
> https://lkml.org/lkml/2017/6/7/624
>
The SCMI (and SCPI) code is broken, that is, unless the firmware/SM is
trained to ignore the random value (pointer to a structure) passed via
R1. Which may be possible to do, but is surely a sign of poor
implementation. And may not be possible if some protocol other than
SCMI runs in parallel.

Andre, your take please?

Thanks.
