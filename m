From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 1/9] pinctrl: mvebu: pinctrl driver core
Date: Sun, 26 Aug 2012 21:33:56 -0700
Message-ID: <503AF8B4.1070206@wwwdotorg.org>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com> <1345623750-10645-1-git-send-email-sebastian.hesselbarth@gmail.com> <1345623750-10645-2-git-send-email-sebastian.hesselbarth@gmail.com> <5035445B.6000500@wwwdotorg.org> <CABJ1b_Tdr80DGqb-FRzwDbF3m7g6fBguk5GtRAfRUYx5Sqy_cA@mail.gmail.com> <50366E44.4030606@wwwdotorg.org> <50369305.6050304@gmail.com> <50369FEE.8000003@wwwdotorg.org> <5036B639.20608@gmail.com> <5036F651.4020700@wwwdotorg.org> <5038F50E.7030807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5038F50E.7030807@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/25/2012 08:53 AM, Sebastian Hesselbarth wrote:
> On 08/24/2012 05:34 AM, Stephen Warren wrote:
>> On 08/23/2012 05:01 PM, Sebastian Hesselbarth wrote:
>>> So possible, valid combinations for uart1 would be:
>>> (a) mpp_uart1;
>>> (b) mpp_uart1, mpp2, mpp3;
>>> (c) mpp_uart1, mpp21, mpp22;
>>> (d) mpp_uart1, mpp2, mpp22;
>>> (e) mpp_uart1, mpp21, mpp3;
>>>  [...]
>> In the example above, there is a single function named "uart1". If this
>> was all the HW supported, I'd expect the driver's
>> pinmux_ops.get_functions_count() to return 1,
>> pinmux_ops.get_function_name(0) to return "uart1", and
>> pinmux_ops.get_function_name(n>0) to return an error.
>>
>> In practice, I assume there are many other options that can be muxed
>> onto mpp2/3/21/22/uart1, so they'd be included in the list as well.
>>
>> I don't expect any scanning, no. I'd expect that tables provided by the
>> SoC-specific drivers to be:
>>
>> * A table of pins
>> * A table of groups
>> * A table of functions
>>
>> No scanning involved.
> 
> Stephen,
> 
> now I do understand but in the current driver we pass pingroups associated
> with the available functions, i.e. "mpp2" with "uart1", "uart2",
> "sdio0", aso.
> IMHO for the above three functions it would be better to have functions
> associated
> with the corresponding groups, i.e. "uart1" with "mpp_uart1", "mpp2",
> "mpp3", aso.

The pinctrl subsystem does expect a list of functions, and for each
function, a list of the groups where it can be selected. I admit that
when I think about this, it's slightly backward, since HW typically has
a list of pins/groups, and for each, a certain set of functions can be
selected. Oh well...
