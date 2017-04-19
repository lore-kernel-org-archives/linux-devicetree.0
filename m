From: Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] usb: dwc3: add disable u2mac linestate check quirk
Date: Tue, 18 Apr 2017 22:15:46 -0700
Message-ID: <CABXOdTeszyp834fjYpqESqpKkgzt58Qjms=g+5G5U3Mx4y=b+A@mail.gmail.com>
References: <1492492659-19266-1-git-send-email-william.wu@rock-chips.com>
 <CABXOdTctJLh7rno=U9Zr91SvuLtwyzWo0vuE0h08uxV63LsK7A@mail.gmail.com> <67e21e78-2f4e-47eb-38f5-734fe13dccab@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <67e21e78-2f4e-47eb-38f5-734fe13dccab-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wlf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 18, 2017 at 8:59 PM, wlf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Dear Guenter,
>
>
>
> =E5=9C=A8 2017=E5=B9=B404=E6=9C=8818=E6=97=A5 21:18, Guenter Roeck =E5=86=
=99=E9=81=93:
>>
>> On Mon, Apr 17, 2017 at 10:17 PM, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> wrote:
>>>
>>> This patch adds a quirk to disable USB 2.0 MAC linestate check
>>> during HS transmit. Refer the dwc3 databook, we can use it for
>>> some special platforms if the linestate not reflect the expected
>>> line state(J) during transmission.
>>>
>>> When use this quirk, the controller implements a fixed 40-bit
>>> TxEndDelay after the packet is given on UTMI and ignores the
>>> linestate during the transmit of a token (during token-to-token
>>> and token-to-data IPGAP).
>>>
>>> On some rockchip platforms (e.g. rk3399), it requires to disable
>>> the u2mac linestate check to decrease the SSPLIT token to SETUP
>>> token inter-packet delay from 566ns to 466ns, and fix the issue
>>> that FS/LS devices not recognized if inserted through USB 3.0 HUB.
>>>
>>> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> ---
>>> Changes in v2:
>>> - fix coding style
>>>
>>>   Documentation/devicetree/bindings/usb/dwc3.txt |  2 ++
>>>   drivers/usb/dwc3/core.c                        | 14 ++++++++++----
>>>   drivers/usb/dwc3/core.h                        |  4 ++++
>>>   3 files changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> index f658f39..6a89f0c 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> @@ -45,6 +45,8 @@ Optional properties:
>>>                          a free-running PHY clock.
>>>    - snps,dis-del-phy-power-chg-quirk: when set core will change PHY
>>> power
>>>                          from P0 to P1/P2/P3 without delay.
>>> + - snps,tx-ipgap-linecheck-dis-quirk: when set, disable u2mac linestat=
e
>>> check
>>> +                       during HS transmit.
>>
>> All other disable-something quirks are named
>> "snps,dis-something-quirk". Maybe use the same naming convention ?
>
> Yes, good idea=EF=BC=81 I will fix it with "snps,dis-tx-ipgap-linecheck-q=
uirk"  in
> next patch verison.
> Thanks:-)
>>
>>
>>>    - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
>>>                          utmi_l1_suspend_n, false when asserts
>>> utmi_sleep_n
>>>    - snps,hird-threshold: HIRD threshold
>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>> index 455d89a..03429c5 100644
>>> --- a/drivers/usb/dwc3/core.c
>>> +++ b/drivers/usb/dwc3/core.c
>>> @@ -796,15 +796,19 @@ static int dwc3_core_init(struct dwc3 *dwc)
>>>                  dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
>>>          }
>>>
>>> +       reg =3D dwc3_readl(dwc->regs, DWC3_GUCTL1);
>>> +
>>
>> My understanding is that the register was only introduced with dwc3
>> revision 2.50a. Is it ok to read and write it unconditionally ?
>
> Yes, refer to dwc3 databook, the DWC3_GUCTL1 was introduced since 2.50a.
> Maybe it's better
> to read and write it only when we know our controller version.
>
> Is it good to fix it like the following patch?
> But this patch has a problem that we need to read and write the register
> twice if our controller verison > =3D 2.90a, and need this quirk.
>
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -806,6 +806,12 @@ static int dwc3_core_init(struct dwc3 *dwc)
>                 dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
>         }
>
> +       if (dwc->dis_tx_ipgap_linecheck_quirk) {
> +               reg =3D dwc3_readl(dwc->regs, DWC3_GUCTL1);
> +               reg |=3D DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
> +               dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
> +       }
> +
>

