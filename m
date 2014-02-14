From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v5 00/10] Support for the Broadcom GENET driver
Date: Thu, 13 Feb 2014 23:07:00 -0800
Message-ID: <52FDC094.1020104@gmail.com>
References: <1392336531-28875-1-git-send-email-f.fainelli@gmail.com> <20140214.002901.293996041341946875.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20140214.002901.293996041341946875.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, cernekee@gmail.com, mark.rutland@arm.com, romieu@fr.zoreil.com
List-Id: devicetree@vger.kernel.org

Le 13/02/2014 21:29, David Miller a =E9crit :
> From: Florian Fainelli <f.fainelli@gmail.com>
> Date: Thu, 13 Feb 2014 16:08:41 -0800
>
>> This patchset adds support for the Broadcom GENET Gigabit Ethernet M=
AC
>> controller. This controller is found on the Broadcom BCM7xxx Set Top=
 Box
>> System-on-a-chips.
>>
>> Changes since v4:
>> - add dependency on CONFIG_OF
>>
>> Changes since v3:
>> - fixed Kconfig dependency on FIXED_PHY
>>
>> Changes since v2:
>> - dropped the patch that adds an "internal" phy-mode
>
> Series applied, thanks.

Great, thanks David!
--
=46lorian
