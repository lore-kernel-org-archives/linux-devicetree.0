From: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: possibility of parent clock selection through DT
Date: Wed, 7 Nov 2012 12:06:10 +0530
Message-ID: <CAPub148Bq=uwTuky25WzXn4yfCukJ+WacxkBvuyV5yTzGasGOQ@mail.gmail.com>
References: <CAPub14-CPS48gQ1h8vvAYBpO_=egjheG_rMoZ894Y4XZ2CinUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPub14-CPS48gQ1h8vvAYBpO_=egjheG_rMoZ894Y4XZ2CinUQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@ti.com>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 7, 2012 at 11:42 AM, Shiraz Hashim
<shiraz.linux.kernel@gmail.com> wrote:
> Hi Mike, Rob,
>
> Devices in a SoC can have multiple possible clock sources which is
> perfectly captured through clk framework.
>
> But the device itself may not be aware of the complex hierarchy above it.
> In this case how do you suggest a board (through DT) should select its
> preference.
>
> Is there some work already going on in this direction ?

Just to make it clear, I already have referred the clock DT bindings and
Shawn Guo patch on removing clk look up registration from kernel code.

Here I am talking about possibility of selecting desired clock hierarchy
by the boards about which device nodes are not aware.

-- 
regards
Shiraz Hashim
