From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 5/7] net: of_mdio: parse "max-speed" property to set PHY
 supported features
Date: Thu, 5 Dec 2013 15:53:41 -0800
Message-ID: <CAGVrzcYeRi=j3PkRbtNXwYFGOr9m7Yco0jORdp76i+DcRNpMFA@mail.gmail.com>
References: <1386283936-26104-1-git-send-email-florian@openwrt.org>
 <1386283936-26104-6-git-send-email-florian@openwrt.org> <52A11F00.1070603@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <52A11F00.1070603@cogentembedded.com>
Sender: netdev-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, abrodkin@synopsys.com, Rob Herring <rob.herring@calxeda.com>, Mark Rutland <mark.rutland@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

2013/12/5 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>:
>>
>> +       /* Set phydev->supported based on the "max-speed" property
>> +        * if present */
>
>
>    Preferred multi-line comment style is this:
>
> /*
>  * bla
>  * bla
>  */

All other comments in this file are:

/* bla
 * bla
 */

which is why I used the same style.
-- 
Florian
