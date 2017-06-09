From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] DT: pinctrl: Add binding documentation for Spreadtrum
 pin controller
Date: Fri, 9 Jun 2017 09:59:03 +0200
Message-ID: <CACRpkdaqCPLsmGWXXrfVdOgBqWHQO5pTSjgd6hZhjNFrjanKQA@mail.gmail.com>
References: <a1fa5b612de318213bab4404997d133ed118f5d2.1495863824.git.baolin.wang@spreadtrum.com>
 <CACRpkdZFUDrfoyvk-CramNP2OVwVAazVsw3S-wCayx8HP6cSZQ@mail.gmail.com> <20170531075827.GA31518@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170531075827.GA31518-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 31, 2017 at 9:58 AM, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> w=
rote:
> On =E4=B8=80,  5=E6=9C=88 29, 2017 at 06:18:29=E4=B8=8B=E5=8D=88 +0200, L=
inus Walleij wrote:

>> > +pad driving level, system control select
>>
>> Actually I do not understand at all what "domain pad driving level"
>> or "system control select" means, those are very generic terms.
>> Can you describe precisely what it means? What domain? What
>> is a domain pad? What kind of system control? What is it selecting
>> between?
>
> I try to explain what they are on Spreadtrum platform. One pin can output
> 3.0v or 1.8v, depending on the related domain pad driving selection, if
> the related domain pad slect 3.0v, then the pin can output 3.0v.

This can probably use the generic pin control property
PIN_CONFIG_POWER_SOURCE (see include/linux/pinctrl/pinconf-generic.h)
and the corresponding DT binding "power-source" see
drivers/pinctrl/pinconf-generic.c and
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

> "system control" is used to choose this function (like: UART0) for which
> system, since we have several systems (AP/CP/CM4) on one SoC.

Aha, that sounds like a very spreadtrum-specific feature actually.

> Since we have lots of different pin configuration to set, it will be hard=
 to
> use the standard pin config describing in binding files. But I will try t=
o
> remove the magic number and use the common pin config.

It is possible to use generic config and add a few custom bindings
"on top" of it. See for example:
Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
mixing a few generic and Qualcomm-specific pin config things,
and their driver is here:
drivers/pinctrl/qcom/pinctrl-spmi-mpp.c

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
