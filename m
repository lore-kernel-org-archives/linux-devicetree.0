From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 6/9] ARM: mvebu: add pinctrl device in DT for Armada
 370/XP SoCs
Date: Wed, 12 Sep 2012 14:57:33 -0600
Message-ID: <5050F73D.8050701@wwwdotorg.org>
References: <1345623750-10645-1-git-send-email-sebastian.hesselbarth@gmail.com> <1347266386-16229-1-git-send-email-sebastian.hesselbarth@gmail.com> <1347266386-16229-7-git-send-email-sebastian.hesselbarth@gmail.com> <504FB9D7.3030205@wwwdotorg.org> <20120912085652.21d3232f@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120912085652.21d3232f@skate>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/12/2012 12:56 AM, Thomas Petazzoni wrote:
> Le Tue, 11 Sep 2012 16:23:19 -0600,
> Stephen Warren <swarren@wwwdotorg.org> a =C3=A9crit :
>=20
>> On 09/10/2012 02:39 AM, Sebastian Hesselbarth wrote:
>>> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>>
>>> The Armada 370 and XP SoCs have configurable muxing for a certain
>>> number of their pins, controlled through a pinctrl driver.
>>
>> Hmmm. I'd be tempted just to put the entire node definition there;
>> putting in a .dtsi file just to share the reg property doesn't seem
>> especially useful.
>=20
> When you say "here" you're mentioning the SoC-specific .dtsi files (i=
=2Ee

(s/here/there I assume).

> the ones in PATCH 7/9 and PATCH 8/9), correct?

Yes, I believe so.

