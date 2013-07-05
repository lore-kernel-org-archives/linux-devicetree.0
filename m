From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Fri, 5 Jul 2013 09:43:36 +0100
Message-ID: <CACxGe6uRJ9B9qnPT_KLNphg-n2WeA9UFO-rvCdKJHijGqJ8SOg@mail.gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk>
 <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com> <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130703090242.GM516-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 3, 2013 at 10:02 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
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

It is however relevant to encode information about how devices are
related to each other. That could be an orthogonal binding though to
describe how displays are oriented relative to each other.

g.
