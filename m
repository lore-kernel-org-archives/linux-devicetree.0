From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 2/3] ARM: sun7i/sun6i: dts: Add NMI
 irqchip support
Date: Wed, 26 Mar 2014 11:04:29 +0100
Message-ID: <5332A62D.90302@redhat.com>
References: <1395256879-8475-1-git-send-email-carlo@caione.org> <1395256879-8475-3-git-send-email-carlo@caione.org> <53329243.8090604@redhat.com> <20140326093946.GE6120@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBR6MZKMQKGQEHTMBAXI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140326093946.GE6120@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 03/26/2014 10:39 AM, Maxime Ripard wrote:
> On Wed, Mar 26, 2014 at 09:39:31AM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 03/19/2014 08:21 PM, Carlo Caione wrote:
>>> This patch adds DTS entries for NMI controller as child of GIC.
>>>
>>> Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
>>
>> Note this breaks the kernel on sun6i / A31 since we don't have a
>> pmic driver there yet, and thus the nmi gets constantly fired without
>> anything clearing it.
>>
>> So the sun6i section needs a status = "disabled"; until we actually have pmic
>> support.
> 
> I guess it also applies to the A20, since the PMIC patches will
> probably get merged later on?

Could be I've never tried it on the A20 without also having the pmic driver
build into the kernel. Thinking more about this, I think this actually is
a bug in the nmi irqchip driver, it should not unmask the gic irq until
it gets an unmask for its child irq itself.

Otherwise we can still get the same problem if ie the pmic driver is
a module, etc.

Hmm, looking at the code I see that it already masks (sets enable to 0)
the irq in sunxi_sc_nmi_irq_init. Note that this really should be
done before the irq_set_chained_handler call though, as from then on
the gic irq is unmasked, so we may get spurious irqs until the
sunxi_sc_nmi_write calls are done.

I don't think this will solve the A31 problem though, I wonder if
the enable reg-offset we've for the A31 is correct, maybe it should
be 8 like with the A20 ?

I'll give this a try when I can find some time for this.

Regards,

Hans
