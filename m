From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2] regulator: dt: fix the name of regulator supply
Date: Sat, 19 May 2012 18:08:28 +0530
Message-ID: <4FB79444.9010306@nvidia.com>
References: <1337369652-27094-1-git-send-email-ldewangan@nvidia.com> <20120519104303.GQ4039@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120519104303.GQ4039@opensource.wolfsonmicro.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "lrg@ti.com" <lrg@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Saturday 19 May 2012 04:13 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Sat, May 19, 2012 at 01:04:12AM +0530, Laxman Dewangan wrote:
>> If there is any input supply for regulator then the name
>> of supply need to provided by init_data->supply_regulator.
>> In dt case, the input supply is searched by the<name>-supply
>> and here it is require to fix the name so that correct device
>> node can be identified at the time of regulator registration.
>> Fixing the name for input supply as "regulator-supply".
> No, supply_regulator is a legacy thing.  Regulators should set
> supply_name in their regulator_desc to tell the framework what name
> the parent has, allowing these supplies to behave in the same way
> as other supplies as far as the binding goes.

So if there is two regulator ldo1 and ldo2 where ldo1 is supply for ldo2 
then
ldo1: ldo1 {
     :::::::
     :::::::
};

ldo2: ldo2 {
     :::::::
     ldo2-supply = <&ldo1>;
};


and when we parse the regulator node, we should see the property name as 
the <name>-supply i.e. ldo1-supply or ldo2-supply and when it found then 
we set the
regulator_desc->supply_name = "ldo2"?

The descriptor is set on the regulator driver and hence it need to be 
parse this in the regulator driver.
We need to set the name regulator_desc->supply_name and hence it needs 
to be in dt binding documentation of that device/regulators.

Is this what you recommend?




-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
