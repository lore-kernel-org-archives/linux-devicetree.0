From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: The future of DT binding maintainership
Date: Tue, 23 Jul 2013 08:52:40 -0700
Message-ID: <51EEA6C8.6090604@wwwdotorg.org>
References: <CACxGe6vtJPbbqwpH8Th5S36Hx50f39j1P4OpLb-Um9xQie6Lng@mail.gmail.com> <20130720034647.2B7B43E14BF@localhost>,<2962401.WRRoYlXkRr@flatron> <60BA5429A0E1584BA3633194F6F993B502B21362@NA-MBX-03.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <60BA5429A0E1584BA3633194F6F993B502B21362@NA-MBX-03.mgc.mentorg.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chaiken, Alison" <Alison_Chaiken@mentor.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Wolfram Sang <w.sang@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On 07/22/2013 12:59 PM, Chaiken, Alison wrote:
> Grant Likely wrote:
>> Another thing discussed is that we need to start validating DT schema with an extension to dtc.
> 
> Is there a schema out there in the wild that exemplifies what you mean?
> 
>> Tomasz Figa has volunteered to do this work and has support from his employer
> 
> That's great news.
> 
>> to have is that the DT schema will get checked as part of the dts build
>> process so that any DT file that doesn't match the documented schema
>> will get flagged, and that the schema files will be human readable and
>> will double as documentation.
> 
> No doubt DTS files are already the best documentation available for many targets.

A nit here:

The DTS files document what HW modules are present on a board, and
various associated parameters.

The bindings describe the format of those DTS files.

The validation here is ensuring that the DTS files are actually written
in a format that matches what the binding definition requires.

So, the issue isn't really documentation of the HW, but rather
documentation of the required DT format, and validating that the DTS
matches that.
