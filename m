From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] GPIO: Add support for dual channel in gpio-xilinx.c
Date: Thu, 20 Jun 2013 11:23:36 +0200
Message-ID: <CACRpkdbWXFLgcUJ-gcUArRotJMoX4JBU9mmheooJBWsLR=QHOA@mail.gmail.com>
References: <4b90b06fce0475b579cfba4d968b4778359154f6.1369826814.git.michal.simek@xilinx.com>
	<CACRpkdY4xaCOe28nu-NrYQ7pafjhj8-xqFcJRF9iJUy3SrCVrA@mail.gmail.com>
	<51A8387C.4030704@monstr.eu>
	<CACRpkdbHiaK6YPgXyxNgEeZxAsddK4x0vS-q3YfyXnj_BgHvuw@mail.gmail.com>
	<51A852A1.7020505@monstr.eu>
	<CACRpkdbL4pqiF8zxMi28SRTJ9AESiFt0wJMhK1oBio_cfFhpsQ@mail.gmail.com>
	<51C2B47A.6010906@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51C2B47A.6010906@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2013 at 9:51 AM, Michal Simek <monstr@monstr.eu> wrote:
> On 06/17/2013 07:29 AM, Linus Walleij wrote:

>> I think of_property_read_bool() will accept
>> xlnx,is-dual = <1>; to mean the same as xlnx,is-dual;
>> try it.
>
> First of all sorry for delay.
> You are right that of_property_read_bool()
> also accept xlnx,is-dual = <1>;
> but also accept and return 1 when xlnx,is-dual = <0>;
> which is incorrect behaviour.

OK but that is a coding issue, not a DT bindings design issue.
Can't we think a bit outside the box?
What about something like this:

static bool is_dual (struct device_node *np)
{
    struct property *prop = of_find_property(np, "xlnx,is-dual", NULL);
    int ret;
    u32 val;

    if (!prop)
        return false;

    ret = of_property_read_u32(np, "xlnx,is-dual", &val);
    if (ret < 0)
        return true; /* node exists but has no cells */

    return !!val;
}

Yours,
Linus Walleij
