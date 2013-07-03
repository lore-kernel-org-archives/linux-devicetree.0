From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Wed, 03 Jul 2013 10:20:37 +0200
Message-ID: <51D3DED5.8080204@gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk> <51D330AC.5060903@gmail.com>
 <20130702202548.GE13924@flint.arm.linux.org.uk>
 <20130702215048.GI516@pengutronix.de>
 <CAPM=9ty8W7wEewLpcKjNV-RXzVnReKVrPu_MGN80=Y-xPr-f+w@mail.gmail.com>
 <20130703065559.GJ516@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130703065559.GJ516-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/03/13 08:55, Sascha Hauer wrote:
> On Wed, Jul 03, 2013 at 08:02:05AM +1000, Dave Airlie wrote:
>> Have you also considered how suspend/resume works in such a place,
>> where every driver is independent? The ChromeOS guys have bitched
>> before about the exynos driver which is has lots of sub-drivers, how
>> do you control the s/r ordering in a crazy system like that? I'd
>> prefer a central driver, otherwise there is too many moving parts.
>
> Composing a DRM device out of subdevices doesn't necessarily mean the
> components should be suspended/resumed in arbitrary order. The DRM
> device should always be suspended first (thus deactivating sub devices
> as necessary and as done already) and resumed last.
>
> Note that a super node approach does not solve this magically. We would
> still have to make sure that the i2c bus masters on our SoC are suspended
> after the DRM device.

+1 for a video card supernode that at best should be some very generic
node with standard properties provided by DRM backend. IIRC there was
a proposal for of_video_card a while ago.

At least for Marvell SoCs, moving device nodes out of the bus structure
will not work. The parent bus is _required_ for address mapping as the
base address is configurable. Using phandles can solve this without
moving nodes.

Also, having separate device nodes does not require a separate driver
for each nodes. All nodes get platform_devices registered, but you can
choose not to have a matching driver for it. Then the video card super
node can pick up that nodes by using the phandles passed and register
a single DRM driver claiming the devices.

Moreover, if we talk about SoC graphics, we have to take audio into
account. If you move all nodes to your video card super node, you will
add another bunch of issues for ASoC linking to e.g. the I2C HDMI
transmitter SPDIF codec.

IMHO phandles and super node subnodes are equivalent from a driver
point-of-view but phandles are more likely to cause less pain for
other subsystems.

The super node approach will also allow to have the same SoC/board
components being used as single video card or multiple video cards
environment. There is virtually no way to automatically determine what
devices belong to "your" video card(s) in a SoC, so we need something to
describe those cards.

One thing I am concerned about is what Sascha pointed out above. If you
hook up an external I2C encoder to your card, you cannot make sure I2C
bus is suspended before DRM device. To be honest, proposing a solution
for that is still way beyond my expertise wrt to Linux internals, so I
am not even trying it. Maybe I am even missing a very important point
for the super node/phandle proposal, if so, please clarify.

Sebastian
