From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2] regulator: dt: fix the name of regulator supply
Date: Sat, 19 May 2012 19:51:16 +0530
Message-ID: <4FB7AC5C.9060609@nvidia.com>
References: <1337369652-27094-1-git-send-email-ldewangan@nvidia.com> <20120519104303.GQ4039@opensource.wolfsonmicro.com> <4FB79444.9010306@nvidia.com> <20120519131019.GS4039@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120519131019.GS4039@opensource.wolfsonmicro.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "lrg@ti.com" <lrg@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Saturday 19 May 2012 06:40 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Sat, May 19, 2012 at 06:08:28PM +0530, Laxman Dewangan wrote:
>
>> The descriptor is set on the regulator driver and hence it need to
>> be parse this in the regulator driver.
>> We need to set the name regulator_desc->supply_name and hence it
>> needs to be in dt binding documentation of that device/regulators.
>> Is this what you recommend?
> I'm sorry, I still can't understand what you're trying to say here
> especially the first sentance.  Listing the name of the supply in the
> binding documentation doesn't seem like a bad idea if that's what you're
> trying to say.

Sorry for not explaining this in well.
In dts file for regulator, I want to specify the supply name same as the 
regulator name i.e.

more generic

my_reg1: abc {
:::::::::::
};

my_reg2: xyz {
::::::::::::::;
  xyz-supply = <&my_reg1>;
};


other way:
my_regname: <name> {
:::::::::;
<name>-supply = <&supply_reg>
};


This will be parsed in regulator driver file, not in core files.


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