How about this ?

    if (dwc->revision >=3D DWC3_REVISION_250A) {
        reg =3D dwc3_readl(dwc->regs, DWC3_GUCTL1);
        if (dwc->revision >=3D DWC3_REVISION_290A)
            reg |=3D DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
        if (dwc->dis_tx_ipgap_linecheck_quirk)
           reg |=3D DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
        dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
    }

Thanks,
Guenter

> Hi John & Felipe,
>        Could you provide me some suggestion=EF=BC=9F
>        Thank you=EF=BC=81
>
>>>          /*
>>>           * Enable hardware control of sending remote wakeup in HS when
>>>           * the device is in the L1 state.
>>>           */
>>> -       if (dwc->revision >=3D DWC3_REVISION_290A) {
>>> -               reg =3D dwc3_readl(dwc->regs, DWC3_GUCTL1);
>>> +       if (dwc->revision >=3D DWC3_REVISION_290A)
>>>                  reg |=3D DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
>>> -               dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
>>> -       }
>>> +
>>> +       if (dwc->tx_ipgap_linecheck_dis_quirk)
>>> +               reg |=3D DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
>>> +
>>> +       dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
>>>
>>>          return 0;
>>>
>>> @@ -1023,6 +1027,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>>                                  "snps,dis-u2-freeclk-exists-quirk");
>>>          dwc->dis_del_phy_power_chg_quirk =3D
>>> device_property_read_bool(dev,
>>>                                  "snps,dis-del-phy-power-chg-quirk");
>>> +       dwc->tx_ipgap_linecheck_dis_quirk =3D
>>> device_property_read_bool(dev,
>>> +                               "snps,tx-ipgap-linecheck-dis-quirk");
>>>
>>>          dwc->tx_de_emphasis_quirk =3D device_property_read_bool(dev,
>>>                                  "snps,tx_de_emphasis_quirk");
>>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>>> index 981c77f..3c2537b 100644
>>> --- a/drivers/usb/dwc3/core.h
>>> +++ b/drivers/usb/dwc3/core.h
>>> @@ -204,6 +204,7 @@
>>>   #define DWC3_GCTL_DSBLCLKGTNG          BIT(0)
>>>
>>>   /* Global User Control 1 Register */
>>> +#define DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS     BIT(28)
>>>   #define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW  BIT(24)
>>>
>>>   /* Global USB2 PHY Configuration Register */
>>> @@ -850,6 +851,8 @@ struct dwc3_scratchpad_array {
>>>    *                     provide a free-running PHY clock.
>>>    * @dis_del_phy_power_chg_quirk: set if we disable delay phy power
>>>    *                     change quirk.
>>> + * @tx_ipgap_linecheck_dis_quirk: set if we disable u2mac linestate
>>> + *                     check during HS transmit.
>>>    * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
>>>    * @tx_de_emphasis: Tx de-emphasis value
>>>    *     0       - -6dB de-emphasis
>>> @@ -1004,6 +1007,7 @@ struct dwc3 {
>>>          unsigned                dis_rxdet_inp3_quirk:1;
>>>          unsigned                dis_u2_freeclk_exists_quirk:1;
>>>          unsigned                dis_del_phy_power_chg_quirk:1;
>>> +       unsigned                tx_ipgap_linecheck_dis_quirk:1;
>>>
>>>          unsigned                tx_de_emphasis_quirk:1;
>>>          unsigned                tx_de_emphasis:2;
>>> --
>>> 2.0.0
>>>
>>>
>>
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
