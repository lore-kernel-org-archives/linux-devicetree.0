From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] regulator: ti-abb: Add support for interleaved LDO registers
Date: Wed, 22 Jan 2014 14:48:05 -0600
Message-ID: <52E02E85.3030509@ti.com>
References: <1389900750-27625-1-git-send-email-nm@ti.com> <20140121185553.GW17314@sirena.org.uk> <52DED341.3030503@ti.com> <20140121215624.GC17314@sirena.org.uk> <52DEF56C.1000209@ti.com> <20140122201932.GD17314@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140122201932.GD17314@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/22/2014 02:19 PM, Mark Brown wrote:
> On Tue, Jan 21, 2014 at 04:32:12PM -0600, Nishanth Menon wrote:
> 
>> The other alternative will be to use reg-names and map individual
>> registers (there are just setup and control registers to deal with per
>> abb instance). That will coexist with other pinctrl, bandgap and other
>> drivers which are not based off syscon.
> 
> Yes, I suspect that's going to be a lot easier to deploy given that
> there are existing drivers using the current non-syscon setup.  I'm
> totally fine with that approach.
> 
ok - thanks for confirming - this also means that existing compatible
flags will have to change - but they were present solely to encode the
offset of setup and control from each other.

Considering that we never had any dtsi in upstream (since they were
all pending clock dts support for TI platforms), I will go with the
assumption of not needing to maintain backward compatible for dtbs
that could never have been generated in upstream kernel.

-- 
Regards,
Nishanth Menon
