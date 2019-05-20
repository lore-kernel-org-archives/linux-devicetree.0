From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [RFC v2 0/5] cpufreq support for the Raspberry Pi
Date: Mon, 20 May 2019 16:21:53 +0530
Message-ID: <20190520105153.ftlnjx7ocr2qkxhd@vireshk-i7>
References: <20190520104708.11980-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190520104708.11980-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, mbrugger@suse.de, rjw@rjwysocki.net, sboyd@kernel.org, eric@anholt.net, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, ptesarik@suse.com, ssuloev@orpaltech.com, linux-clk@vger.kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 20-05-19, 12:47, Nicolas Saenz Julienne wrote:
> Hi all,
> as some of you may recall I've been spending some time looking into
> providing 'cpufreq' support for the Raspberry Pi platform[1]. I think
> I'm close to something workable, so I'd love for you to comment on it.
> 
> There has been some design changes since the last version. Namely the
> fact that I now make sure *only* the CPU frequency is updated. The
> firmware API we use has two modes, with or without turbo. Enabling turbo
> implies not only scaling the CPU clock but also the VPU and other
> peripheral related clocks.  This is problematic as some of them are not
> prepared for this kind frequency changes. I spent some time adapting the
> peripheral drivers, but the result was disappointing as they poorly
> support live frequency changes (which most other chips accept, think for
> instance I2C and clock stretching) but also turned out hard to integrate
> into the kernel. As we were planning to use 'clk_notifiers' which turns
> out not to be such a good idea as it's prone to deadlocks and not
> recommended by the clock maintainers[2]. It's also worth mentioning that
> the foundation kernel doesn't support VPU frequency scaling either.
> 
> With this in mind, and as suggested by clock maintainers[2], I've
> decided to integrate the firmware clock interface into the bcm2835 clock
> driver. This, in my opinion, provides the least friction with the
> firmware and lets us write very simple and portable higher level
> drivers. As I did with the 'cpufreq' driver which simply queries the max
> and min frequencies available, which are configurable in the firmware,
> to then trigger the generic 'cpufreq-dt'.
> 
> In the future we could further integrate other firmware dependent clocks
> into the main driver. For instance to be able to scale the VPU clock,
> which should be operated through a 'devfreq' driver.
> 
> This was tested on a RPi3b+ and if the series is well received I'll test
> it further on all platforms I own.

Please always supply version history on what has changed from V1. And
why do you keep sending it as RFC ? Just keep the default PATCH thing,
the patches are in good shape I would say.

-- 
viresh
