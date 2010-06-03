From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of/crypto: n2_core.c: Fix build failures
Date: Wed, 2 Jun 2010 21:00:02 -0600
Message-ID: <AANLkTimML1WcKSraNyuUyVIxW7HtCeExLt2tFtwGM06T@mail.gmail.com>
References: <20100602.194549.200117567.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20100602.194549.200117567.davem@davemloft.net>
Sender: linux-crypto-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: agust@denx.de, linux-crypto@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, herbert@gondor.apana.org.au
List-Id: devicetree@vger.kernel.org

On Wed, Jun 2, 2010 at 8:45 PM, David Miller <davem@davemloft.net> wrot=
e:
> From: agust@denx.de
> Date: Thu, =A03 Jun 2010 01:35:41 +0200
>
>> From: Anatolij Gustschin <agust@denx.de>
>>
>> Fixes build errors caused by the:
>> - OF device_node pointer being moved into struct device
>> - removal of the match_table and name fields from
>> =A0 struct of_platform_driver
>>
>> Signed-off-by: Anatolij Gustschin <agust@denx.de>
>
> This is already fixed in the crypto GIT tree.

thanks, dropped.

g.


--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
