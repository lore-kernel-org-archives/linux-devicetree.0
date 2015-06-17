From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V7 2/3] OPP: Allow multiple OPP tables to be passed via DT
Date: Wed, 17 Jun 2015 20:12:23 +0530
Message-ID: <20150617144223.GC15153@linux>
References: <cover.1433434659.git.viresh.kumar@linaro.org>
 <263c128844f5a3c9280c8be71f6c9eb1869a5188.1433434659.git.viresh.kumar@linaro.org>
 <CAL_Jsq+EOOeQw42wZi+H82ovLn8LcQUuK9HGT+FvewdhTf7Q1w@mail.gmail.com>
 <20150617133314.GB15153@linux>
 <CAL_Jsq+SdgAf7=Yq7Jk_1d9jTpAOLCEuEDCZvD=-h=2MWsNfFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+SdgAf7=Yq7Jk_1d9jTpAOLCEuEDCZvD=-h=2MWsNfFw@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Rafael Wysocki <rjw@rjwysocki.net>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Nishanth Menon <nm@ti.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mike.turquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Olof Johansson <olof@lixom.net>, Sudeep Holla <Sudeep.Holla@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Viswanath Puttagunta <viswanath.puttagunta@linaro.org>, Lucas Stach <l.stach@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <ta.omasab@gmail.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kevin Hilman <khilman@linaro.org>, Santosh
List-Id: devicetree@vger.kernel.org

On 17-06-15, 08:47, Rob Herring wrote:
> Defined order is a key part of DT bindings. We solve the variable
> length problem with name lists associated with variable length
> property like:
> 
> operating-point-names = "slow", "fast";

I agree that we should have used this..

> I'm not a fan of doing this if we can avoid it, but we should at least
> follow the same pattern. Don't send me a patch with that yet, I want
> to hear from Stephen.

Good that you told me to stop :)

> You can also use "status" to disable specific tables rather than
> removing from the list.

Hmmm, right. That's far better.

-- 
viresh
