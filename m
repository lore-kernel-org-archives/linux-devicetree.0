From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 3/3] ARM: at91/defconfig: update sama5 defconfig
Date: Thu, 15 Oct 2015 17:42:53 +0200
Message-ID: <561FC97D.2040806@atmel.com>
References: <1444824684-24526-1-git-send-email-ludovic.desroches@atmel.com>
 <1444824684-24526-3-git-send-email-ludovic.desroches@atmel.com>
 <20151015132451.GD3421@piout.net> <20151015153116.GE26893@odux.rfo.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151015153116.GE26893@odux.rfo.atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
Cc: plagnioj@jcrosoft.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cyrille.pitchen@atmel.com
List-Id: devicetree@vger.kernel.org

Le 15/10/2015 17:31, Ludovic Desroches a =E9crit :
> On Thu, Oct 15, 2015 at 03:24:51PM +0200, Alexandre Belloni wrote:
>> Hi,
>>
>> On 14/10/2015 at 14:11:24 +0200, Ludovic Desroches wrote :
>>> Add SAMA5D2 SoC plus Atmel flexcom and Atmel sdhci devices.
>>>
>>> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>>> ---
>>>  arch/arm/configs/sama5_defconfig | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>> It is probably worth updating the multi_v7_defconfig too (in a separ=
ate
>> patch).
>>
>=20
> Maybe I have to send a whole defconfig update . I mean when you do
> savedefconfig, you have more changes. I won't send each one separatel=
y. I
> have kept changes which were in relation with the stuff I had.
>=20
> Or I can send a defconfig update from the savedefconfig and then add
> sama5d2, flexcom and sdhci.

Actually you can do this for our own AT91 defconfigs.

=46or the multi_v7_defconfig I would recommend to simply make a patch w=
ith
our updates and let the arm-soc maintainer merge it with their current
one: I mean, they will manage the conflicts on this file anyway and the
changes to this file will not be part of one or our pull-requests but a
patch that they will handle separately: so no need to add more update
than the strictly needed ones on our end.

Bye,
--=20
Nicolas Ferre
