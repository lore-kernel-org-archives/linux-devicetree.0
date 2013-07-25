From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: The future of DT binding maintainership
Date: Thu, 25 Jul 2013 10:46:13 -0700
Message-ID: <51F16465.3030708@wwwdotorg.org>
References: <CACxGe6vtJPbbqwpH8Th5S36Hx50f39j1P4OpLb-Um9xQie6Lng@mail.gmail.com> <20130720034647.2B7B43E14BF@localhost> <2962401.WRRoYlXkRr@flatron> <20130724141112.464623E09C5@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130724141112.464623E09C5@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On 07/24/2013 07:11 AM, Grant Likely wrote:
> On Sat, 20 Jul 2013 15:49:21 +0200, Tomasz Figa <tomasz.figa@gmail.com> wrote:
...
>> From remaining questions I remember:
>>  - How should we mark bindings as staging and stable? (i.e. 
>> documentation/schema files in different folders or something else?)
> 
> I think having a different folder for staged bindings is going to be the
> most managable. The other option would be a tag in the file indicating
> that it is stable, but I suspect that will require more work in the long
> run. At least with a staging directory you can tell at a glance which
> bindings are in draft form. Any bindings used from the staging directory
> should trigger a warning from DTC, but we probably want to consolidate
> all 'staging' binding warnings into a single message so that dtc output
> doesn't get too chatty.
> 
> Once a binding is moved into the stable directory, only backwards
> compatible changes should be allowed.

Is the following scenario useful to consider

* A minimal DT binding is initially created to represent the most basic
features of a device. This graduates quickly to being marked stable.

* The full feature-set of the device needs to be exposed later. This
involves making backwards-compatible changes to the binding. Those
changes may initially be very tentative, since they're more complex.

This implies to me that we either need to mark specific properties or
parts of a binding as stable, and part as tentative. Does using separate
directories for this make sense, or should we put markup into the
binding definition itself?

I suppose we could consider bindings/tentative/foo/bar.txt as
automatically inheriting-from/extending bindings/stable/foo/bar.txt.
