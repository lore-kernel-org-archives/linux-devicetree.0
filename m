From: Joachim  Eastwood <manabian@gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: skeleton: add unit name to memory node
Date: Wed, 30 Mar 2016 18:15:35 +0200
Message-ID: <CAGhQ9VykiwMWaw3xcJdg2CahNFt+sp7tFC5O8VwA=-_=UoJ8kA@mail.gmail.com>
References: <1459290646-3592-1-git-send-email-manabian@gmail.com>
 <1459290646-3592-3-git-send-email-manabian@gmail.com>
 <20160330110611.GB25354@leverpostej> <56FBCF70.80006@mentor.com>
 <20160330134155.GC25354@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160330134155.GC25354@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 30 March 2016 at 15:41, Mark Rutland <mark.rutland@arm.com> wrote:
> On Wed, Mar 30, 2016 at 04:06:56PM +0300, Vladimir Zapolskiy wrote:
>> On 30.03.2016 14:06, Mark Rutland wrote:
>> > On Wed, Mar 30, 2016 at 12:30:41AM +0200, Joachim Eastwood wrote:
>> >> Add unit name to memory to remove the following warning:
>> >>  Warning (unit_address_vs_reg): Node /memory has a reg or ranges
>> >>                            property, but no unit name
>> >
>> > If anything, it would be better to get rid of the memory node from the
>> > skeleton DTs.
>> >
>> > For DTs which have a memory node there's no problem, and DTs which
>> > expect a bootlaoder to fill things in have a logical place to document
>> > that fact.
>
>> The only problem I see if DTB is updated on a board but a board bootloader
>> on fix-up is capable to fill a preexisting "/memory" device node in only,
>> otherwise it is not clear why the device node is present in skeleton.dtsi.
>
> Sure. To clarify the above, what I expect that for this case is that the
> empty memory node would exist in the dts for that particular board,
> along with a comment, e.g.
>
>         /* The firmware/bootloader for $BOARD fills this in */
>         memory {
>                 device_type = "memory";
>                 reg = <0 0 0 0>;
>         };

To avoid the warning with the new dtc this would need to be memory@0.


> That way you can tell at a glance that the lack of memory information in
> the DT for a board is intentional, and the bootloader still gets the
> node it expects.


But this doesn't seem to be a "problem" with any of the DTs in
arch/arm/boot as they all defined a memory node.

I used the following script to check for the memory node in all built dtb's.
  make ARCH=arm CONFIG_OF_ALL_DTBS=y dtbs
  for i in $(ls arch/arm/boot/dts/*.dtb); do
         m=$(scripts/dtc/dtc -I dtb -O dts $i | grep -m1 'memory.*{')
         if [ -z "$m" ]; then
                 echo "Missing memory node in $i"
          fi
  done

So it should be pretty safe to just remove the memory node entry in
the skeleton files. Unless I have missed something with the script
above.


regards,
Joachim Eastwood
