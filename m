From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 3/4] arm64: dts: sdm845: Add minimal dts/dtsi files for
 sdm845 SoC and MTP
Date: Wed, 21 Feb 2018 15:23:57 -0800
Message-ID: <CAD=FV=WgyX-O8haJp3WpzPodV2f1sokL9hW_qe7R8hVYy3v+sg@mail.gmail.com>
References: <20180216060503.22006-1-rnayak@codeaurora.org>
 <20180216060503.22006-4-rnayak@codeaurora.org>
 <20180219163651.66936056@why.wild-wind.fr.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219163651.66936056@why.wild-wind.fr.eu.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, evgreen@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Feb 19, 2018 at 8:36 AM, Marc Zyngier <marc.zyngier@arm.com> wrote:
>> +                     interrupts = <GIC_SPI 208 IRQ_TYPE_NONE>;
>
> Please do not use IRQ_TYPE_NONE, ever. It doesn't exist in the GIC
> binding. Set it to the actual trigger value.
>

>> +                     interrupts = <GIC_SPI 481 IRQ_TYPE_NONE>;
>
> Same here.

Thanks for the review Marc!


Andy: If I'm reading everything correctly you're the one who would
collect these patches and apply them.  Is that right?  Do they look OK
to you in general?  Would you prefer that Rajendra send out a v5 with
the fixes pointed out by Marc, or would you prefer to fix them up
yourself when applying?  Is now a good time or would you prefer to
wait?

Thanks!  :)

-Doug
