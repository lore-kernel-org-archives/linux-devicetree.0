From: Rob Clark <robdclark@gmail.com>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Thu, 4 Jul 2013 11:11:59 -0400
Message-ID: <CAF6AEGuzwNJtuAWS29YvdZ1fiMGk5cuv24n4wxkKsDPT8FrDBw@mail.gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
	<20130702204255.2044c01b@armhf>
	<20130702191923.GD13924@flint.arm.linux.org.uk>
	<51D330AC.5060903@gmail.com>
	<CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
	<51D348F5.2080205@gmail.com>
	<00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
	<20130703090242.GM516@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130703090242.GM516@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Jean-Francois Moine <moinejf@free.fr>, Daniel Drake <dsd@laptop.org>, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, Russell King <rmk@arm.linux.org.uk>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 3, 2013 at 5:02 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> On Wed, Jul 03, 2013 at 05:57:18PM +0900, Inki Dae wrote:
>> > video {
>> >     /* Single video card w/ multiple lcd controllers */
>> >     card0 {
>> >             compatible = "marvell,armada-510-display";
>> >             reg = <0 0x3f000000 0x1000000>; /* video-mem hole */
>> >             /* later: linux,video-memory-size = <0x1000000>; */
>> >             marvell,video-devices = <&lcd0 &lcd1 &dcon>;
>> >     };
>> >
>> >     /* OR: Multiple video card w/ single lcd controllers */
>> >     card0 {
>> >             compatible = "marvell,armada-510-display";
>> >             ...
>> >             marvell,video-devices = <&lcd0>;
>> >     };
>> >
>> >     card1 {
>> >             compatible = "marvell,armada-510-display";
>> >             ...
>> >             marvell,video-devices = <&lcd1>;
>> >     };
>> > };
>>
>> Sorry but I'd like to say that this cannot be used commonly. Shouldn't you
>> really consider Linux framebuffer or other subsystems? The above dtsi file
>> is specific to DRM subsystem. And I think the dtsi file has no any
>> dependency on certain subsystem so board dtsi file should be considered for
>> all device drivers based on other subsystems: i.e., Linux framebuffer, DRM,
>> and so no. So I *strongly* object to it. All we have to do is to keep the
>> dtsi file as is, and to find other better way that can be used commonly in
>> DRM.
>
> +1 for not encoding the projected usecase of the graphics subsystem into
> the devicetree. Whether the two LCD controllers shall be used together
> or separately should not affect the devicetree. devicetree is about
> hardware description, not configuration.

I do like the supernode idea, it would have avoided the ugly
global-list-of-sub-devices in tilcdc (and probably some other
drivers).

As for projection of use-case, and whether it is something drm
specific or not..  if there is a way to make it generic enough that it
could work for fbdev, well I suppose that is nice.  Not a hard
requirement in my mind, or at least it is a secondary priority
compared to having a better way to having drm devices composed of
sub-{devices,nodes,whatever}.

BR,
-R

> Sascha
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
