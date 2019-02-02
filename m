From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v2] arm64/hisilicon: fix SDcard detection
Date: Sat, 2 Feb 2019 09:52:52 +0100
Message-ID: <CAKfTPtDcHC=gbKciUVWb6_q=qyEcBZNnYpQ_VvYo0EsbST41BQ@mail.gmail.com>
References: <1547454274-1674-1-git-send-email-vincent.guittot@linaro.org>
 <3722223a-4f06-3e1c-86ca-542289c7c918@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3722223a-4f06-3e1c-86ca-542289c7c918@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wei Xu <xuwei5@hisilicon.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, LAK <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Wei,

On Fri, 1 Feb 2019 at 18:00, Wei Xu <xuwei5@hisilicon.com> wrote:
>
> Hi Vincent,
>
> On 1/14/2019 8:24 AM, Vincent Guittot wrote:
> > The SDcard detection of hikey960 is active low so cd-inverted is wrong.
> > Instead of adding cd-inverted, we should better set correctly cd-gpios
> > to use GPIO_ACTIVE_LOW.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
>
> Updated the subject as Leo suggested and applied to the hisilicon tree.

Thanks

> Thanks!
>
> Best Regards,
> Wei
>
> > ---
> >
> > SD card detection was not working on v5.0-rc1 but patch
> > https://marc.info/?l=linux-mmc&m=154637189021211&w=2 makes it work.
> > Nevertheles, latest changes in of_mmc_detection makes possible to have
> > a correct DT config.
> >
> >  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> > index 71bfe41..dc314e7 100644
> > --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> > +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> > @@ -665,8 +665,7 @@
> >       sd-uhs-sdr50;
> >       sd-uhs-sdr104;
> >       disable-wp;
> > -     cd-inverted;
> > -     cd-gpios = <&gpio25 3 0>;
> > +     cd-gpios = <&gpio25 3 GPIO_ACTIVE_LOW>;
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&sd_pmx_func
> >                    &sd_clk_cfg_func
> >
>
