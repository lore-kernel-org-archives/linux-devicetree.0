From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2 1/9] pinctrl: mvebu: pinctrl driver core
Date: Thu, 23 Aug 2012 22:31:01 +0200
Message-ID: <50369305.6050304@gmail.com>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com> <1345623750-10645-1-git-send-email-sebastian.hesselbarth@gmail.com> <1345623750-10645-2-git-send-email-sebastian.hesselbarth@gmail.com> <5035445B.6000500@wwwdotorg.org> <CABJ1b_Tdr80DGqb-FRzwDbF3m7g6fBguk5GtRAfRUYx5Sqy_cA@mail.gmail.com> <50366E44.4030606@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <50366E44.4030606@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/23/2012 07:54 PM, Stephen Warren wrote:
>> dt_parse() and dt_parse_function() build up structs that get used later on
>> in mvebu_pinmux_ops that require indexed functions. I can join them with
>> dt_node_to_map() but that would require incremental kzalloc for the
>> corresponding array. Or I could (functionally) leave dt_parse() to allocate
>> the array and only join dt_parse_function() with dt_node_to_map().
>
> So everything you said makes sense, in that the core driver is
> parameterizable and receives data from a SoC-variant-specific driver
> indicating which pins/groups/functions are available. I'm still not sure
> though why the translation of the pin/group/function structures passed
> to probe into other data structures requires accessing the DT at all;
> the set of available pins/groups/functions isn't configured through DT,
> and doesn't need to be limited to only those options actually used in
> DT, so can't you just process all the data that's passed to probe
> without interaction with the DT?

Hmm, maybe I still don't quite understand the terminology of pinctrl/pinmux
core completely. What exactly should mvebu_pinmux_get_funcs_count return
if not the number of DT node children?

I thought that a "function" in the terminology of pinctrl/pinmux core is
a list of pingroups and corresponding values to actually set it to e.g. uart1.
In pinctrl-mvebu this would be one marvell,function assigned to one or more
marvell,pins.

If the above is correct, I still need to access DT in probe() at least to count
the number of children passed to allocate an array for mvebu_pinmux_ops callbacks
that get indexed by "fid" (pctl->functions).

Sebastian
