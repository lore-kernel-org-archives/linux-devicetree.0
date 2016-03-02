From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH v4 1/2] clk: add lpc18xx creg clk driver
Date: Thu, 3 Mar 2016 00:27:10 +0100
Message-ID: <CAGhQ9VzmTrDmKF+_8CRFgioyrXUOR9uOk-KADw2seEa16OP78A@mail.gmail.com>
References: <1456351460-15483-1-git-send-email-manabian@gmail.com>
	<1456351460-15483-2-git-send-email-manabian@gmail.com>
	<20160302230159.12762.59247@quark.deferred.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160302230159.12762.59247@quark.deferred.io>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 3 March 2016 at 00:01, Michael Turquette <mturquette@baylibre.com> wrote:
> Hi Joachim,
>
> Quoting Joachim Eastwood (2016-02-24 14:04:19)
>> +static struct clk *clk_register_creg_clk(struct clk_creg_data *creg_clk,
>> +                                        const char **parent_name,
>> +                                        struct regmap *syscon)
>> +{
>> +       struct clk_init_data init;
>> +
>> +       init.ops = creg_clk->ops;
>> +       init.name = creg_clk->name;
>> +       init.parent_names = parent_name;
>> +       init.num_parents = 1;
>> +
>> +       creg_clk->reg = syscon;
>> +       creg_clk->hw.init = &init;
>> +
>> +       return clk_register(NULL, &creg_clk->hw);
>
> This should be devm_clk_register with your struct device *dev passed
> into it.

Since clk_register_creg_clk() is used both from early init and probe
I'll need to change the function a bit.

I'll pass dev in as a parameter and either do clk_register() or
devm_clk_register() depending on dev being NULL or not.
Doesn't look like devm_clk_register() would like to be passed NULL for dev.


I send out a new version tomorrow.

btw, this driver is a builtin_platform_driver. So is there a point in
using devm_clk_register?


regards,
Joachim Eastwood
