From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 09/14] fdt: Add polarity-aware gpio functions
 to fdtdec
Date: Thu, 15 Nov 2012 16:46:28 -0700
Message-ID: <50A57ED4.9030103@wwwdotorg.org>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
	<1351218671-15228-10-git-send-email-sjg@chromium.org>
	<1351235842.20572.10.camel@tellur>
	<CAPnjgZ0x=1mgwZ049amB1G4ADM_bBke3TY33Co7cNnHhc3V5zg@mail.gmail.com>
	<5091FF8B.7040109@wwwdotorg.org>
	<CAPnjgZ0qt200WSzmYXXCiEZ6d_d8mxVs1MU-byA7-JDM_JR4rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ0qt200WSzmYXXCiEZ6d_d8mxVs1MU-byA7-JDM_JR4rQ@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Sean Paul <seanpaul@chromium.org>, Tom Rini <trini@ti.com>
List-Id: devicetree@vger.kernel.org

On 11/15/2012 04:31 PM, Simon Glass wrote:
> Hi Stephen,
> 
> On Wed, Oct 31, 2012 at 9:50 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>> On 10/31/2012 05:59 PM, Simon Glass wrote:
>>> Hi,
>>>
>>> On Fri, Oct 26, 2012 at 12:17 AM, Lucas Stach <dev@lynxeye.de> wrote:
>>>> Am Donnerstag, den 25.10.2012, 19:31 -0700 schrieb Simon Glass:
>>>>> From: Sean Paul <seanpaul@chromium.org>
>>>>>
>>>>> Add get and set gpio functions to fdtdec that take into account the
>>>>> polarity field in fdtdec_gpio_state.flags.
>>>>>
>>>> In another thread Stephen Warren and I came to the conclusion that we
>>>> most likely should remove this polarity flag from the GPIO bindings.
>>>>
>>>> Currently it is only for the USB VBUS GPIO which should move over to
>>>> regulators once they land in U-Boot. Do you have any other applications
>>>> for this flag, so we might reconsider removing it?
>>>>
>>>
>>> Well, any time you have a flag which is inverted in meaning, it can be
>>> useful. We have several switches on the board which can be active high
>>> or low, and polarity is used for that.
>>>
>>> In fact, it would be nice IMO to be able to specify input/output as
>>> well. I know the exynos bindings do this. There is a noddy function
>>> called fdtdec_setup_gpio() in U-Boot which really needs to be sorted
>>> out. I discussed with Stephen some time ago how GPIOs should be
>>> SOC-specific and it should be possible to set up a GPIO with a single
>>> call, as Linux does. The more information there is in the binding, the
>>> more it can do automatically.
>>>
>>> Does the Tegra Linux GPIO binding still have a polarity?
>>
>> Yes it does, although in practice it can't be used (and hence should
>> really be removed), since not all GPIO bindings have such a flag, so
>> there is always a need for a separate property to indicate the polarity
>> (c.f. fixed-regulator with GPIO control bindings for example).
>>
> 
> I've had a bit of time to look into this. I see that the regulator
> framework in the kernel seems to be used for various control purposes,
> and provides useful polarity stuff. I was rather hoping that GPIOs
> could be a bit more high level in U-Boot, with information about:
> 
> - input/output
> - drive strength
> - polarity
> - pull up/down
> 
> In fact most of these are actually supported in most kernel bindings,
> but of course it is binding-specific. Would it be useful to ask for a
> polarity setting in the GPIO. When it is not available, the polarity
> would then always be normal.
> 
> This might avoid moving polarity and input/output selecting down into
> each client of the gpio, which seems undesirable in general.
> 
> Should we consider a second level of indirection for GPIOs to support
> these non-binding features? It seems a bit complicated though.
> 
> However, if it is too late to do this, or not desirable for some
> reason, then we should just drop this patch.

The issue may not be bad enough we have to drop flag usage. It's also
being discussed at:

http://www.spinics.net/lists/arm-kernel/msg206299.html

I'd recommend seeing how that pans out before making a decision whether
to start/keep using flags or not.
