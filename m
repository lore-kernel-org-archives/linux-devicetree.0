From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] pinctrl: dove: add PMU functions to pinctrl
Date: Mon, 13 May 2013 22:03:57 +0200
Message-ID: <5191472D.7060601@gmail.com>
References: <1367883368-27889-1-git-send-email-sebastian.hesselbarth@gmail.com> <20130513200002.GY31290@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130513200002.GY31290@titan.lakedaemon.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/13/2013 10:00 PM, Jason Cooper wrote:
> On Tue, May 07, 2013 at 01:36:08AM +0200, Sebastian Hesselbarth wrote:
>> Dove power management unit can mux some special functions to mpp0-15.
>> This patch adds support to set/get the current PMU function mapped
>> to the corresponding mpp pins. The device tree documentation is also
>> updated accordingly.
>>
>> Signed-off-by: Sebastian Hesselbarth<sebastian.hesselbarth@gmail.com>
>
> Do you intend to have anything depending on these changes in this merge
> window?

Jason,

I don't. There will be pmu and pmic support someday but I am not working
on it.

Sebastian
