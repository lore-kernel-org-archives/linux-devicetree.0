From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v9 3/7] mailbox: qcom: Move the apcs struct into a
 separate header
Date: Wed, 25 Oct 2017 21:28:11 -0700
Message-ID: <20171026042811.GL1575@tuxbook>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
 <20170921164940.20343-4-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170921164940.20343-4-georgi.djakov@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 21 Sep 09:49 PDT 2017, Georgi Djakov wrote:

> Move the structure shared by the APCS IPC device and its subdevices
> into a separate header file.
> 

As you're creating the apcs regmap with devm_regmap_init_mmio() you can
just call dev_get_regmap(dev->parent) in your child to get the handle.

But I would prefer that you just add the clock code to the existing
driver.

Regards,
Bjorn
