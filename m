From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Subject: Re: [PATCH v8 2/2] ARM: dts: TS-4600: add basic device tree
Date: Thu, 7 Dec 2017 12:06:11 -0500
Message-ID: <1f11151e-fa71-5af6-245d-482fcbcec5e9@savoirfairelinux.com>
References: <20171123210410.7107-1-sebastien.bourdelin@savoirfairelinux.com>
 <20171123210410.7107-2-sebastien.bourdelin@savoirfairelinux.com>
 <CAOMZO5DcM0u9+DZjywsqadu834++rXAckqnkMqzZOo-vgFVs_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5DcM0u9+DZjywsqadu834++rXAckqnkMqzZOo-vgFVs_w@mail.gmail.com>
Content-Language: fr-classic
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, kernel@savoirfairelinux.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Featherston <mark@embeddedarm.com>, kris@embeddedarm.com
List-Id: devicetree@vger.kernel.org

Hi Fabio

On 11/26/2017 02:39 PM, Fabio Estevam wrote:
> Hi Sebastien,
> 
> On Thu, Nov 23, 2017 at 7:04 PM, Sebastien Bourdelin
> <sebastien.bourdelin@savoirfairelinux.com> wrote:
> 
>> +       reg_vddio_sd0: regulator-vddio-sd0 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vddio-sd0";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               regulator-boot-on;
>> +               gpio = <&gpio3 28 GPIO_ACTIVE_HIGH>;
> 
> It seems this should be GPIO_ACTIVE_LOW instead, as you don't pass
> 'enable-active-high' here.
> 

Yes! you are right, thanks for the catch!

Regards,
Sebastien.
