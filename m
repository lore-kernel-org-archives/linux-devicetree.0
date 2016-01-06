From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/1] regulator: max8973: add support for junction thermal
 warning
Date: Wed, 6 Jan 2016 19:50:26 +0530
Message-ID: <568D22AA.8030902@nvidia.com>
References: <1452060922-24426-1-git-send-email-ldewangan@nvidia.com> <20160106121857.GW6588@sirena.org.uk> <568D064A.8080609@nvidia.com> <20160106123735.GX6588@sirena.org.uk> <20160106142521.GA11188@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160106142521.GA11188@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wednesday 06 January 2016 07:55 PM, Rob Herring wrote:
> On Wed, Jan 06, 2016 at 12:37:35PM +0000, Mark Brown wrote:
>> On Wed, Jan 06, 2016 at 05:49:22PM +0530, Laxman Dewangan wrote:
>>> On Wednesday 06 January 2016 05:48 PM, Mark Brown wrote:
>>>> * PGP Signed by an unknown key
>>>> On Wed, Jan 06, 2016 at 11:45:22AM +0530, Laxman Dewangan wrote:
>>>>>   Enhanced transient response (ETR) will affect the configuration of CKADV.
>>>>> +-maxim,junction-temp-warning: Junction temp warning on which device generates
>>>>> +		warning interrupts.
>>>> This needs to specify what the values are - it looks like it's raw
>>>> register values but I'd have expected from this that it'd be an actual
>>>> temperature.
>>> I tried to roundoff to the next higher threshold when supported value (120
>>> or 140 degC) is not provided in driver. But it is fine to me to specify the
>>> possible value setting here and DT binding doc. Will do on next patch.
>> I don't really mind which you use so long as the documentation is clear.
> I prefer that degrees are used rather than register values.
>
 From DT/platform, any values can be passed. Driver will round off to 
next higher side.
The document details will only provide what is supported by the PMIC device.
E.g. It can pass to ,<=120C and driver will set nearest threshold which 
is 120C.
If it is >120C then it will set to 140C.
