From: "dbasehore ." <dbasehore@chromium.org>
Subject: Re: [PATCH 2/3] mfd: cros ec: spi: Increase EC transaction delay
Date: Mon, 18 Nov 2013 10:55:52 -0800
Message-ID: <CAGAzgsrUedg7pGXpS6VaWkHeYjvcyio7byeEZ=88t3U1XzbsPQ@mail.gmail.com>
References: <1384770649-8593-1-git-send-email-treding@nvidia.com>
	<1384770649-8593-2-git-send-email-treding@nvidia.com>
	<20131118104343.GG13640@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131118104343.GG13640@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

We haven't had any issues with this patch and we've had it in our tree
for a while.

I also stress tested the patch by repeatedly reading over the spi a lot.
