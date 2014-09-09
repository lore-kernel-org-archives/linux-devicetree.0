From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v7 2/5] ARM: imx6: gpc: Add PU power domain for GPU/VPU
Date: Tue, 9 Sep 2014 21:01:08 +0200
Message-ID: <CAPDyKFozmLLEwK297K0mtvf-m_fUC79ZstbF6V-TAnNTh41VZw@mail.gmail.com>
References: <1409060791-23167-1-git-send-email-p.zabel@pengutronix.de>
 <1409060791-23167-3-git-send-email-p.zabel@pengutronix.de>
 <CAPDyKFovJOVyKRNSA+sEjd4mXA9QYYYDQEAvTzkptj8FDzgWTQ@mail.gmail.com>
 <1410177246.3981.34.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1410177246.3981.34.camel@paszta.hi.pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

[...]

>> > +       is_off = IS_ENABLED(CONFIG_PM_RUNTIME);
>> > +       if (is_off)
>> > +               imx6q_pm_pu_power_off(&imx6q_pu_domain.base);
>>
>> Could you elaborate why is_off depends on CONFIG_PM_RUNTIME? That
>> seems strange to me. :-)
>>
>> Additionally, I think it would be better to leave the domain "on"
>> state. Wouldn't that even be required for some drivers to be able to
>> succeed probing of these devices?
>
> The devices in the PU power domain are Vivante GPUs and the CODA Video
> Processing Unit. These are platform devices that don't need to be active
> to enumerate before being probed. The drivers support runtime PM, so if
> CONFIG_PM_RUNTIME is enabled, it is safe to disable the PU power domain
> on boot. The drivers will probe and request for the power domain to be
> enabled via runtime PM before accessing the hardware.
>
> If CONFIG_PM_RUNTIME is disabled, the power domain needs to stay enabled
> at all times.

Hi Philipp,

Thanks for your reply, that certainly made it clear on what you would
like to accomplish.

Before discussing further consequences in genpd of this approach
(using IS_ENABLED(CONFIG_PM_RUNTIME)), I would be interested to see
how the runtime PM support is implemented for any of the drivers you
refer to. Do you mind pointing me to any of them?

Kind regards
Uffe
