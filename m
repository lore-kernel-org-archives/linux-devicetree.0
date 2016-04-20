From: Sergio Prado <sergio.prado@e-labworks.com>
Subject: Re: [PATCH v2] ARM: dts: imx6: Add dts for Embest MarS Board
Date: Wed, 20 Apr 2016 16:41:46 -0300
Message-ID: <5717DB7A.4030406@e-labworks.com>
References: <1460420743-30883-1-git-send-email-sergio.prado@e-labworks.com>
 <CAOMZO5AKdFtCZJSFg5ZJ2j8MBta_s=HSNBaH5a9zoTdkwQ477Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5AKdFtCZJSFg5ZJ2j8MBta_s=HSNBaH5a9zoTdkwQ477Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 19-04-2016 08:34, Fabio Estevam wrote:
> On Mon, Apr 11, 2016 at 9:25 PM, Sergio Prado
> <sergio.prado@e-labworks.com> wrote:
>
>> +&fec {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_enet>;
>> +       phy-mode = "rgmii";
>> +       phy-reset-gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
>
> Are you sure this is really active high?
>

You are right. Although the ethernet interface did work that way, the 
reset pin is active low. I will fix in V3.

Best regards,

Sergio Prado
