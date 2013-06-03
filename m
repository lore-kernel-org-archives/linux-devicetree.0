From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] mfd: DT bindings for the palmas family MFD
Date: Mon, 03 Jun 2013 14:38:34 -0600
Message-ID: <51ACFECA.10209@wwwdotorg.org>
References: <1370261333-5121-1-git-send-email-j-keerthy@ti.com> <20130603141851.GG3370@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130603141851.GG3370@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: J Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, rob.herring@calxeda.com, rob@landley.net, mturquette@linaro.org, sameo@linux.intel.com, wim@iguana.be, lgirdwood@gmail.com, gg@slimlogic.co.uk, t-kristo@ti.com, Ian Lartey <ian@slimlogic.co.uk>
List-Id: devicetree@vger.kernel.org

On 06/03/2013 08:18 AM, Lee Jones wrote:
> On Mon, 03 Jun 2013, J Keerthy wrote:
>> Add the various binding files for the palmas family of chips. There is a
>> top level MFD binding then a seperate binding for regulators IP blocks on chips.

>> diff --git a/Documentation/devicetree/bindings/mfd/palmas.txt b/Documentation/devicetree/bindings/mfd/palmas.txt

>> +Example:
>> +
>> +palmas {
> 
> Should this be 'palmas@48 {', as it has an address?

It's common to only include the unit-address (@48) if it's needed to
make the node name unique (i.e. if you had multiple palmas devices).

>> diff --git a/Documentation/devicetree/bindings/regulator/palmas-pmic.txt b/Documentation/devicetree/bindings/regulator/palmas-pmic.txt

> See: Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> 
>> +	       ti,sleep-mode - mode to adopt in pmic sleep 0 - off, 1 - auto,
>> +	       2 - eco, 3 - forced pwm
> 
> I've seen lots of sleep-mode properties, can't we define a generic
> one?

Isn't it HW-specific?
