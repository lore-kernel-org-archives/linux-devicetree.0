From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCHv2 2/3] net: socionext: Add Synquacer NetSec driver
Date: Wed, 13 Dec 2017 21:16:24 +0530
Message-ID: <CABb+yY2VoKs_6CarHjf=_B9vQH06nh+D=RYbvRpvX_x=6RiM-A@mail.gmail.com>
References: <1513098873-20977-1-git-send-email-jassisinghbrar@gmail.com>
 <1513098954-21093-1-git-send-email-jassisinghbrar@gmail.com> <CAKv+Gu-6gb10VromMaTJkzpu1DovDO7B5-GWEQPs04qAG=2ksw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAKv+Gu-6gb10VromMaTJkzpu1DovDO7B5-GWEQPs04qAG=2ksw@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd.bergmann@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 12, 2017 at 10:54 PM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
> On 12 December 2017 at 17:15,  <jassisinghbrar@gmail.com> wrote:
....
>> +
>> +static int netsec_netdev_load_microcode(struct netsec_priv *priv)
>> +{
>> +       int err;
>> +
>> +       err = netsec_netdev_load_ucode_region(
>> +               priv, NETSEC_REG_DMAC_HM_CMD_BUF,
>> +               le32_to_cpup(priv->eeprom_base + NETSEC_EEPROM_HM_ME_ADDRESS_H),
>> +               le32_to_cpup(priv->eeprom_base + NETSEC_EEPROM_HM_ME_ADDRESS_L),
>> +               le32_to_cpup(priv->eeprom_base + NETSEC_EEPROM_HM_ME_SIZE));
>
> ... here, and in other places below, you are still dereferencing
> eeprom_base as if it is a pointer, which is not allowed with in the
> __iomem address space. This should use readl() instead [which happens
> to incorporate the endian swap as well]
>
Ahh, how could it have been just two revisions!

thanks
