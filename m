From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 07/19] tegra: fdt: Add LCD definitions for
	Tegra
Date: Thu, 12 Jul 2012 10:21:01 +0200
Message-ID: <CAPnjgZ0Lv2rjVzNottsY+NWYmred5Au+hebUuTTOSAJufTkLjA@mail.gmail.com>
References: <1339604395-6621-1-git-send-email-sjg@chromium.org>
	<1339604395-6621-8-git-send-email-sjg@chromium.org>
	<4FDA749D.2030201@wwwdotorg.org>
	<CAPnjgZ2MUpjGS-BwQ6yASahFiu2OTWx4RUrJ7bkSkq72QmX++Q@mail.gmail.com>
	<20120711054842.GB10344@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20120711054842.GB10344@avionic-0098.mockup.avionic-design.de>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Stephen Warren <swarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Thierry,

On Wed, Jul 11, 2012 at 7:48 AM, Thierry Reding
<thierry.reding@avionic-design.de> wrote:
> On Wed, Jul 11, 2012 at 06:44:10AM +0200, Simon Glass wrote:
>> Hi Stephen,
>>
>> On Fri, Jun 15, 2012 at 1:32 AM, Stephen Warren <swarren@wwwdotorg.org>wrote:
>>
>> > On 06/13/2012 10:19 AM, Simon Glass wrote:
>> > > Add LCD definitions and also a proposed binding for LCD displays.
>> > >
>> > > The PWFM is in progress on the device-tree-discuss list, so only a
>> > > very basic binding is offered here.
>> >
>> > I believe we have settled on a final representation, it just hasn't been
>> > added into linux-next yet. See:
>> >
>> >
>> > http://gitorious.org/linux-pwm/linux-pwm/commit/d3ce73e5dc86646a6302f2b0f7dd40e8c552fa04
>>
>>
>> Thanks for the pointer. I suppose this doesn't address clocks as yet, but
>> that's fine.
>
> I was waiting for the common clock framework and DT bindings to get
> ready. This should happen RSN for Tegra so I will probably look at
> adding support for it in.

OK, are you looking at adding it in U-Boot?

>
> By the way, the PWM tree has now been in linux-next for a couple of
> weeks and I plan to submit it for inclusion in 3.6.

Yes Stephen pointed me to that so I picked it up, thanks.

>
>> > > I am not sure if it is better to have the lcd within the display
>> > > controller as with i2c/spi, or a separate node. From a hardware point
>> > > of view the LCD is certainly connected to the display controller, so
>> > > perhaps this version makes most sense. We could have a stand-alone
>> > > top-level lcd node with a phandle pointing to the display controller,
>> > > but these doesn't seem to be an obvious advantage to that approach.
>> >
>> > Equally, there's been extensive discussion re: how to represent the
>> > NVIDIA display controller in DT. I strongly believe that U-Boot
>> > shouldn't go ahead in isolation with a binding that's completely
>> > unrelated to what's happening in the kernel. Please can you take what
>> > Thierry is working on for the kernel, and/or contribute to that binding
>> > etc., so we don't end up with multiple ways of doing the same thing.
>> > Part of the whole point of DT is to have a single way of representing HW
>> > that multiple OSs (or perhaps bootloaders) cna use. If everyone just
>> > goes and does their own thing, we've lost.
>> >
>>
>> I can see the email here.
>>
>> http://lists.freedesktop.org/archives/dri-devel/2012-April/021223.html
>>
>> I posted this series originally in January. That email is from April, and I
>> don't see activity in the last 2 months. As previously discussed it is not
>> productive to chase a moving target.
>
> I had hoped I could get this finished much faster, but then things
> happened. However there has been quite some progress in the meantime.
>
> I actually based that very first version on what you had in the earlier
> Tegra LCD series with a couple of additions to support DRM
> specificities. However the proposal was shot down pretty early mainly
> because the display timing description was very Tegra specific. One
> proposal was to include an EDID blob directly into the DT and pass it on
> to DRM, which is what the current code does.
>
> Lately there's been some work on adding a generic description for
> display timings:
>
>         http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html
>
> I haven't tested that code yet, but it might turn out to be an
> interesting replacement for the EDID blob.

Yes I prefer it, it is much easier to see what is going on. I will put
something together based on that.

>
>> Thierry, have you settled on a binding yet? If not do you have something
>> sort-of close that I could use in U-Boot?
>
> The currently accepted form (as in "Stephen said it looks reasonable")
> is here:
>
>         http://lists.freedesktop.org/archives/dri-devel/2012-July/024899.html
>
> It currently only defines the bindings for the RGB and HDMI outputs, but
> that should be fine since from what I can tell your U-Boot driver
> supports RGB only anyway. It is probably also way more than you really
> need in U-Boot because it has DT nodes for all the graphics-related
> modules.

I also need a place to put the pwm and GPIOs for the panel itself.
Something like this:

		nvidia,pwm = <&pwm 2 0>;
		nvidia,backlight-enable-gpios = <&gpio 28 0>;	/* PD4 */
		nvidia,lvds-shutdown-gpios = <&gpio 10 0>;	/* PB2 */
		nvidia,backlight-vdd-gpios = <&gpio 176 0>;	/* PW0 */
		nvidia,panel-vdd-gpios = <&gpio 22 0>;		/* PC6 */
		nvidia,panel-timings = <4 203 17 15>;  (number of ms before turning
on the next gpio)
		nvidia,bits-per-pixel = <16>;    (er, TBD)

I am thinking of something like a phandle in your rgb node:

	host1x {
		dc@54200000 {
			rgb {
				nvidia-panel = <&lcd_panel>;
...

	lcd_panel: panel {
		nvidia,pwm = <&pwm 2 0>;
                ...
        }

Or have you already solved this problem another way?

Regards,
Simon

>
> Thierry
