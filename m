From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3 06/18] tegra: fdt: Add LCD definitions for
	Tegra
Date: Thu, 27 Sep 2012 06:58:52 -0700
Message-ID: <CAPnjgZ2NAf4PF0_U9hQeJzpdL87ZNq+WpxsbFJQHbh4rY2MoEg@mail.gmail.com>
References: <1342106718-3058-1-git-send-email-sjg@chromium.org>
	<1342106718-3058-7-git-send-email-sjg@chromium.org>
	<CAPnjgZ2SbVVKxUdW1cvLf_9rAWLWeiVr-y6S_sz-Uw5_O_AyQA@mail.gmail.com>
	<501803F3.6090803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <501803F3.6090803@wwwdotorg.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Stephen Warren <swarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Tue, Jul 31, 2012 at 9:12 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 07/31/2012 03:27 AM, Simon Glass wrote:
>> On Thu, Jul 12, 2012 at 4:25 PM, Simon Glass <sjg@chromium.org> wrote:
>>> Add LCD definitions and also a proposed binding for LCD displays.
>>>
>>> The PWM is as per what will likely be committed to linux-next soon.
>>>
>>> The displaymode binding comes from a proposal here:
>>>
>>> http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html
>>>
>>> The panel binding is new, and fills a need to specify the panel
>>> timings and other tegra-specific information. Should a binding appear
>>> that allows the pwm to handle this automatically, we can revisit
>>> this.
>>
>> Any comments on this binding please? The main addition from Thierry's
>> one posted on LMKL is the LCD resolution selection.
>
> I have some concerns about the way the mode is represented in the
> binding; the timing parameters are quite different to how e.g. an EDID
> DTD would represent them, which I think will lead to conversion mistakes
> when writing the DT.
>
> I'm trying to get along of Sascha's original email so I can join in on
> that discussion.

Did you get any resolution here?

>
>>> diff --git a/doc/device-tree-bindings/video/tegra20-dc.txt b/doc/device-tree-bindings/video/tegra20-dc.txt
>
>>> +Optional properties (rgb):
>>> + - nvidia,frame-buffer: address of frame buffer (if omitted it will be
>>> +               calculated)
>>> +       - This may be useful to share an address between U-Boot and Linux and
>>> +               avoid boot-time corruption / flicker
>
> Why can't the display driver read this out of the display registers,
> instead of requiring the same information to be passed using DT too?

The U-Boot display driver needs to set this value in the display
registers - at reset I don't think we can rely on any particular
value.

Do you mean the kernel display driver? Well it could, but it doesn't.
Really this is just a way of getting U-Boot and Linux to agree on the
address, by having U-Boot know the address that the kernel will happen
to use. It isn't very robust, but we have found it useful as a means
of avoiding problems in this area.

Regards,
Simon
